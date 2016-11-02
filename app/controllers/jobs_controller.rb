class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, except: [:all_jobs]
  before_action :set_category_titles, only: [:new, :edit]

  def all_jobs
    @jobs = Job.all
    if params[:sort] == 'interest'
      @jobs = Job.order('level_of_interest DESC')
    end
    render :all_jobs
  end

  def index
    @jobs = @company.jobs
    @contact = Contact.new
    @contacts = @company.contacts
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @job.comments
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    @category = Category.find_by(title: params[:job][:category_id])
    params[:job][:category_id] = @category.id
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_category_titles
    @category_titles = Category.pluck(:title)
  end
end
