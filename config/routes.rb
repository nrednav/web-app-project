Rails.application.routes.draw do

	# Root route
	root 'main#home'

	# Contact route
	match '/contact', :to => 'main#contact', :via => :get

	# Menu route
	match '/menu', :to => 'menu#menu', :via => :get

	# Cuisine routes
	match '/menu/cn', :to => 'menu#show', :via => :get, :cuisine => 'cn'
	match '/menu/jp', :to => 'menu#show', :via => :get, :cuisine => 'jp'
	match '/menu/kr', :to => 'menu#show', :via => :get, :cuisine => 'kr'	

	# Order routes
	match '/order', :to => 'order#show', :via => :get
	match '/order/create', :to => 'order#create', :via => :post
	match '/order/edit', :to => 'order#edit', :via => :get

	# User Authentication routes
	match '/login', :to => 'sessions#new', :via => :get
	match '/logout', :to => 'sessions#destroy', :via => :get
	match '/register', :to => 'users#new', :via => :get
	resources :users
	resources :sessions

end
