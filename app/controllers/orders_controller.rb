class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @shipped_orders = @orders.select {|o| o.shipped?}
    @non_shipped_orders = @orders.select {|o| !o.shipped?}
  end

  def show
    @order = Order.find(params[:id])
  end
end
