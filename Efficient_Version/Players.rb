class Players
  
  def self.human(my_identifier, opponent_identifier)
    Human.new(my_identifier, opponent_identifier)
  end

  def self.machine(my_identifier,opponent_identifier)
    Machine.new(my_identifier, opponent_identifier)
  end

end