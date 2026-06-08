## Standard Lib Imports ##
import shutil
from pathlib import Path


DOTFILE_DIR = Path(__file__).parent.parent / 'dot_files'
HOME_DIR = Path.home()


def clear_dotfiles():
    print('Clearing any exisiting nonsense dot files...')
    for source_path in DOTFILE_DIR.iterdir():
        target_path = HOME_DIR / source_path.name
        if target_path.is_symlink():
            print(f"Removing the symlink for '{source_path.name}' config...")
            target_path.unlink()
        elif target_path.is_dir():
            print(f"Deleting the existing '{source_path.name}' dir...")
            shutil.rmtree(target_path)
        elif target_path.exists():
            print(f"Deleting the existing '{source_path.name}' file...")
            target_path.unlink()
        else:
            print(f"'{source_path.name}' is not an existing config!")
    print("A 'Path' has been cleared")
    
def replicate_dotfiles():
    print('Creating the correct solution...')
    for source_path in DOTFILE_DIR.iterdir():
        target_path = HOME_DIR / source_path.name
        print(f"Copying '{source_path.name}'...")
        if source_path.is_dir():
            shutil.copytree(source_path, target_path)
        else:
            shutil.copy2(source_path, target_path)
    print('Dot files staged successfully.')
    return


TASKS = [clear_dotfiles, replicate_dotfiles]


def main():
    print('Your config files will now be setup!')
    for x in TASKS:
        x()
    print('Your config files are ready to go! :D')
    return


if __name__ == '__main__':
    main()
