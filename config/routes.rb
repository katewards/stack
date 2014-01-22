Stack::Application.routes.draw do

	# urls for activeadmin (it put itself in)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


	# I want to add in all the REST urls for the stories e.g. index, show, new, create, edit, update, destroy
  
  resources :stories do

  	# this is called a nested resource
  	# basically meaning the ulrs for comments are on the 
  	# urls for stories

  	resources :comments

    # because votes are related to stories just like comments

    resources :votes 
    
  end


	# lets add in a homepage
  
  root "stories#index"

end
