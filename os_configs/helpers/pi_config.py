## Base Imports ##
from pathlib import Path
import sys
import shutil


# Checks for args passed
if len(sys.argv) != 2:
    sys.exit("Usage: python3 my_file.py <mnt_location>")
mnt_path = Path(sys.argv[1])


# treats user-data as primary config
print('Finding available configs...')
path = Path(__file__).parent / 'cloud-init'
setups = [
    x for x in (path / 'user-data').iterdir()
    if x.name != 'base-file'
]
print('Choices for setup config:')
for x in setups:
    print(f'- {x.stem}')
config = input('Pick a config: ')
if config not in [x.stem for x in setups]:
    print('Not a valid settup!')
    sys.exit(1)
print('Applying base config...')
user_data = Path(path / 'user-data' / (config+'.yaml'))
shutil.copy2(user_data, mnt_path/'user-data')


# move secondary config files if they exist
network_config = path / 'network-config' / (config+'.yaml')
meta_data = path / 'meta-data' / (config+'.yaml')

print('Checking for other config files...')
if network_config.exists():
    shutil.copy2(network_config, mnt_path/'network-config')
    print('`network-config` applied!')
else:
    print('No `network-config` found.')
if meta_data.exists():
    shutil.copy2(meta_data, mnt_path/'meta-data')
    print('`meta-data` applied!')
else:
    print('No `meta-data` found.')
