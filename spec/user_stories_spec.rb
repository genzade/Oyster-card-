# In order to keep using public transport
# As a customer
# I want to add money to my card
#
 # In order to protect my money
# As a customer
# I don't want to put too much money on my card
#
#In order to pay for my journey
# As a customer
# I need my fare deducted from my card
#
# n order to get through the barriers
# As a customer
# I need to touch in and out
#
# I order to pay for my journey
# As a customer
# I need to have the minimum amount for a single journey
#
# Inorder to pay for my journey
# As a customer
# I need to pay for my journey when it's complete
#
# In rder to pay for my journey
# As a customer
# I need to know where I've travelled from
#
# In oder to know where I have been
# As a customer
# I want to see to all my previous trips
#
# In orer to know how far I have travelled
# As a customer
# I want to know what zone a station is in
#
# In ordr to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
#
# In orde to be charged the correct amount
# As a customer
# I need to have the correct fare calculated
require 'oystercard'
describe 'User Story' do
  oystercard = Oystercard.new
  it 'respond to balance' do
    expect { oystercard.balance }.not_to raise_error
  end

  it 'responds to top_up' do
    expect { oystercard.top_up(1) }.not_to raise_error
  end
end
