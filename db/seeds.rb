# coding: utf-8

Field.create!(
  name: 'フィールド1 ',
  email: 'test@test.com',
  image_id: File.open('./app/assets/images/field1.png'),
  address: '東京都',
  introduction: 'ここは東京のフィールド1'
)

Field.create!(
  name: 'フィールド2 ',
  email: 'test@test.com',
  image_id: File.open('./app/assets/images/field1.png'),
  address: '東京都',
  introduction: 'ここは東京のフィールド2'
)

Field.create!(
  name: 'フィールド3 ',
  email: 'test@test.com',
  image_id: File.open('./app/assets/images/field1.png'),
  address: '東京都',
  introduction: 'ここは東京のフィール3'
)
