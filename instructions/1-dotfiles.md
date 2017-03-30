# Dotfiles

## Create your own dotfiles repository
- Create the folder ".dotfiles" in $HOME and initilize a git repository within it
- Copy all your dotfiles into the folder
- Commit the files
- Create a new, seperate GitHub repository named dotfiles (don't confuse this with this forked repository), and push your local commit to the remote GitHub repository

## Create an initialization script
- Create a shellscript called "init.sh" which is placed within the .dotfiles folder which does the following:
    - Installs oh-my-zsh for your user if the .oh-my-zsh folder does not exist in your home folder (hint: [how to check if folder exists](http://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script))
    - Place symlinks in your home folder which point to files in the .dotfiles folder with the same filenames. For instance $HOME/.vimrc -> .dotfiles/.vimrc. Try to use $HOME when you specify where to put the symlink, and try to use a relative link when you specify the symlink's destination.
    - Similarily, symlink to .dotfiles/aliases.zsh (if you have one) from the correct zsh folder using an environment variable (hint: $ZSH_CUSTOM). Remember, all files in $ZSH_CUSTOM with the .zsh-suffix are sourced when zsh starts.
    - Source the .zshrc file
    - Bonus question: When you source the .zshrc file in the script above, how do we need to run the init script in order for it to work correctly?
    - Inform the the user that the task has been successfully performed
- Commit the shellscript to your personal dotfiles repo and push it to the remote repository
- Copy the shellscript to this repository (which you forked in the beginning of this project), specifically to the folder "$FORKED_REPO/$USER/init.sh"
- Create a pull request to the driftprosjekt repository with this new init-script


## Update mechanism
- Create a shellscript called "update.sh" besides your init-script which does the following
    - Pulls the newest version of your dotfiles from your GitHub repository
    - Either make your GitHub-repository public, such that the "git pull"-operation doesn't prompt the user for their GitHub password, or alternatively, make use of a GitHub token. The last one is a bit more tricky, for additional documentation take a look [here](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

## Learn to use two new tools
- Learn the basics of how crontab works by googling around. This is a tool which enables you to schedule repeating events on Unix systems.
- Log into Thorium and use the "wall" command in order to broadcast the message "$USER has finished the crontab task" every 30 seconds to all logged in users on Thorium. Google how to use the wall command.

## Update your dotfiles automatically
- Add a cronjob on thorium which runs init.sh every day at 03:00
- Bonus task: Make this cronjob initiliazation a part of the init-script. How to do this can be found [here](http://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash). Make a pull request for this new change of init.sh to this repository (driftprosjekt)

## Create a deploy script
- Create a deploy script called "deploy.sh" which takes in one or two arguments, such that it can be run like this: "deploy.sh [hostname] [username]. It should do the following tasks:
    - Save the first argument to the variable $HOSTNAME
    - If a second argument is provided, save it to the variable $USERNAME (question: Why shouldn't we use the variable name $USER?). If username is not provided, use the username of the user which invoked the script.
    - Return an error message to the user if not 1 or 2 arguments where given
    - ssh into username@hostname, pull your dotfiles repository from github, and run the initialization script
    - Return a success message to the user
