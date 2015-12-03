#  

# In order to keep using public transport
# As a customer
# I want to add money to my card

require 'oystercard'

describe 'User Stories' do
  it 'raise error if balance is less than minimum fare' do 
    oystercard = Oystercard.new
    expect { oystercard.touch_in('entry_station') }.to raise_error 'Not enough funds available'
  end

  it 'deducts minimum fare when touching out' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM)
    expect { oystercard.touch_out('exit_station') }.to change{ oystercard.balance}.by -(Oystercard::MINIMUM)
  end

  it 'touching out at station resets entry station' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station') ; oystercard.touch_out('exit_station')
    expect(oystercard.journey).to eq({})
  end

  it 'access journey history' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station') ; oystercard.touch_out('exit_station')
    expect(oystercard.history).to eq(:"Journey 1" => { entry_station: 'entry_station', exit_station: 'exit_station' } )
  end
  
end

