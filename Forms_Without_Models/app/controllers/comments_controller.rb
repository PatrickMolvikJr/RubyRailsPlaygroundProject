class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # # GET /comments
  # # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end
  #
  # # GET /comments/1
  # # GET /comments/1.json
  # def show
  # end
  #
  # # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end
  #
  # # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  # POST /comments.json
  def create
    @blog = Blog.find(params[:blog_id])
    @blog.comments.create(comment_params)
    @blog.save
    redirect_to blog_path(@blog.id)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content, :avatar, :rating, :blog_id)
    end
end
