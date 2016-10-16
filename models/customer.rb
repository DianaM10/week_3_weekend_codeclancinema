require_relative("../db/sql_runner")

class Customer

  attr_accessor( :id, :name, :funds)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES 
    ('#{@name}', #{@funds}) RETURNING *"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    return Customer.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

  def self.map_item(sql)
    result = customers.map(sql)
    return result.first
  end

  def update()
    sql = "UPDATE customers SET
    name = '#{@name}',
    funds = #{@funds}
    WHERE id = #{@id}"
    customer = SqlRunner.run(sql)
    return customer
  end

  def delete
    sql = "DELETE FROM customers WHERE
    name = '#{@name}' AND
    funds = #{@funds}"
    SqlRunner.run(sql)
  end

 


end