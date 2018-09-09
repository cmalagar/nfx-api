# app/graphql/query_types/meeting_query_type.rb

module QueryTypes
    MeetingQueryType = GraphQL::ObjectType.define do
      name 'MeetingQueryType'
      description 'Meeting Query Type'
  
      field :meetings, types[Types::MeetingType], 'returns all meetings' do
        resolve ->(_obj, _args, _ctx) { Meeting.all }
      end
    end
end