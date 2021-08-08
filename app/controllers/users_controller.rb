class UsersController < ApplicationController
  def index
    @user=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      puts "Error! not saved"
    end
  end

  def edit
    @user=User.find(params[:id])
    post_params=params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :city_id)
    @user.update(post_params)
    redirect_to users_path
  end

  def update
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end

end
