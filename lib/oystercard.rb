class Oystercard

attr_reader :balance, :entry_station, :exit_station, :history, :journey

MINIMUM=1

LIMIT=90

  def initialize
    self.balance = 0
    @journey = {}
    @history = []
  end


  def top_up(cash)
    raise "Balance cannot exceed £#{LIMIT}" if balance + cash > LIMIT
    self.balance += cash
  end

  def touch_in(station)
    raise 'Not enough funds available' if balance < MINIMUM
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM)
    @exit_station = station
    record_journey
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

  def record_journey
    journey[entry_station] =  exit_station 
    history << journey
  end

end