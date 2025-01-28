# NOTE ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#  ███████ ██ ███████ ██   ██
#  ██      ██ ██      ██   ██
#  █████   ██ ███████ ███████
#  ██      ██      ██ ██   ██
#  ██      ██ ███████ ██   ██
#
#  Author       : zx0r
#  License      : MIT License
#  Description  : Stay hungry; Stay foolish
#  Contact Info : https://github.com/zx0r/hyprdots-gentoo

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#if status is-login
#end

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if status is-interactive

    if string match -q -- 'tmux*' $TERM
        set -g fish_vi_force_cursor 1
    end

    # Fish performance optimizations
    # Boost startup speed
    set -gx fish_greeting ""
    set -g fish_vi_key_bindings # Use vi key bindings (optional)
    set -gx fish_handle_reflow 0

    # Command execution optimization
    set -gx fish_command_timer_enabled 1
    set -gx async_prompt_functions fish_prompt

    # History optimization
    set -gx fish_history_max_length 50000
    set -gx fish_history_merge_sessions 1

    # JIT loading for functions
    function __fish_load_function --on-variable PWD
        set -gx fish_function_path $fish_function_path
    end

    source $XDG_CONFIG_HOME/fish/aliases/abbr.fish
    source $XDG_CONFIG_HOME/fish/themes/colorscheme.fish
    source $XDG_CONFIG_HOME/fish/user_variables.fish

    # Source conda configuration if it exists
    if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
        source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
    end

    # Source mamba configuration if it exists
    if test -f "$HOME/miniconda3/etc/fish/conf.d/mamba.fish"
        source "$HOME/miniconda3/etc/fish/conf.d/mamba.fish"
    end

end

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set LS_COLORS $XDG_CONFIG_HOME/iconsdb

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -x fish_user_paths
fish_add_path /bin /sbin /usr/bin /usr/sbin /usr/lib/go/bin /usr/lib/rustup/bin
fish_add_path $XDG_BIN_DIR $BOB_HOME $GOPATH/bin $CARGO_HOME/bin $NODE_PATH $RIPGREP_CONFIG_PATH $BUN_PATH $CONDA_PATH
fish_add_path /usr/local/bin /opt/homebrew/bin $HOME/.local/bin $HOME/.local/scripts

# ━━━━━━━━━━━━━━ NVM hook jorgebucaran/nvm.fish ━━━━━━━━━━━━━━━━━━━━━

set --universal nvm_default_version latest
set --universal nvm_default_packages npm

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -U fish_history_ignore 'cd*' 'ls*' 'eza*' 'uname*' clear exit reboot poweroff pwd history which whoami whois unzip upload uptime useradd egrep pgrep head hostname

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Install plugins and themes for yazi file manager
function run_yazi_plugins_install
    curl -sSL https://gist.githubusercontent.com/zx0r/8c8ad48dd795a1cfbd2e2bd4b6b9bdff/raw/07fe9009124c9d8fc2635392198ee787f62ac5b1/install_yazi_plugins.sh | bash
end

alias dotfiles='git --git-dir=$HOME/Desktop/macOS-dotfiles --work-tree=$HOME'
