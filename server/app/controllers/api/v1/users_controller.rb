module Api
  module V1
    class UsersController < ApplicationController
      before_filter :restrict_access

      # GET /users
      def index
        @users = User.all
        respond_to { |format|
          format.json { render :json => @users.to_json(:include => :specialisms) }
        }
      end

      # GET /users/1
      def show
        @user = User.find(params[:user_id])
        respond_to { |format|
          format.json { render :json => @user.to_json(:include => [:specialisms,:role]) }
        }
      end

      def login
        if params[:username].nil? || params[:password].nil?
          respond_to { |format|
            format.json { render :json => {:error => ["Invalid Information"]} }
          }
          return
        end
        @user = User.authenticate(params[:username],params[:password])
        respond_to { |format|
          if !@user.nil?
            format.json { render :json => @user.to_json(:include => [:specialisms,:role]) }
          else
            format.json { render :json => {:errors => [:invalid => true]} }
          end
        }
      end

      # POST /users/new
      def create
        @user = User.new(params[:user])
        @user.password = Digest::MD5.hexdigest(@user.password)
        respond_to do |format|
          if @user.save
            format.json { render json: @user, status: :created, location: @user }
          else
            format.json { render json: {:errors => @user.errors}}
          end
        end
      end

       # POST /users/id/change_password
      def change_password
        if params[:username].nil? || params[:password].nil? || params[:new_password].nil?
          respond_to do |format|
            format.json { render :json => {:error => ["Invalid Information"]} }
          end
          return
        end
        @user = User.authenticate(params[:username],params[:password])
        respond_to do |format|
          if !@user.nil?
            @user.password = Digest::MD5.hexdigest(params[:new_password])
            if @user.save
              format.json { render :json => {:updated => true} }
            else
              format.json { render :json => {:errors => @user.errors} }
            end
          else
            format.json { render :json => {:errors => [:invalid => true]} }
          end
        end
      end

      # POST /users/1/update
      def update
        @user = User.find(params[:user_id])
        @user.specialisms.destroy_all
        if !params[:specialisms].nil?

          params[:specialisms].each do |sp|
             speciality = @user.specialismships.new()
             speciality.specialism_id = sp[:id]
             speciality.save
          end

        end
        @user.email = params[:email]
        @user.fullname = params[:fullname]
        @user.role_id = params[:role_id] if !params[:role_id].nil?
        @user.kinect_angle = params[:kinect_angle]
        respond_to do |format|
          if @user.save()
            format.json { render json: {:updated => true}  }
          else
            format.json { render json: {:errors => @user.errors} }
          end
        end
      end


      # POST /users/1/delete
      def destroy
        @user = User.find(params[:user_id])

        #delete all calendars related with the user
        @user.calendas.delete_all

        @user.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end
  
    end
    
  end
  
end
