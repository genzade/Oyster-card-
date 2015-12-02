require 'oystercard'
describe Oystercard do
  #oystercard = Oystercard.new
#let(:oystercard) { double :oystercard }
  let(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
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
  it 'respond to touch in' do
    expect(oystercard).to respond_to :touch_in
  end

  it 'raises an error if balance is less than minimum fair' do 
    expect { oystercard.touch_in(entry_station) }.to raise_error 'Not enough funds available'
  end

  it 'records entry station upon touching in' do
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in(entry_station)
    expect(oystercard.entry_station).to eq entry_station
  end
 end

 describe '#touch_out' do
  it 'respond to touch out' do
    expect(oystercard).to respond_to :touch_out
  end

  it 'deducts minimum fare from balance' do
    oystercard.top_up(Oystercard::MINIMUM)
    expect { oystercard.touch_out }.to change{ oystercard.balance}.by -(Oystercard::MINIMUM)
  end

  it 'sets entry station to nil upon touching out' do
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in(entry_station) ; oystercard.touch_out
    expect(oystercard.entry_station).to be_nil
  end

 end

 it 'responding to in journey' do
  expect(oystercard).to respond_to :in_journey?
 end

end
