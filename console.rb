require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )
require( 'pry-byebug')

customer1 = Customer.new( { 'name' => 'Leonardo', 'funds' => 50})
customer1.save()
customer2 = Customer.new( { 'name' => 'Ralph', 'funds' => 75})
customer2.save()
customer3 = Customer.new( { 'name' => 'Michaelangelo', 'funds' => 20})
customer3.save()
customer4 = Customer.new( { 'name' => 'Donatello', 'funds' => 600})
customer4.save()

film1 = Film.new( { 'title' => 'Nausicaa of the valley of the Wind', 'price' => 20 })
film1.save()
film2 = Film.new( { 'title' => 'Deadpool', 'price' => 15 })
film2.save()
film3 = Film.new( { 'title' => 'Laputa', 'price' => 18 })
film3.save()

ticket1 = Ticket.new( { 'customer_id' => customer3.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new( { 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3.save()
ticket4 = Ticket.new( { 'customer_id' => customer4.id, 'film_id' => film3.id})
ticket4.save()

binding.pry
nil