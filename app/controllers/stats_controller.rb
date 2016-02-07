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

    







    # participantes que tiveram mais votos nas suas ideias
    @most_useful_participant = LazyHighCharts::HighChart.new('column') do |f|
      f.chart defaultSeriesType: 'column', margin: [50, 200, 60, 170]
      f.xAxis(:categories => @ideas_mas_votos_ideas)
      series = { type: 'column', name: 'nome?', data: @ideas_mais_votos }
      f.series(series)
      f.options[:title][:text] = 'Total Expenses and Revenues'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end











   
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
      series = { type: 'column', name: 'nome?', data: @ideas_by_participant }
      f.series(series)
      f.options[:title][:text] = 'Total Expenses and Revenues'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end

    # ideias masi votadas
    @top_ideas = LazyHighCharts::HighChart.new('column') do |f|
      f.chart defaultSeriesType: 'column', margin: [50, 200, 60, 170]
      f.xAxis(:categories => @ideas_top_votes_ideas)
      series = { type: 'column', name: 'nome?', data: @ideas_top_votes }
      f.series(series)
      f.options[:title][:text] = 'Total Expenses and Revenues'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '13px Trebuchet MS, Verdana, sans-serif' } } })
    end


    # participantes que tiveram mais votos nas suas ideias


     
    
  end



  def show
  end

  def new
  end

  def edit
  end

  private

end
