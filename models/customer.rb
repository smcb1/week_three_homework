require_relative("../db/sql_runner")
require("pry-byebug")

class Customer

  attr_reader :id
  attr_accessor :name, :wallet

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @wallet = options['wallet'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      wallet
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id;"
    values = [@name, @wallet]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET
    (
      name,
      wallet
      ) =
      (
        $1, $2
      )
      WHERE id = $3;"
      values = [@name, @wallet]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM customers;"
      customers = SqlRunner.run(sql).first
      return customers.map { |c| customers
        Customer.new(c) }
      end

      def self.delete_all()
        sql = "DELETE FROM customers;"
        values = []
        SqlRunner.run(sql, values)
      end

      def film_tickets() # Show which films a customer has booked to see
        sql = "SELECT films.* FROM films INNER JOIN
        tickets ON tickets.film_id = films.id WHERE
        customer_id = $1
        order by films.title;"
        values = [@id]
        films = SqlRunner.run(sql, values).first
        return films.map { |f| films
          Film.new(f) }
        end

        def ticket_purchase(film)
          @wallet -= film.price
        end

        def num_of_tickets()
          return film_tickets().count
        end

      end
