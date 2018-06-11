class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(input_string: params[:order][:input_string])
    if @order.save
      render json: { 
        order: @order.number,
        deliver: @order.deliver_by 
      }.to_json
    else
      render json: { 
        errors: @order.errors.full_messages 
      }.to_json
    end
  end

  def show
    @order = Order.find_by_number(params[:id])
    if @order
      render json: { 
        order: @order.number,
        deliver: @order.deliver_by 
      }.to_json
    else
      render json: { 
        errors: "Order not found"
      }.to_json
    end
  end

  private

  def order_params
    params.require(:order).permit(:input_string)
  end
end
