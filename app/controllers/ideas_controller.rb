class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_comments, only: [:show, :destroy]

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
    @ideation_session.available_session = @ideation_session.available_session and @ideation_session.start_time.to_i <= Time.new.to_i 
    @ideation_session.available_session = @ideation_session.available_session and @ideation_session.end_time.to_i >= Time.new.to_i 
     if !@ideation_session.available_session
       @idea=nil 
       respond_to do |format|
         format.html { redirect_to ideation_sessions_path, prompt: 'The session has ended' }
       end
     else
      @idea.ideation_session = @ideation_session
      @idea.participant_id = Participant.where(email: current_user.email, ideation_session_id: params[:ideation_session_id]).first.id
      @idea.number = @ideation_session.nideas
      # @idea.theme_id = Theme.where(name: GlobalConstants::DefaultTheme, ideation_session_id: @ideation_session.id).first.id
      @idea.theme_id = params[:id_theme]
      @ideation_session.nideas = @idea.number + 1
      @ideation_session.save
      respond_to do |format|
        if @idea.save
          format.html { redirect_to @ideation_session, notice: '' }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: '' }
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
      redirect_to ideation_session_path(@ideation_session), notice: ''
    else
      redirect_to ideation_session_path(@ideation_session), notice: ''
    end
  end

  def update_theme_ideas
    if params[:idea_ids].present?
      ids = params[:idea_ids]
      @ideas = Idea.find(ids)
      @ideas.each do |idea|
        idea.update_attribute(:theme_id, params[:id_theme])
      end
      render json: [{ message: 'Topic changed with success.' }]
    end
  end

  def delete_ideas
    if params[:idea_ids].present?
      ids = params[:idea_ids]
      Idea.destroy(ids)
      render json: [{ message: 'Ideas deleted with success' }]
    end
  end
  
  def vote_ideas
    @ideation_session = IdeationSession.find(params[:id_ideation_session])
    if params[:idea_ids].present? && @ideation_session.status_votation == true
      ids = params[:idea_ids]
      @ideas = Idea.find(ids)
      @ideas.each do |idea|
        Vote.create(idea_id: idea.id, participant_id: params[:id_participant], ideation_session_id: params[:id_ideation_session])
      end
      render json: [{ message: 'Ideas voted with success.' }]
    else
      render json: [{ message: 'Error.' }]
    end
  end
  
  def vote_remove
    @ideation_session = IdeationSession.find(params[:id_ideation_session])
    if params[:idea_ids].present? && @ideation_session.status_votation == true
      ids = params[:idea_ids]
      @ideas = Idea.find(ids)
      vote_ids = []
      @ideas.each do |idea|
        vote_id = Vote.where(idea_id: idea.id, participant_id: params[:id_participant], ideation_session_id: params[:id_ideation_session]).take.id
        vote_ids.push(vote_id)
      end
      Vote.destroy(vote_ids)
      render json: [{ message: 'Voted removed with success.' }]
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_id, :ideation_session_id, :text, :color, :number, comments_attributes: [:id, :participant_id, :idea_id, :body])
    end
end
