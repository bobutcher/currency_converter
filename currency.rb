class Currency
  def initialize(string)
    split_money = string.split("")
    currency_type = split_money.shift
    @numerics - split_money.join("").to_f
    @currency_code = symbol_map[@symbol]
    symbol_map = {"$" => :USD, "€" => :EUR, "¥" => :JPY}
  end

  def amount
    @amount
  end

  def currency_code
    @currency_code = currency_code
  end

  def symbol
    @symbol
  end
end
