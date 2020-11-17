class Manager < Employee
    attr_accessor :employees
    
    def initialize
        super
        @employees = []
    end

    def bonus_multiplier(multiplier)
        queue = @employees
        sum = 0
        until queue.empty?
            person = queue.shift
            sum += person.salary * multiplier
            queue << person.employees
        end
        sum
    end

    def employees=

    end

end