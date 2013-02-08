class UsersController < ApplicationController

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
  
  #Hasta aquí fue el login y logout
  #Aquí empieza Updatind, Showing y Deleteing users
  
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


end
