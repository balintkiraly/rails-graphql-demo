# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'A User'
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :oauth_id, String, null: false
  end
end
