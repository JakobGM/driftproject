# Dotfiles
All files starting with a "dot", i.e. ".", in a Unix file system are considered to be hidden. This means that they will not be shown by most GUI file explorers (like Finder on MacOS) or by a normal invocation of `ls` in your terminal (you need to add the -a flag in order to see such files).

But in normal speech/writing, when we say "dotfiles", we usually do not mean _all_ hidden files, but specifically (hidden) configuration files for Unix programs, such as ".vimrc", ".bashrc", ".zshrc", and ".tmuxrc". Such files determine the behaviour of their respective programs. The way to change such configuration files is often:
* You want to change the behaviour of program `xxx`.
* You open your terminal.
* You change directory to your home folder: `cd $HOME`.
* You open/create the file `.xxxrc`: `vim .xxxvimrc`.
* You add a new line to the document, specifying some configuration, and save the document.
* The `xxx` program should reflect the change after closing any existing instance of `xxx` and opening it again.

Let's take a look at an example: we would like to show line numbers when we open a file in vim.
You could do this by issuing the following terminal command: `echo "set number" >> ${HOME}/.vimrc && vim`.
Try to understand exactly what this command does.

We usually want to deploy identical copies of these files to all our workstations and servers. Therefore it is common to have a so called "dotfiles" repository to keep track of your customization files across several different hosts.The version control, deployment, and automatic update mechanism of such files is the task of this project.
Keep in mind that from now on "dotfiles" will refer to configuration files of specific interest, and *not* all hidden files.

## Create your own dotfiles repository
- Create the folder ".dotfiles" in `$HOME` and initilize a git repository within it
- Copy all your dotfiles into the folder
- Commit the files
- Create a new, seperate GitHub repository named dotfiles (don't confuse this with this forked repository), and push your local commit to the remote GitHub repository

## Create an initialization script
In the following task, we are going to write a shell script which automates a somewhat boring task. [This website](shellscript.sh) has a well written tutorial if you need any help.

One of the more common mistakes when it comes to writing shellscripts is related to the use of relative file paths. As you now probably know, a relative file path is interpreted in the context of where you are in the file system, the so called "working directory". You can see this file path by running `pwd` or looking at the environment variable `$PWD`. A relative file path `folder/file` is replaced by the shell with `$pwd/folder/file`, and this _absolute_ file path changes as you move about in the file system with the `cd` command. This is, of course, also the case for a shell script! You would probably want the same behaviour of your shellscript whether if you run it like this `folder/script.sh` our like this `./script.sh`, but that is not necessarily so if the shellscript contains relative file paths. 

There are two ways to "fix" this, 1) Use `cd` in the beginning of your shellscript, using an absolute path. 2) Only use absolute paths, using env. variables like `$HOME` when necessary. The first solution has the probably unwanted effect of changing the working directory of the user if the script is run with `source`. This can be fixed by saving `$PWD` and changing back to it after the script finishes. The second aproach is more conventional, though. It is worth mentioning that "unhandled" relative links can come in handy when you actually want the script to change behaviour depending on where you invoke it. An example is if you have made a shellscript which does something in your current working directory.

Another tip is to try to rely on work that has already been done for you. This is best illustrated with an example; symlinking all files from one folder to another while printing the name of each file and asking the user when the script tries to overwrite an existing file. As a programmer, your first impulse might be to use a for-loop, iterating through all the files, adding some if-constructs in order to check if the files are already present, finally using `ln -s` to link each file symbolically. But this could be easily done in a single line by using the appropiate flags available for the `ln` command. The moral of the story is, take a good look at `man ln` or `man whatever` before you start scripting some behaviour involving a command. This might save you a lot of hazzle!

