FactoryGirl.define do
  factory :user do
    username 'Example User'
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :deck do
    name 'foo'
    class_type 'bar'
    user_id '1'
  end
end