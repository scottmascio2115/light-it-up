  FactoryGirl.define do

    factory :slideshow do |f|
      f.user_id "1"
      f.name "test slideshow"
      f.shared "false"
      f.px_height "1280"
      f.px_width "750"
    end
  end
