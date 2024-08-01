abbr -a e nvim
abbr -a m make
abbr -a g git
abbr -a gs git status
abbr -a gl git log --oneline

if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza'
	abbr -a ll 'eza -l'
	abbr -a lll 'eza -la'
end

set -x MANPAGER "nvim +Man!"
set -x EDITOR nvim

fish_add_path -gp "$HOME/.dotfiles/bin" "$HOME/.local/bin"
fish_add_path -gp "$HOME/.dotfiles_local/bin"

if status --is-interactive
	set fish_greeting
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
