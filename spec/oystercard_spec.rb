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
      oystercard.top_up(90)
      expect {oystercard.top_up(1)}.to raise_error "Balance cannot exceed £#{Oystercard::LIMIT}"
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

end
