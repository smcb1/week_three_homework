require_relative("../db/sql_runner")
require("pry")

class Screening

  attr_reader :title, :screen_time, :price
  attr_accessor :seats

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @screen_time = options['screen_time']
    @price = options['price']
    @seats = options['seats']
  end

  def save()
    sql = "INSERT INTO screenings
    (
      title,
      screen_time,
      price,
      seats
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id;"
    values = [@title, @screen_time, @price, @seats]
    films = SqlRunner.run(sql, values).first
    @id = films['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET
    (
      name,
      wallet
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5;"
      values = [@title, @screen_time, @price, @seats]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM screenings;"
      screenings = SqlRunner.run(sql).first
      return screenings.map { |s| screenings
      Screening.new(c) }
    end

    def self.delete_all()
      sql = "DELETE FROM screenings;"
      values = []
      SqlRunner.run(sql, values)
    end

end
