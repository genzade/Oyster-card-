class Oystercard

attr_reader :balance
LIMIT=90

  def initialize
    @balance = 0

  end

 def top_up(cash)
   @balance = @balance + cash
   raise "Balance cannot exceed £#{LIMIT}" if @balance > LIMIT

end
end
