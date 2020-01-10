FactoryBot.define do

  factory :post do
    title              {Faker::Name.last_name}
    address            {'東京駅'}
    image              { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/sample_image.jpg'), 'image/jpeg') }
    content            {'aaaaaaaaaaaaaaa'}
    latitude           {35.6959}
    longitude          {139.702}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end