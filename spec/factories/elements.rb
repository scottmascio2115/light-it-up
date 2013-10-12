  FactoryGirl.define do

    factory :element do |f|
      f.slide_id "1"
      f.element_type_id "1"
      f.content "This is the content"
      f.size "really big"
      f.coordinates "over here"
    end
  end
