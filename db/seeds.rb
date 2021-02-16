field1 = Field.create({ name: 'the シールズ', email: 'test1@test1', password: '111111', image: File.open('./app/assets/images/field1.jpg'), address: '千葉県千葉市若葉区小倉町１３３６',
                        introduction: '弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field2 = Field.create({ name: 'Rock234', email: 'test2@test2', password: '111111', image: File.open('./app/assets/images/field2.jpg'), address: '埼玉県大里郡寄居町西ノ入１１８３',
                        introduction: '関東最大級のサバイバルゲームフィールド
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field3 = Field.create({ name: 'HEAD SHOW', email: 'test3@test3', password: '111111', image: File.open('./app/assets/images/field3.jpg'), address: '千葉県印西市平賀２４７０',
                        introduction: '総敷地面積約8,000坪。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field4 = Field.create({ name: 'TENKOOOOO', email: 'test4@test4', password: '111111', image: File.open('./app/assets/images/field4.jpg'), address: '東京都八王子市高月町２２０５',
                        introduction: '大きな市街地フィールドです。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field5 = Field.create({ name: '東京サバゲパーカー', email: 'test5@test5', password: '111111', image: File.open('./app/assets/images/field5.jpg'), address: '千葉県印西市草深3筆 草深字仲ノ側258番1他',
                        introduction: '中東をイメージした市街地エリアと、米軍基地を再現したフィールドで、
臨場感あふれるプレイを楽しめます。
弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field6 = Field.create({ name: 'フォレストオニオン', email: 'test1@test', password: '111111', address: '千葉県印西市平賀２４７０',
                        introduction: '【参加費】
平日 ：2,500円
土日祝：3,000円
※詳細な情報は公式HPにてご確認ください。
【アクセス】
・車 酒々井ICから約20分
・送迎バス（※要予約）京成本線京成酒々井駅 集合' })

field7 = Field.create({ name: 'TENGUSAMA TOKYO', email: 'test2@test', password: '111111', address: '東京都八王子市戸吹町５８０',
                        introduction: '弾数制限	：	無制限
参加資格	：	18歳以上
開催日	：	第１～４日曜 第２土曜 第１月曜 第３水曜 第４火曜・木曜
料金	：	￥3,500(税込)
※食事代込み（食事抜きの方・女性の方￥５００ OFF）' })

field8 = Field.create({ name: 'Hill', email: 'test3@test', password: '111111', address: '埼玉県上尾市領家１０４３',
                        introduction: '【参加費】
平日 ：2,500円
土日祝：3,000円
※詳細な情報は公式HPにてご確認ください。
【アクセス】
・車 酒々井ICから約20分
・送迎バス（※要予約）京成本線京成酒々井駅 集合' })

field9 = Field.create({ name: 'Oasss', email: 'test4@test', password: '111111', address: '埼玉県川越市上松原２２１',
                        introduction: '【参加費】
平日 ：2,500円
土日祝：3,000円
※詳細な情報は公式HPにてご確認ください。
【アクセス】
・車 酒々井ICから約20分
・送迎バス（※要予約）京成本線京成酒々井駅 集合' })

field10 = Field.create({ name: 'ATTACKERATTACKER', email: 'test5@test', password: '111111', address: '神奈川県横浜市港北区新吉田町６０６１',
                        introduction: '【参加費】
平日 ：2,500円
土日祝：3,000円
※詳細な情報は公式HPにてご確認ください。
【アクセス】
・車 酒々井ICから約20分
・送迎バス（※要予約）京成本線京成酒々井駅 集合' })

# ユーザー作成
user1 = User.create({ nickname: '宮田くん', email: 'user1@user.com', password: '111111', introduction: 'よろしく',
                      main_gun: 'M700' })
user2 = User.create({ nickname: 'アスカ', email: 'user2@user.com', password: '111111', introduction: 'ようかん好きです',
                      main_gun: 'P90' })
user3 = User.create({ nickname: 'キョン', email: 'user3@user.com', password: '111111', introduction: 'よろしく',
                      main_gun: 'MK18' })
user4 = User.create({ nickname: 'ネギ', email: 'user4@user.com', password: '111111', introduction: 'よろしくお願いします！',
                      main_gun: 'M1851' })
user5 = User.create({ nickname: 'キキ', email: 'user5@user.com', password: '111111', introduction: '森林メインです',
                      main_gun: '特になし' })
user6 = User.create({ nickname: 'ダンペイ', email: 'user6@user.com', password: '111111', introduction: 'ワシのジョー',
                      main_gun: 'mp5' })
user7 = User.create({ nickname: 'ねずこ', email: 'user7@user.com', password: '111111', introduction: '',
                      main_gun: 'HK416D' })
user8 = User.create({ nickname: '矢吹くん', email: 'user8@user.com', password: '111111', introduction: '', main_gun: 'なし' })
user9 = User.create({ nickname: '五代くん', email: 'user9@user.com', password: '111111', introduction: '',
                      main_gun: 'G3 SAS HC' })

# グループ作成
chat_group1 = ChatGroup.create({ chat_group_name: '初心者大歓迎！！', chat_group_description: '初心者仲間募集中です' })
chat_group2 = ChatGroup.create({ chat_group_name: '千葉県民チーム作りませんか？', chat_group_description: 'サバゲの聖地！！！！' })
chat_group3 = ChatGroup.create({ chat_group_name: '女子だけのチーム組みましょう', chat_group_description: '女子会しましょ！' })
chat_group4 = ChatGroup.create({ chat_group_name: '酒好き集合', chat_group_description: '打ち上げは池袋' })
chat_group5 = ChatGroup.create({ chat_group_name: 'チームメンバー募集です',
                                 chat_group_description: '目標20人！！活動拠点は埼玉がメインです。年齢職業問いません！！' })

# グループ参加
user1.chat_groups << chat_group1
user1.chat_groups << chat_group2
user1.chat_groups << chat_group4
user1.chat_groups << chat_group5
user1.save

user2.chat_groups << chat_group2
user2.chat_groups << chat_group3
user2.save

user3.chat_groups << chat_group3
user3.chat_groups << chat_group1
user3.save

# フォロー
user1.followers << user2
user1.followers << user3
user1.followers << user4
user1.save

user2.followers << user1
user2.followers << user3
user2.followers << user4
user2.save

user3.followers << user2
user3.followers << user4
user3.followers << user5
user2.save

# お気に入りフィールド
user1.fields << field1
user1.fields << field2
user1.fields << field3
user1.fields << field4
user1.fields << field5
user1.save

user2.fields << field2
user2.fields << field3
user2.fields << field4
user2.save

Infomation.create!([
                     { id: 1,
                       title: '定例会案内',
                       body: '土日ご予約お待ちしております',
                       field_id: 1 },
                     { id: 2,
                       title: '昨日の写真アップしました',
                       body: '復活無制限盛り上がりました！',
                       field_id: 2 },
                     { id: 3,
                       title: 'ウォシュレットトイレ付けました',
                       body: '快適です。更衣室やシャワールームもあり！',
                       field_id: 3 },
                     { id: 4,
                       title: '女性サバゲーマー大歓迎',
                       body: '虫がいない今の時期にどうぞ。',
                       field_id: 4 },
                     { id: 5,
                       title: '本日のオーナー',
                       body: '元気有り余ってます。遊びに来てください',
                       field_id: 5 },
                     { id: 6,
                       title: '初心者大歓迎',
                       body: 'スタッフのサポート付き。レンタルもあります。',
                       field_id: 6 }
                   ])
