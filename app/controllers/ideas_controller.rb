class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json

  def create
    @ideation_session = IdeationSession.find(params[:ideation_session_id])
    @idea = Idea.new(idea_params)
    @idea.ideation_session = @ideation_session
    @idea.user_id = current_user.id
    @idea.number = @ideation_session.nideas
    # @idea.theme_id = Theme.where(name: GlobalConstants::DefaultTheme, ideation_session_id: @ideation_session.id).first.id
    @idea.theme_id = params[:id_theme]
    @ideation_session.nideas = @idea.number + 1
    @ideation_session.save
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @ideation_session, notice: 'Idea was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    id_session = @idea.ideation_session_id
    @ideation_session = IdeationSession.find(id_session)
    if @idea.present?
      @idea.destroy
      redirect_to ideation_session_path(@ideation_session), notice: 'Idea was successfully destroyed.'
    else
      redirect_to ideation_session_path(@ideation_session), notice: 'Error try destroyed Idea.'
    end
  end

  def update_theme_ideas
    if params[:idea_ids].present?
      ids = params[:idea_ids]
      @ideas = Idea.find(ids)
      @ideas.each do |idea|
        idea.update_attribute(:theme_id, params[:id_theme])
      end
      render json: [{ message: 'Ideas updated with success' }]
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_id, :ideation_session_id, :text, :color, :number)
    end
end
