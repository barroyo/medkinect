module Api
  module V1
    class SpecialismsController < ApplicationController
      before_filter :restrict_access

      # GET /specialism
      def index
        @Specialisms = Specialism.all
        respond_with(@Specialisms)
      end

 
      # GET /specialism/id
      def show
        @specialism = Specialism.find(params[:specialism_id])
        respond_with(@specialism)
      end



      # POST /specialism/new
      def create
        @specialism = Specialism.new(params[:specialism])

        respond_to do |format|
          if @specialism.save
            format.json { render json: @Specialism, status: :created, location: @user }
          else
            format.json { render json: @Specialism.errors, status: :unprocessable_entity }
          end
        end
      end

      # POST /specialism/id/update
      def update
        @specialism = Specialism.find(params[:specialism_id])

        respond_to do |format|
          if @specialism.update_attributes(params[:specialism])
            format.json { render json: {:updated => true} }
          else
            format.json { render json: {:errors => @specialism.errors}, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /specialism/id/delete
      def destroy
        @specialism = User.find(params[:specialism_id])
        @specialism.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end

    end

  end
end
