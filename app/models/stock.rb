class Stock < ActiveRecord::Base
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.look_up(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      new(name: stock.company_name, ticker: stock.symbol, last_price: stock.close) unless stock.nil?
    rescue Exception => e
      return nil
    end
  end
  
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
