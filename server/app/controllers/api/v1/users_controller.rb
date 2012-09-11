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
          format.json { render :json => @user.to_json(:include => [:specialisms,:role]) }
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
            format.json { render json: {:errors => @user.errors}, status: :unprocessable_entity }
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
        respond_to do |format|
          if @user.save()
            format.json { render json: {:updated => true}  }
          else
            format.json { render json: {:errors => @user.errors}, status: :unprocessable_entity }
          end
        end
      end


      # POST /users/1/delete
      def destroy
        @user = User.find(params[:user_id])
        @user.destroy

        respond_to do |format|
          format.json { render json: {:deleted => true} }
        end
      end
  
    end
    
  end
  
end
