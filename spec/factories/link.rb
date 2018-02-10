FactoryGirl.define do
  factory :link do
    url FFaker::Internet.http_url
    subject FFaker::Lorem.phrase
    company
  end
end