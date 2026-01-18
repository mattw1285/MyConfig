# MyConfig

The `MyConfig` repo is a centralised repo for my personal config files and env setup.
The goal is to minimise repetitive manual steps, automate common tasks and maintain a reproducible baseline.

This repo doubles as:
- A Safety Net
- Living Record Of Env
- Baseline Setup

This repo is intentionally opinionated and personal.
It’s not meant to be universal, but rather my evolving toolkit for personal projects.

Despite being somwhat overkill, _**I**nfrastructure **A**s **C**ode_ is where this is going... or at least my terrible version of.
I don't quite have the need or hardware for terraform, so reflashing os drives it is!

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
"Your infrastructure should be a graveyard." 
```

---

## Roadmap:

| **TOPIC** | **PROGRESS** | **PERCENT** |
| :--- | :--- | :--- |
| Dev Setup | ![75%](https://geps.dev/progress/75) | 75%
| VIM | ![0%](https://geps.dev/progress/0) | 0%
| Utility Servers | ![0%](https://geps.dev/progress/1) | 0%
| Dekstop Setup | ![0%](https://geps.dev/progress/20) | 0%

---

```
"Build it, then burn it."
```

---

## Currently Included:

- `os_configs`
  - CLI Install Tool
  - SSH Auto Enable
  - DEV Config

```
MyConfig
├── os_configs
│   ├── meta-data
│   │   └── base-file
│   ├── network-config
│   │   └── base-file
│   ├── pi_config.py
│   ├── pi_os.sh
│   └── user-data
│       ├── base-file
│       └── pi_dev.yaml
└── README.md
```
