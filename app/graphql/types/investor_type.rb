# app/graphql/types/investor_type.rb

module Types
    InvestorType = GraphQL::ObjectType.define do
      name 'InvestorType'
      description 'The Investor type'
  
      field :id, !types.ID
      field :company, !types.String
      field :location, !types.String
      field :contact, !types.String
      field :stage, !types.String
      field :interest, !types.String

      field :meetings, types[Types::MeetingType] do
        resolve -> (investor, _args, _ctx) { investor.meetings }
      end
    end
end