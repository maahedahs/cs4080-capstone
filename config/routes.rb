Rails.application.routes.draw do
  
 
   #this will match/route any 404 erros to the invalid search error we have custom made. 
  get '/404', to: 'errors#invalid_search'
  
  # get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
