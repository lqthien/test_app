class BlogController < ApplicationController
  def index

  end

  def new
    @blog_post = BlogPost.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @blog_post = BlogPost.create(params[:blog_post])
    respond_to do |format|
      format.js
    end
  end

  def show
    if(@blog_post = BlogPost.find_by_id(params[:id])).nil?
      redirect_to root_path
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def delete
    return unless current_user.admin? && (blog_post = BlogPost.find_by_id(params[:id])).present?
    blog_post.destroy
    respond_to do |format|
      format.js
    end
  end
end