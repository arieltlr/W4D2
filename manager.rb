require_relative "./employee.rb"

class Manager < Employee
    attr_reader :name, :title, :salary, :boss
    attr_accessor :employees
    
    def initialize(name, title, salary, boss=nil)
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

    # def employees=()

    # end

end



ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
# ned.bonus_multiplier(5)
darren.bonus_multiplier(4)
david.bonus_multiplier(3)