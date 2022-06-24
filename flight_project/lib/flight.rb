class Flight

    attr_reader :passengers

    def initialize(flight_string, capacity)
        @flight_number = flight_string
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger)
        unless self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
        self.passengers.map { |ele| ele.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end


end