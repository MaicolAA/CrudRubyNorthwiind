# db/migrate/xxxxxxxxxxxxxx_create_empleados.rb

class CreateEmpleados < ActiveRecord::Migration[6.1]
  def change
    create_table :empleados do |t|
      t.string :name
      t.string :phone
      t.integer :dept_id
      t.string :direccion
      t.boolean :isactive

      t.timestamps
    end

    # Restricción de clave foránea para dept_id
    add_foreign_key :empleados, :departamentos, column: :dept_id
  end
end

