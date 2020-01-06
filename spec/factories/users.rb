FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 8)
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    address               {'東京都'}
    introduction          {'よろしくお願いします'}
    avatar                { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/sample_image.jpg'), 'image/jpeg') }
  end

end