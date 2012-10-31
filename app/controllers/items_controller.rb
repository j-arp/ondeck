class ItemsController < ApplicationController
      layout 'xhr', :only=>[:checklist]

      def notes
          @item = Item.find(params[:id])
          @new_note = Note.new
      end

      
      def saveNote
          @item = Item.find(params[:id])
          @note = Note.new(params[:note])
          @note.save
          @item.notes << @note
          @item.save
          
          redirect_to :controller=>"items", :action=>"notes", :id=>params[:id]
          
      end


      def checklist
        
        weeklist = session[:weeks].join(",")

        if !params.has_key?(:status)
          statusid = 3
        else
          statusid = params[:status]
        end
        
        @items = Item.where("week in (?) and status_id = ? ", session["weeks"], statusid)
        respond_to do |format|
          format.html # checkoff.html.erb
          format.json { render :json => @items }
        end
      end
      


      def setStatus
        @item = Item.find(params[:id])
        @item.status_id = params[:statusid]
        @item.save
        render :json => @item
      end
      
      def move
          @item = Item.find(params[:id])
          
          if params[:dir] == 'up'
            new_week = @item.week.to_i + 1
            if new_week.to_i > session[:week].to_i
                new_status = 2
              else
                new_status = @item.status_id
              end  
          else
              new_week = @item.week.to_i - 1
              if new_week.to_i == session[:week].to_i
                new_status = 3
              else
                new_status = @item.status_id
              end
          end
          
          @item.week = new_week;
          @item.status_id = new_status
          @item.save
          render :json => @item
      end
        
      def checkoff
        @item = Item.find(params[:id])
        @item.status_id = 4
        @item.save
        render :json => @item
      end

      def uncheck
        @item = Item.find(params[:id])
        @item.status_id = 3
        @item.save
        render :json => @item
      end



#########################
## basic


  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all(:order=>'week desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @programs = Program.all
    @statuses = Status.all
    
    @item.week = session[:week]
    @item.year = session[:year]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  #  itemweek = @item.week.to_s
  #  itemyear = @item.year.to_s    
    
#    unless  itemweek .length
     #   @item.week = itemweek
    #  end

#    unless  itemyear.length
 #       @item.year = session[:year]
  #    end  

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    now = Time.new
    @item.week = now.strftime('%W')
    @item.year = now.strftime('%Y')
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, :notice => 'Item was successfully created.' }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, :notice => 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  


end
