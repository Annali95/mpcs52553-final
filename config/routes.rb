Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

  root "home#index"



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/mychart' => 'admins#chart'

  get '/myarticles' => 'articles#myarticle'
  get '/grouparticles/:group_id' => 'grouparticles#show'
  get '/articles/new/:group_id' => 'articles#new'

  get '/mygroups' => 'groups#mygroup'
  get '/groupmembers/:id' => 'connections#showmember'
  get '/connections/:group_id' => 'connections#addmember'
  delete '/connections/:id' => 'connections#destroy'
  delete '/connections/:group_id/:user_id' => 'connections#delete'

  # get "/new_grouparticle/:group_id" => 'articles#new_grouparticle'
  # get "/new_grouparticle/" => 'articles#new_grouparticle'
  get '/articles/:id/like' => 'articles#like'
  post '/articles/secret' => 'articles#secret'

  resources :articles
  resources :groups
  resources :users




# creates seven different routes in your application, all mapping to the Photos controller:

# HTTP Verb	Path	Controller#Action	Used for
# GET	/photos	photos#index	display a list of all photos
# GET	/photos/new	photos#new	return an HTML form for creating a new photo
# POST	/photos	photos#create	create a new photo
# GET	/photos/:id	photos#show	display a specific photo
# GET	/photos/:id/edit	photos#edit	return an HTML form for editing a photo
# PATCH/PUT	/photos/:id	photos#update	update a specific photo
# DELETE	/photos/:id	photos#destroy	delete a specific photo

end
