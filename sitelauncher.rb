#! /usr/share/rvm/rubies/ruby-2.7.0/bin/ruby
# frozen_string_literal: true

default_address = 'http://127.0.0.1:5500/' # change this as convenient
address = ARGV.empty? ? default_address : ARGV[0]

browsers = [
  'firefox',
  'chromium',
  'google-chrome'
  # edit this array as you like. These are commands to be passed to your terminal. Make sure that any browsers you choose take the same command format cmd --new-window <URL> or modify the code below
]

begin
  new_desktop = `wmctrl -d`[/[0-9]  \*/][0].to_i + 1
  `wmctrl -s #{new_desktop}`
  # sleep 1 #re-enable if browsers sometimes open in old desktop not new one
  `#{browsers.map { |b| b + ' --new-window' + " \"#{address}\"" + ' & ' }.join('')}`
rescue StandardError
  puts "
  The launcher encountered an error. It is likely that you need to install
  wmctrl, e.g. on Ubuntu

  \tsudo apt-get install wmctrl

  "
end
