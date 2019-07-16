class Admin::QuestionsController < Admin::BaseController

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    params[:question][:question_type] = params[:question][:question_type].to_i
    @question = Question.new question_params

    if @question.save
      flash[:success] = t "create_successfully"
      redirect_to new_admin_question_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit :subject_id, :content, :question_type,
      :score, answers_attributes:
        [:id, :answer, :is_correct, :_destroy]
  end
end
