class Admin::SubjectsController < Admin::BaseController
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
    @subjects = Subject.sort_created_desc.paginate page: params[:page],
      per_page: Settings.subject_per_page
  end

  private

  def subject_params
    params.require(:subject).permit :name, :description
  end
end
