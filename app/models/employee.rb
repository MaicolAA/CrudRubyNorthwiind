class Employee < ApplicationRecord
    self.primary_key = "employee_id" 

    def full_name
      "#{first_name} #{last_name}"
    end
  end
  
