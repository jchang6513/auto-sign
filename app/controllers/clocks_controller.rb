class ClocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :find_clock, only: [:show, :edit, :update, :destroy]

  def index
    @clocks = Clock.where user_id: Clock.current_user.id
    render json: @clocks.as_json(root: false)
  end

  def show
    @clock = find_clock
  end

  def new
    @job = Job.find(params[:job_id])
    @clock = Clock.new
  end

  def create
    @clock = Clock.new clock_params

    if @clock.save
         redirect_to job_clocks_path(), notice: "The clock was created!"
    else
         render 'new'
    end
  end

  def edit
  end

  def update
    if @clock.update(clock_params)
         redirect_to @clock, notice: "Update successful"
    else
         render 'edit'
    end
  end

  def destroy
    @clock.destroy
    redirect_to root_path, notice: "clock destroyed"
  end

private
  def clock_params
       params.require(:clock).permit(:clock_in, :clock_out).merge(user_id: current_user.id).merge(job_id: params[:job_id])
  end

  def find_clock
       @clock = Clock.find(params[:id])
  end

  def set_current_user
    Clock.current_user = current_user
  end
end
