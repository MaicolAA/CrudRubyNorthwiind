class OrderSearchController < ApplicationController
  
  def index
    if params[:employee_id].present?
      @employee = Employee.find(params[:employee_id])
      @orders = ActiveRecord::Base.connection.select_all("select * from orders where employee_id =(#{@employee.employee_id})")
    else
      @employee = nil
      @orders = []
    end

    @employees = Employee.all
    @customers = Customer.all
    
  end
end
