Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

  root "home#index"



  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  get '/myarticle' => 'article#myarticle'
  get '/grouparticle/:group_id' => 'article#grouparticle'
  get '/article/new/:group_id' => 'article#new'

  get '/mygroups' => 'group#mygroup'
  get '/groupmember/:id' => 'connection#showmember'
  get '/connection/:group_id' => 'connection#addmember'
  delete '/connection/:id' => 'connection#destroy'
  get "/new_grouparticle/:group_id" => 'article#new_grouparticle'
  get "/new_grouparticle/" => 'article#new_grouparticle'

  resources :article
  resources :group
  resources :user





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
