require 'journey'

describe Journey do
  let(:journey) { Journey.new('origin') }
  it "should be able to tell us where the journey started" do
    expect(journey.origin).to eq('origin')
  end

end
