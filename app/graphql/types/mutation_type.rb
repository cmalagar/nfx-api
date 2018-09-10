# app/graphql/types/mutation_type.rb

module Types
  MutationType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'MutationType'
    root_type.description = 'The mutation root'
    root_type.interfaces = []

    root_type.fields = Util::FieldCombiner.combine([
      Mutations::InvestorMutation,
      Mutations::MeetingMutation
    ])
  end
end
