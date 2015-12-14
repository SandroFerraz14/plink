class ThemesController < ApplicationController
  before_action :set_theme, only: [:edit, :update, :destroy]

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
    @theme = Theme.find(params[:id])
    id_session = @theme.ideation_session_id
    @ideation_session = IdeationSession.find(id_session)
    if @theme.present?
      @theme.destroy
      redirect_to ideation_session_path(@ideation_session), notice: 'Theme was successfully destroyed.'
    else
      redirect_to ideation_session_path(@ideation_session), notice: 'Error try destroyed theme.'
    end
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
