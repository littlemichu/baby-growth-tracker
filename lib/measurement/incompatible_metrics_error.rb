
  module Measurement

  # Understands that an invalid operation was attempted
  # on incompatible Unit types
  class IncompatibleMetricsError < RuntimeError

    def initialize(*units)
      @units = units
    end

  end
end


