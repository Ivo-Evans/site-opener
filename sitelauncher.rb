#! /usr/share/rvm/rubies/ruby-2.7.0/bin/ruby
# The above line should be modified for you. use the terminal command which ruby to find your filepath
default_address = "http://127.0.0.1:5500/" # change this as convenient
address = ARGV.empty? ? default_address : ARGV[0]

browsers = [
  "firefox",
  "chromium",
  "google-chrome"
  # edit this array as you like. Make sure that any browsers you choose take the same command format cmd --new-window <URL> or modify the code below
]

begin
  new_desktop = `wmctrl -d`[/[0-9]  \*/][0].to_i + 1
  `wmctrl -s #{new_desktop}` 
  # sleep 1 #re-enable if browsers sometimes open in old desktop not new one
  `#{browsers.map { |b| b + " --new-window" + " \"#{address}\"" + " & "}.join("")}`
  # `#{command}`
rescue
  puts "The launcher encountered an error. It is likely that you need to install the dependency, wmctrl, e.g. on Ubuntu"
  puts
  puts "\tsudo apt-get install wmctrl" 
  puts
end

=begin
Instructions 

1. Running the program

run to open same website in multiple browsers in a single workspace
switch between workspaces with ctrl-alt-arrow
must have wmctrl installed
will open the default address by default, but if you include an address when you invoke the program it will use that instead. I have configured the default address to my normal localhost for vscode live server.



2. 'installing' the program
This script can be used 'out of the packet' but if you add it to your $PATH as an executable you can use it from anywehre. There are variations on how to do this, but here is how I did it:

- Put sitelauncher.rb in home//<your username>/bin/ e.g. home/ivo/bin/ 
  - If this directory doesn't exist (quite likely), make it
- Set the address of your Ruby version on line 1 of sitelauncher.rb. 
  - Find this address with the terminal command which ruby
  - remember to include a ! after the # to make the comment on line 1 a shebang comment
- make sitelauncher.rb an executable in terminal by running
  chmod +x sitelauncher.rb
  - make sure you're in the right folder
- Make sure home//<your username>/bin/ is in your $PATH 
  - see all the directories in your #PATH with 
    sed 's/:/\n/g' <<< "$PATH"
  - if it isn't there (probable) add it to your .bashrc or .zshrc file (in ~)
  - add this line to .bashrc and/or .zshrc
    export PATH=$PATH:"home/ivo/bin/" #obviously don't use ivo unless you are also called Ivo
- restart shell (you might need to log out and in again)
- You should now be able to enter sitelauncher.rb from any location
=end










