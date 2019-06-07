class OrdersController < ApplicationController

  def show
    user=session[:user]
    puts user['id']
    @orders=Order.where(user_id: user['id'])
  end



end