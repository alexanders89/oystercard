require 'oystercard'

describe 'Feature Tests' do
  describe Oystercard do
    let(:card) { Oystercard.new }
    # In order to use public transport
    # As a customer
    # I want money on my card
    it 'Has a balance' do
      expect(card.balance).to eq 0
    end
    # In order to keep using public transport
    # As a customer
    # I want to add money to my card
    it 'Allows balance to be topped up' do
      expect(card.topup(10)).to eq 10
    end
    it 'Prevents balance exceeding £90' do
      expect { card.topup(95) }.to raise_error(RuntimeError, 'Maximum Balance Reached')
    end
  end
end
