# app/graphql/types/query_type.rb

module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    
    # Add root-level fields here.
    root_type.name = 'QueryType'
    root_type.description = 'The query root'
    root_type.interfaces = []

    root_type.fields = Util::FieldCombiner.combine([
      QueryTypes::InvestorQueryType,
      QueryTypes::MeetingQueryType
    ])

    # They will be entry points for queries on your schema.
  end
end