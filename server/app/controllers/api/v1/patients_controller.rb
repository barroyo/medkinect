module Api
  module V1
    class PatientsController < ApplicationController
      before_filter :restrict_access

      # GET /patients.json
      def index
        @patients = Patient.all

        respond_to do |format|
          format.json { render json: @patients }
        end
      end


      # GET /patients/1
      def show
        @patient = Patient.find(params[:patient_id])

        respond_to do |format|
          format.json { render json: @patient }
        end
      end




      # POST /patients/new
      def create
        @patient = Patient.new(params[:patient])

        respond_to do |format|
          if @patient.save
            format.json { render json: @patient, status: :created, location: @patient }
          else
            format.json { render json: {:errors =>@patient.errors}, status: :unprocessable_entity }
          end
        end
      end

      # PUT /patients/1/update
      def update
        @patient = Patient.find(params[:patient_id])

        respond_to do |format|
          if @patient.update_attributes(params[:patient])
            format.json { render json: {:updated => true} }
          else
            format.json { render json: {:errors => @patient.errors}, status: :unprocessable_entity }
          end
        end
      end

      # POST /patients/1/delete
      def destroy
        @patient = Patient.find(params[:patient_id])
        @patient.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end
    end
  end 
end