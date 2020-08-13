# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphqlPlayground::Rails::Engine, at: '/playground', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'

  get '/login', to: 'application#login'
  get '/callback', to: 'application#callback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
