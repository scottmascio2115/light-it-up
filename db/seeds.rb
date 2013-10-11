User.destroy_all
Slideshow.destroy_all
Slide.destroy_all

50.times do
  User.create(email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password")
end

5.times do
  user = User.all.sample
  Slideshow.create(name: Faker::Lorem.sentence(word_count = 3, supplemental = false, random_words_to_add = 3),
                   shared: [false, true].sample,
                   user_id: user.id)
end


Slideshow.all.each do |slideshow|
  rand(3..7).times do

    offset = rand(User.count)

    if slideshow.shared == false
      user_id = slideshow.user_id
    else
      user_id = User.first(offset: offset).id
    end

    Slide.create(slideshow_id: slideshow.id,
                 creator_id: user_id,
                 title: Faker::Lorem.sentence(word_count = 3, supplemental = false, random_words_to_add = 10))
  end
end

element_types = [ {name: "Title",
                   before_tag: "<h1>",
                   after_tag: "</h1>"},
                   {name: "Image",
                   before_tag: "<img>",
                   after_tag: "</img>"}
                ]
