class Oystercard

attr_reader :balance, :travelling

MINIMUM=1

LIMIT=90

  def initialize
    self.balance = 0
    @travelling = false
  end


  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def touch_in
    raise 'Not enough funds available' if balance < MINIMUM
    @travelling = true
  end

  def touch_out
    @travelling = false
    deduct(MINIMUM)
  end

  def in_journey?
    @travelling
  end

  private

  def balance=(cash) # excluding condition => equivalent to attr_writer :balance
    @balance = cash if cash.is_a?(Fixnum) 
  end

  def deduct(cash)
    self.balance -= cash
  end

end