require 'oystercard'
describe Oystercard do
  #oystercard = Oystercard.new
#let(:oystercard) { double :oystercard }
  let(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
   describe '#balance' do 
     it 'returns balance as 0' do
       expect(oystercard.balance).to eq (0)
     end
   end
 describe '#top_up' do
     it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'adds cash to the oystercard' do
      expect { oystercard.top_up(10) }.to change{ oystercard.balance }.by 10
    end
    it 'prevent balance from exceeding £90' do
      oystercard.top_up(Oystercard::LIMIT)
      expect {oystercard.top_up(Oystercard::MINIMUM)}.to raise_error "Balance cannot exceed £#{Oystercard::LIMIT}"
    end
 end

 describe '#touch_in' do
  it 'raises an error if balance is less than minimum fair' do 
    expect { oystercard.touch_in(entry_station) }.to raise_error 'Not enough funds available'
  end

 end

 describe '#touch_out' do
  it 'deducts minimum fare from balance' do
    oystercard.top_up(Oystercard::MINIMUM)
    expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance}.by -(Oystercard::MINIMUM)
  end

  it 'resets current journey upon touching out' do
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in(entry_station) ; oystercard.touch_out(exit_station)
    expect(oystercard.journey).to eq({})
  end

 end

 describe '#in_journey?' do 
  it 'starts as false when not travelling' do
    expect(oystercard.in_journey?).to be false
  end

  it 'changed to true when travelling' do
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in(entry_station)
    expect(oystercard.in_journey?).to be true
  end
 end

 it 'records journey history' do
  oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in(entry_station) ; oystercard.touch_out(exit_station)
  expect(oystercard.history).to eq(:"Journey 1" => { entry_station: entry_station, exit_station: exit_station } )
 end

end
