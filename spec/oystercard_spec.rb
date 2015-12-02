require 'oystercard'
describe Oystercard do
  #oystercard = Oystercard.new
#let(:oystercard) { double :oystercard }
  let(:oystercard) { described_class.new }
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

 describe '#deduct' do
   it 'respond to deduct' do
       is_expected.to respond_to(:deduct).with(1).argument
   end

   it 'deducts money' do
     expect { oystercard.deduct(10) }.to change{ oystercard.balance }.by -10
   end
 end

 describe '#touch_in' do
  it 'respond to touch in' do
    expect(oystercard).to respond_to :touch_in
  end

  it 'travelling is true when touching in' do
    oystercard.top_up(Oystercard::MINIMUM)
    oystercard.touch_in
    expect(oystercard.travelling).to eq true
  end

  it 'raises an error if balance is less than minimum fair' do 
    expect { oystercard.touch_in }.to raise_error 'Not enough funds available'
  end
 end

 describe '#touch_out' do
  it 'respond to touch out' do
    expect(oystercard).to respond_to :touch_out
  end

  it 'travelling is false when touching out' do
    oystercard.top_up(Oystercard::MINIMUM) ; oystercard.touch_in ; oystercard.touch_out
    expect(oystercard.travelling).to eq false
  end

 end

 it 'responding to in journey' do
  expect(oystercard).to respond_to :in_journey?
 end

end
