class GoalsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]

  before_action :set_goal, only: %i[ show edit update destroy ]

  def index
    @goals = Goal.all
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to @goal
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to @goal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.expect(goal: [ :name, :status, :description, :featured_image ])
    end
end
