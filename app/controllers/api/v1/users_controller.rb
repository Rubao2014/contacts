class Api::V1::UsersController < Api::ApiController
	# respond_to :json
 
	#   def index
	#     @users = User.all
	#     respond_with @users
	#   end
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def show
  end

  def create

    @user = User.new(user_params)

    if  @user.save
      render :json =>  @user.as_json(:email=> @user.email, :password=> @user.password, :password_confirmation=> @user.password), :status=>201, :notice => 'Envio de confirmação enviado para o e-mail cadastrado.'
      return
    else
      warden.custom_failure!
      render :json =>  @user.errors, :status=>422
    end

  end

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
