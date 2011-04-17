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


end