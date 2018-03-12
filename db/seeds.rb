# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bread.create(bread_name: 'Aish Merahrah', bread_type: 'Flatbread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Anadama Bread', bread_type: 'Yeast bread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Anpan', bread_type: 'Sweet bun', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Appam (hoppers)', bread_type: 'Varies', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Arepa', bread_type: 'Cornbread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Baba', bread_type: 'Thick, round', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Bagel', bread_type: 'Yeast bread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Baguette', bread_type: 'Yeast bread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Banana Bread', bread_type: 'Fruit bread', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Boule', bread_type: 'Yeast', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Borodinsky', bread_type: 'Sourdough', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Bread roll', bread_type: 'Bun', warehouse_id: 1, created_at: Time.now)
Bread.create(bread_name: 'Breadstick', bread_type: 'Dry bread', warehouse_id: 1, created_at: Time.now)

puts "Breads Created!"
