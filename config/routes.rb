Rails.application.routes.draw do
  root 'application#index'
  get '/scholars-program', to: 'application#scholars_program'
  get '/policy', to: 'application#policy'
  post '/contact', to: 'application#contact'
end
