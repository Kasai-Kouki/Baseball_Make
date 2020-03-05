# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Area.create(name:  "東京")
Category.create(category:  "エンジョイ")
User.create(name: "管理者",
             email: "admin@example.jp",
             area_id: 1,
             teamname: "サンプル",
             category_id: 1,
             password: "K1234567",
             password_confirmation: "K1234567",
             admin: true)