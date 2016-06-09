module Quantity
  # Understands a specific metric
  class Unit
    attr_reader :base_amount, :metric_type
    protected :base_amount, :metric_type

    def initialize(metric_type, name, number_of_base_units)
      @name = name
      @metric_type = metric_type
      @base_amount = number_of_base_units.to_f
    end

    def amount(value)
      Quantity.new(value, self)
    end

    def amount_from(other_amount, other_unit)
      other_amount * other_unit.base_amount / @base_amount
    end

    def amount_from_quantity(quantity)
      amount_from(quantity.amount, quantity.unit)
    end

    def compatible?(other)
      @metric_type == other.metric_type
    end

    def s(value)
      amount(value)
    end

    def es(value)
      amount(value)
    end

    DISTANCE = Object.new
    INCH = Unit.new(DISTANCE, 'inches', 1)
    FOOT = Unit.new(DISTANCE, 'feet', 12 * 1)
    YARD = Unit.new(DISTANCE, 'yards', 3 * 12 * 1)
    MILE = Unit.new(DISTANCE, 'miles', 1760 * 3 * 12 * 1)
    CM = Unit.new(DISTANCE, 'centimeters', 1/2.54)

    VOLUME = Object.new
    OUNCE = Unit.new(VOLUME, 'ounces', 1)
    CUP = Unit.new(VOLUME, 'cups', 8 * 1)
    PINT = Unit.new(VOLUME, 'pints', 2 * 8 * 1)
    QUART = Unit.new(VOLUME, 'quarts', 2 * 2 * 8 * 1)
  end
end
