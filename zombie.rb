class Zombie
  @@horde = [] #collection of zombies
  @@plaque_level = 10 #rate at which new zombie spawn. This value will increase
  @@max_speed = 5 #max value of speed
  @@max_strength = 8 #max value for str
  @@default_speed = 1 #value won't change
  @@default_strength = 3 #value won't change


#Come back to solve the negative edge-case
  def initialize(speed, strength)
    if speed > @@max_speed
       @speed = @@default_speed
    else
      @speed = speed
    end
    if strength <= @@max_strength
       @strength = strength
    else
      @strength = @@default_strength
    end
  end

#Returns value of horde
  def self.all
    return @@horde
  end

  def self.spawn
    spawn_number = rand(@@plaque_level)
    current_horde = 0
    while current_horde < spawn_number
      current_horde += 1
      @@horde << Zombie.new(rand(@@max_speed), rand(@@max_strength))
    end
  end

  def self.new_day
    # Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plaque_level
  end

  def self.increase_plaque_level
    random_number = rand(3)
    @@plaque_level += random_number
  end

  #some_die_off random number that removes zombies

  def self.some_die_off
    random_number = rand(11)
    @@horde.pop(random_number)
  end

  def encounter
    outrun = self.outrun_zombie?
    survive = self.survive_attack?

    if outrun == false && survive == true
      me_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << me_zombie
      return "You are now a ZOMBIE"
    elsif outrun == false && survive == false
      return "You are now DEAD"
    else
      return "You are now ALIVE"
    end
  end

  def outrun_zombie?
    your_speed = rand(@@max_speed)
    if your_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    your_strength = rand(@@max_strength)
    if your_strength > @strength
      return true
    else
      return false
    end
  end

end
#
# Zombie.spawn
# Zombie.new_day
# Zombie.increase_plaque_level
# Zombie.some_die_off
zombie1 = Zombie.new(2, 2)

2.times do
  zombie1.encounter
end

puts Zombie.all.inspect
