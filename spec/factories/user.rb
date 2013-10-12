FactoryGirl.define do
  factory :user do |f|
    f.email "factory@gmail.com"
    f.password "password"
    f.password_confirmation "password"
  end




  # factory :slideshow do |f|
  #   f.email "factory@gmail.com"
  #   f.password "password"
  #   f.password_confirmation "password"
  # end

  # factory :element do |f|
  #   f.email "factory@gmail.com"
  #   f.password "password"
  #   f.password_confirmation "password"
  # end

  # factory :element_type do |f|
  #   f.email "factory@gmail.com"
  #   f.password "password"
  #   f.password_confirmation "password"
  # end
end

