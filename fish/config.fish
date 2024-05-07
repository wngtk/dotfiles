abbr -a c cargo
abbr -a e nvim
abbr -a m make
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a gs 'git status'
abbr -a vimdiff 'nvim -d'

set fish_greeting	 # Supresses fish's intro message
set -x MANPAGER "nvim +Man!"
fish_add_path -gp "$HOME/.dotfiles/bin" "$HOME/.local/bin"

if status --is-interactive
	# Commands to run in interactive sessions can go here
	if ! set -q TMUX; and not set -q VSCODE_IPC_HOOK_CLI
		exec tmux
	end
    if command -v starship > /dev/null
	    starship init fish | source
    end
end

if command -v apt > /dev/null
	abbr -a p 'sudo apt'
	abbr -a up 'sudo apt update && sudo apt -y upgrade'
end

if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza'
	abbr -a ll 'eza -l'
	abbr -a lll 'eza -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

if test -f /usr/share/autojump/autojump.fish;
	source /usr/share/autojump/autojump.fish;
end

# Type - to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

function expand-dot-to-parent-directory-path -d 'expand ... to ../.. etc'
    # Get commandline up to cursor
    set -l cmd (commandline --cut-at-cursor)

    # Match last line
    switch $cmd[-1]
        case '*..'
            commandline --insert '/..'
        case '*'
            commandline --insert '.'
    end
end

function my_key_bindings
    fish_default_key_bindings
    bind . 'expand-dot-to-parent-directory-path'
end

set -g fish_key_bindings my_key_bindings

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'
