$:.unshift File.dirname(__FILE__)
module Quantity
  require 'quantity'
  require 'unit'
  require 'incompatible_metrics_error'

  # Ensures Quantity operates correctly.
  describe 'Quantity' do

    it 'compares quantities with similar units' do
      expect(Unit::INCH.es(36) == Unit::YARD.s(1)).to be true
      expect(Unit::INCH.es(36) == Unit::YARD.s(1)).to be true
    end

    it 'raises error for incompatible metrics' do
      expect { Unit::YARD.s(2) - Unit::CUP.s(2) } .to raise_error IncompatibleMetricsError
    end

    it 'different units should be equatable' do
      expect(Unit::QUART.s(2) == Unit::PINT.s(4)).to be true
      expect(Unit::PINT.s(4) == Unit::QUART.s(2)).to be true
    end

    it 'can added quantities in different units' do
      expect(Unit::PINT.s(6) == Unit::PINT.s(2) + Unit::QUART.s(2)).to be true
      expect(Unit::PINT.s(6) == Unit::QUART.s(2) + Unit::PINT.s(2)).to be true
    end

    it 'can negate quantities in different units' do
      expect(Unit::PINT.s(-6) == -Unit::PINT.s(6)).to be true
      expect(Unit::PINT.s(-8) == -Unit::QUART.s(4)).to be true
    end

    it 'can subtract quantities in different units' do
      expect(Unit::PINT.s(-2) == Unit::PINT.s(2) - Unit::QUART.s(2)).to be true
      expect(Unit::PINT.s(2) == Unit::QUART.s(2) - Unit::PINT.s(2)).to be true
    end

    it 'can compare different units' do
      expect(Unit::OUNCE.s(1) != Unit::INCH.es(1)).to be true
    end

  end
end
