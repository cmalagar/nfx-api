# app/graphql/types/meeting_type.rb

module Types
    MeetingType = GraphQL::ObjectType.define do
      name 'MeetingType'
      description 'The Meeting type'
  
      field :id, !types.ID
      field :time, !types.String
      field :investor_id, !types.String
    end
end