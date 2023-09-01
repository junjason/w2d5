class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    attr_reader :name

    def get_flight_number(flight_str)
        alphabet = (['A'..'Z'].to_a + ['a'..'z'].to_a).to_s
        i = 0
        while i < flight_str.length && alphabet.include?(flight_str[i])
            i += 1
        end
        flight_str[i..-1]
    end 

    def has_flight?(flight_str)
        flight_no = get_flight_number(flight_str)
        @flight_numbers.each do |flight_number|
            if flight_no != "" && flight_number.include?(flight_no)
                return true
            end
        end
        false
    end

    def add_flight(flight_str)
        if !has_flight?(flight_str)
            @flight_numbers << flight_str.upcase
        end
    end





end