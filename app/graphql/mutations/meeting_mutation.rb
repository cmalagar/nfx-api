require 'date'

module Mutations
    MeetingMutation = GraphQL::ObjectType.define do
        name 'MeetingMutation'
        description 'Mutation type for meetings'
    
        field :create_meeting, Types::MeetingType do
            argument :investor_id, !types.ID

            resolve ->(_obj, args, _ctx) do
                investor = Investor.find_by(id: args[:investor_id])

                if (investor)
                    d = DateTime.now

                    Meeting.create(
                        time: d.next_month.strftime("%d/%m/%Y %H:%M"),
                        investor_id: args[:investor_id] 
                    )
                else 
                    puts 'Investor not found'
                end 
            end
        end

        field :edit_meeting, Types::MeetingType do
            argument :id, !types.ID, 'the ID of the meeting to delete'
            argument :time, types.String
            argument :investor_id, types.ID 

            resolve ->(_obj, args, _ctx) do
                meeting = Meeting.find_by(id: args[:id])

                if args.key?(:time)
                    meeting.update(
                        time: args[:time]
                    )
                end

                if args.key?(:investor_id)
                    meeting.update(
                        investor_id: args[:investor_id]
                    )
                end 

                meeting
            end
        end

        field :delete_meeting_by_id, types[Types::MeetingType] do
            argument :id, !types.ID, 'the ID of the meeting to delete'
        
            resolve ->(_obj, args, _ctx) do
                meetings = Meeting.all
                meeting = Meeting.find_by(id: args[:id])
                
                # Ensure that we find and delete meeting
                if (meeting)   
                    meeting.destroy
                    puts 'Meeting ' + meeting.id + ' destroyed'
                else
                    puts 'Meetings not found'
                end

                # Return all meetings for investor
                meetings
            end
        end

        field :delete_meeting_by_investor, Types::InvestorType do
            argument :investor_id, !types.ID, 'the ID of the investor whos meetings we want to delete'

            resolve -> (_obj, args, _ctx) do
                investor = Investor.find_by(id: args[:investor_id])

                # Ensure that investor exists before delete
                if (investor) 
                    Meeting.where(investor_id: args[:investor_id]).destroy_all
                else 
                    puts 'Investor not found'
                end
                
                investor
            end
        end
    end
end
