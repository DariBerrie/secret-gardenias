# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
## check command
puts "Destroying gardens..."
Garden.destroy_all if Rails.env.development?

puts "Creating gardens..."
garden = Garden.create!(
  name: "Cozy Garden",
  image_url: "https://cdn2.atlantamagazine.com/wp-content/uploads/sites/4/2023/05/ABGearthgoddess_courtesy.jpg"
)

puts "#{garden.name} created."

puts "Creating plants..."

plant = Plant.new(
  name: "Poison Ivy",
  image_url: "https://www.geisinger.org/-/media/OneGeisinger/Images/ghs/health-and-wellness/Wellness-Articles/2022/2022-08-Rash-decisions-How-to-deal-with-poison-ivy.jpg?sc_lang=en&hash=00E7391867DC568FBCC847D1459532E8&w=0&h=0&as=1&hash=A8F8472796D5397383686EC5CFC9CEDE"
)

plant.garden = garden
plant.save!

puts "#{plant.name} created."