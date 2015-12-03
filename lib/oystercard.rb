class Oystercard

attr_reader :balance, :history, :journey

MINIMUM=1

LIMIT=90

  def initialize
    self.balance = 0
    @journey = {}
    @history = {}
    @journey_count = 0
  end


  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def touch_in(station)
    raise 'Not enough funds available' if balance < MINIMUM
    @journey[:entry_station] = station
  end

  def touch_out(station)
    @journey_count += 1
    deduct(MINIMUM)
    @journey[:exit_station] = station
    @history[:"Journey #{@journey_count}"] = @journey
    @journey = {}
  end

  def in_journey?
    @journey[:entry_station] != nil
  end

  private

  def balance=(cash) # excluding condition => equivalent to attr_writer :balance
    @balance = cash if cash.is_a?(Fixnum) 
  end

  def deduct(cash)
    self.balance -= cash
  end

end


