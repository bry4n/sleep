$:.unshift "lib"

require 'sleep'

sleep = Sleep.new

puts "Wake up at one of the following times: (Set your alarm clock)"
puts sleep.now.join(", ")
