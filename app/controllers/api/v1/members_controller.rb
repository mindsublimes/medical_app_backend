class Api::V1::MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    member = Member.new(member_params)
    if member.save
      render json: member, status: :created
    else
      render json: member.errors, status: :unprocessable_entity
    end
  end

  def show
    member = Member.find(params[:id])
    if member.avatar.attached?
      render json: { url: rails_blob_url(member.avatar) }
    else
      render json: { error: 'Image not found' }, status: :not_found
    end
  end
  
  private
  
  def member_params
    params.require(:member).permit(:first_name, :last_name, :gender, :age, :role, :avatar)
  end
end
