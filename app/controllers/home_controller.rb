class HomeController < ApplicationController
  def index
    @programs = Program.all
    @item = Item.new
    @statuses = Status.all
    
    now = Time.new
    week = now.strftime('%W')
    year = now.strftime('%Y')
    lastweek = week.to_i - 1;
    nextweek = week.to_i + 1;
    
    session[:week] = week
    session[:year] = year
    session[:weeks] = [lastweek,week,nextweek]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

  def user
     respond_to do |format|
       format.html # index.html.erb
       format.json { render :json => @items }
     end
  end

end
