require_relative("../db/sql_runner")

class Ticket

  attr_accessor(:id, :customer_id, :film_id)

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING *"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets"
    return Ticket.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new(ticket)}
    return result
  end

  def self.map_item(sql)
    result = Ticket.map(sql)
    return result.first
  end

  def update()
    sql = "UPDATE tickets SET
    customer_id = '#{@customer_id}',
    film_id = #{@film_id}
    WHERE id = #{@id}"
    film = SqlRunner.run(sql)
    return film
  end

  def delete
    sql = "DELETE FROM tickets WHERE
    customer_id = '#{@customer_id}' AND
    film_id = #{@film_id}"
    SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers INNER JOIN tickets on tickets.customer_id = customers.id WHERE customer_id = #{@customer_id}"
    return Customer.map_items(sql)
  end

end