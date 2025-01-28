# Disable tracking and telemetry
set -gx DO_NOT_TRACK 1
set -gx HINT_TELEMETRY off
set -gx NEXT_TELEMETRY_DISABLED 1

# Only for Gentoo Linux (emerge -av at-spi2-core)B
# set -gx AT_SPI2_REGISTRY true

# Uncomment to enable for debugging
set -gx GIT_TRACE 1
set -gx GIT_TRACE 1
set -gx STARSHIP_LOG error

# Mozilla
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_WAYLAND_USE_VAAPI 1
set -gx MOZ_DISABLE_RDD_SANDBOX 1
set -gx MOZ_USE_XINPUT2 1
set -gx MOZ_DBUS_REMOTE 1
#set -gx EGL_PLATFORM wayland

# Language settings
set -U LANG 'en_US.UTF-8'
set -gx LC_ALL 'en_US.UTF-8'
set -U PYTHONIOENCODING UTF-8

# Editor configuration
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx GIT_EDITOR $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Terminal settings
set -gx TERMINAL foot
set -gx TERM xterm-256color
set -gx COLORTERM truecolor

# Bat syntax highlighting and Git integration
# set -gx BAT_THEME cyberpunk-glow
# set -gx BAT_PAGER "less -RF"
# set -gx BAT_CONFIG_DIR "$XDG_CONFIG_HOME/bat"
# set -gx BAT_CONFIG_PATH "$XDG_CONFIG_HOME/bat/bat.conf"

# Browser settings
set -gx BROWSER ungoogled-chromium
set -gx BROWSERCLI command w3m

set -gx NOTEBOOK obsidian
set -gx NOTEBOOK_DIR $HOME/notebook

# Set correct macOS $HOME path
set -gx HOME /Users/$USER

# XDG Base Directory Specification
set -q XDG_CACHE_HOME || set -gx XDG_CACHE_HOME "$HOME/.cache"
set -q XDG_CONFIG_HOME || set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME || set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_STATE_HOME || set -gx XDG_STATE_HOME "$HOME/.local/share/state"
##set -q XDG_RUNTIME_DIR || set -gx XDG_RUNTIME_DIR 	(mktemp -d "/tmp/(id -u)-runtime-dir.XXX")
#set -q XDG_DATA_DIRS || set -gx $XDG_DATA_DIRS 	"/usr/local/share:/usr/share"
#set -q XDG_CONFIG_DIRS || set -gx $XDG_CONFIG_DIRS	 "/etc:/etc/xdg"

# XDG User Directories
set -gx XDG_DOWNLOAD_DIR "$HOME/downloads"
set -gx XDG_DOCUMENTS_DIR "$HOME/documents"
set -gx XDG_PICTURES_DIR "$HOME/pictures"
set -gx XDG_DESKTOP_DIR "$HOME/desktop"
# set -gx XDG_TEMPLATES_DIR     "$HOME/templates"
# set -gx XDG_PUBLICSHARE_DIR   "$HOME/public"
# set -gx XDG_VIDEOS_DIR 	"$HOME/videos"
# set -gx XDG_MUSIC_DIR 	"$HOME/music"

# XDG Custom Directories
set -gx XDG_BIN_DIR /usr/local/bin # System-wide binaries
set -gx XDG_HOMEBREW_BIN /opt/homebrew/bin # Homebrew packages (only macOS)
set -gx XDG_BIN_HOME "$HOME/.local/bin" # User binaries
set -gx XDG_BACKUP_DIR "$HOME/backup"
set -gx XDG_DOTFILES_DIR "$HOME/dotfiles"
set -gx XDG_PROJECTS_DIR "$HOME/projects"
set -gx XDG_SCRIPTS_DIR "$HOME/.local/scripts"

# X and editor settings
set -x XINITRC "$HOME/.xinitrc"
set -x NVIMRC "$NVIM_DIR/init.lua"
set -x NVIM_DIR "$XDG_CONFIG_HOME/nvim"

set -gx GOPATH "$HOME/.go"
# set -gx GOROOT "$XDG_DATA_HOME/go"
set -gx CARGO_HOME "$HOME/.cargo"
set -gx CONDA_PATH "$HOME/miniconda3/bin"
# set -gx CONDA_HOME "$XDG_CONFIG_HOME/conda/condarc"
# set -gx PYENV_ROOT "$XDG_DATA_HOME/pyenv"
set -gx BUN_PATH "$HOME/.bun/bin"
set -gx NODE_PATH "$HOME/.npm-global/bin"
# set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
# set -gx LUAROCKS_CONFIG "$XDG_CONFIG_HOME/luarocks/config.lua"
set -gx BOB_HOME "$XDG_DATA_HOME/bob/nvim-bin"
set -gx BOB_CONFIG "$XDG_CONFIG_HOME/bob/config.json"
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/ripgreprc"
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
# set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -gx GIT_CONFIG "$XDG_CONFIG_HOME/git/.gitconfig"
set -gx CURL_HOME "$XDG_CONFIG_HOME/curl/curlrc"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
# set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
# set -gx LYNX_CFG "$XDG_CONFIG_HOME/lynx/lynx.cfg"
# set -xg W3M_DIR $XDG_DATA_HOME/w3m
# set -xg WORKON_HOME $XDG_DATA_HOME/virtualenvs
# set -gx OPENSSL_DIR /usr/local/ssl
# set -U PIP_LOG_FILE "$XDG_DATA_HOME/pip/log"
# set -U PIP_CONFIG_FILE "$XDG_CONFIG_HOME/pip/pip.conf"
# set -xg FFMPEG_DATADIR $XDG_CONFIG_HOME/ffmpeg

set -gx TASKRC "$XDG_CONFIG_HOME/task/taskrc"
set -gx TASKDATA "$XDG_CONFIG_HOME/task"
set -gx TASKOPENRC "$XDG_CONFIG_HOME/taskopen/taskopenrc" # https://github.com/jschlatow/taskopen
set -gx TIMEWARRIORDB "$XDG_DATA_HOME/timewarrior/tw.db"

# set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"

# set -gx TMUX_CONFIG_DIR "$XDG_CONFIG_HOME/tmux"
# set -gx TMUX_SCRIPT_DIR "$XDG_CONFIG_HOME/tmux/scripts"
# set -gx TMUX_PLUGIN_MANAGER_PATH "$XDG_CONFIG_HOME/tmux/plugins"
# set -gx TMUXINATOR_CONFIG_DIR "$XDG_CONFIG_HOME/tmux/tmuxinator"
