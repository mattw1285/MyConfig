## Standard Lib Imports ##
import shutil
from pathlib import Path


DOTFILE_DIR = Path(__file__).parent / 'dot_files'
HOME_DIR = Path.home()


def staging_dotfiles():
    print('Staging dot files...')
    for source_path in DOTFILE_DIR.iterdir():
        target_path = HOME_DIR / ('.' + source_path.name)
        if target_path.is_symlink():
            print(f"Removing the symlink for '.{source_path.name}' config...")
            target_path.unlink()
        elif target_path.is_dir():
            print(f"Deleting the existing '.{source_path.name}' dir...")
            shutil.rmtree(target_path)
        elif target_path.exists():
            print(f"Deleting the existing '.{source_path.name}' file...")
            target_path.unlink()
        else:
            print(f"'.{source_path.name}' is not an existing config!")
        print(f"Setting up '.{source_path.name}' symlink...")
        target_path.symlink_to(source_path)
    print('Dot files staged successfully.')
    return


TASKS = [staging_dotfiles]


def main():
    print('Your dev environment will now be setup!')
    for x in _TASKS:
        x()
    print('Everything is ready to go! :D')
    return


if __name__ == '__main__':
    main()
