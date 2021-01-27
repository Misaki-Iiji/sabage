# coding: utf-8

Field.create!([
{ name: 'フィールド1',
  email: 'test1@test1',
  password: '111111',
  image: File.open('./app/assets/images/field1.jpg'),
  address: '東京都江戸川区1-1-1',
  introduction: 'ここは東京のフィールド1'
},

{ name: 'フィールド2',
  email: 'test2@test2',
  password: '111111',
  image: File.open('./app/assets/images/field2.jpg'),
  address: '東京都江戸川区2-2-2',
  introduction: 'ここは東京のフィールド2'
},

{ name: 'フィールド3',
  email: 'test3@test3',
  password: '111111',
  image: File.open('./app/assets/images/field3.jpg'),
  address: '東京都江戸川区3-3-3',
  introduction: 'ここは東京のフィール3'
},

{ name: 'フィールド4',
  email: 'test4@test4',
  password: '111111',
  image: File.open('./app/assets/images/field4.jpg'),
  address: '東京都江戸川区4-4-4',
  introduction: 'ここは東京のフィール4'
},

{ name: 'フィールド5',
  email: 'test5@test5',
  password: '111111',
  image: File.open('./app/assets/images/field5.jpg'),
  address: '東京都江戸川区5-5-5',
  introduction: 'ここは東京のフィール5'
 }

# { name: 'フィールド6',
#   email: 'test6@test6',
#   password: '111111',
#   image: File.open('./app/assets/images/field6.jpg'),
#   address: '東京都江戸川区6-6-6',
#   introduction: 'ここは東京のフィール6'
# },

# { name: 'フィールド6',
#   email: 'test6@test6',
#   password: '111111',
#   image: File.open('./app/assets/images/field6.JPG'),
#   address: '東京都江戸川区6-6-6',
#   introduction: 'ここは東京のフィール6'
# }
])


5.times do |n|
  User.create!(
    email: "user#{n + 1}@user.com",
    nickname: "ユーザー#{n + 1}",
    password: '111111',
  )
end