# remove ? interpretation as glob
set -U fish_features qmark-noglob

set -gx IS_DAY true

set -gx XDG_CACHE_HOME "/home/greg/.cache"
set -gx XDG_CONFIG_HOME "/home/greg/.config"
set -gx XDG_DATA_HOME "/home/greg/.local/share"

set -gx EDITOR "nvim"
set -gx SUDO_EDITOR "/usr/bin/nvim"
set -gx VISUAL "nvim"

# heathens polluting my home directory
set -gx ANDROID_SDK_HOME "/home/greg/.config/android"
set -gx CARGO_HOME "/home/greg/.local/share/cargo"
set -gx GIT_SSH_COMMAND "ssh -q -F /etc/ssh/ssh_config"
set -gx GNUPGHOME "/home/greg/.config/gnupg"
set -gx LESSHISTFILE "/dev/null"
set -gx NERDTREE_BOOKMARKS "/tmp/.NERDTreeBookmarks"
set -gx NOTMUCH_CONFIG "/home/greg/.config/notmuch/config"
set -gx NPM_CONFIG_USERCONFIG "~/.config/npm/npmrc"
set -gx RUSTUP_HOME "/home/greg/.local/share/rustup"

if $IS_DAY
    set -gx BAT_THEME "OneHalfLight"
    set -gx FZF_DEFAULT_OPTS "--reverse --color=light"
else
    set -gx BAT_THEME "TwoDark"
    set -gx FZF_DEFAULT_OPTS "--reverse"
end

set -gx BRAVE_FLAGS "--disk-cache-dir=/dev/null --disk-cache-size=1"
set -gx FZF_DEFAULT_COMMAND 'fd -t f --hidden -E .git -E node_modules'
set -gx GIT_MERGE_AUTOEDIT "no"
set -gx GOPATH "/home/greg/.cache/go"
set -gx GTK_OVERLAY_SCROLLING 0
set -gx LESS "-Ri "
set -gx RIPGREP_CONFIG_PATH "/home/greg/.config/ripgrep"
set -gx RUSTFLAGS "-C link-arg=-fuse-ld=lld"

# nvidia gpu
set -gx __GL_ExperimentalPerfStrategy 1

# fish customizations

set -x fish_greeting
set fish_cursor_default block
set fish_cursor_insert line

# prompt customizations
set fish_prompt_pwd_dir_length 0
set theme_display_date no
set theme_display_git_master_branch yes
set theme_display_hg no
set theme_display_hostname no
set theme_display_nvm no
set theme_display_vi no
set theme_nerd_fonts yes

set -x LF_ICONS "\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
"
