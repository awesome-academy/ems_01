class Admin::SubjectsController < Admin::BaseController
  before_action :load_subject, except: [:index, :new, :create]

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "create_successfully"
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def index
    @subjects = Subject.not_disable.sort_created_desc.paginate page: params[:page],
      per_page: Settings.subject_per_page
  end

  def edit; end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "update_successfully"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.questions.any?
      @subject.update_attribute :disable, true
      flash[:success] = t "disable_successfully"
    elsif @subject.destroy
      flash[:success] = t "delete_successfully"
    else
      flash.now[:danger] = t "error_message"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name, :description
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    render file: "public/404.html", status: :not_found, layout: false
  end
end
