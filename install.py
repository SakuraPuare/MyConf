import pathlib
import os

black_list = ['.git', 'LICENSE', 'README.md', 'install.sh', 'install.py']

install_dest = pathlib.Path('~').expanduser()


def mk_symlink(path):
    src: pathlib.Path = path.absolute()
    dest: pathlib.Path = install_dest / path
    if dest.exists(follow_symlinks=False):
        print(f'{dest} already exists')
        os.remove(dest)

    dest.symlink_to(src)
    print(f'{path} -> {dest}')


def mk_copy(path):
    src: pathlib.Path = path.absolute()
    dest: pathlib.Path = install_dest / path
    if dest.exists(follow_symlinks=False):
        print(f'{dest} already exists')
        os.remove(dest)
    dest.write_bytes(src.read_bytes())
    print(f'{path} -> {dest}')


def iterdir(path):
    for file in path.iterdir():
        if file.name in black_list:
            continue
        if file.is_dir():
            (install_dest / file).mkdir(exist_ok=True)
            iterdir(file)
        elif file.is_file() or file.is_symlink():
            mk_symlink(file)
            # mk_copy(file)


def main():
    iterdir(pathlib.Path('.'))


if __name__ == "__main__":
    main()
