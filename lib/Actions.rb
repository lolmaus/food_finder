# Список действий, которые пользователь может вводить
#
# Переменная класса @@actions содержит массив экземпляров класса Action.



class Actions

	class Action

		def initialize(aliases=[])
			@aliases = aliases
		end

		def match?(user_alias)
			@aliases.include?(user_alias)
		end

		attr_reader(:aliases)
	end










	@@actions = []
	@@actions << Action.new(['list','read'])
	@@actions << Action.new(['find','search'])
	@@actions << Action.new(['add','new'])
	@@actions << Action.new(['quit','exit'])



	# Поиск значения
	def self.action_exists? (user_action)
		@@actions.find do |action|
			action.match?(user_action)
		end
	end

	# Возвращаем список команд
	def self.actions
		@@actions.collect {|action| action.aliases.first}
	end
end