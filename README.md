# TheDuck 
A Discord bot that watches for keywords and quacks in response. 

## Setup 
* Install Ruby 2.2.4 
* Install bundler (`gem install bundler`) 
* Run `bundle install` 
* Create a `config.yml` file in the same directory with
```
token: "DISCORD_APPLICATION_BOT_TOKEN" 
application_id: "DISCORD_APPLICATION_ID"
```

These values can be created when setting up a [Discord application](https://discordapp.com/developers/applications/me)
 
## Running 
Run `bundle exec ruby duckbot.rb`

To add the bot to a server you control, open `https://discordapp.com/oauth2/authorize?client_id=DISCORD_APPLICATION_CLIENT_ID&scope=bot&permissions=0` in a browser.
