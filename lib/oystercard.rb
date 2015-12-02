class Oystercard

attr_reader :balance, :travelling
LIMIT=90

  def initialize
    self.balance = 0
    @travelling = false
  end


  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def deduct(cash)
    self.balance -= cash
  end

  def touch_in
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

  def in_journey?
    @travelling
  end

  private

  def balance=(cash) # excluding condition => equivalent to attr_writer :balance
    @balance = cash if cash.is_a?(Fixnum) 
  end

end