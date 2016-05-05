# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(username: "moon", gender: "남자", email: 'qwe@qwe.com', password: "12341234", password_confirmation: "12341234")
# Board.create(name: "자유게시판", description: "자유롭게 말하세요")

40.times do
    Post.create(title: "테스트 타이틀", content: "내용테스트", user_id: 1, board_id: 1)
end