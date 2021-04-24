# Configuration file for ipython.

import os
import time
from IPython.terminal.prompts import Prompts, Token

c = get_config()

c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False
c.TerminalIPythonApp.display_banner = False
c.InteractiveShell.colors = "Linux"
c.InteractiveShell.editor = "code -w"

c.InlineBackend.figure_format = "retina"

# Logging

logdir = os.path.expanduser(
    time.strftime("~/Dropbox (Personal)/history/ipython/%Y/%m/")
)
logfile = os.path.join(logdir, time.strftime("%d.log"))
if not os.path.exists(logdir):
    os.makedirs(logdir)
c.InteractiveShellApp.exec_lines = ["%%logstart %s append" % logfile]
