class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.where user_id: current_user.id
  end

  def show
    @job = find_job
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params

    if @job.save
         redirect_to @job, notice: "The job was created!"
    else
         render 'new'
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
         redirect_to @job, notice: "Update successful"
    else
         render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path, notice: "Job destroyed"
  end

private
  def job_params
       params.require(:job).permit(:title, :link).merge(user_id: current_user.id)
  end
  def find_job
       @job = Job.find(params[:id])
  end

end
