module Api
  module V1
    class CalendarsController < ApplicationController

      # GET /calendars
      def index
        @calendars = Calendar.all

        respond_to do |format|
          format.json { render json: @calendars }
        end
      end


      # GET /calendars/id
      def show
        @calendar = Calendar.find(params[:calendar_id])

        respond_to do |format|
          format.json { render json: @calendar }
        end
      end




      # POST /calendars/new
      def create
        @calendar = Calendar.new(params[:calendar])

        respond_to do |format|
          if @calendar.save
            format.json { render json: @calendar, status: :created, location: @calendar }
          else
            format.json { render json: {:errors => @calendar.errors}, status: :unprocessable_entity }
          end
        end
      end

      # PUT /calendars/id/update
      def update
        @calendar = Calendar.find(params[:calendar_id])

        respond_to do |format|
          if @calendar.update_attributes(params[:calendar])
            format.json { render json: {:updated => true} }
          else
            format.json { render json: {:errors =>@calendar.errors}, status: :unprocessable_entity }
          end
        end
      end


      # POST /calendars/id/delete
      def destroy
        @calendar = Calendar.find(params[:calendar_id])
        @calendar.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end

      # GET /calendars/user/id
      def show_user_dates
        @calendars = Calendar.find(:all, :conditions => {user_id: params[:user_id]})

        respond_to do |format|
          format.json { render json: @calendars }
        end
      end
    end
  end
end