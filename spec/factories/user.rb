FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "awfulPass"
    password_confirmation "awfulPass"
    role 'guest'
  end

  trait :artist do
    role 'artist'
  end
  trait :admin do
    role 'admin'
  end
  trait :banned do
    role 'banned'
  end
  trait :guest do
    role 'guest'
  end
end
