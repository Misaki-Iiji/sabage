# coding: utf-8

Field.create!(
  name: 'フィールド1 ',
  email: 'test1@test1',
  password: '111111',
  # image_id: File.open('./app/assets/images/field1.png'),
  address: '東京都江戸川区1-1-1',
  introduction: 'ここは東京のフィールド1'
)

Field.create!(
  name: 'フィールド2 ',
  email: 'test2@test2',
  password: '111111',
  # image_id: File.open('./app/assets/images/field2.jpg'),
  address: '東京都江戸川区2-2-2',
  introduction: 'ここは東京のフィールド2'
)

Field.create!(
  name: 'フィールド3',
  email: 'test3@test3',
  password: '111111',
  # image_id: File.open('./app/assets/images/field3.jpg'),
  address: '東京都江戸川区3-3-3',
  introduction: 'ここは東京のフィール3'
)
