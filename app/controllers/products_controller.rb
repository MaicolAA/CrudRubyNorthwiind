class ProductsController < ApplicationController



    def index
       @products = Product.all
       @suppliers = Supplier.all
       @categories = Category.all
    end

    def productoscaros
        @productoscaros= ActiveRecord::Base.connection.execute("SELECT * FROM ObtenerProductosCaros()")

    end
    def edit
        @product = Product.find(params[:id])

        @suppliers = Supplier.all
        @categories = Category.all
    end
      
    #new version 
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path, notice: "Producto actualizado exitosamente."
        else
            render 'edit'
        end
    end

  
        def product_params
            params.require(:product).permit(:product_name, :supplier_id, :category_id, :quantity_per_unit, :unit_price, :units_in_stock, :units_on_order, :reorder_level, :discontinued)
        end


        def new
          @product = Product.new
          @product.product_id = generate_unique_product_id

          @suppliers = Supplier.all
          @categories = Category.all
        end
        
        def create
          @product = Product.new(product_params)
          
          # intent

  

          #end

          if @product.save
            flash[:success] = 'Producto creado correctamente.'
            redirect_to products_path
          else
            render 'new'
          end
        end



        private

        def product_params
          params.require(:product).permit(:product_id, :product_name, :supplier_id, :category_id, :quantity_per_unit, :unit_price, :units_in_stock, :units_on_order, :reorder_level, :discontinued)
        end

        def generate_unique_product_id
          loop do
            random_id = rand(10..99)
            return random_id unless Product.exists?(product_id: random_id)
          end
        end

        #intento de llamar en combocox opciones



        
end



