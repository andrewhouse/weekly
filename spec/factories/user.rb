FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "awfulPass"
    password_confirmation "awfulPass"
    role 'guest'
  end

  trait :shopper do
    # v- DB column role
    role 'shopper'
  end
  trait :seller do
    role 'seller'
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
