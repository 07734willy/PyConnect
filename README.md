# PyConnect
Python TCP server + Vimscript file to autorun python source files on save, piping output to a separate terminal

First, create a virtual environment `venv` in the repo directory, for the python executable you wish for the runner to use. To create a virtual environment using `virtualenv`, do:

    virtualenv -p <PATH_TO_PYTHON_EXECUTABLE> venv
    
If you do not have `gnome-terminal` or prefer to use another terminal, you can set the `PYCONNECT_TERM` environment variable to change this. The value should expect to be appended with a command to run on startup ("python /path/to/some/file.py").

Once that's all setup, just open a `*.py` file in vim, load the vimscript with `:source pyconnect.vim`, and then a new terminal should pop up, displaying the output of the last run (empty for now). Everytime you write any python buffers, this terminal will refresh.
