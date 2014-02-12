require "scrivener/validations"

module Ohm
  module Validations
    include Scrivener::Validations

    module Callbacks
      def valid?
        before_validation

        result = super

        after_validation

        result
      end

      protected

      def before_validation
      end

      def after_validation
      end
    end

    include Callbacks
  end
end
