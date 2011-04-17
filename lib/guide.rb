# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'restaurant'
require 'action'

class Guide

	def initialize(path=nil)
		# Пытаемся найти текстовый файл ресторана.
		Restaurant.filepath = path

		if Restaurant.file_exists?
			puts "Файл #{Restaurant.filepath} с данными о ресторанах обнаружен."
		# Если не можем найти, создаем новый файл.
		elsif Restaurant.create_file
			puts "Создан новый файл #{Restaurant.filepath} для хранения данных о ресторанах"
		# Если не можем создать, выходим
		else
			puts "Не удалось ни обнаружить, ни создать файл с данными ресторана. Программа прервана."
			exit!
		end
	end


	def launch!
		# Вступление
		introduction

		# Основной цикл
		result = nil
		until result == :quit # Завершаем цикл, если пользователь ввел "quit"

			# Запарашиваем, что пользователь хочет сделать.
			action = get_action

			# Выполнить это действие, сохранить результат в result
			result = Action.perform(action)
		end

		# Завершение
		conclusion
	end

	def get_action

		action = nil

		# Спрашиваем пользователя, что он хочет, пока он не введет валидную команду.
		until action
			puts "\nВведите одну из команд: " + Action.return_default_actions.join(", ")
			print "> "
			action = gets.chomp.downcase.strip
		end
		return action
	end


	def introduction
		puts "\n\n<<< Добро пожаловать в Food Finder>>>\n\n"
		puts "Это интерактивный каталог, который поможет вам выбрать ресторан по вкусу.\n\n"
	end

	def conclusion
		puts "\n<<< До свидания и приятного аппетита! >>>\n\n\n"
	end
end