FactoryGirl.define do
  factory :item do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence rand 2..4 }
    link { Faker::Internet.url } 
    status 'project'
    artist { create :user, :artist}
  end
end
