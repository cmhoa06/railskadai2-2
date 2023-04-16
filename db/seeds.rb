# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rooms = [
    { name: '施設１', introduction: '安い', fee: 10000, address: '東京都' },
    { name: '施設２', introduction: '広い', fee: 20000, address:'大阪府' }, 
    { name: '施設３', introduction: '温泉がある', fee:30000, address: '京都府' },
    { name: '施設４', introduction: '綺麗', fee:40000, address: '札幌市' }
  ]
Room.create(rooms)