FactoryGirl.define do
  factory :user do |f|
    f.email "factory@gmail.com"
    f.password "password"
    f.password_confirmation "password"
  end
end

