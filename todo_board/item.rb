class Item

    def self.valid_date?(d_str)
        nums="1234567890"
        d_str[0..3].split("").all? { |ele| nums.include?(ele)} && d_str[4] == "-" && "01".include?(d_str[5]) && nums.include?(d_str[6]) && d_str[7] == "-" && (("012".include?(d_str[8]) && nums.include?(d_str[9])) || ( d_str[-2..-1] == "30") || ( d_str[-2..-1] == "31"))
    end

    attr_accessor :title, :deadline, :description


    def initialize(title, deadline, description)
        @title = title
        raise "Invalid Date"  if !Item.valid_date?(deadline) 
        @deadline = deadline
        @description = description
        
    end
    
    


end




p Item.valid_date?('2019-10-25') # true
p Item.valid_date?('1912-06-23') # true
p Item.valid_date?('2018-13-20') # false
p Item.valid_date?('2018-12-32') # false
p Item.valid_date?('10-25-2019') # false


puts
puts
puts
puts

p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

p Item.new(
    'Buy Cheese',
    '2019-10-21',
    'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date