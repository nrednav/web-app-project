require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "valid user" do
		# Create the user
		@salt = "f1ewqe31saf13eg" 
		@user = User.new
		@user.email = "validuser_email@gmx.us"
		@user.salt = @salt
		@user.crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt)
		@user.password = "test_password"
		@user.save!

		# Get user and set password
		@user_retrieved = User.last
		@user_retrieved.password = "test_password_2"

		# Assert validity
		assert(@user_retrieved.valid?)
	end

	test "can create user" do

		# Create the user
		@salt = "21dwsxsgf13ef"
		@email = "new_email@gmx.us"
		@new_user = User.create!(email: @email,
								salt: @salt, 
								crypted_password: Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt),
								password: "123456")

		# Assert last user created has same email as one just saved
		assert_equal(@email, User.last.email)
	end

	test "can read user" do
		# Create user
		@email = "user_temp@gmx.us"
		@salt = "21dwsxssadfqef"
		@crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt)
		@user = User.new(email: @email, crypted_password: @crypted_password, salt: @salt)
		@user.password = "1234"
		@user.save!

		# Read user 
		@read_user = User.last

		# Assert equivalence
		assert_equal(@email, @read_user.email)
	end

	test "can update user" do
		# Create user
		@email = "user_temp@gmx.us"
		@salt = "21dwsxssadfqef"
		@crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt)
		@user = User.new(email: @email, crypted_password: @crypted_password, salt: @salt)
		@user.password = "1234"
		@user.save!

		# Find last user created and update their email address
		@user = User.last
		@email = "updated_email@gmail.com"
		@user.update!(email: @email, password: "1234")

		# Assert email was updated
		assert_equal(@email, User.last.email)
	end

	test "can destroy user" do

		# Create user
		@email = "user_temp@gmx.us"
		@salt = "21dwsxssadfqef"
		@crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt)
		@user = User.new(email: @email, crypted_password: @crypted_password, salt: @salt)
		@user.password = "1234"
		@user.save!

		# Destroy user
		@count = User.count
		User.last.destroy

		# Assert that theres no records in the users table now
		assert_equal((@count-1), User.count)
	end

	test "user can have many orders" do
		@order_1 = orders(:one)
		@order_2 = orders(:two)

		# Create user
		@email = "user_temp@gmx.us"
		@salt = "21dwsxssadfqef"
		@crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("secret", @salt)
		@user = User.new(email: @email, crypted_password: @crypted_password, salt: @salt)
		@user.password = "1234"
		@user.save!

		# Add the orders
		User.last.orders << @order_1
		User.last.orders << @order_2

		# Assert count of orders for user is 2
		assert_equal(2, User.last.orders.count)
	end
end
