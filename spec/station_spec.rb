require 'station'

describe Station do
  let(:station) { described_class.new(:name, :zone) }
    it 'accepts and exposes a name variable' do
      expect(station.name).to eq :name
    end

    it 'accepts and exposes a zone variable' do
      expect(station.zone).to eq :zone
    end

end