class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?

        delimiter, numbers = extract_delimiter_and_numbers(numbers)

        validate_consecutive_delimiters!(numbers, delimiter)
        validate_negatives(numbers, delimiter)

        numbers.split(Regexp.union(delimiter)).reject(&:empty?).map(&:to_i).sum
    end

    private

    def extract_delimiter_and_numbers(numbers)
        if numbers.start_with?("//")
            delimiter_section, numbers = numbers.split("\n", 2)

            raise "Invalid Input" if numbers.nil?

            delimiter = delimiter_section[2..]
            validate_delimiter!(delimiter)

            [Regexp.new(Regexp.escape(delimiter)), numbers]
        
        else
            raise "Invalid Input" if numbers.include?("+")
            [/[\n,]/, numbers]
        end
    end

    def validate_delimiter!(delimiter)
        raise "Invalid Input" if delimiter.match?(/[{}]/) || delimiter.empty?
    end

    def validate_consecutive_delimiters!(numbers, delimiter)
        delimiter_str = delimiter.is_a?(Regexp) ? delimiter.source : Regexp.escape(delimiter)

        if numbers.match?(Regexp.new("#{delimiter_str}{2,}"))
            raise "Invalid Input"
        end
    end    

    def validate_negatives(numbers, delimiter)
        negatives = numbers.split(Regexp.union(delimiter)).map(&:to_i).select { |n| n.negative? }
        raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end
end