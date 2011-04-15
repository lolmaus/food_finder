# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

#### Food Finder ####
#
# Запускайте этот файл из командной строки
# для работы с Food Finder.
#


# Константа APP_ROOT будет содержать текущую директорию
APP_ROOT = File.dirname(__FILE__)

# Добавляем текущий путь в список путей, где искать файлы
$:.unshift( File.join(APP_ROOT, 'lib') )

# Подключаем собственную библиотеку
require 'guide'

# Поехали!
guide = Guide.new ('restaurants.txt')
guide.launch!