require_relative '../db/sql_runner.rb'
require_relative 'house'

class Student
  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house'].to_i
    @age = options['age'].to_i
  end

  def to_s
    "ID: #{@id}, Name: #{@first_name} #{@last_name},
    House: #{find_house.name} and Age: #{@age}."
  end

  def save
    sql = 'INSERT INTO students (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4) RETURNING id;'
    values = [@first_name, @last_name, @house, @age]
    @id = SQL.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = 'UPDATE students SET (first_name, last_name, house, age) =
    ($1, $2, $3, $4) WHERE id = $5;'
    values = [@first_name, @last_name, @house, @age, @id]
    SQL.run(sql, values)
  end

  def delete
    SQL.run('DELETE FROM students WHERE id = $1;', [@id])
  end

  def self.delete_all
    SQL.run('DELETE FROM students;', [])
  end

  def self.find_all
    SQL.run('SELECT * FROM students;', []).map do |student_hash|
      Student.new(student_hash)
    end
  end

  def self.find(id)
    Student.new(SQL.run('SELECT * FROM students WHERE id = $1;', [id])[0])
  end

  def find_house
    House.new(SQL.run('SELECT * FROM houses WHERE id = $1;', [@house])[0])
  end
end
