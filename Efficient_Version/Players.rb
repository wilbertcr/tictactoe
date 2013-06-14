class Players
  
  def self.human(my_id, opponent_id)
    Human.new(my_id, opponent_id)
  end

  def self.machine(my_id,opponent_id)
    Machine.new(my_id, opponent_id)
  end

end