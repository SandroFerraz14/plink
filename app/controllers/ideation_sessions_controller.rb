class IdeationSessionsController < ApplicationController
  before_action :set_ideation_session, only: [:show, :edit, :update, :destroy]
  before_action :set_themes, only: [:show, :destroy]
  before_action :set_ideas, only: [:show, :destroy]
  before_action :set_participants, only: [:show, :destroy]
  before_action :all_participants, only: [:index, :new, :edit]

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
    @ideation_session.nideas = 1
    @ideation_session.user_id = current_user.id
    @ideation_session.start_time = params[:start_time_value]
    @ideation_session.end_time = params[:end_time_value]

    if @ideation_session.start_time == nil
      @ideation_session.available_session = true
    elsif @ideation_session.start_time.to_i > Time.new.to_i
      @ideation_session.available_session = false
    elsif @ideation_session.end_time == nil
      @ideation_session.available_session = true
    elsif @ideation_session.end_time.to_i < Time.new.to_i
      @ideation_session.available_session = false
    else
      @ideation_session.available_session = true
    end
    respond_to do |format|
      if @ideation_session.save
        theme = Theme.new
        theme.name = GlobalConstants::DefaultTheme
        theme.ideation_session_id = @ideation_session.id
        theme.save
        format.html { redirect_to @ideation_session, notice: 'Ideation session was successfully created.' }
      else
        format.html { render :new }
      end
    end
    if @ideation_session.anonymity == 1
      @seed = NicknamesFeed.find(rand(1..10))
      @admin = Participant.create(user_id: current_user.id, ideation_session_id: @ideation_session.id, active: true, nickname: @seed.nick, avatar_file_name: @seed.image_url, email: current_user.email)
    else
      @admin = Participant.create(user_id: current_user.id, ideation_session_id: @ideation_session.id, active: true, nickname: current_user.email, avatar_file_name: 'default_profile', email: current_user.email)
    end
  end

  def update
    @ideation_session.start_time = params[:start_time_value]
    @ideation_session.end_time = params[:end_time_value]
    
    if @ideation_session.start_time == nil
      @ideation_session.available_session = true
    end

    if @ideation_session.start_time.to_i > Time.new.to_i
      @ideation_session.available_session = false
    elsif @ideation_session.end_time == nil
      @ideation_session.available_session = true
    elsif @ideation_session.end_time.to_i < Time.new.to_i
      @ideation_session.available_session = false
    else
      @ideation_session.available_session = true
    end

    respond_to do |format|
      if @ideation_session.update(ideation_session_params)
        if @ideation_session.available_session 
          format.html { redirect_to @ideation_session, notice: 'Ideation session was successfully updated.' }
        else
          format.html { redirect_to ideation_sessions_path, notice: 'Ideation session was successfully updated.' }
        end

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

  def set_anonymous 
    @ideation_session = IdeationSession.find(params[:id])
    @participants = @ideation_session.participants
    @seed = NicknamesFeed.find(rand(1..10))
    @participants.where(email: current_user.email, ideation_session_id: @ideation_session.id).take.update_attributes(avatar_file_name: @seed.image_url, nickname: @seed.nick)
    redirect_to :back
  end

  def set_identified
    @ideation_session = IdeationSession.find(params[:id])
    @participants = @ideation_session.participants
    if current_user.user_photo_file_name
      @part = @participants.where(email: current_user.email, ideation_session_id: @ideation_session.id).take.update_attributes(avatar_file_name: current_user.user_photo_file_name, nickname: current_user.email)
    else
      @part = @participants.where(email: current_user.email, ideation_session_id: @ideation_session.id).take.update_attributes(avatar_file_name: "default_profile", nickname: current_user.email)
    end
    redirect_to :back
  end

  def set_availability
    @ideation_session = IdeationSession.find(params[:id_ideation_session])
    @ideation_session.update_attribute(:available_session, params[:availability])
    render json: [{ message: 'Status of session updated with success.' }]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ideation_session
      @ideation_session = IdeationSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ideation_session_params
      params.require(:ideation_session).permit(:name, :description, :anonymity, :number_votes, :start_time, :end_time, themes_attributes: [:id, :name, :_destroy])
    end

    def set_themes
      @themes = @ideation_session.themes
    end

    def set_ideas
      @ideas = @ideation_session.ideas
    end

    def set_participants
      @participants = @ideation_session.participants
    end

    def all_participants
      @participants = Participant.all
    end
end
