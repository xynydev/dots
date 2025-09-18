$env.config.show_banner = false

alias cat = bat
alias zed = flatpak run dev.zed.Zed

# chezmoi
alias cze = chezmoi edit --apply
alias cza = chezmoi add

# env
bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{n}={v}"
    | where { |x| ($x.n not-in $env) or $x.v != ($env | get $x.n) }
    | where n not-in ["_", "LAST_EXIT_CODE", "DIRS_POSITION"]
    | transpose --header-row
    | into record
    | load-env

# yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# extend
mkdir ($nu.data-dir | path join "vendor/autoload")
mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# workaround for mise commands not being available during config.nu execution
~/.local/share/mise/installs/atuin/latest/atuin-x86_64-unknown-linux-musl/atuin init nu --disable-up-arrow
	| save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")


# complete
let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}
$env.config = {
    completions: {
        external: {
            enable: true
            completer: $fish_completer
        }
    }
}


# print
fastfetch --logo ~/.config/fastfetch/XYNY-mash.png --logo-padding-left 2 --logo-width 48 --logo-type sixel
fortune -s | cowsay -f three-eyes | lolcat -g eba0ac:cba6f7 -b
