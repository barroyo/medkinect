module Api
  module V1
    class RolesController < ApplicationController
      before_filter :restrict_access

      # GET /roles
      def index
        @roles = Role.all

        respond_to do |format|
          format.json { render json: @roles }
        end
      end


      # GET /roles/1
      def show
        @role = Role.find(params[:role_id])

        respond_to do |format|
          format.json { render json: @role }
        end
      end


      # POST /roles/new
      def create
        @role = Role.new(params[:role])

        respond_to do |format|
          if @role.save
            format.json { render json: @role, status: :created, location: @role }
          else
            format.json { render json: @role.errors, status: :unprocessable_entity }
          end
        end
      end

      # POST /roles/1/update
      def update
        @role = Role.find(params[:role_id])

        respond_to do |format|
          if @role.update_attributes(params[:role])
            format.json { render json: {:updated => true} }
          else
            format.json { render json: @role.errors, status: :unprocessable_entity }
          end
        end
      end

      # POST /roles/1/delete
      def destroy
        @role = Role.find(params[:role_id])
        @role.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end
    end
  end
end