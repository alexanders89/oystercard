require 'oystercard'

describe Oystercard do
  # In order to use public transport
  # As a customer
  # I want money on my card
  it "Has a balance" do
    expect(subject.balance).to eq 0
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it "Allows balance to be topped up" do
    expect(subject.topup(10)).to eq 10
  end
end
