require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoo_finance'

get '/:symbol' do |symbol|
	@price_array = YahooFinance.quotes([symbol.to_sym], [:last_trade_price])
  @price = @price_array[0][:last_trade_price]
 	@name = symbol
  erb :quote
end
