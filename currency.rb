class Currency
  attr_reader :currency_type, :numerics, :symbol
  def initialize(string)
    split_money = string.chars
    @symbol = split_money.shift
    symbol_map = { '$' => :USD, '€' => :EUR, '¥' => :JPY }
    @numerics = split_money.join.to_f
    @currency_type = symbol_map[@symbol]
  end

  def +(other)
    if @symbol == other.symbol
      other.numerics + numerics
    else
      raise DifferentCurrencyCodeError, 'Cannot add different currencies together'
    end
  end

  def -(other)
    if @symbol == other.symbol
      other.numerics - numerics
    else
      raise DifferentCurrencyCodeError, 'Cannot subtract different currencies together'
    end
  end

  def ==(other)
    if @symbol == other.symbol
      other.numerics == numerics
    else
      false
    end
  end

  def *(other)
    multi_var = @numerics * other.to_f
    Currency.new("#{@symbol}#{multi_var}")
  end
end

class DifferentCurrencyCodeError < StandardError
end
