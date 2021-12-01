class MembershipsController < ApplicationController

  def index
    memberships = Membership.all
    render json: memberships
  end 

  def create 
      new_member = Membership.create(member_params)
      render json: new_member, status: :created
  end 

  private

  def member_params
    params.permit(:charge, :client_id, gym_id)
  end

  zackM = Membership.create( charge: 100, client_id: 2, gym_id: 1)


end
