require "./Human.rb"
require "./Machine.rb"
class Players
  
  attr_accessor :human, :machine

  def human
    Human().new()
  end

  def machine
    Machine.new
  end
  
    
end