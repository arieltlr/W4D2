require_relative "./employee.rb"
require "byebug"

class Manager < Employee
    attr_reader :name, :title, :salary, :boss
    attr_accessor :employees
    
    def initialize(name, title, salary, boss=nil)
        super
        @employees = []
    end

    def bonus_multiplier(multiplier)
        # debugger
        queue = @employees
        # debugger
        sum = 0
        # debugger
        until queue.empty?
            # debugger
            person = queue.shift
            # debugger
            sum += person.salary * multiplier
            # debugger
            queue += person.employees if person.class == Manager
            # debugger
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
p ned.bonus_multiplier(5)
p darren.bonus_multiplier(4)
p david.bonus_multiplier(3)