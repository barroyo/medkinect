class UsersController < ApplicationController

  before_filter :require_login

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to { |format|
      format.html
      format.json { render :json => @users.to_json(:include => :specialisms) }
    }
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @calendars = Calendar.where("user_id = ?", params[:id])
    respond_to { |format|
      format.html
      format.json { render :json => @user.to_json(:include => [:specialisms,:role]) }
    }
  end

  def login
    @user = User.authenticate(params[:username],params[:password])
    respond_to { |format|
      format.json { render :json => @user.to_json(:include => [:specialisms,:role]) }
    }
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_with(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.specialismships.collect { |a| a.specialism }
    # all especialisms where not in user.specialisms :D yeah toper rocks \m/
    if @user.specialisms.size > 0
      @specialismslist = Specialism.find(:all, :conditions => ['id not in (?)', @user.specialisms.map(&:id)])
    else
      @specialismslist = Specialism.find(:all)
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.password = Digest::MD5.hexdigest(@user.password)
    @user.kinect_angle = 0
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        @user.password = params[:user][:password]
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.specialisms.destroy_all
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.fullname = params[:user][:fullname]
    @user.role_id = params[:user][:role_id]
    @user.kinect_angle = 0
    @user.password = Digest::MD5.hexdigest('123123')
    @specialities = params[:specialisms]
    if !@specialities.nil?
      @specialities.each do |id|
        Specialismship.new({:specialism_id => id, :user_id => @user.id}).save
      end
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.calendars.delete_all
    @user.specialismships.delete_all
    
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
