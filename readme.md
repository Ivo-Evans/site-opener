This is a program to open a webpage in multiple browsers in a new desktop, so that you may check your site's cross-browser compatibility. You must have Ruby and wmctrl installed and you must be using Linux. 

It works straight out of the box, but you should install it by adding it to your $PATH so that you can execute it from any location.

Workspaces can be switched between with ctrl-alt-arrow

## Adding sitelauncher.rb to your global path as an executable

There are variations on how to do this, but here is how I did it:

- Put sitelauncher.rb in 
    ```home//<your username>/bin/``` e.g. ```home/ivo/bin/```
  - If this directory doesn't exist (quite likely), make it
- Set the address of your Ruby version on line 1 of sitelauncher.rb.
  - Find this address with the terminal command ```which ruby```
  - remember to include a ! after the # to make the comment on line 1 a shebang comment
- make sitelauncher.rb an executable in terminal by running  
  ```chmod +x sitelauncher.rb```
  - make sure you're in the right folder
- Make sure ```home//<your username>/bin/``` is in your $PATH
  - see all the directories in your #PATH with  
    ```sed 's/:/\n/g' <<< "$PATH"```
  - if it isn't there (probable) add it to your .bashrc or .zshrc file (in ~)
  - add this line to .bashrc and/or .zshrc  
    ```export PATH=$PATH:"home/ivo/bin/" #obviously don't use ivo unless you are also called Ivo```
- restart shell (you might need to log out and in again)
- You should now be able to enter sitelauncher.rb from any location

## using sitelauncher.rb

- Just entering sitelauncher.rb should open the default site in a new desktop
- edit the default if you like or override it by calling sitelauncher with a new URL, e.g.
  ```sitelauncher.rb gogle.com```
- add or remove browsers by adding or removing their relevant launch commands from the array ```browsers```
