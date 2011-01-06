class ActionItemsController < ApplicationController
  before_filter :authenticate_person!
  
  # GET /action_items
  # GET /action_items.xml
  def index
    @action_items = ActionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_items }
    end
  end

  # GET /action_items/1
  # GET /action_items/1.xml
  def show
    @action_item = ActionItem.find(params[:id])
    
    @action_item_comment = ActionItemComment.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_item }
    end
  end

  # GET /action_items/new
  # GET /action_items/new.xml
  def new
    @action_item = ActionItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_item }
    end
  end

  # GET /action_items/1/edit
  def edit
    @action_item = ActionItem.find(params[:id])
  end

  # POST /action_items
  # POST /action_items.xml
  def create
    @action_item = ActionItem.new(params[:action_item])

    respond_to do |format|
      if @action_item.save
        format.html { redirect_to(@action_item, :notice => 'Action item was successfully created.') }
        format.xml  { render :xml => @action_item, :status => :created, :location => @action_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_items/1
  # PUT /action_items/1.xml
  def update
    @action_item = ActionItem.find(params[:id])

    respond_to do |format|
      if @action_item.update_attributes(params[:action_item])
        format.html { redirect_to(@action_item, :notice => 'Action item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_items/1
  # DELETE /action_items/1.xml
  def destroy
    @action_item = ActionItem.find(params[:id])
    @action_item.destroy

    respond_to do |format|
      format.html { redirect_to(action_items_url) }
      format.xml  { head :ok }
    end
  end
  
  def vote_up
    @action_item = ActionItem.find(params[:id])
    if !@action_item.votes
      @action_item.votes = 0
    end
    @action_item.votes = @action_item.votes + 1

    respond_to do |format|
      if @action_item.save()
        format.html { redirect_to(@action_item, :notice => 'Your vote was recorded.') }
      end
    end
  end
  
  def take_on
    @action_item = ActionItem.find(params[:id])
    
    @person_taking_on_action_item = PersonTakingOnActionItem.new
    @person_taking_on_action_item.person = current_person
    @person_taking_on_action_item.action_item = @action_item
    
    respond_to do |format|
      if PersonTakingOnActionItem.where({:person_id => current_person.id, :action_item_id => @action_item.id}).length > 0
        format.html { redirect_to(@action_item, :notice => "Aren't you already signed up?") }
      elsif @person_taking_on_action_item.save()
        format.html { redirect_to(@action_item, :notice => 'You have been added to the list to help.') }
      end
    end
  end
end
