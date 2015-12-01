require 'oystercard'
describe Oystercard do
  #oystercard = Oystercard.new
#
   describe '#balance' do
     it 'returns balance as 0' do
       expect(subject.balance).to eq (0)
     end
   end
 describe '#top_up' do
     it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'adds cash to the oystercard' do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end
 end

end
