module Mutations
  class UpdateGroup < BaseMutation
    field :group, Types::GroupType, null: false

    argument :id, ID, required: true
    argument :name, String, required: false
    argument :user_id, ID, required: false

    def resolve(id:, name: nil, user_id: nil)
      group         = Group.find(id.to_i)
      authorize group, :update?
      update_params = {}
      update_params.merge!({ name: name }) unless name.nil?
      update_params.merge!({ user: User.find(user_id.to_i) }) unless user_id.nil?
      group.update(update_params)
      { group: group }
    end
  end
end
