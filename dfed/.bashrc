# Prompt:
PS1='\[\e[38;5;207m\]\w\[\e[0m\] \[\e[33m\]%\[\e[0m\] '

# Aliases:
# Gnu aliases:
alias \
    la='ls -Alh --color=always --group-directories-first' \
    grep='grep --color=auto' \
    ..='cd ..' \
    ...='cd ../..' \
    rm="rm -iv"

# Application aliases:
alias \
    t='tree -Ca' \
    yta='yt-dlp --extract-audio --audio-format mp3' \
    ytv="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

# git aliases
alias \
    gs='git status' \
    ga='git add' \
    gcmt='git commit -m' \
    gpushom='git push origin main' \
    gpullom='git pull origin main'

# fzf aliases:
alias fzf='fzf --height=20 --border --border-label="╢ Search ╟" --color=label:italic:green'
fcd() { 
    cd $(find -type d | fzf) 
}
fv() { 
    vim $(fzf --preview='cat {}') 
}

# Start bash with
fastfetch
