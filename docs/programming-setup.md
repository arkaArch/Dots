## Setup for python virtual environment:

### Install virtualenv:
Arch doesn't come with pip pre-installed. So install it with:
    sudo pacman -S python-pip

Now install 'virtualenv' systemwide as:
    sudo pacman -S python-virtualenv"


### Create virtual environment:
    * Go to a folder where you want to create a virtual environment.
    * Create the virtual env with "python3 -m venv .venv". 
    * Activate the virtual environment with "source .venv/bin/activate"
    * This will create .venv folder which contains local copy of python and pip installed.
    * You can check that by typing 'pip list' 
    * Copy this thing into requirement.txt by pip freeze > requirements.txt
    * You can insall those packages from requirements.txt with 
      'pip install -r /path/to/requirements.txt'
    * You can exit from venv by typing "deactivate"
