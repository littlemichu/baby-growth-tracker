
class Baby < ActiveRecord::Base
  #include IncompatibleMetricsError
  include Measurement
  #include Unit
  attr_accessor :height_unit, :weight_unit, :temperature_unit
  
  UNIT_MAP = {
    'cm'=> Measurement::Unit::CM,
    'in'=> Measurement::Unit::INCH,
    'lb'=> Measurement::Unit::LB,
    'kg'=> Measurement::Unit::KG,
    '°C'=> Measurement::Unit::DEGREEC,
    '°F'=> Measurement::Unit::DEGREEF
  }
  
  DEFAULT_UNIT_MAP = {
    height: 'cm',
    weight: 'kg',
    temperature: '°C'
  }

  def initialize(attributes = nil, options = {})
    attributes = _convert_attributes(attributes)
    super(attributes, options)
  end

  def update(attributes)
    attributes = _convert_attributes(attributes)
    super(attributes)
  end
  
  def _convert_attributes(attributes)
    if attributes
      
      converted_attr = {}
      
      height_object = UNIT_MAP[attributes[:height_unit]].es(attributes[:height])
      weight_object = UNIT_MAP[attributes[:weight_unit]].es(attributes[:weight])
      temp_object   = UNIT_MAP[attributes[:temperature_unit]].es(attributes[:temperature])
      
      
      
      converted_attr[:height] = UNIT_MAP[get_height_unit()].amount_from_quantity(height_object)
      converted_attr[:weight] = UNIT_MAP[get_weight_unit()].amount_from_quantity(weight_object)
      converted_attr[:temperature] = UNIT_MAP[get_temperature_unit()].amount_from_quantity(temp_object)
      
      
      return attributes.merge(converted_attr)
    end
  end

end
