require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
    
  def self.columns
    # ...
    @column_names ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    @column_names.first.map(&:to_sym)
  end


  def self.finalize!
    
    self.columns.each do |c|
      define_method( "#{c}=" ) do |val|
        @attributes[c] = val
      end
      define_method("#{c}") do
        @attributes[c]
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name

  end

  def self.table_name
    # ...
    @table_name = self.to_s.downcase+"s"
    
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end





  def initialize(params = {})
    # ...
    
  end

  def attributes
    # ...
    @attributes||=Hash.new

  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
