require_relative "item"


class List

    attr_accessor :label

    def initialize(label)

        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        @items << Item.new( title, deadline, description) if Item.valid_date?(deadline)
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < @items.length
    end

    def swap(index_1, index_2)
        if (valid_index?(index_1) && valid_index?(index_2))
            @items[index_1],@items[index_2] = @items[index_1],@items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else 
            nil
        end
    end

    def priority
        @items[0]
    end



    def print
        puts "____________________________________________________________"
        puts "|"+((" "*((58 - self.label.length)/2) )+self.label).ljust(58)+"|"
        puts "|__________________________________________________________|"
        puts "| Num | Item                                      Deadline |"
        puts "|__________________________________________________________|"
        (0...@items.length).each do |i| 
           puts  "|  #{(i+1).to_s.rjust(2)} | #{@items[i].title.ljust(38)}| #{@items[i].deadline} |"
        end
        puts "|__________________________________________________________|"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "____________________________________________________________"
            puts "|"+((" "*((58 - @items[index].title.length)/2) )+@items[index].title).ljust(58)+"|"
            puts "|__________________________________________________________|"
            puts "| Description                                     Deadline |"
            puts "|__________________________________________________________|"
            puts "| " +  @items[index].description.ljust(47)+@items[index].deadline + "|"
            puts "|__________________________________________________________|"
        else
            puts "Not a valid item."
        end

    end

    def print_priority
        print_full_item(0)
    end





end
puts
puts
puts
puts

  temp =  nil

p temp = List.new( "hi")
puts
puts

p temp.add_item('Fix login page', '2019-10-25', 'The page loads too slow.' )
puts
puts

p temp.size
puts
puts

p temp.add_item('Change Me', '1999-12-31', 'y2k' )
puts
puts

p temp.size
puts
puts

p temp.swap(0,1)
puts
puts

p temp
puts
puts

p temp[1]

puts
puts

p temp.add_item('Fix checkout page', '2010-12-02' )
puts
puts

temp.print
puts
puts
p temp[1]
puts
puts
p
temp.print_priority