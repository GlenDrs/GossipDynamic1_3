class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    if session[:user_id]
# using find() would return an error if he can't find anything. So we use find_by instead, basicaly same process but not errors is return if the value is empty 
      @user = User.find_by(id: session[:user_id])
    end
  end

  def show
  end

  def new
    @gossip=Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to @gossip, #notice: "Gossip was successfully created." 
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_url, notice: "Gossip was successfully destroyed." 
  end

private
def set_gossip
  @gossip = Gossip.find(params[:id])
end

def gossip_params
  params.require(:gossip).permit(:title, :content, :user_id)
end

end
