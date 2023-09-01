require "byebug"

class Item
    def self.valid_date?(date_string)
        #debugger
        return false if date_string[4] != '-' || date_string[7] != '-'
        year = date_string[0..3].to_i
        month = date_string[5..6].to_i
        day = date_string[8..9].to_i
        return false if month < 1 || month > 12
        return false if day < 1 || day > 31
        return false if year < 2000 || year > 2024
        true
    end

    def initialize(title, deadline, description)
        if !Item::valid_date?(deadline)
            raise RuntimeError.new("Invalid date")
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    attr_accessor :title, :description
    attr_reader :deadline

    def deadline=(new_deadline)
        if !Item::valid_date?(new_deadline)
            raise RuntimeError.new("Invalid date")
        end
        @deadline = new_deadline
    end

    
end