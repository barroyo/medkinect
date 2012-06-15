module Api
  module V1
    class SicksController < ApplicationController
      before_filter :restrict_access
      # GET /sicks
      # GET /sicks.json
      def index
        @sicks = Sick.all

        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @sicks }
        end
      end

      # GET /sicks/1
      # GET /sicks/1.json
      def show
        @sick = Sick.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @sick }
        end
      end

      # GET /sicks/new
      # GET /sicks/new.json
      def new
        @sick = Sick.new

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @sick }
        end
      end

      # GET /sicks/1/edit
      def edit
        @sick = Sick.find(params[:id])
      end

      # POST /sicks
      # POST /sicks.json
      def create
        @sick = Sick.new(params[:sick])

        respond_to do |format|
          if @sick.save
            format.html { redirect_to @sick, notice: 'Sick was successfully created.' }
            format.json { render json: @sick, status: :created, location: @sick }
          else
            format.html { render action: "new" }
            format.json { render json: @sick.errors, status: :unprocessable_entity }
          end
        end
      end

      # PUT /sicks/1
      # PUT /sicks/1.json
      def update
        @sick = Sick.find(params[:id])

        respond_to do |format|
          if @sick.update_attributes(params[:sick])
            format.html { redirect_to @sick, notice: 'Sick was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @sick.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /sicks/1
      # DELETE /sicks/1.json
      def destroy
        @sick = Sick.find(params[:id])
        @sick.destroy

        respond_to do |format|
          format.html { redirect_to sicks_url }
          format.json { head :no_content }
        end
      end
    end
  end
end