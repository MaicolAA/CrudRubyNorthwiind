class EmployeesController < ApplicationController
  def index
    result = ActiveRecord::Base.connection.select_all("SELECT * FROM getAllEmployes()")
    @employees = result.to_a

  end
end
