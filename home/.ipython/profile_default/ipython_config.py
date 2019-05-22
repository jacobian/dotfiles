# Configuration file for ipython.

import os
import time
from IPython.terminal.prompts import Prompts, Token

c = get_config()

c.InteractiveShell.autoindent = True
c.InteractiveShell.confirm_exit = False
c.TerminalIPythonApp.display_banner = False
c.InteractiveShell.colors = "Linux"
c.InteractiveShell.editor = "subl -n -w"

c.InlineBackend.figure_format = "retina"

# UGH the old style was much easier.
# See https://stackoverflow.com/questions/38275585/adding-color-to-new-style-ipython-v5-prompt
# c.PromptManager.in_template = '[\#] >>> '
# c.PromptManager.in2_template = '   .\D.: '
# c.PromptManager.out_template = '[\#]   : '
# c.PromptManager.justify = True


class MyPrompts(Prompts):
    def in_prompt_tokens(self, cli=None):
        return (
            (Token.Prompt, "["),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, "] >>> "),
        )

    def out_propmt_tokens(self):
        return (
            (Token.Prompt, "["),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, "]   : "),
        )


c.TerminalInteractiveShell.prompts_class = MyPrompts

# Logging

logdir = os.path.expanduser(time.strftime("~/Dropbox/history/ipython/%Y/%m/"))
logfile = os.path.join(logdir, time.strftime("%d.log"))
if not os.path.exists(logdir):
    os.makedirs(logdir)
c.InteractiveShellApp.exec_lines = ["%%logstart %s append" % logfile]
