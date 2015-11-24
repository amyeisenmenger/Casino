module Random_Events

random_events = [ Proc.new(player) { mugged_in_toilet }, ]
  def mugged_in_toilet(player)
    puts "#{player.name} worked"
  end

end

random_events.sample.call(Player.new("james" ,21 ))