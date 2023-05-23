require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'
require_relative './classes/person'
require_relative './modules/create'
require_relative './modules/list'
require_relative './modules/hasher'
require_relative './modules/store'

class App
  include Create
  include List
  include Hasher
  include Store
  attr_reader :people, :books

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    load_files
    show_menu
    save_files
    puts 'Thank you for using this app!' if @number.to_i == 7
  end
end
