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
    expect { oystercard.touch_in }.not_to raise_error
  end

  it 'touching out' do
  oystercard = Oystercard.new 
    expect { oystercard.touch_out }.not_to raise_error
  end

  it 'in journey' do
    oystercard = Oystercard.new
    expect { oystercard.in_journey?}.not_to raise_error
  end

  it 'raise error if balance is less than minimum fare' do 
    oystercard = Oystercard.new
    expect { oystercard.touch_in }.to raise_error 'Not enough funds available'
  end

end

