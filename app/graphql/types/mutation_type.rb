module Types
  class MutationType < Types::BaseObject
    field :update_group, mutation: Mutations::UpdateGroup
    field :add_group, mutation: Mutations::AddGroup
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
