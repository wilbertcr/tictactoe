require "./Human.rb"
require "./Machine.rb"
class Players
  
  attr_accessor :human, :machine
  
  def initialize()
    @human = Human.new
    @machine = Machine.new
  end
  
end