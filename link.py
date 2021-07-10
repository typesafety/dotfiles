#! /usr/bin/python3

import argparse
import pathlib
from pathlib import Path
from sys import exit


class Dotfiles():
    def __init__(self, dotfiles: Path):
        config = dotfiles / '.config'
        if not config.exists():
            raise FileNotFoundError(f'{config.absolute()} is not a directory')

        self.dotfiles = dotfiles
        self.config = config


class Home():
    def __init__(self, home: Path):
        config = home / '.config'
        if not config.exists():
            raise FileNotFoundError(f'{config.absolute()} is not a directory')

        self.home = home
        self.config = config


def link(pairs: list[tuple[Path, Path]], is_dry: bool):
    if is_dry:
        print('Running DRY')

    for sym, source in pairs:
        print(f'Linking: {sym} -> {source}')
        if not is_dry:
            sym.symlink_to(source)


def pair_configs(home: Home, dotfiles: Dotfiles) -> list[tuple[Path, Path]]:
    # Create pairs of directories as ($HOME/.config, dotfiles/.config).
    dirs = (d.name for d in dotfiles.config.iterdir() if d.is_dir())
    pairs = list(map(lambda d: (home.config / d, dotfiles.config / d), dirs))
    return pairs


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description='Symlink config files')
    parser.add_argument('--dotfiles', metavar='DOTFILES_DIR',
                        type=Path, required=True)
    parser.add_argument('--dry', action='store_true')
    return parser


def main():
    parser = make_parser()
    args = parser.parse_args()

    home = Home(Path.home())
    dotfiles = Dotfiles(args.dotfiles.absolute())

    config_pairs = pair_configs(home, dotfiles)

    link(config_pairs, is_dry=args.dry)


if __name__ == '__main__':
    main()

