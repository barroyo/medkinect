class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user= User.find(:all, :joins => " inner join specialismships sp on users.id=sp.user_id", :conditions => ["users.id =? and sp.updated_at >= ?", params[:id],'2012-05-05T04:02:16Z'],:include=>:specialismships,:group => :id)
    respond_to do |format|
        format.json { render json: @user.to_json(:include=>[:specialismships]) }
    end
    
    
   # @user = User.find(params[:id])
    #@user.role = Role.find(@user.role_id)
	#  @user.specialismships.collect { |a| a.specialism }
    #respond_with(@user)
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
	
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
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
	
	@specialityes = params[:specialism]
	
	if !@specialityes.empty?
		@specialityes.each do |id| 
			Specialismship.new({:specialism_id => id, :user_id => @user.id}).save
		end
	end
	
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice:  @specialityes}
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
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
end
