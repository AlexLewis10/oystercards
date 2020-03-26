require 'oystercard'

describe Oystercard do

#  let (:"text string") { double :station }

  context '#balance' do
    it 'responds to #balance' do
      expect(subject).to respond_to :balance
    end
    it 'a newly created card has a balance of 0' do
      expect(subject.balance).to be 0
    end
  end

  context '#topup' do
    it 'responds to #topup' do
      expect(subject).to respond_to :topup
    end
    it 'expects an argument, the amount to add to balance' do
      expect(subject).to respond_to(:topup).with(1).argument
    end
    it 'returns a new value of balance with the amount added' do
      expect { subject.topup(5) }.to change { subject.balance }.by(5)
    end

  end

  context 'testing max and min limits of card' do

    it 'card has maximum balance and raises error if exceeded' do
      subject.topup(Oystercard::MAXIMUM_BALANCE)
      expect { subject.topup(1) }.to raise_error "Maximum balance £#{Oystercard::MAXIMUM_BALANCE}"
    end

    it 'will raise an error if there is not enough balance on the card' do
      expect { subject.touch_in("text string") }.to raise_error "Below minimum balance of £#{Oystercard::MINIMUM_BALANCE}"
    end

  end

  xit 'when user touches in captures station of "text string"' do
    subject.topup(10)
    expect { subject.touch_in("text string") }.to change { subject.entry_station }.from(nil).to("text string")
  end


  context '#in_journey' do
    it 'responds to touch_in' do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end
    it 'responds to touch_out' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end

    it 'responds to in_journey?' do
      expect(subject).to respond_to :in_journey?
    end

    context 'adds 10 to balance and touches in' do

      before do
        subject.topup(10)
        subject.touch_in("text string")
      end

        xit 'it checks if the card in use after user touched in' do
          expect(subject).to be_in_journey
        end
        it 'it checks if the card not in use after user touched out' do
          subject.touch_out('buh')
          expect(subject).not_to be_in_journey
        end
        it 'when use touches out, the correct amount is deducted from the balance' do
          expect { subject.touch_out('buh') }.to change { subject.balance }.by -(Oystercard::MINIMUM_FARE)
        end
        it " should record your travel history" do
          subject.touch_out('buh')
          expect(subject.history.length).to eq(1)
        end
      end
  end
   describe "please work" do
     let(:card) { Oystercard.new }
     xit "should wipe station you entered in upon touching out" do
       card.topup(10)
       card.touch_in('hub')
       expect { card.touch_out('buh') }.to change { card.entry_station }.from("hub").to(nil)
     end
     it " should record your travel history" do
       card.topup(10)
       card.touch_in('hub')
       card.touch_out('buh')
       expect(card.history[-1][:start]).to eq('hub')
     end
     it " should record your travel history" do
       card.topup(10)
       card.touch_in('hub')
       card.touch_out('buh')
       expect(card.history[-1][:finish]).to eq('buh')
     end
   end
end
