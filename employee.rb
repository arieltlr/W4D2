class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        add_manager
    end

    def bonus_multiplier(multiplier)
        bonus = @salary * multiplier
    end

    def add_manager 
        if !boss.nil?
            boss.employees << self
        end
    end


end


