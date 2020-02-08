default_address = "yandex.com"
address = ARGV.empty? ? default_address : ARGV[0]

browsers = [
  "firefox",
  "chromium",
  "google-chrome"
  # edit this array as you like. Make sure that any browsers you choose take the same command format cmmd --new-window <URL> or modify the code below
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


# Instructions 

# run to open same website in multiple browsers in a single workspace
# switch between workspaces with ctrl-alt-arrow
# must have wmctrl installed
# will open the default address by default, but if you include an address when you invoke the program it will use that instead. I have configured the default address to my normal localhost for vscode live server.














