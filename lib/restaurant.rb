# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'csv'

class Restaurant

	# Переменная класса, содержащая путь к файлу данных с ресторанами
	@@filepath = nil
	# Создаем метод назначения переменной класса извне
	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end
	def self.filepath
		@@filepath
	end

	def self.file_exists?
		# Класс должен знать, существует ли файл с данными о ресторанах
		@@filepath && self.file_usable?
	end

	def self.file_usable?

		return true if @@filepath &&
						File.exists?(@@filepath) &&
						File.readable?(@@filepath) &&
						File.writable?(@@filepath)
		# Конец unless
	end

	def self.create_file
		# Создаем файл с данными о ресторанах
		File.open(@@filepath, 'w') unless file_exists?
		return file_usable?
	end

	def self.saved_restaurants
		# Считываем файл с данными о ресторанах
		# Возвращаем экземпляры ресторанов.
	end

	def self.build_with_wizard
		args = {}

		print "Название ресторана: "
		args[:name] = gets.chomp.strip

		print "Кухня: "
		args[:cuisine] = gets.chomp.strip

		print "Средний счет (в рублях): "
		args[:price] = gets.chomp.strip

		return self.new(args)
	end


	def initialize(args={})
		@name    = args[:name]    || ""
		@cuisine = args[:cuisine] || ""
		@price   = args[:price]   || ""
	end

	attr_accessor :name, :cuisine, :price

	def save
		return false unless Restaurant.file_usable?
		CSV.open(@@filepath, 'a') do |writer|
			writer << [@name, @cuisine, @price]
		end
	end
end