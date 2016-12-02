class UsersController < ApplicationController

 def show
	  if params[:id].nil? && current_user
	    @user = current_user
	  else
	    @user = User.find(params[:id])
	  end
	  #@title = @user.name
	 end
  
 def edit
    @user = User.find(params[:id])
 end

 def create
  @user = User.new(params[:user])
  if @user.save
    sign_in @user
    flash[:success] = "Account created!"
    redirect_to @user
   else
     @title = "Sign up"
     render 'new'
   end
 end

 def destroy
  @user.destroy
  redirect_to users_path, :flash => { :success => "User destroyed." }
 end

  def update

    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end



  def user_params

      params.require(:user).permit(:cpf, :rg, :name, :surname, :image, :address, :address2, :cidade, :state, :zipcode, :cellphone)
  end

  def  find_cadastro
    @user = User.find(params[:id])
  end


end
