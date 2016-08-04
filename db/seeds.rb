sampleImages = [
  'https://a2.muscache.com/im/pictures/2eeb24df-8732-4d3a-9139-afcfd2dd775e.jpg?aki_policy=xx_large'
]

# users
admin = User.create!(
  first_name:            'dylan',
  last_name:             'ng',
  mobile_number:         '12345678',
  email:                 'dylan@gmail.com',
  password:              'test123',
  password_confirmation: 'test123'
)
admin.toggle!(:admin)

# listings
10.times do
  content = Faker::Hipster.sentence
  address = Faker::Address.street_address
  user = User.find(User.pluck(:id).shuffle.first)
  user.listings.create!(
    content: content,
    address: address,
    photo:   'http://www.artrend.com.sg/images/12312013125537PMAT-0430(L).jpg',
    # photo: File.open(File.join(Rails.root, '/app/assets/images/test.jpg')),
    user_id: user.id
    )
end
