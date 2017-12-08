# Generate namespace for importing the 3 cuisines in separate tasks
namespace :import do

	desc "imports chinese cuisine menu"
	task :cn_cuisine => :environment do
		require 'csv'

		CSV.foreach('db/resources/cn_menu.csv') do |row|
			
			name = row[0]
			price = row[1].to_i
			cuisine = row[2]
			course = row[3]

			Food.create(name: name, price: price, cuisine: cuisine, course: course)
		end
	end

	desc "imports japanese cuisine menu"
	task :jp_cuisine => :environment do
		require 'csv'

		CSV.foreach('db/resources/jp_menu.csv') do |row|

			name = row[0]
			price = row[1].to_i
			cuisine = row[2]
			course = row[3]

			Food.create(name: name, price: price, cuisine: cuisine, course: course)
		end
	end

	desc "imports korean cuisine menu"
	task :kr_cuisine => :environment do
		require 'csv'

		CSV.foreach('db/resources/kr_menu.csv') do |row|

			name = row[0]
			price = row[1]
			cuisine = row[2]
			course = row[3]

			Food.create(name: name, price: price, cuisine: cuisine, course: course)
		end
	end
end