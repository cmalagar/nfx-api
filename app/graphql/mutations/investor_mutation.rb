# app/graphql/mutations/investor_mutation.rb

module Mutations
    InvestorMutation = GraphQL::ObjectType.define do
        name 'InvestorMutation'
        description 'Mutation type for investors'

        field :create_investor, Types::InvestorType do
            argument :company, !types.String
            argument :location, !types.String
            argument :contact, !types.String
            argument :stage, !types.String
            argument :interest, !types.String

            resolve ->(_obj, args, _ctx) do
                Investor.create(
                    company: args[:company],
                    location: args[:location],
                    contact: args[:contact],
                    stage: args[:stage],
                    interest: args[:interest]
                )
            end
        end

        field :edit_investor, Types::InvestorType do
            argument :id, !types.ID, 'id of investor'
            argument :company, types.String
            argument :location, types.String
            argument :contact, types.String
            argument :stage, types.String
            argument :interest, types.String

            resolve ->(_obj, args, _ctx) do
                investor = Investor.find_by(id: args[:id])

                if args.key?(:company)
                    investor.update(
                        company: args[:company]
                    )
                end

                if args.key?(:location)
                    investor.update(
                        location: args[:location]
                    )
                end

                if args.key?(:contact)
                    investor.update(
                        contact: args[:contact]
                    )
                end

                if args.key?(:stage)
                    investor.update(
                        stage: args[:stage]
                    )
                end

                if args.key?(:interest)
                    investor.update(
                        interest: args[:interest]
                    )
                end

                investor
            end
        end

        field :delete_investor, types[Types::InvestorType] do
            argument :id, !types.ID, 'the ID of the investor to delete'
        
            resolve ->(_obj, args, _ctx) do
                investors = Investor.all
                investor = Investor.find_by(id: args[:id])
            
                # Ensure that we find and delete investor
                if (investor) 
                    investor.destroy
                end
                
                # return all investors
                investors
              end
        end
    end
end
