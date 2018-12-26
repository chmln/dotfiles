set PATH -g /home/greg/.npm-global/bin/ $PATH
set PATH -g /home/greg/.config/bin/ $PATH
set PATH -g /home/greg/.config/yarn/global/node_modules/.bin/ $PATH
set PATH -g /home/greg/.local/share/cargo/bin $PATH
set PATH -g /home/greg/.local/lib/python3.6/site-packages $PATH
set PATH -g /home/greg/.local/bin/ $PATH

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx SUDO_EDITOR "/usr/bin/nvim"

# heathens polluting my home directory
set -gx CARGO_HOME "/home/greg/.local/share/cargo"
set -gx RUSTUP_HOME "/home/greg/.local/share/rustup"
set -gx LESSHISTFILE "/dev/null"
set -gx NERDTREE_BOOKMARKS "/tmp/.NERDTreeBookmarks"

# always show scrollbars
set -gx GTK_OVERLAY_SCROLLING 0

# use gtk theme in qt
set -gx QT_QPA_PLATFORMTHEME "qt5ct"

# disable redundant merge messages
set -gx GIT_MERGE_AUTOEDIT "no"

set fish_greeting ""
set fish_cursor_default block
set fish_cursor_insert line
