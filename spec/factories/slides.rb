  FactoryGirl.define do

    factory :slide do |f|
      f.slideshow_id "1"
      f.creator_id "1"
      f.title "test title"
      f.sort_order "1"
    end
  end
