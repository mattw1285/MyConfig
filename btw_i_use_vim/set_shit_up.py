## Standard Lib Imports ##
from pathlib import Path

home_dir = Path.home()
current_dir = __file__

def main() -> None:
    print(current_dir)
    print([x for x in home_dir.iterdir()])

if __name__ == 'main':
    main()
