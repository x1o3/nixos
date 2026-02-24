if status is-interactive
    source ~/.config/fish/hyprtitty.fish
end
set -x EDITOR "nvim"
set -x SOPS_USE_GPG 1
set fish_greeting
set TERM "xterm-256color"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux FZF_DEFAULT_OPTS "--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set fish_color_normal brcyan 
set fish_color_autosuggestion brgrey
set -U fish_color_command "#f8bd96" # '#50fa7b'
set fish_color_error brred #'#ff5555'
set fish_color_quote bryellow
# set fish_color_keyword "#5E9DA1"
fish_vi_key_bindings
alias killme="sudo nixos-rebuild --flake $HOME/nixos#nyx switch"
alias levelup="sudo nixos-rebuild --flake $HOME/nixos#nyx switch --upgrade-all --verbose"
alias offline="sudo nixos-rebuild --flake $HOME/nixos#nyx switch --option substitute false"
alias fuckmess="sudo nix-collect-garbage -d"
alias nomorempd="sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system"
alias htb="exegol start htb" # running exegol container named htb
alias shell="nix-shell --run fish"
alias msf='sudo msfconsole 2> /dev/null -q'
alias x="cd /x"
alias a="cd /arsenal"
alias d="cd /d"
alias fix-audio-port="hdajackretask"
alias pptx2pdf="unoconv -f pdf *.pptx 2> /dev/null"
alias ppt2pdf="unoconv -f pdf *.ppt 2> /dev/null"
alias concmp4="ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4"
alias clone="git clone"
alias pull="git pull"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias init="git init"
alias checkout="git checkout"
alias ll='exa -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ls='eza --color=always --icons --group-directories-first | grep -v "\($RECYCLE.BIN\|System Volume Information\)"'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | grep -E "^\."' 
alias pipes="pipes-rs -k curved -p 3 -t 0.13 -r 0.6"
alias ":q"="exit"
alias nvim="nvim"
alias v="nvim"
alias tmsource="tmux source-file ~/.config/tmux/tmux.conf"
alias tmux="tmux -u"
alias wcc="warp-cli connect"
alias w--="warp-cli disconnect"
alias mux="tmux new-session -t shell"
starship init fish | source
zoxide init fish | source
function rm!
    set -l keep $argv
    set -l files *

    for f in $files
        if not contains -- $f $keep
            rm -- $f
        end
    end
end
# Created by `pipx` on 2026-02-12 21:16:28
set PATH $PATH /home/x1o3/.local/bin
