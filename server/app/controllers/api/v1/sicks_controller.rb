module Api
  module V1
    class SicksController < ApplicationController
      before_filter :restrict_access

      # GET /sicks
      def index
        @sicks = Sick.all

        respond_to do |format|
          format.json { render json: @sicks }
        end
      end

      # GET /sicks/1
      def show
        @sick = Sick.find(params[:sick_id])

        respond_to do |format|
          format.json { render json: @sick }
        end
      end


      # POST /sicks/new
      def create
        @sick = Sick.new(params[:sick])

        respond_to do |format|
          if @sick.save
            format.json { render json: @sick, status: :created, location: @sick }
          else
            format.json { render json: {:errors => @sick.errors} }
          end
        end
      end

      # POST /sicks/id/update
      def update
        @sick = Sick.find(params[:sick_id])

        respond_to do |format|
          if @sick.update_attributes(params[:sick])
            format.json { render json: {:updated => true} }
          else
            format.json { render json: {:errors => @sick.errors } }
          end
        end
      end

      # POST /sicks/id/delete
      def destroy
        @sick = Sick.find(params[:sick_id])
        @sick.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
        
      end

    end

  end
end