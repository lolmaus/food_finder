# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

# #



class Action

	@@actions = []

	def self.find_action (user_action)
		@@actions.find do |action|
			return action if action.match?(user_action)
		end
	end

	# Возвращаем список команд
	def self.return_default_actions
		@@actions.collect {|action| action.aliases.first}
	end

	def self.perform (user_action)

		action = self.find_action(user_action)

		if action
			puts "\nВыполняю «#{user_action}».\n"
			action.perform
		else
			puts "\nЯ не понимаю эту команду. :(\n"
		end
	end


	attr_reader(:aliases)

	def initialize(aliases=[], &block)
		@@actions << self
		@aliases = aliases
		@action = block
	end

	def match?(user_alias)
		@aliases.include?(user_alias)
	end

	def perform
		@action.call
	end


end

Action.new(['list','read'])
Action.new(['find','search'])


Action.new(['add','new']) do
	puts "\nДобавляем ресторан. Введите его данные."

	restaurant = Restaurant.build_with_wizard

	if restaurant.save
		puts "\nРесторан добавлен.\n\n"
	else
		puts "\nОшибка сохранения. :( Ресторан не добавлен.\n\n"
	end
end


Action.new(['quit','exit']) { :quit }