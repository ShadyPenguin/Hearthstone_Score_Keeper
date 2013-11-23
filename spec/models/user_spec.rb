require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      username: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    }
  end

  it 'should create a new instance given valid attributes' do
    expect { User.create!(@attr) }.to change(User, :count).by(1)
  end
end