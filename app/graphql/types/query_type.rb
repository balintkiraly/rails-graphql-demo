module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :users, [Types::UserType], null: false,
      description: "Returns a list of Users"
    def users
      User.all
    end

    field :me, Types::UserType, null: true,
      description: "Returns the currently signed in User"
    def me
      context[:current_user]
    end

    field :groups, [Types::GroupType], null: true,
      description: "Returns a list of Groups"
    def groups
      Group.all
    end
  end
end
