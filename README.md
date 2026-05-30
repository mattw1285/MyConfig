# MyConfig

The `MyConfig` repo is a centralised repo for my personal config files and env 
setup. The goal is to minimise repetitive manual steps, automate common tasks 
and maintain a reproducible baseline.

This repo doubles as:
- A Safety Net
- Living Record Of Env
- Baseline Setup

This repo is intentionally opinionated and personal. It’s not meant to be 
universal, but rather my evolving toolkit for personal projects.

Despite being somwhat overkill, _**I**nfrastructure **A**s **C**ode_ is where 
this is going... or at least my terrible version of. I don't quite have the 
need or hardware for terraform, so reflashing os drives it is!

---

```
"When one gets sick, you shoot it and get another one."
```

---

## Goals:

- **Reproducibility** – quick and consistent env spin up
- **Incremental Improvement** – standardise setup while allowing refinement
- **Automation:** – reduce manual steps
- **Learning** - infra tasks and bash practice

---

```
"Your infrastructure should be a graveyard... Just like your list of nearly 
complete project" 
```

---

## Roadmap:

| **TOPIC** | **PROGRESS** | **PERCENT** |
| :--- | :--- | :--- |
| Dev OS | ![75%](https://geps.dev/progress/75) | 75% |
| Dev Setup | ![10%](https://geps.dev/progress/10) | 10% |
| VIM | ![15%](https://geps.dev/progress/15) | 15% |
| Utility Servers | ![0%](https://geps.dev/progress/0) | 0% |
| Dekstop Setup | ![0%](https://geps.dev/progress/0) | 0% |

---

```
"Build it, then burn it."
```

---

## Currently Included:

- `os_configs` - DEV Config
  - CLI Install Tool
  - SSH Auto Enable
- `btw_i_use_vim` - development niceness
  - vim config
  - tmux config
  - aliases

```
MyConfig
├── btw_i_use_vim
│   ├── bash_aliases
│   ├── my_tmux.sh
│   └── stuck_in_insert_mode
├── os_configs
│   ├── cloud-init
│   │   ├── meta-data
│   │   │   └── base-file
│   │   ├── network-config
│   │   │   └── base-file
│   │   └── user-data
│   │       ├── base-file
│   │       └── pi_dev.yaml
│   ├── pi_config.py
│   └── pi_os.sh
└── README.md

7 directories, 10 files
```
