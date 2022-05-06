class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]

  def index
    @meetups = policy_scope(Meetup)
  end

  def show
    @has_voted = Vote.has_voted?(@meetup, current_user)
  end

  def new
    @meetup = current_user.owned_meetups.new
    2.times { @meetup.invites.build }
    authorize @meetup
  end

  def edit
  end

  def create
    @meetup = current_user.owned_meetups.new(meetup_params)
    authorize @meetup

    @meetup.owner = current_user
    binding.pry
    if @meetup.save
      flash[:notice] = "You have successfully created a Meetup!"
      redirect_to @meetup
    else
      render :new
    end
  end

  def update
    @meetup.invites.new(user: current_user)
    @meetup.update(meetup_params)

    if @meetup.save
      flash[:notice] = "Successfully updated Meetup"
      redirect_to @meetup
    else
      render :edit
    end
  end

  def destroy
    @meetup.destroy
    redirect_to meetups_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description, :date, :user_id,
                                   invites_attributes: [:user_id])
  end

  def set_meetup
    @meetup = Meetup.find(params[:id])
    authorize @meetup
  end
end
