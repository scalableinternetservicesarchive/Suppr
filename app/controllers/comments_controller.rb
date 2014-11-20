class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :show, :destroy, :edit, :new, :update]

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.dinner, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @comment.dinner }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    success = @comment.user_id == current_user.id ? true : false
    respond_to do |format|
      if success and @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, notice: 'You can not modify this comment' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    success = false
    if @comment.user_id == current_user.id
      @comment.destroy
      success = true
    end

    respond_to do |format|
      format.html { redirect_to comments_url, notice: success ? 'Comment was successfully removed.' : 'You can not delete this comment' }
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
      params.require(:comment).permit(:dinner_id, :content)
    end
end
