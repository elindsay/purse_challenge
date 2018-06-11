class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(input_string: params[:order][:input_string])
    if @order.save
      render json: @order
    else
      render json: { 
        errors: @order.errors.full_messages 
      }.to_json,
      status: 422
    end
  end

  def show
    @order = Order.find_by_number(params[:id])
    if @order
      render json: @order
    else
      render json: { 
        error: "Order not found"
      }.to_json,
      status: 404
    end
  end

  def index
    @orders = Order.all
    render json: @orders
  end

  private

  def order_params
    params.require(:order).permit(:input_string)
  end
end
