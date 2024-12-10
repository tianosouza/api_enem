class V1::QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show update destroy ]

  def index
    page_number = params[:page].try(:[], :number)
    page_size = params[:page].try(:[], :size) || 10

    @questions = Question.all.page(page_number).per(page_size)

    render json: @questions
  end

  def show
    render json: @question
  end

  def exam
    @questions = Question.by_year(params[:year])

    render json: @questions
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy!
  end

  private

    def set_question
      @question = Question.find(params.expect(:id))
    end


    def question_params
      params.expect(question: [ :title, :index, :year, :language, :discipline, :context, :file, :correct_alternative, :alternatives_introduction, :alternatives, :exam_id ])
    end
end
