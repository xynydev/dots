fenv source /etc/profile
fenv source ~/.profile

if test -d /home/linuxbrew/.linuxbrew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if status is-interactive
    alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
    alias ls="eza -l --icons=always"
    alias cat="bat"
    # alias codium="ELECTRON_OZONE_PLATFORM_HINT=auto codium"
    #alias clibox="distrobox rm cli && distrobox create --nvidia --name cli --image ghcr.io/xynydev/clicontainer:latest && distrobox enter cli"
    #alias cliboxf="distrobox rm --force cli && distrobox create --nvidia --name cli --image ghcr.io/xynydev/clicontainer:latest && distrobox enter cli"

    alias zed="flatpak run dev.zed.Zed"
    #alias turtle="flatpak run de.philippun1.turtle"

    alias y="yazi"

    alias cze="chezmoi edit --apply"

    zoxide init fish | source    
    mise activate fish | source
    
    starship init fish | source
end
