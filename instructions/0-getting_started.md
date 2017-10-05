# A super simple time tracking application for the terminal
We will try to learn everything required in order to make a simple application for the terminal. 
The application will be used to log when you start and stop working, so that you can bill your client/employer correctly.

When you are finished you should be able to do the following:
* Open terminal
* Run a command called `yatt start` (yet another time tracker)
* The application saves the date and time, marking it specifically as the start
* At some later point you run the command `yatt stop`. The stop time is logged.
* All the previous logs can be shown by issuing the command `yatt log`.

The application should preferably be implemented as a `bash`-script.

Try to make this application in increasing amounts of complexity. A rough outline is given:
* First the program can be run by writing `bash /path/to/folder/name_of_your_shellscrip.sh`. You can worry later how you can run this by just writing `yatt` anywhere in the directory structure from your terminal.
* Start by not taking in any arguments to the program. First the program can just "echo" out the current time in a reasonable format.
* Then instead of echoing the date out to the terminal, save it to a predefined file instead.
* Make the program append to the file, instead of overwriting the file each time.
* Now implement the `start` and `stop` arguments.
* Implement the `log` argument.

Here are some of the concepts you probably need to learn in order to achieve this:
* Creating a shell script. Take a look [here](https://www.shellscript.sh/)
* Change the permissions of a file, such that you can run it. See `chmod`.
* Running a shell script directly.
* Adding an alias in order to run a command from an arbitrary working directory. See `alias`.
* Adding a program to your `$PATH`. Google: "Append to $PATH variable".
* Echoing content to the terminal. See `echo`.
* Get the current time in terminal. See `date`.
* Understand the concepts of "standard in" and "standard out", specifically related to UNIX architectures.
* Append standard output to a file. See the `>> operator`.
* Standard in arguments to shell scripts. See `$1`, `$2`, and so on.
* How to "spit out" the content from a file. See `cat`.
