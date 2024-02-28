# frozen_string_literal: true

class ValidatesIdentity
  module MxRfc
    class PersonValidator
      VALIDATION_REGULAR_EXPRESSION = /\A([A-ZÑ&]{4})([0-9]{2}[0-1][0-9][0-3][0-9])([A-Z0-9]{3})\z/i.freeze

      attr_reader :value

      def initialize(value)
        @value = value.to_s
      end

      def valid?
        return true if value.blank?

        result.present? && valid_date?
      end

      def formatted
        value
      end

      private

      def result
        @result ||= VALIDATION_REGULAR_EXPRESSION.match(value)
      end

      def birth_date
        @birth_date ||= result[2]
      end

      def birth_date_century
        @birth_date_century ||= birth_date[0..1].to_i
      end

      def birth_date_month
        @birth_date_month ||= birth_date[2..3]
      end

      def birth_date_day
        @birth_date_day ||= birth_date[4..5]
      end

      def current_century
        Date.today.year.to_s[0..1].to_i
      end

      def last_century
        current_century - 1
      end

      def valid_date?
        year =
          if birth_date_century > current_century
            "#{last_century}#{birth_date_century}"
          else
            "#{current_century}#{birth_date_century}"
          end

        Date.parse("#{birth_date_day}-#{birth_date_month}-#{year}")

        true
      rescue Date::Error
        false
      end
    end
  end
end
