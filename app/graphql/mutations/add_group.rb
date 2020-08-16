module Mutations
  class AddGroup < BaseMutation

    field :group, Types::GroupType, null: false

    argument :name, String, required: true
    argument :user, ID, required: false

    def resolve(name:, user:)
      { group: Group.create(name: name, user: User.find(user)) }
    end
  end
end
