class IdeationSessionsController < ApplicationController
  before_action :set_ideation_session, only: [:show, :edit, :update, :destroy]
  before_action :set_themes, only: [:show]

  def index
    @ideation_sessions = IdeationSession.all
  end

  def show
  end

  def new
    @ideation_session = IdeationSession.new
  end

  def edit
  end

  def create
    @ideation_session = IdeationSession.new(ideation_session_params)

    respond_to do |format|
      if @ideation_session.save
        format.html { redirect_to @ideation_session, notice: 'Ideation session was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ideation_session.update(ideation_session_params)
        format.html { redirect_to @ideation_session, notice: 'Ideation session was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ideation_session.destroy
    respond_to do |format|
      format.html { redirect_to ideation_sessions_url, notice: 'Ideation session was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ideation_session
      @ideation_session = IdeationSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ideation_session_params
      params.require(:ideation_session).permit(:name, :description, themes_attributes: [:id, :name])
    end

    def set_themes
      @themes = @ideation_session.themes
    end
end
