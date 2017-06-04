# Virus Predictor

# I worked on this challenge [with: Eli Vickery].
# We spent [2] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  def virus_effects
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

  private

  def predicted_deaths(population_density, population, state)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects


#=======================================================================
# Reflection Section
=begin

1) The first subset of hash data (the key-value pair for each state) is the standard Ruby notation for declaring hashes. That is declaring the key on the left hand side of the statement (in "" or ''), then the '=>' symbol, then the data which contains the value of the key.
The second subset of hash data (the value of each state key) is declared using 'syntactical sugar,' or a shorthand method ruby uses for simpler syntax. Instead of writing out the key and values as strings, the key-value pair can simply be declared in the following format: "key: value"
Additionally, the second shorthand method of declaring key-value pairs requires that when referencing the values of each (subset) key, a special notation must be used, like so: 'hash_name[:key1][:subset_key2]'. Alternatively when string notation is used to declare the hash keys, the normal way of accessing the value would look like: 'hash_name["key1_name"]["key2_name"]'.

2) 'require_relative' is a subset of 'require' and the main difference is that require_relative loads files from directories relative to where the program resides, while require can only use the current directory in which you are running the program.
Another way to think about it is that proper implementation of require can only be declared in a couple ways: 'require ./file.rb' or 'require file.rb', whereas require_relative can point to any filepath so long as the directory points to an existing file.

3) The most common methods of iterating through a hash in ruby are using the #each and #map hash methods. Using these methods with an enumerator, with the key & value pair as the two pipe variables, allows for easy access to the main parameter values of each hash.
While it is also possible to use other methods, such as a for, while, or until loop, these methods are slightly more involved and generally aren't preferred unless there is a specific reason for their implementation.

4) 

5)

=end