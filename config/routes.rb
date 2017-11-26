Rails.application.routes.draw do

	# Default route
	root 'main#home'

	# Contact route
	match '/contact', :to => 'main#contact', :via => :get

	# Menu route
	match '/menu', :to => 'menu#menu', :via => :get


end
