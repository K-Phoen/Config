# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/kevin/.zshrc'

#prompt
autoload -U promptinit
promptinit

# pour avoir des infos sur git dans le promp
autoload -Uz vcs_info
 
#zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F !' # modifs sur des fichiers trackés
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' on %F{green}%b%c%u%F{black}'
    } else {
        zstyle ':vcs_info:*' formats ' on %F{green}%b%c%u%F?%F{black}' # fichiers non trackés détectés
    }
 
    vcs_info
}

setopt prompt_subst

#PS1='[%n@%M %~]$ '
PROMPT=$'[%{\e[0;31m%}%n%{\e[00m%}@%{\e[0;35m%}%m:%{\e[0;34m%}%~%{\e[00m%}${vcs_info_msg_0_}]$ '

#Pour éviter de proposer un élément déjà présent lors d'un cp, mv ou rm :

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# ne pas écrire les doublons dans l'historique
setopt hist_ignore_all_dups

# correction des commandes
setopt correctall

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e #-v
# End of lines configured by zsh-newuser-install

#export EDITOR=/usr/bin/vim
export PATH=$PATH:~/sdk_android/tools
export PAGER=most
#alias

alias aptupgrade='sudo aptitude update && sudo aptitude safe-upgrade'
#alias initserv='sudo /etc/init.d/apache2 start && sudo /etc/init.d/mysql start && sudo /etc/init.d/memcac'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lh='ls -lh --color=auto'

alias ssai='ssh 192.168.1.24'
alias ssam='ssh 192.168.1.22'
alias ssvps='ssh root@95.130.15.21 -p 2001'
alias ssh-x='ssh -c arcfour,blowfish-cbc -XC'

alias dual_screen='xrandr --output VGA1 --mode 1280x1024 --same-as LVDS1'
alias mono_screan='xrandr --output LVDS1 --mode 1024x600'

#alias git
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gci='git commit'

#alias mercurial
alias hgs='hg status'
alias hgc='hg commit'
alias hgps='hg push'

# Gestion de la couleur pour 'ls' (exportation de LS_COLORS)
if [ -x /usr/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  else
    eval "`dircolors`"
  fi
fi

# supprime le mot précédant le curseur avec ^W
export WORDCHARS=${WORDCHARS:s,/,,}

# Je ne veux JAMAIS de beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
