require_relative 'currency'

class CurrencyConverter
  def initialize(hash)
    @rate = hash
  end

  def convert(currency_item, request_code)
    if @rate.has_key?(request_code)
      result = currency_item.numerics / @rate[request_code]
      symbol_map = { '$' => :USD, '€' => :EUR, '¥' => :JPY }
      symbol = symbol_map[request_code]
      Currency.new("#{symbol}#{result}")
    else
      raise UnknownCurrencyCodeError, "I don't know that code"
    end
  end
end

class UnknownCurrencyCodeError < StandardError
end
