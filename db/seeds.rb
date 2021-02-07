# coding: utf-8

Field.create!([
{ name: 'the シールズ',
  email: 'test1@test1',
  password: '111111',
  image: File.open('./app/assets/images/field1.jpg'),
  address: '千葉県千葉市若葉区小倉町1番地',
  introduction: '弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
},

{ name: 'Rock234',
  email: 'test2@test2',
  password: '111111',
  image: File.open('./app/assets/images/field2.jpg'),
  address: '埼玉県大里郡寄居町西ノ入１１',
  introduction: '関東最大級のサバイバルゲームフィールド
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
},

{ name: 'HEAD SHOW',
  email: 'test3@test3',
  password: '111111',
  image: File.open('./app/assets/images/field3.jpg'),
  address: '千葉県印西市平賀55',
  introduction: '総敷地面積約8,000坪。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
},

{ name: 'TENKOOOOO',
  email: 'test4@test4',
  password: '111111',
  image: File.open('./app/assets/images/field4.jpg'),
  address: '東京都八王子市高月05',
  introduction: '大きな市街地フィールドです。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
},

{ name: '東京サバゲパーカー',
  email: 'test5@test5',
  password: '111111',
  image: File.open('./app/assets/images/field5.jpg'),
  address: '千葉県印西市草深30',
  introduction: '中東をイメージした市街地エリアと、米軍基地を再現したフィールドで、
臨場感あふれるプレイを楽しめます。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
},

{ name: 'フォレストオニオン',
  email: 'test1@test',
  password: '111111',
  # image: File.open('./app/assets/images/field6.jpg'),
  address: '千葉県印西市平賀70',
  introduction: '【参加費】
平日　：2,500円
土日祝：3,000円
※詳細な情報は公式HPにてご確認ください。
【アクセス】
・車 酒々井ICから約20分
・送迎バス（※要予約）京成本線京成酒々井駅　集合'
},

{ name: 'TENGUSAMA TOKYO',
  email: 'test2@test',
  password: '111111',
  # image: File.open('./app/assets/images/field7.JPG'),
  address: '東京都八王子市戸吹町5',
  introduction: '弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜　第２土曜　第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）'
}
])


# 5.times do |n|
#   User.create!(
#     email: "user#{n + 1}@user.com",
#     nickname: "ユーザー#{n + 1}",
#     password: '111111',
#   )
# end

# ユーザー作成
user1 = User.create({nickname:"USER1", email: "user1@user.com", password: "111111"})
user2 = User.create({nickname:"USER2", email: "user2@user.com", password: "111111"})
user3 = User.create({nickname:"USER3", email: "user3@user.com", password: "111111"})

#グループ作成
chat_group1 = ChatGroup.create({chat_group_name:"GROUP1"})
chat_group2 = ChatGroup.create({chat_group_name:"GROUP2"})
chat_group3 = ChatGroup.create({chat_group_name:"GROUP3"})

#関連付けを追加
user1.chat_groups << chat_group1
user1.chat_groups << chat_group2
user1.save

user2.chat_groups << chat_group2
user2.chat_groups << chat_group3
user2.save

user3.chat_groups << chat_group3
user3.chat_groups << chat_group1
user3.save
