class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :all_participants, only: [:index, :new, :edit]
  # GET /comments
  # GET /comments.json
  def index
    @idea = Idea.find(params[:idea_id])
    @ideation_session = IdeationSession.find(@idea.ideation_session_id)
    if Time.new.to_i <= @ideation_session.end_time.to_i || Time.new.to_i > @ideation_session.end_time_votation.to_i
      @ideation_session.update_attribute(:status_votation, false)
    else
      @ideation_session.update_attribute(:status_votation, true)
    end
    if @ideation_session.start_time == nil
      @ideation_session.update_attribute(:available_session, true)
    elsif @ideation_session.start_time.to_i > Time.new.to_i
      @ideation_session.update_attribute(:available_session, false)
    elsif @ideation_session.end_time == nil
      @ideation_session.update_attribute(:available_session, true)
    elsif @ideation_session.end_time.to_i < Time.new.to_i
      @ideation_session.update_attribute(:available_session, false)
    else
      @ideation_session.update_attribute(:available_session, true)
    end
    @comments = Comment.where(idea_id: @idea.id)

  end


  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @idea = Idea.find(params[:idea_id])
    @ideation_session = IdeationSession.find(@idea.ideation_session_id)


  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comments = Comment.all
    @idea = Idea.find(params[:idea_id])
    @ideation_session = IdeationSession.find(@idea.ideation_session_id)
    @comment = Comment.new(comment_params)
    @comment.idea_id = @idea.id
    @comment.participant_id = Participant.where(user_id: current_user.id).first.id
    respond_to do |format|
      if @comment.save && (@ideation_session.status_votation || @ideation_session.available_session)
        format.html { redirect_to idea_comments_path(@idea), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @idea = Idea.find(@comment.idea_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to idea_comments_path(@idea), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:participant_id, :idea_id, :body)
    end

    def all_participants
      @participants = Participant.all
    end
end
