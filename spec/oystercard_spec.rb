require 'oystercard'

describe Oystercard do
  it'allows an Oystercard to have a balance' do
    expect(subject.balance).to eq 0
  end
end
