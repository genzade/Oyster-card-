# in order to use public ....
require 'oystercard'
describe 'User Story' do
  oystercard = Oystercard.new
  it 'respond to balance' do
    expect { oystercard.balance }.not_to raise_error
  end
end
