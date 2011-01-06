class ActionItemCommentsController < ApplicationController
  before_filter :authenticate_person!
  
  # GET /action_item_comments
  # GET /action_item_comments.xml
  def index
    @action_item_comments = ActionItemComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action_item_comments }
    end
  end

  # GET /action_item_comments/1
  # GET /action_item_comments/1.xml
  def show
    @action_item_comment = ActionItemComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action_item_comment }
    end
  end

  # GET /action_item_comments/new
  # GET /action_item_comments/new.xml
  def new
    @action_item_comment = ActionItemComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action_item_comment }
    end
  end

  # GET /action_item_comments/1/edit
  def edit
    @action_item_comment = ActionItemComment.find(params[:id])
  end

  # POST /action_item_comments
  # POST /action_item_comments.xml
  def create
    @action_item_comment = ActionItemComment.new(params[:action_item_comment])
    @action_item_comment.person = current_person

    respond_to do |format|
      if @action_item_comment.save
        format.html { redirect_to(@action_item_comment.action_item, :notice => 'Your comment has been added.') }
        format.xml  { render :xml => @action_item_comment, :status => :created, :location => @action_item_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @action_item_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /action_item_comments/1
  # PUT /action_item_comments/1.xml
  def update
    @action_item_comment = ActionItemComment.find(params[:id])

    respond_to do |format|
      if @action_item_comment.update_attributes(params[:action_item_comment])
        format.html { redirect_to(@action_item_comment, :notice => 'Action item comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action_item_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /action_item_comments/1
  # DELETE /action_item_comments/1.xml
  def destroy
    @action_item_comment = ActionItemComment.find(params[:id])
    @action_item_comment.destroy

    respond_to do |format|
      format.html { redirect_to(action_item_comments_url) }
      format.xml  { head :ok }
    end
  end
end
