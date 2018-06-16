class Stock < ActiveRecord::Base
  def self.look_up(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      new(name: stock.company_name, ticker: stock.symbol, last_price: stock.close) unless stock.nil?
    rescue Exception => e
      return nil
    end
  end
end
