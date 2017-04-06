#!/bin/sh
#update pulls the newest version of my dotfiles

repos=("$HOME/.dotfiles" "$HOME/.oh-my-zsh")
    
echo ""
echo "Getting the latest from" ${repos} "using git pull --rebase"

for repo in ${repos[@]}
do
    while :
    do
            echo ""
            echo "***********************************************************"
            echo "* Do you want to pull for" ${repo} "?[Y/N] *"
            read INPUT_STRING
            case $INPUT_STRING in
                    Y)
                            echo ""
                            echo "      Pulling latest for" ${repo} "..."
                            cd "${repo}"
                            git pull --rebase
                            echo ""
                            break
                            ;;
                    N)
                            echo ""
                            echo "      Cancelling pull from" ${repo}
                            break
                            ;;
                    *)
                            echo ""
                            echo "      Sorry, I don't understand"
                            ;;
            esac
    done
done
