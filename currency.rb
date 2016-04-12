class Currency
  # attr_reader :currency_type, :numerics                   # => nil
  def initialize(string)
    string
    split_money = string.chars
    @symbol = split_money.shift
    symbol_map = {"$" => :USD, "€" => :EUR, "¥" => :JPY}
    @numerics = split_money.join.to_f
    @currency_type = symbol_map[@symbol]
  end
  def +(other)
    if @symbol == other.symbol
    other.numerics + self.numerics
  else
    raise DifferentCurrencyCodeError, "Cannot add different currencies together"
    end
  end
  def -(other)
    if @symbol == other.symbol
     other.numerics - self.numerics
   else
    raise DifferentCurrencyCodeError, "Cannot subtract different currencies together"
    end
  end

  def ==(other)
    if @symbol == other.symbol
    other.numerics == self.numerics
  else
    false
    end
  end

  def currency_type
    return @currency_type
  end

  def numerics
     @numerics
  end

  def symbol
     @symbol
  end

  def *(other)
    multi_var = @numerics * other.to_f
     Currency.new("#{@symbol}#{multi_var}")
  end
end

  class DifferentCurrencyCodeError < StandardError
  end
