class UsersController < ApplicationController

  before_filter :signed_in_user,  :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,    :only => [:edit, :update]
  before_filter :admin_user,      :only => :destroy

  #action show
	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
	
	def new
    @user = User.new
  	@title = "Sign up"
  end

  def create
    #raise params[:user].inspect

    @user = User.new(params[:user])
    if @user.save
    	sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
      @title = "Sign up"
      render 'new'
    end
  end

  #####################################################
  ##         Hasta aquí fue el login y logout        ##
  #####################################################
  ## Aquí empieza Updatind, Showing y Deleteing users #
  #####################################################
  
  def edit
  		@user = User.find(params[:id])
  		@title = "Edit user"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])

      flash[:success] = "Your data were updated successfully"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end

  end

  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
    def signed_in_user
      deny_access unless signed_in?
    end
    
    def deny_access
    	store_location
      #flash[:notice] => "Please sign in"
    	redirect_to signin_path, :notice => "Please sign in"
    end
    
    def correct_user
    	@user = User.find(params[:id])
    	flash[:notice] = "You cant access to that user edit"
    	redirect_to(user_path) unless current_user?(@user)
    end



end
