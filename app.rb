require_relative 'currency'            # => true
require_relative 'currency_converter'  # => true

  c1 = Currency.new("$10.00")   # => #<Currency:0x007ff9fd8826c0 @symbol="$", @numerics=10.0, @currency_type=:USD>
  c2 = Currency.new("$10.00")   # => #<Currency:0x007ff9fd881ef0 @symbol="$", @numerics=10.0, @currency_type=:USD>
  c3 = Currency.new("€10.00")   # => #<Currency:0x007ff9fd881928 @symbol="€", @numerics=10.0, @currency_type=:EUR>
  c4 = Currency.new("€4.00")    # => #<Currency:0x007ff9fd881388 @symbol="€", @numerics=4.0, @currency_type=:EUR>
  c5 = Currency.new("¥100.00")  # => #<Currency:0x007ff9fd87b438 @symbol="¥", @numerics=100.0, @currency_type=:JPY>
  c6 = Currency.new("¥200.00")  # => #<Currency:0x007ff9fd87af38 @symbol="¥", @numerics=200.0, @currency_type=:JPY>

  #can be multiplied by a float
  c2 * 0.25         # => #<Currency:0x007ff9fd87a920 @symbol="$", @numerics=2.5, @currency_type=:USD>
  #can be multiplied by a fixnum
  c3 * 2            # => #<Currency:0x007ff9fd87a448 @symbol="€", @numerics=20.0, @currency_type=:EUR>
  #shows currency code
  c6.currency_type  # => :JPY


  #object with the same currency code and value equal each other
  c1 == c2  # => true
  #objects with different currency code and same value do not equal each other
  c1 == c3  # => false



  #can add with the same currency code
  c1 + c2  # => 20.0
  #can be subtracted with the same currency code
  c2 - c1  # => 0.0

  currency_test = CurrencyConverter.new({:USD => 1, :EUR => 1.13919, :JPY => 0.00922})  # => #<CurrencyConverter:0x007ff9fd8793e0 @rate={:USD=>1, :EUR=>1.13919, :JPY=>0.00922}>

  c7 = currency_test.convert(c1, :JPY)  # => #<Currency:0x007ff9fd878cb0 @symbol="1", @numerics=84.5986984815618, @currency_type=nil>

  c8 = currency_test.convert(c1, :AUD)  # ~> UnknownCurrencyCodeError: I don't know that code

# ~> UnknownCurrencyCodeError
# ~> I don't know that code
# ~>
# ~> /Users/bobutcher/Documents/currency_converter/currency_converter.rb:15:in `convert'
# ~> /Users/bobutcher/Documents/currency_converter/app.rb:35:in `<main>'
