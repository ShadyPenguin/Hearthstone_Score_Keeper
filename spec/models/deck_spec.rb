require 'spec_helper'

describe Deck do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck)
    @user.decks << @deck
  end

  describe 'Deck Associations' do
    it 'should have a user attribute' do
      expect(@deck).to respond_to(:user)
    end

    it 'should be associated to the correct user' do
      expect(@deck.user) == @user
      expect(@deck.user_id) == @user.id
    end
  end
  
end
