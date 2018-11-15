class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @shipped_orders = @orders.select {|o| o.shipped?}
    @non_shipped_orders = @orders.select {|o| !o.shipped?}
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    10.times {@order.line_items.build}
  end

  def create
    @order = Order.create(shipped_at: order_params[:shipped_at])
    widget = Widget.create!
    order_params[:line_items_attributes].each do |attributes|
      quantity = attributes[-1][:quantity].to_i
      unit_price = attributes[-1][:unit_price].to_f

      if quantity > 0 && unit_price.present?
        line_item = LineItem.new(order_id: @order.id,
                                 quantity: quantity,
                                 unit_price: unit_price,
                                 widget_id: widget.id)
        line_item.save!
      end
    end

    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(
        :shipped_at,
        line_items_attributes: [:quantity, :unit_price])
  end
end
