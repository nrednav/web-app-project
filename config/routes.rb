Rails.application.routes.draw do

	# Default route
	root 'main#home'

	# Contact route
	match '/contact', :to => 'main#contact', :via => :get


end
