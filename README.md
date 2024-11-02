# Django Project Setup Script

This Bash script automates the setup of a new Django project within a virtual environment. It allows you to either create the environment in the current directory or specify an absolute path, simplifying the Django setup by handling environment creation, virtual environment activation, and project initialization.

## Features

- **Environment Setup**: Creates a virtual environment for the Django project.
- **Custom Directory Options**: Choose to set up in the current directory or provide a custom path.
- **Automated Installation**: Installs Django and initializes a new project.
- **Command Alias**: Adds a convenient `setup` command to your environment for easy re-use.

## Requirements

- **Python 3**: Ensure Python 3 is installed on your system.
- **pip**: Required for installing Django within the virtual environment.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/marouanaddou/django_env_setup.git
```

1. Go to the cloned directory:

```bash
cd django_env_setup
```

1. Grant execute permissions to the script:

```bash
chmod +x run.sh
```

## Usage

Run the script:

```bash
./run.sh
```

To ensure any new environment variables or aliases are loaded, run:

```bash
source ~/.zshrc
```

Now  type

```bash
setup
```

### Cleanup

After successfully setting up your Django project, you can use the command `setup` to run the script again. You can also remove the cloned folder containing this script, as it is no longer needed.

To remove the cloned folder, navigate out of it and run:

```bash
rm -rf django_env_setup
```
