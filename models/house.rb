require_relative '../db/sql_runner'

class House
  attr_reader :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = 'INSERT INTO houses (name, logo)
    VALUES ($1, $2) RETURNING id;'
    values = [@name, @logo]
    @id = SQL.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all
    SQL.run('DELETE FROM houses;', [])
  end

  def self.find_all
    SQL.run('SELECT * FROM houses;', []).map do |house_hash|
      House.new(house_hash)
    end
  end

  def self.find(id)
    House.new(SQL.run('SELECT * FROM houses WHERE id = $1;', [id])[0])
  end
end
