# Gems
require 'yaml'
require 'discordrb'
require 'zalgo'

# --------------------------------------------------------- #
# Config
# --------------------------------------------------------- #

CONFIG = YAML.load_file(File.join(__dir__,"config.yml"))

# What're we listening for?
words = [
  "duck","Duck","DUCK",
  "quack","Quack","QUACK",
  "bird","Bird","BIRD",
  "fly","Fly","FLY",
  "swim","Swim","SWIM",
  "pond","Pond","POND",
  "paddle","Paddle","PADDLE",
  "bread","Bread","BREAD",
  "hunt","Hunt","HUNT",
  "egg","Egg","EGG",
  "fowl","Fowl","FOWL",
  "bill","Bill","BILL",
  "water","Water","WATER",
  "lame","Lame","LAME",
  "wild","Wild","WILD",
  "wing","Wing","WING",
  "feather","Feather","FEATHER",
  "tape","Tape","TAPE",
  "ened","Ened","ENED",
  "aenid","Aenid","AEnid","AENID",
  "rubber","Rubber","RUBBER",
  "rabbit","Rabbit","RABBIT",
  "season","Season","SEASON"
]

# Longer replies for @mentions
responses = [
  "who would summon the duck, her dark wings spread wide to envelop the cowering earth?",
  "the duck's bill opens, and her quack shakes the earth's foundation",
  "like a ragged blade, the duck's great shadow splits the water's surface",
  "the dreadful padding of her feet echoes in your chest",
  "quack","quack","quack","quack","quack","quack quack",
  "quack quack quack"
]

# --------------------------------------------------------- #
# Methods
# --------------------------------------------------------- #

# Quack
def quack(event,message="quack")
  event.respond(Zalgo.he_comes(message)) # respond
end

# Convert the text to rot13
def rot13(value)
  return rot5(value.downcase.tr("abcdefghijklmnopqrstuvwxyz","nopqrstuvwxyzabcdefghijklm").upcase)
end

def rot5(value)
  return value.tr("0123456789","5678901234")
end

# --------------------------------------------------------- #
#  The Duck Bot
# --------------------------------------------------------- #

# Login
bot = Discordrb::Bot.new CONFIG["email"], CONFIG["password"]

# Respond to messages
bot.message(containing: words) do |event|
  roll = rand(100)+1
  if roll == 100
    quack(event,"QUACK QUACK QUACK")
  elsif roll >= 90
    quack(event)
  end
end

# Test Channel responses
bot.message(in: "#ducktest") do |event|
  quack(event)
end

# Respond to mentions
bot.mention() do |event|
  event.respond(Zalgo.he_comes(rot13(responses.sample)))
end

# Respond to PMs
bot.pm() do |event|
  event.respond(Zalgo.he_comes(rot13("i can see you, #{event.author.username.downcase}")))
end

# --------------------------------------------------------- #
# Run the bot and restart on errors
# --------------------------------------------------------- #
begin
  # Run the bot
  puts "---"
  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} -- Starting "
  bot.run
rescue Exception => e
  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} -- #{e.message}"
  retry
end
