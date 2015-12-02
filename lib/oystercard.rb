class Oystercard

attr_reader :balance, :entry_station

MINIMUM=1

LIMIT=90

  def initialize
    self.balance = 0
  end


  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def touch_in(station)
    raise 'Not enough funds available' if balance < MINIMUM
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM)
    @entry_station = nil
  end

  def in_journey?
    @entry_station
  end

  private

  def balance=(cash) # excluding condition => equivalent to attr_writer :balance
    @balance = cash if cash.is_a?(Fixnum) 
  end

  def deduct(cash)
    self.balance -= cash
  end

end