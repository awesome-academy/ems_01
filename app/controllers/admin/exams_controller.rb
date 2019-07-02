class Admin::ExamsController < Admin::BaseController
  before_action :ensure_subject_exist, only: :create

  def new
    @exam = Exam.new
  end

  def index
    @exams = Exam.sort_created_desc
  end

  def create
    @exam = Exam.new exam_params

    if params[:exam_questions].to_i > @subject.questions.size
      subject_questions = @subject.questions.size
      @exam.errors.add :exam_questions, I18n.t("subject_questions_not_enough",
        subject_questions: subject_questions)
      render :new
      return
    end

    @exam.name = t ".exam_name", subject_name: @exam.subject_name
    @exam.score_each_question = params[:score_each_question].to_i

    create_exam_questions @exam.subject_id, params[:exam_questions].to_i, @exam

    if @exam.save
      flash[:success] = t "create_successfully"
      redirect_to admin_exams_path
    else
      render :new
    end
  end

  private

  def exam_params
    params.require(:exam).permit :subject_id, :name, :status, :limited_time,
      :score
  end

  def create_exam_questions subject_id, no_questions, exam
    exam_questions = Question.random_questions_by_subject(subject_id,
      no_questions)
    exam_questions.each do |f|
      exam.questions << f
    end
  end

  def ensure_subject_exist
    @subject = Subject.find_by id: params[:exam][:subject_id]
    return if @subject
    render file: "public/404.html", status: :not_found, layout: false
  end
end
