require 'oystercard'

describe Oystercard do
  it'allows an Oystercard to have a balance' do
    expect(subject.balance).to eq 0
  end

  it 'It responds to topup' do
    expect(subject).to respond_to(:topup).with(1).argument
  end

  it 'Topup adds money to balance' do
    subject.topup(15)
    expect(subject.balance).to eq 15
  end

  it "Deducts fare from the card" do
    card = Oystercard.new(20)
    card.touch_in
    card.touch_out
    expect(card.balance).to eq 19
  end

  it "Allows a card to be in use" do
    card = Oystercard.new(10)
    card.touch_in
    expect(card.in_use).to be true
  end

  it "Allows a card to be touched out" do
    card = Oystercard.new
    card.touch_out
    expect(card.in_use).to be false

  end

  it "Requires minimum balance of £1 to touch in" do
    card = Oystercard.new(0.5)
    expect { card.touch_in }.to raise_error(RuntimeError, 'Insufficient Funds')
  end

  it "Charges the card £1 upon touchout" do
    card = Oystercard.new(5)
    card.touch_in
    card.touch_out
    expect(card.balance).to eq 4
  end
end
