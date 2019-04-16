require 'csv'

CSV.foreach(Rails.root.join('db', 'seeds', 'cn_menu.csv')) do |row|
  name = row[0]
  price = row[1].to_i
  cuisine = row[2]
  course = row[3]
  Food.create(name: name, price: price, cuisine: cuisine, course: course)
end

CSV.foreach(Rails.root.join('db', 'seeds', 'kr_menu.csv')) do |row|
  name = row[0]
  price = row[1].to_i
  cuisine = row[2]
  course = row[3]
  Food.create(name: name, price: price, cuisine: cuisine, course: course)
end

CSV.foreach(Rails.root.join('db', 'seeds', 'jp_menu.csv')) do |row|
  name = row[0]
  price = row[1].to_i
  cuisine = row[2]
  course = row[3]
  Food.create(name: name, price: price, cuisine: cuisine, course: course)
end
