class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    logger.debug "In controller"
    @order = Order.create(input_string: params[:order][:input_string])
  end

  private

  def order_params
    params.require(:order).permit(:input_string)
  end
end
