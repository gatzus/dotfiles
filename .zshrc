# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#ghcup echo commands
[ -f "/Users/jakob/.ghcup/env" ] && . "/Users/jakob/.ghcup/env" # ghcup-envsourcesource

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

#ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

#p10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# plugins
eval "$(zoxide init --cmd cd zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#fzf
#export FZF_DEFAULT_COMMAD="fd --hiddden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix -exclude .git"
export FZF_DEFAULT_OPTS=" --height 70% --layout=default --border " #aussehen von fzf

# aliasse
alias zedi='zed $(fzf -m --preview="bat --color=always {}")' #oeffne file in zed editor
alias opi='open $(fzf -m)' #oeffne files mit standardapp des files
alias startai="ollama run deepseek-r1:7b" #startet ki in ollama
alias runol="brew services run ollama" #startet ollama
alias killol="brew services kill ollama" #killt ollama (geht nur so halb)
alias stopol="brew services stop ollama" #stoppt ollama
