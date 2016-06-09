require './unit'
require './quantity'
require './incompatible_metrics_error'

def get_heights_from_db()
  return [3, 2, 1]
end

height_arr = []
i = 1
until i == 3:
  height_arr.push(Quantity::Unit::INCH.es(i)
end



def get_converted_height_arr(height_arr, unit):
  converted_arr = []
  height_arr.each do |height|
    converted_arr.push(unit.amount_from_quantity(height))
  end
  return converted_arr
end
ten_inches = Quantity::Unit::INCH.es(10)
