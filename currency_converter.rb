require_relative "currency"


class CurrencyConverter
  def initialize(hash)
    @rate = hash
  end

  def convert(currency_item, request_code)
    if @rate.has_key?(request_code)
      result = currency_item.numerics/@rate[request_code]
      symbol_map = {"$" => :USD, "€" => :EUR, "¥" => :JPY}
      symbol = symbol_map[request_code]
      Currency.new("#{symbol}#{result}")
    else
      raise UnknownCurrencyCodeError, "I don't know that code"
    end
  end
end

c1 = Currency.new("$10.00")
c2 = Currency.new("$10.00")
c3 = Currency.new("€10.00")
c4 = Currency.new("€4.00")
c5 = Currency.new("¥100.00")
c6 = Currency.new("¥200.00")

class UnknownCurrencyCodeError < StandardError
end
