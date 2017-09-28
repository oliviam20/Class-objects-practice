class Employee

  attr_reader :name #getter

  # validation: the following ensures valid arguments are given
  def name=(name) #setter
    if name == ""
      raise "Name can't be blank!"
    end
    @name = name
  end
  # end validation

  # def initialize(name = "Anonymous", salary = 0.0, hourly_wage = 0.0)
  #   self.name = name # name = is the same as calling name=
  #   self.salary = salary # same principle as above. self points to the object/instance (amy) itself
  #   # we have to use 'self' because there'll be an error if we do amy.name = name
  #   # also, amy (instance) is not in scope so we use 'self' to refer to the class itself
  #   # Ruby definitely knows 'self.name=name' is a call to the 'name=' method. This enables validation
  #   self.hourly_wage = hourly_wage
  # end

  def print_name
    puts "Name: #{self.name}" # self.name is the same as name; it works if 'self' is omitted
  end

end

class SalariedEmployee < Employee

  attr_reader :salary

  # validation: the following ensures valid arguments are given
  def salary=(salary) #setter
    if salary < 0
      raise "A salary of #{salary} isn't valid!"
    end
    @salary = salary
  end

  def print_pay_stub
    print_name # This calls print_name method inherited from superclass Employee
    pay_for_period = (self.salary / 365.0 * 14)
    formatted_pay = format("%.2f", pay_for_period)
    puts "Pay This Period: $#{formatted_pay}"
  end

end

class HourlyEmployee < Employee

  attr_reader :hourly_wage, :hours_per_week

  def hourly_wage=(hourly_wage)
    if hourly_wage < 0
      raise "An hourly wage of $#{hourly_wage} isn't valid!"
    end
    @hourly_wage = hourly_wage
  end

  def hours_per_week=(hours_per_week)
    if hours_per_week < 0
      raise "#{hours_per_week} hours isn't valid!"
    end
    @hours_per_week = hours_per_week
  end

  def print_pay_stub
    print_name # This calls print_name method inherited from superclass Employee
    pay_for_period = (hourly_wage * hours_per_week * 2)
    formatted_pay = format("%.2f", pay_for_period)
    puts "Pay This Period: $#{formatted_pay}"
  end

end

amy = SalariedEmployee.new #Try invalid arguments to test the methods name= and salary=
amy.name = "Amy Blake"
amy.salary = 50_000
amy.print_pay_stub

olivia = HourlyEmployee.new
olivia.name = "Olivia Mo"
olivia.hourly_wage = 23
olivia.hours_per_week = 50
olivia.print_pay_stub
