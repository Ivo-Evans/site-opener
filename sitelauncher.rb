address = "lemonparty.com" # change this to adjust it for you

browsers = [
  "firefox",
  "chromium",
  "google-chrome"
]

begin
  new_desktop = `wmctrl -d`[/[0-9]  \*/][0].to_i + 1
  `wmctrl -s #{new_desktop}` # this might not work for fourth desktops or greater - but maybe it will if lower desktops already exist??
  sleep 1
  command = browsers.map { |b| b + " \"#{address}\""}.join(" & ")
  `#{command}`
rescue
  puts "you need to install a dependency, wmctrl, e.g. on Ubuntu"
  puts
  puts "\tsudo apt-get install wmctrl" 
  puts
end

# The state of play: this works if the browsers are not open, if they are open it doesn't open new windows in new desktops, but rather new tabs
# sometimes exceptions are thrown for reasons other than lacking wmctrl, e.g. the wrong browser command
## firefox --new-window URL


# TODO: add argv support for non-default page