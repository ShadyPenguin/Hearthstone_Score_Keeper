require 'spec_helper'

describe User do
  it 'should create a new user' do
    expect(User.create!(@attr)).to change(User.count).by(1)
  end
end