require './unit'
require './quantity'
require './incompatible_metrics_error'

UNIT_MAP = {
  'CM': Quantity::Unit::CM,
  'INCH': Quantity::Unit::INCH
}

#Height     Weight      Date
#20"     |  8        |  2016-05-01

class Measurement

  @height
  @weight
  @timestamp
  
end

#arr = [<Measurement @height= ; @weight= >, <Measurement @height=; @weight=;>, ... ]

height_unit = 'INCH'
weight_unit = 'LB'

arr = [
  ["height", 1, 2, 3],
  ["weight", 1, 2, 3]
  ]



def convert_measurements(arr, height_unit, weight_unit)
  converted_arr = []
  arr.each do |measurement|
  end
end

def get_heights_from_db()
  return [3, 2, 1]
end

def get_weights_from_db()
  return [1, 2, 3]
end

height_arr = []


def get_converted_arr(arr, unit)
  converted_arr = []
  arr.each do |measurement|
    converted_arr.push(UNIT_MAP[unit].amount_from_quantity(measurement))
  end
  return converted_arr
end