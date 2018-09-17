#Vampire.new Task is to create a Vampire class
  #Every vampire has name, age, in_coffin, drank_blood_today
# stores a list of vampires into a array class
#Everyday at sunset the vampire leaves their coffins for drank_blood_today
  #Get back to coffin by sunrise and if they did not drink blood than they die


class Vampire
  @@coven = []


  def initialize(name, age)
    @name = name
    @age  = age
    @in_coffin  = true
    @drank_blood_today  = false
  end

  def in_coffin
    return @in_coffin
  end

  def in_coffin=(in_coffin)
    @in_coffin = in_coffin
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def drank_blood_today=(drank_blood_today)
    @drank_blood_today = drank_blood_today
  end


  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.all
    return @@coven
  end


  def drink_blood
    # random_number = rand(2)
    #
    # @@coven.each do |vampire|
    # # if random_number == 0
    #   return @drank_blood_today = true
    # else
    #   return "Could not find blood"
    @drank_blood_today = true

    end


  def self.sunrise
    @@coven.delete_if {|vampire| vampire.in_coffin == false || vampire.drank_blood_today == false}
  end

  def self.sunset #class method
    @@coven.each do |vampire|
    vampire.drank_blood_today = false
    vampire.in_coffin = false
    end
  end

  def go_home
    @in_coffin = true
  end

end
#
# 20.times do
#
# Vampire.create("Dan", 20)
# end
#
#
#
#
# puts Vampire.all.inspect
#
# Vampire.sunset
