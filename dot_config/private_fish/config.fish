#fenv source /etc/profile
#fenv source ~/.profile

if test -d /home/linuxbrew/.linuxbrew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if status is-interactive
    alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
    alias ls="eza -l --icons=always"
    alias cat="bat"
    # alias codium="ELECTRON_OZONE_PLATFORM_HINT=auto codium"
    # alias clibox="distrobox rm cli && distrobox create --nvidia --name cli --image ghcr.io/xynydev/clicontainer:latest && distrobox enter cli"
    # alias cliboxf="distrobox rm --force cli && distrobox create --nvidia --name cli --image ghcr.io/xynydev/clicontainer:latest && distrobox enter cli"

    alias zed="flatpak run dev.zed.Zed"
    #alias turtle="flatpak run de.philippun1.turtle"

    function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
    end

    alias cze="chezmoi edit --apply"
    alias cza="chezmoi add"

    #zoxide init fish | source   
     
    mise activate fish | source
    
    atuin init fish --disable-up-arrow | source

    starship init fish | source
end
