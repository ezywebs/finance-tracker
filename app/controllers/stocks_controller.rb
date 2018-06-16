class StocksController < ApplicationController
  def search
    flash.now[:danger] = "Invalid stock ticker" if params[:stock].blank? || (@stock = Stock.look_up(params[:stock])).nil?
    render partial: 'users/result'
  end
end