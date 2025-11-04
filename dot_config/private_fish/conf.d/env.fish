set -gx PATH \
    /usr/libexec/bluebuild/nu/ \
    $HOME/.cargo/bin/ \
    $HOME/.local/bin/ \
    $HOME/.local/lib/ \
    $PATH

set -gx EDITOR micro
set -gx MICRO_TRUECOLOR 1

set -gx XDG_DATA_HOME $HOME/.local/share/
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $XDG_CACHE_HOME

set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx ELECTRON_OZONE_PLATFORM_HINT auto
