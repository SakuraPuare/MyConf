export EDITOR='vim'
if [ -e /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash ]; then . /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash; fi

PATH=~/.console-ninja/.bin:$PATH

[ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/opt/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/opt/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

