module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :blog_by_id, BlogType, null: true do
      description "Find a blog by ID"
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def blog_by_id(id:)
      Blog.find(id)
    end

    field :blog, BlogType, null: true do
      description "Find a blog by ID"
      # argument :id, ID, required: true
    end

    # Then provide an implementation:
    def blog
      Blog.last
    end
  end
end
