require 'factory_girl_rails'
require 'faker'

puts "Seed: start"

20.times do
  FactoryGirl.create :book
end

puts "Seed: finish"
