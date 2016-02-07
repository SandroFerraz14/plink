class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :edit, :update]

  def index
    @ideation_session = IdeationSession.find(params[:ideation_session_id])

    @participants = Participant.where(ideation_session_id: @ideation_session.id)
    @votes = Vote.where(ideation_session_id: @ideation_session.id)
    @ideas = Idea.where(ideation_session_id: @ideation_session.id)
    @themes = Theme.where(ideation_session_id: @ideation_session.id)

    @ideas_by_theme = @ideas.joins(:theme).group(:name).count(:all).to_a

    @ideas_by_participant = @ideas.joins(:participant).group(:nickname).order('count_all desc').count('all').take(5).to_a
    @ideas_by_participant_participant = @ideas_by_participant.map {|i| i[0]}

    @ideas_top_votes = @votes.joins(:idea).group(:number).order('count_all desc').count('all').take(5).to_a
    @ideas_top_votes_ideas = @ideas_top_votes.map {|i| i[0]}

    @ideas_top_votes_id = @votes.joins(:idea).group(:idea_id).order('count_all desc').count('all').take(5).to_a

    @participant_id = []
    @nickname_vote_idea = []
    @ideas_top_votes_id.each do |a|
      id = a[0]
      votos = a[1]
      @idea_part = Idea.find(id)
      nickname = Participant.find(@idea_part.participant_id).nickname
      aux = []
      aux[0] = nickname
      aux[1] = votos
      @nickname_vote_idea << aux
      @participant_id << nickname
    end

    @distinct_participant_id = []
    @distinct_participant_id = @participant_id.uniq

    @most_useful_part = []
    @distinct_participant_id.each do |p|
      @total = 0
      @nickname_vote_idea.each do |x|
        if x[0] == p
          @total = @total + x[1]
        end
      end
      @elemento = [p,@total]
      @most_useful_part << @elemento
    end

    @most_useful_part_part = @most_useful_part_part.take(5)

    @most_useful_part_part = @most_useful_part.map {|i| i[0]}
   
    # temas com mais ideias
    @theme_ideas = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> @ideas_by_theme
      }
      f.series(series)
      f.options[:title][:text] = "Ideas by Theme"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end

    #participantes que lançaram mais ideias
    @most_active_participant = LazyHighCharts::HighChart.new('column') do |f|
      f.chart defaultSeriesType: 'column', margin: [50, 200, 60, 170]
      f.xAxis(:categories => @ideas_by_participant_participant)
      series = { type: 'column', name: @ideas_by_participant_participant, data: @ideas_by_participant }
      f.series(series)
      f.options[:title][:text] = 'most_active_participant'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end

    # ideias masi votadas
    @top_ideas = LazyHighCharts::HighChart.new('column') do |f|
      f.chart defaultSeriesType: 'column', margin: [50, 200, 60, 170]
      f.xAxis(:categories => @ideas_top_votes_ideas)
      series = { type: 'column', name: @ideas_top_votes_ideas, data: @ideas_top_votes }
      f.series(series)
      f.options[:title][:text] = 'top_ideas'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end


    # participantes que tiveram mais votos nas suas ideias
    @most_useful_participant = LazyHighCharts::HighChart.new('column') do |f|
      f.chart defaultSeriesType: 'column', margin: [50, 200, 60, 170]
      f.xAxis(:categories => @most_useful_part_part)
      series = { type: 'column', name: @most_useful_part_part, data: @most_useful_part }
      f.series(series)
      f.options[:title][:text] = 'most_useful_participant'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end

     
    
  end



  def show
  end

  def new
  end

  def edit
  end

  private

end
