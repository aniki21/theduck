#!/bin/bash
PATH="/home/pi/.rvm/gems/ruby-2.2.4/bin:/home/pi/.rvm/gems/ruby-2.2.4@global/bin:/home/pi/.rvm/rubies/ruby-2.2.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/.rvm/bin:/home/pi/.rvm/bin"

echo "$(date) -- Running Duck"
/home/pi/.rvm/wrappers/ruby-2.2.4@duck/ruby /home/pi/projects/theduck/duckbot.rb
echo "$(date) -- Duck exited"
