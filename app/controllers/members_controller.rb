class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)
    @house = House.find(params[:house_id])
    @member.house = @house

    if @member.save
      flash[:notice] = "Member added successfully"
      redirect_to @house
    else
      flash[:alert] = @member.errors.full_messages.join(', ')
      render :new
    end
  end

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end
end
