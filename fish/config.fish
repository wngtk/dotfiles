abbr -a e nvim
abbr -a v vim
abbr -a m make
abbr -a g git
abbr -a ga 'git add -p'
abbr -a gs git status
abbr -a gl git log --oneline
abbr -a lg lazygit

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

set -x MANPAGER "nvim +Man!"
set -x EDITOR nvim

fish_add_path -p "$HOME/.dotfiles/bin" "$HOME/.local/bin"
fish_add_path -p "$HOME/.dotfiles_local/bin"

if status --is-interactive
	set fish_greeting
    switch $TERM
		case 'linux'
			:
		case '*'
			if ! set -q TMUX; and ! set -q VSCODE_IPC_HOOK_CLI
				# ensure that the new tmux _also_ starts fish
				exec tmux set-option -g default-shell (which fish) ';' new-session
			end
	end
    # Allow local customizations
    if test -e "$HOME/.config/fish/config_local_after.fish"
        builtin source "$HOME/.config/fish/config_local_after.fish"
    end
end

if test -f $HOME/.autojump/share/autojump/autojump.fish
	. $HOME/.autojump/share/autojump/autojump.fish
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

# Update dotfiles
function dfu
    fish -c 'cd ~/.dotfiles && git pull --ff-only && ./install -q'
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (command -q hostname; and hostname; or hostnamectl hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
