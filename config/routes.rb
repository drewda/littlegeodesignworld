Littlegeodesignworld::Application.routes.draw do
  root :to => "site#land"

  resources :question_comments
  resources :questions
  resources :action_item_comments
  resources :action_items
  resources :people
  
  match '/questions/:id/vote_up' => 'questions#vote_up', :as => :vote_up_question
  match '/action_items/:id/vote_up' => 'action_items#vote_up', :as => :vote_up_action_item
  match '/action_items/:id/take_on' => 'action_items#take_on', :as => :take_on_action_item

  devise_for :admins
  devise_for :persons
end