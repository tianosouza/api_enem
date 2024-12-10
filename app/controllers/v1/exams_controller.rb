class V1::ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show update destroy ]

  def index
    page_number = params[:page].try(:[], :number)
    page_size = params[:page].try(:[], :size) || 10

    @exams = Exam.all.page(page_number).per(page_size)

    render json: @exams
  end

  def show
    render json: @exam
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      render json: @exam, status: :created, location: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  def update
    if @exam.update(exam_params)
      render json: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @exam.destroy!
  end

  private

    def set_exam
      @exam = Exam.find_by!(year: params[:year]) || Exam.find(params[:id])
    end

    def exam_params
      params.expect(exam: [ :title, :year, :disciplines, :languages ])
    end
end
