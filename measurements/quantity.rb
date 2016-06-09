module Quantity
  # Understands a specific amount
  class Quantity
    attr_reader :amount, :unit
    #protected :amount, :unit

    def initialize(amount, unit)
      @amount = amount.to_f
      @unit = unit
    end

    def ==(other)
      return false unless @unit.compatible?(other.unit)
      amount == other_amount(other)
    end

    def +(other)
      unless @unit.compatible?(other.unit)
        fail IncompatibleMetricsError.new(@unit, other.unit)
      end
      Quantity.new(@amount + other_amount(other), @unit)
    end

    def -@
      Quantity.new(- amount, @unit)
    end

    def -(other)
      self + -other
    end

    protected

    def other_amount(other_quantity)
      unit.amount_from(other_quantity.amount, other_quantity.unit)
    end

  end
end
