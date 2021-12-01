class GymsController < ApplicationController

  def index
    gyms = Gym.all
    render json: gyms
  end 

  def show
    if params[:id]
    gym = find_gym
    render json: gym, status: :ok
    else
      error_message
    end
  end

  def destroy
 
    gym = find_gym
    if gym
      gym.destroy
      head :no_content
    else
      error_message
    end 

  end 

  private 

  def find_gym
    Gym.find(params[:id])
  end 

  def error_message
    rendor json: { error:"could not find"}, status: :not_found
  end 

  def gym_params
    params.permit(:name, :address)
  end 

end
