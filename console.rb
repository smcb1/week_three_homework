require("pry-byebug")
require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")
require_relative("models/screening")

# Ticket.delete_all()
# Film.delete_all()
# Screenings.delete_all()
# Customer.delete_all()

customer1 = Customer.new({ 'name'=> 'Colin Bell', 'wallet'=> '5' })
customer2 = Customer.new({ 'name'=> 'Louise Reid', 'wallet'=> '10' })
customer3 = Customer.new({ 'name'=> 'John McCollum', 'wallet'=> '15' })
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({ 'title'=> 'Iron Man', 'price'=> '3' } )
film2 = Film.new({ 'title'=> 'The Incredible Hulk', 'price'=> '5' } )
film3 = Film.new({ 'title'=> 'Thor', 'price'=> '8' } )
film4 = Film.new({ 'title'=> 'Captain America', 'price'=> '5' } )
film5 = Film.new({ 'title'=> 'Batman Begins', 'price'=> '3' } )
film6 = Film.new({ 'title'=> 'Vice', 'price'=> '10' } )
film1.save()
film2.save()
film3.save()
film4.save()
film5.save()
film6.save()

ticket1 = Ticket.new({ 'customer_id'=> customer1.id, 'film_id'=> film6.id })
ticket2 = Ticket.new({ 'customer_id'=> customer2.id, 'film_id'=> film4.id })
ticket3 = Ticket.new({ 'customer_id'=> customer3.id, 'film_id'=> film4.id })
ticket1.save()
ticket2.save()
ticket3.save

# Extensions
# screening1 = Screening.new({ "screen_time" => "12:00", "film_id" => film1.id, "seats" => "5" })
# screening2 = Screening.new({ "screen_time" => "15:00", "film_id" => film2.id, "seats" => "10" })
# screening3 = Screening.new({ "screen_time" => "17:00", "film_id" => film3.id, "seats" => "15" })
# screening4 = Screening.new({ "screen_time" => "20:00", "film_id" => film6.id, "seats" => "20" })
# screening1.save()
# screening2.save()
# screening3.save()
# screening4.save()

binding.pry
nil
