class Oystercard

attr_reader :balance
LIMIT=90

  def initialize
    self.balance = 0
  end

  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def deduct(cash)
    self.balance -= cash
  end

  private

  def balance=(cash)
    @balance = cash if cash.is_a?(Fixnum)
  end



end
