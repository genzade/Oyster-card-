#  

# In order to keep using public transport
# As a customer
# I want to add money to my card

require 'oystercard'

describe 'User Stories' do
  oystercard = Oystercard.new
  it 'responds to balance' do
  expect { oystercard.balance }.not_to raise_error
  end

  oystercard = Oystercard.new
  it 'adds money to oystercard' do
  expect { oystercard.top_up(Oystercard::MINIMUM) }.not_to raise_error
  end

  it 'touching in' do
  oystercard = Oystercard.new
  oystercard.top_up(Oystercard::MINIMUM) 
    expect { oystercard.touch_in('entry_station') }.not_to raise_error
  end

  it 'touching out' do
  oystercard = Oystercard.new 
    expect { oystercard.touch_out('exit_station') }.not_to raise_error
  end

  it 'in journey' do
    oystercard = Oystercard.new
    expect { oystercard.in_journey?}.not_to raise_error
  end

  it 'raise error if balance is less than minimum fare' do 
    oystercard = Oystercard.new
    expect { oystercard.touch_in('entry_station') }.to raise_error 'Not enough funds available'
  end

  it 'deducts minimum fare when touching out' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM)
    expect { oystercard.touch_out('exit_station') }.to change{ oystercard.balance}.by -(Oystercard::MINIMUM)
  end

  it 'touching in at station' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station')
    expect(oystercard.entry_station).to eq 'entry_station'
  end

  it 'touching out at station' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station') ; oystercard.touch_out('exit_station')
    expect(oystercard.entry_station).to be_nil
  end

  it 'saves exit station' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station') ; oystercard.touch_out('exit_station')
    expect(oystercard.exit_station).to eq 'exit_station'
  end

  it 'shows journey history' do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in('entry_station') ; oystercard.touch_out('exit_station')
    expect(oystercard.history).not_to be_nil
  end

  it 'new oystercard should have no travel history' do
    oystercard = Oystercard.new
    expect(oystercard.history).to be_empty
  end

end

