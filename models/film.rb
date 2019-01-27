require_relative("../db/sql_runner")
require("pry-byebug")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id;"
    values = [@title, @price]
    films = SqlRunner.run(sql, values).first
    @id = films['id'].to_i
  end

  def update()
    sql = "UPDATE films SET
    (
      name,
      wallet
      ) =
      (
        $1, $2
      )
      WHERE id = $3;"
      values = [@title, @price]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM films;"
      films = SqlRunner.run(sql).first
      return films.map { |f| films
      Film.new(c) }
    end

    def self.delete_all()
      sql = "DELETE FROM films;"
      values = []
      SqlRunner.run(sql, values)
    end

    def customer_bookings() # Show which cutomers have booked to see which film
      sql = "SELECT customers.* FROM customers INNER JOIN
      tickets ON tickets.customer_id = customers.id
      WHERE film_id = $1
      order by customers.name;"
      values = [@id]
      customers = SqlRunner.run(sql, values).first
      return customers.map { |c| customers
        Customer.new(c) }
      end

  end
