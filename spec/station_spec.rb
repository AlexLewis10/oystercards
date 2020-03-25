require 'station'

describe Station do
  let(:station) { Station.new('hammersmith', 1) }
  context "has a name and zone" do
    it " should tell you the name of the station" do
      expect(station).to respond_to(:name)
    end
    it "should tell you what the name of the station is" do
      expect(station.name).to eq('hammersmith')
    end

    it " should tell you the zone of the station" do
      expect(station.zone).to be
    end
    it "should tell you the zone of the station" do
      expect(station.zone).to eq(1)
    end
  end
end
