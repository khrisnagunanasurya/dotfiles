# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /Users/khrisna/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

alias l='ls -CF'
alias la='ls -A'
alias ll='exa --long --header --group --git --modified --color-scale'
alias ls='ls --color=auto'

alias dcu='docker-compose --verbose up --remove-orphans'
alias dce='docker-compose exec'
alias dcr='docker-compose run --rm'
alias dcd='docker-compose down'

alias allpods='kubectl get pods -n msi'
alias pods='allpods --field-selector=status.phase==Running'
function execpod {
  kubectl exec -ti "$1" -n msi -- sh
}

function forwardpodport {
  kubectl port-forward "$1" "$2":"$3" -n msi
}

function cptopod {
  readonly local_file=${1:?"Local file must be specified."}
  readonly pod=${2:?"Pod must be specified."}
  readonly remote_path=${3:=.}
  readonly namespace=${4:=msi}

  kubectl cp "$local_file" "$namespace"/"$pod":/var/www/mos/"$remote_path"
}

function it {
  docker exec -ti "$1" sh
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/Users/khrisna/homebrew/opt/openssl@1.1/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/Users/khrisna/homebrew/opt/curl/bin:$PATH"

export OPENAI_API_KEY=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
