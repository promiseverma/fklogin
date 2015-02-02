class HighScoresController < ApplicationController
  before_action :set_high_score, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @high_scores = HighScore.all
    respond_with(@high_scores)
  end

  def show
    respond_with(@high_score)
  end

  def new
    @high_score = HighScore.new
    respond_with(@high_score)
  end

  def edit
  end

  def create
    @high_score = HighScore.new(high_score_params)
    @high_score.save
    respond_with(@high_score)
  end

  def update
    @high_score.update(high_score_params)
    respond_with(@high_score)
  end

  def destroy
    @high_score.destroy
    respond_with(@high_score)
  end

  private
    def set_high_score
      @high_score = HighScore.find(params[:id])
    end

    def high_score_params
      params.require(:high_score).permit(:game, :score)
    end
end
