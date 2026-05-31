## Standard Lib Imports ##
from pathlib import Path

home_dir = Path.home()
current_dir = __file__

print(current_dir)
print([x for x in home_dir.iterdir()])
