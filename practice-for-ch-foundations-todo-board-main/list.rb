require_relative ("./item.rb")

class List 
    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label

    def add_item(title, deadline, description="")
        return false if !Item::valid_date?(deadline)
        item = Item.new(title, deadline, description)
        @items << item
        true
    end

    def size 
        @items.length
    end

    def valid_index?(index)
        return true if index >= 0 && index < @items.length
        false 
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------"
        puts @label.rjust(25)
        puts "------------------------------------------"
        puts "Index".ljust(10) + "| " + "Item".ljust(15) + "| " + "Deadline".ljust(15)
        puts "------------------------------------------"
        @items.each_with_index do |item, i|
            puts i.to_s.ljust(10) + "| " + item.title.ljust(15) + "| " + item.deadline
        end
        puts "------------------------------------------"
    end

    def print_full_item(index)
        if valid_index?(index)
            puts "------------------------------------------"
            puts @items[index].title
            puts @items[index].deadline
            puts @items[index].description
            puts "------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !valid_index?(index)
        while (index != 0 && amount != 0)
            swap(index-1, index)
            index-=1
            amount-=1
        end
        true
    end

    def down(index, amount=1)
        return false if !valid_index?(index)
        while (index != @items.length && amount != 0)
            swap(index, index+1)
            index+=1
            amount-=1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end


end