- Create a shellscript called "init.sh" which is placed within the .dotfiles folder which does the following:
    - Installs oh-my-zsh for your user if the .oh-my-zsh folder does not exist in your home folder (hint: [how to check if folder exists](http://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script))
    - Place symlinks in your home folder which point to files in the .dotfiles folder with the same filenames. For instance $HOME/.vimrc -> .dotfiles/.vimrc. Try to use $HOME when you specify where to put the symlink, and try to use a relative link when you specify the symlink's destination. If your solution uses wildcards (a.k.a. globbing or `*`) you might have troubles matching hidden files. For solutions to this issue, take a look [here](https://unix.stackexchange.com/a/6397).
    - Similarily, symlink to .dotfiles/aliases.zsh (if you have one) from the correct zsh folder using an environment variable (hint: $ZSH_CUSTOM). Remember, all files in $ZSH_CUSTOM with the .zsh-suffix are sourced when zsh starts.
    - Source the .zshrc file
    - Bonus question: When you source the .zshrc file in the script above, how do we need to run the init script in order for it to work correctly?
    - Inform the the user that the task has been successfully performed
    - Bonus task 1: Make the script behave correctly if it has already been run previously. The if control structure in bash can check for existence of files easily, and you might want to use this. The -f flag checks if there exists a file, the -L flag checks if there is a symlink, and the -e flag checks for both. When symlinking with `ln` you might want to use the `-i` flag, which prompts the user when you try to overwrite an existing symlink, asking if the symlink should be overwritten. Check `man ln` for more information.
    - Bonus task 2: Seperate the dotfiles into two folders called 'home' and 'zsh_custom'. Modify the script such that it allows an arbitrary amount of files in each folder, making symlinks from $HOME and $ZSH_CUSTOM to the two respective folders.
    - Bonus task 3: Print the name of each file as it is symlinked in order to give more feedback to the user.
    - Bonus taks 4: If your `.vimrc` file uses the plugin manager Vundle, you need to do a bit more than just symlinking to the `.vimrc` file. If `~/.vim/bundle/Vundle.vim` doesn't exist, you need to git clone the Vundle repository in order to install Vundle. You also need to install all the plugins specified in `.vimrc`. You can do this by running `vim +PluginInstall +qall`. More information can be found [here](https://github.com/VundleVim/Vundle.vim). 
- Commit the shellscript to your personal dotfiles repo and push it to the remote repository
- Copy the shellscript to this repository (which you forked in the beginning of this project), specifically to the folder "$FORKED_REPO/$USER/init.sh"
- Create a pull request to the driftprosjekt repository with this new init-script


## Update mechanism
- Create a shellscript called "update.sh" besides your init-script which does the following
    - Pulls the newest version of your dotfiles from your GitHub repository
    - Either make your GitHub-repository public, such that the "git pull"-operation doesn't prompt the user for their GitHub password, or alternatively, make use of a GitHub token. The last one is a bit more tricky, for additional documentation take a look [here](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
    - Optional: The script runs the `init.sh` script again in case the new updated dotfiles-repository has added any new files. This will require that you have done the bonus task which makes the `init.sh` script behave correctly when it is run for second time.

## Learn to use two new tools
- Learn the basics of how crontab works by googling around. This is a tool which enables you to schedule repeating events on Unix systems.
- Log into Thorium and use the "wall" command in order to broadcast the message "$USER has finished the crontab task" every 30 seconds to all logged in users on Thorium. Google how to use the wall command.

## Update your dotfiles automatically
- Add a cronjob on thorium which runs `update.sh` every day at 03:00
- Bonus task: Make this cronjob initiliazation a part of the init-script. How to do this can be found [here](http://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash). Make a pull request for this new change of init.sh to this repository (driftprosjekt)

## Create a deploy script
- Create a deploy script called "deploy.sh" which takes in one or two arguments, such that it can be run like this: "deploy.sh [hostname] [username]. It should do the following tasks:
    - Save the first argument to the variable $HOSTNAME
    - If a second argument is provided, save it to the variable $USERNAME (question: Why shouldn't we use the variable name $USER?). If username is not provided, use the username of the user which invoked the script.
    - Return an error message to the user if not 1 or 2 arguments where given
    - ssh into username@hostname, pull your dotfiles repository from github, and run the initialization script
    - Return a success message to the user

## Bonus task for an extra challenge
- Create a shellscript in the dotfiles repository called "dotadd.sh" which does the following:
    - Takes in one or more arguments, which are paths to files (start by only supporting absolute file paths)
    - Moves the files to a folder named 'dotadded' in the dotfiles repository. (Bonus bonus task: check if the file is located in $HOME or $ZSH_CUSTOM, and if so, add it to the correct folder)
    - Adds new instructions to the initialization script in order to symlink these files. Here the >> operator might come in handy
    - Runs the initialization script a new(NB: This assumes that the script behaves correctly when it has been partially run before)

## Rounding up
You can now carry on to [project 2](2-filehosting.md), where you will learn how to set up a web server and host files from it.
