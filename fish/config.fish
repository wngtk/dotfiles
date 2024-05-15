abbr -a e nvim

set -x MANPAGER "nvim +Man!"
fish_add_path -gp "$HOME/.dotfiles/bin" "$HOME/.local/bin"

if status --is-interactive
    set fish_greeting
end

if test -f /home/wngtk/.autojump/share/autojump/autojump.fish; . /home/wngtk/.autojump/share/autojump/autojump.fish; end

# Type - to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end
