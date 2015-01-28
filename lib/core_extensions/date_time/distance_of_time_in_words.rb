module CoreExtensions
  module DateTime
    module DistanceOfTimeInWords
      def parse_distance_of_time_in_words(string)
        date_pattern = Regexp.new('(\d+) (\w+) ago')

        digit = string.match(date_pattern)[1].to_i
        frame = case string.match(date_pattern)[2]
        when 'day', 'days' then :days
        when 'month', 'months' then :months
        when 'year', 'years' then :years
        end

        digit.send(frame).ago
      end
    end
  end
end