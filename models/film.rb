require_relative("../db/sql_runner")

class Film

attr_accessor( :id, :name, :price)

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}',#{@price}) RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all
    sql =  "SELECT * FROM films"
    return Film.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film)}
    return result
  end

  def self.map_item(sql)
    result = Film.map(sql)
    return result.first
  end

  def update()
    sql = "UPDATE films SET
    title = '#{@title}',
    price = #{@price}
    WHERE id = #{@id}"
    film = SqlRunner.run(sql)
    return film
  end

  def delete
    sql = "DELETE FROM films WHERE
    title = '#{@title}' AND
    price = #{@price}"
    SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = #{@id};"
    return Customer.map_items(sql)
  end

  


end