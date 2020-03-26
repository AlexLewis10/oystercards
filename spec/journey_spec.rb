require 'journey'

describe Journey do
  let(:journey) { Journey.new('Bank') }
  it "should be able to tell us where the journey started" do
    expect(journey.start_point).to eq('Bank')
  end

  it "responds to #journey_finish" do
    expect(journey).to respond_to :journey_finish
  end

  it "tells us where the #journey_finish" do
    expect(journey.journey_finish("Bank")).to eq("Bank")
  end

  it "responds to #calculate" do
    expect(journey).to respond_to :calculate
  end

  it "responds to #complete" do
    expect(journey).to respond_to :complete
  end
end
