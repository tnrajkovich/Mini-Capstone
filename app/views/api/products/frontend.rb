
require "http"

system "clear"
puts "Welcome to the Real Estate Crowdfunding app!"

while true
  puts "Choose an option:"
  puts "[1] Show one product"
  puts "[2] Show all products"
  puts "[q] Quit"
  input_choice = gets.chomp
  if input_choice == "1"
    response = HTTP.get("http://localhost:3000/api/one_product_url")
    contact = response.parse
    pp contact
  elsif input_choice == "2"
    response = HTTP.get("http://localhost:3000/api/all_products_url")
    contacts = response.parse
    pp contacts
  elsif input_choice == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid option."
  end
  puts
end
