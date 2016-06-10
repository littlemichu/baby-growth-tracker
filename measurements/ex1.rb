require './unit'
require './quantity'
require './incompatible_metrics_error'

def get_heights_from_db()
  return Array[3, 2, 1]
end

def get_heights_unit()
  return "CMS"
end

height_arr = get_heights_from_db()

i = 0
while i < height_arr.size
  height_object_arr.push(Quantity::Unit::INCH.es(height_arr.at(i)))
  i = i + 1
end

height_arr.each do |height|
  height_object_arr.push(Quantity::Unit::INCH.es(height))
end


def get_converted_height_arr(height_object_arr, unit)
  converted_arr = Array.new (height_arr.size)
  i = 0
  while i < height_arr.size
    converted_arr.push(Quantity::Unit::get_heights_unit().s(1).amount_from_quantity(height_arr.at(i)))
    i = i +1
  end
  return converted_arr
  
  converted_arr= []
  height_object_arr.each do |height|
  converted_arr.push(unit_map[get_heights_unit()].amount_from_quantity(height))
  
end
end

#ten_inches = Quantity::Unit::INCH.es(10)
