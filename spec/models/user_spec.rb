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

  describe 'Username Validations' do
    it 'should require username' do
      un_named_user = User.new(@attr.merge(username: ''))
      un_named_user.should_not be_valid
    end

    it 'should prevent username from being too long' do
      long_name = 'a'*17
      
      user_with_long_name = User.new(@attr.merge(username: long_name))
      user_with_long_name.should_not be_valid
    end
  end

  describe 'Email Validations' do
    it 'should reject improper format' do
      invalid_emails = %w(foo@bar foo_bar.buz foo@bar.b)
      invalid_emails.each do |email|
        user_invalid_email = User.new(@attr.merge(email: email))
        user_invalid_email.should_not be_valid
      end
    end

    it 'should accept proper format' do
      valid_emails = %w(foo@bar.com foo-bar@bazz.buz)
      valid_emails.each do |email|
        user_valid_email = User.new(@attr.merge(email: email))
        user_valid_email.should be_valid
      end
    end

    it 'should reject duplicate emails' do
      User.create!(@attr)
      User.new(@attr).should_not be_valid
    end

    it 'should reject duplicate emails (case insensitive)' do
      User.create!(@attr)
      User.new(@attr.merge(email: "USER@example.com")).should_not be_valid
    end
  end

  describe 'Password Validations' do
    it 'should reject short passwords (< 6 chars)' do
      user_short_password = User.new(@attr.merge(password: 'foo', password_confirmation: 'foo'))
      user_short_password.should_not be_valid
    end
  end
end