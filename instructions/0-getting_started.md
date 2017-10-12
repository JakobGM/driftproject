# A super simple time tracking application for the terminal
We will try to learn everything required in order to make a simple application for the terminal. 
The application will be used to log when we start and stop working, such that we can bill our client/employer correctly.

## End Goal
When we are finished we should be able to do the following:
* Open a terminal.
* Run a command called `yatt start` (yet another time tracker).
* The application saves the start date and time.
* At some later point we run the command `yatt stop`. The stop time is logged.
* All the previous logs can be shown by issuing the command `yatt log`.

## "The Tech Stack"
The application should preferably be implemented as a `bash`-script (or `zsh` if you prefer it).
These kind of "terminal applications" are seldom implemented in bash/zsh in the 21st century. Most programmers prefer to use more "proper" programming languages such as python and ruby. These languages are often considered to be more powerful and consistent, and therefore less error-prone.

But there are some reasons to insist on using `bash` or `zsh` for this exercise:
* All the lines you end up writing in a bash-script are lines that you could have just entered directly into the terminal. You therefore end up learning commands that you will end up using when you use the terminal as an interactive shell.
* A bash script is often more [portable](https://en.wikipedia.org/wiki/Software_portability), as long as you use Linux or MacOS.
* A bash script can often be downloaded and run straight away. No unnecessary configuration/setup required. 
* It is relatively easy to solve a large problem by breaking it into smaller problems and solving them one by one. The smaller issues are often already solved for you by some built-in program in the terminal. In the end you can combine all the solutions. Take a look at the [UNIX philosophy](https://en.wikipedia.org/wiki/Unix_philosophy#Origin).

## How to Solve the Task
Try to make this application in increasing amounts of complexity. A rough outline is given:
* First the program can be run by writing `bash /path/to/folder/name_of_your_shellscrip.sh`. You can worry later about how you can run this by just writing `yatt` anywhere in the directory structure from your terminal.
* Start by not taking in any arguments to the program. First the program can just "echo" out the current time in a reasonable format.
* Then instead of echoing the date out to the terminal, save it to a predefined file instead.
* Make the program append to the file, instead of overwriting the file each time.
* Now implement the `start` and `stop` arguments.
* Implement the `log` argument.

## Relevant Concepts to Learn
Here are some of the concepts you probably need to learn in order to achieve this:
* Creating a shell script. Take a look [here](https://www.shellscript.sh/). You do not need to read the entirety of this guide, try to use it as reference material after you have read the three first sections.
* Understand the concepts of "standard in" and "standard out", specifically related to UNIX architectures. [Here](https://linux.startcom.org/docs/fr/Introduction%20to%20Linux/sect_05_01.html) is an explanation.
* How to learn about a terminal application. Here the [man](https://unix.stackexchange.com/questions/193815/how-do-i-use-man-pages-to-learn-how-to-use-commands/193816) command comes in handy. You might want to install [tldr](http://tldr.sh/) as an addition to `man`, as it gives more example-driven explanations of terminal applications.
* Change the permissions of a file, such that you can run it. See `chmod`. `ls -la` can be used in order to check the permissions of all files in the current working directory. The output can be a bit cryptic, a detailed description can be found [here](https://www.computerhope.com/unix/uchmod.htm).
* Running a shell script directly.
* Adding an alias in order to run a command from an arbitrary working directory. See [`alias`](https://stackoverflow.com/questions/8967843/how-do-i-create-a-bash-alias).
* Adding a program to your `$PATH`. See [how to append to the $PATH variable](https://unix.stackexchange.com/a/26059).
* Printing content to the terminal. See `echo`.
* Get the current time in terminal. See `date`.
* Append standard output to a file. See the `>> operator`.
* Standard in arguments to shell scripts. See `$1`, `$2`, and so on.
* How to "spit out" the content from a file. See `cat`.
