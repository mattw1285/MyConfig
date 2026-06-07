## Standard Lib Imports ##
import shutil
from pathlib import Path

DOTFILE_DIR = Path(Path(__file__).parent) / 'dot_files'
HOME_DIR = Path.home()

def main():
    setup = [x for x in DOTFILE_DIR.iterdir()]
    for each in setup:
        target_path = HOME_DIR / ('.' + each.name)
        source_path = each
        if target_path.exists():
            print(f"Deleting {target_path}")
        else:
            print(each.name,'does not')

if __name__ == '__main__':
    main()
