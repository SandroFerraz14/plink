class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = Theme.all
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def edit
  end

  def create
    @ideation_session = IdeationSession.find(params[:ideation_session_id])
    @theme = Theme.new(theme_params)
    @theme.ideation_session = @ideation_session
    respond_to do |format|
      if @theme.save
        format.html { redirect_to @ideation_session, notice: 'Theme was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @theme = Theme.find(params[:ideation_session_id])
    if @theme.present?
      @theme.destroy
      respond_to do |format|
        format.html { redirect_to themes_url, notice: 'Theme was successfully destroyed.' }
      end
    end
    format.html { redirect_to themes_url, notice: 'Error destroyed theme.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:name)
    end
end
