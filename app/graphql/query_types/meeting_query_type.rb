# app/graphql/query_types/meeting_query_type.rb

module QueryTypes
    MeetingQueryType = GraphQL::ObjectType.define do
      name 'MeetingQueryType'
      description 'Meeting Query Type'
  
      field :meetings, types[Types::MeetingType], 'returns all meetings' do
        resolve ->(_obj, _args, _ctx) { Meeting.all }
      end

      field :meeting, Types::MeetingType, 'return a meeting' do
        argument :id, !types.ID 
        resolve -> (_obj, args, _ctx) { Meeting.find_by(id: args[:id]) }
      end
    end
end