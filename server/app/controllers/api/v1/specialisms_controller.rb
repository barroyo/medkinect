module Api
  module V1
    class SpecialismsController < ApplicationController
      before_filter :restrict_access
      # GET /users
      # GET /users.json
      def index
        @Specialisms = Specialism.all
        respond_with(@Specialisms)
      end

      # GET /users/1
      # GET /users/1.json
      def show
        @specialism = Specialism.find(params[:id])
        respond_with(@specialism)
      end

      # GET /users/new
      # GET /users/new.json
      def new
        @specialism = Specialism.new

        respond_with(@specialism)
      end

      # GET /users/1/edit
      def edit
        @specialism = Specialism.find(params[:id])
      end

      # POST /users
      # POST /users.json
      def create
        @specialism = Specialism.new(params[:specialism])

        respond_to do |format|
          if @specialism.save
            format.html { redirect_to @specialism, notice: 'Specialism was successfully created.' }
            format.json { render json: @Specialism, status: :created, location: @user }
          else
            format.html { render action: "new" }
            format.json { render json: @Specialism.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /users/1
      # PUT /users/1.json
      def update
        @specialism = Specialism.find(params[:id])

        respond_to do |format|
          if @specialism.update_attributes(params[:specialism])
            format.html { redirect_to @specialism, notice: 'Specialism was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @specialism.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /users/1
      # DELETE /users/1.json
      def destroy
        @user = User.find(params[:id])
        @user.destroy

        respond_to do |format|
          format.html { redirect_to users_url }
          format.json { head :no_content }
        end
      end

    end

  end
end
