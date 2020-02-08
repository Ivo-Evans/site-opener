address = "yandex.com" # change this to adjust it for you

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


# TODO: add argv support for non-default page