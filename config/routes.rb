Rails.application.routes.draw do

	# Root route
	root 'main#home'

	# Contact routes
	match '/contact', :to => 'main#contact', :via => :get
	match '/contact/request', :to => 'main#request_contact', :via => :post, as: "request_contact"

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
	match '/orders', :to => 'sessions#list_orders', :via => :get
	match '/orders/view/:id', :to => 'sessions#view_order', :via => :get, as: "view_order"
	match '/order/confirm', :to => 'order#confirm_order', :via => :post, as: "confirm_order"
	match '/order/confirm', :to => 'order#confirm_order', :via => :get
	
	# User Authentication routes
	match '/login', :to => 'sessions#new', :via => :get
	match '/logout', :to => 'sessions#destroy', :via => :get
	match '/register', :to => 'users#new', :via => :get
	match '/sessions', :to => 'sessions#create', :via => :post, as: "sessions"
	match '/users', :to => 'users#create', :via => :post,  as: "users"

end
