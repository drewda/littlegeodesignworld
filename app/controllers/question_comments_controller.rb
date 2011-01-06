class QuestionCommentsController < ApplicationController
  before_filter :authenticate_person!
  
  # GET /question_comments
  # GET /question_comments.xml
  def index
    @question_comments = QuestionComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @question_comments }
    end
  end

  # GET /question_comments/1
  # GET /question_comments/1.xml
  def show
    @question_comment = QuestionComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question_comment }
    end
  end

  # GET /question_comments/new
  # GET /question_comments/new.xml
  def new
    @question_comment = QuestionComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question_comment }
    end
  end

  # GET /question_comments/1/edit
  def edit
    @question_comment = QuestionComment.find(params[:id])
  end

  # POST /question_comments
  # POST /question_comments.xml
  def create
    @question_comment = QuestionComment.new(params[:question_comment])
    @question_comment.person = current_person

    respond_to do |format|
      if @question_comment.save
        format.html { redirect_to(@question_comment.question, :notice => "We've added your comment.") }
        format.xml  { render :xml => @question_comment, :status => :created, :location => @question_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /question_comments/1
  # PUT /question_comments/1.xml
  def update
    @question_comment = QuestionComment.find(params[:id])

    respond_to do |format|
      if @question_comment.update_attributes(params[:question_comment])
        format.html { redirect_to(@question_comment, :notice => 'Question comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_comments/1
  # DELETE /question_comments/1.xml
  def destroy
    @question_comment = QuestionComment.find(params[:id])
    @question_comment.destroy

    respond_to do |format|
      format.html { redirect_to(question_comments_url) }
      format.xml  { head :ok }
    end
  end
end
