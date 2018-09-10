# app/graphql/query_types/investor_query_type.rb

module QueryTypes
    InvestorQueryType = GraphQL::ObjectType.define do
      name 'InvestorQueryType'
      description 'The investor query type'

      field :investors, types[Types::InvestorType], 'returns all investors' do
        resolve ->(_obj, _args, _ctx) { Investor.all }
      end

      field :investor, Types::InvestorType, 'returns the queried investor' do
        argument :id, !types.ID
        resolve ->(_obj, args, _ctx) { Investor.find_by!(id: args[:id]) }
      end
    end
  end