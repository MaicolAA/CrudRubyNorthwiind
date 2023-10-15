class EmployeesController < ApplicationController
  def mostrar
    result = ActiveRecord::Base.connection.select_all("SELECT * FROM getAllEmployes()")
    @employees = result.to_a

  end

  def index
    @employees = Employee.all
  end
  

  
  def edit
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def destroy
    employee_id = params[:id]
    ActiveRecord::Base.connection.execute("CALL delete_employee(#{employee_id})")
    redirect_to employees_path, notice: 'Empleado eliminado exitosamente.'
  end
  
  def create

    employee_id = params[:employee][:employee_id]
    last_name = params[:employee][:last_name]
    first_name = params[:employee][:first_name]
    title = params[:employee][:title]
    title_of_courtesy = params[:employee][:title_of_courtesy]
    birth_date = params[:employee][:birth_date]
    hire_date = params[:employee][:hire_date]
    address = params[:employee][:address]
    city = params[:employee][:city]
    region = params[:employee][:region]
    postal_code = params[:employee][:postal_code]
    country = params[:employee][:country]
    home_phone = params[:employee][:home_phone]
    extension = params[:employee][:extension]
    notes = params[:employee][:notes]
    reports_to = params[:employee][:reports_to]
    photo_path = params[:employee][:photo_path]


    ActiveRecord::Base.connection.execute("SELECT create_employee(
      #{employee_id}::smallint,
      '#{last_name}',
      '#{first_name}',
      '#{title}',
      '#{title_of_courtesy}',
      '#{birth_date}'::date,
      '#{hire_date}'::date,
      '#{address}',
      '#{city}',
      '#{region}',
      '#{postal_code}',
      '#{country}',
      '#{home_phone}',
      '#{extension}',
      NULL::bytea, -- Photo (null si no se proporciona)
      '#{notes}',
      #{reports_to}::smallint,
      '#{photo_path}'
    )")

    redirect_to employees_path, notice: 'Empleado creado exitosamente.'
  end


  
    def update
    employee_id = params[:id]
    last_name = params[:employee][:last_name]
    first_name = params[:employee][:first_name]
    title = params[:employee][:title]
    title_of_courtesy = params[:employee][:title_of_courtesy]
    birth_date = params[:employee][:birth_date]
    hire_date = params[:employee][:hire_date]
    address = params[:employee][:address]
    city = params[:employee][:city]
    region = params[:employee][:region]
    postal_code = params[:employee][:postal_code]
    country = params[:employee][:country]
    home_phone = params[:employee][:home_phone]
    extension = params[:employee][:extension]
    notes = params[:employee][:notes]
    reports_to = params[:employee][:reports_to]
    photo_path = params[:employee][:photo_path]

    ActiveRecord::Base.connection.execute("SELECT update_employee(
      #{employee_id}::smallint,
      '#{last_name}',
      '#{first_name}',
      '#{title}',
      '#{title_of_courtesy}',
      '#{birth_date}'::date,
      '#{hire_date}'::date,
      '#{address}',
      '#{city}',
      '#{region}',
      '#{postal_code}',
      '#{country}',
      '#{home_phone}',
      '#{extension}',
      NULL::bytea, -- Photo (null si no se proporciona)
      '#{notes}',
      #{reports_to}::smallint,
      '#{photo_path}'
    )")

    redirect_to employees_path, notice: 'Empleado actualizado exitosamente.'


  end
  
end
