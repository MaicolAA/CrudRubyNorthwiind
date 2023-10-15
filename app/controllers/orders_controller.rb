# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end
  
    # Otras acciones del controlador...
  
  end
  