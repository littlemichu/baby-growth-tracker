
class Baby < ActiveRecord::Base
  #include IncompatibleMetricsError
  # include Quantity
  #include Unit
  attr_accessor :height_unit, :weight_unit, :temperature_unit

  def initialize(attributes = nil, options = {})
    puts "OPTIONS: #{options}"
    puts "ATTRIBUTES: #{attributes}"
    if (attributes != nil and attributes.key?(:name))
      puts "name: #{attributes[:name]}"
      attributes[:name] = "Alice the Taiwanese!"
    end
    super(attributes, options)
  end
    
# UNIT_MAP = {
#   'CM'=> Quantity::Unit::CM,
#   'INCH'=> Quantity::Unit::INCH,
#   'LB'=> Quantity::Unit::LB,
#   'KG'=> Quantity::Unit::KG,
#   'DEGREEC'=> Quantity::Unit::DEGREEC,
#   'DEGREEF'=> Quantity::Unit::DEGREEF
#   }

# def self.get_heights_from_db()
#   return [3, 2, 1]
# end

# def self.get_heights_unit()
#   return "CM"
# end

# def self.get_weights_unit()
#   return "KG"
# end

# def self.get_temps_unit()
#   return "DEGREEF"
# end


# height_arr = get_heights_from_db()

# height_object_arr = []
# weight_object_arr = []
# temp_object_arr = []

# default_heights_unit = "INCH"
# default_weights_unit = "LB"
# default_temps_unit = "DEGREEC"

# height_arr.each do |height|
#   height_object_arr.push(UNIT_MAP[default_heights_unit].es(height))
#   weight_object_arr.push(UNIT_MAP[default_weights_unit].es(height))
#   temp_object_arr.push(UNIT_MAP[default_temps_unit].es(height))
# end

# puts height_arr

# converted_height_arr= []
# converted_weight_arr= []
# converted_temp_arr= []
#   height_object_arr.each do |height|
#     converted_height_arr.push(UNIT_MAP[get_heights_unit()].amount_from_quantity(height))
#     converted_weight_arr.push(UNIT_MAP[get_weights_unit()].amount_from_quantity(height))
#     converted_temp_arr.push(UNIT_MAP[get_temps_unit()].amount_from_quantity(height))
#   end
#   puts converted_height_arr
#   puts converted_weight_arr
#   puts converted_temp_arr

end
