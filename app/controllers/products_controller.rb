class ProductsController < ApplicationController
    def index
       @products = Product.all
    end

    def productoscaros
        @productoscaros= ActiveRecord::Base.connection.execute("SELECT * FROM ObtenerProductosCaros()")

    end
end
