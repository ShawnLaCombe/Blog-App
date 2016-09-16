class BlogsController < ApplicationController
  def about
    
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_url, notice: ("Successfully Saved")
    else
      flash.now[:notice] = "Not Saved"
      render :new
    end
  end

  def show 
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_url, notice: "Success"
    else 
      flash.now notice: "Not Successful"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to blogs_url, notice: "Dog Destroyed"
    else
      flash.now notice: "Dog not Destroyed"
      redirect_to blogs_url
    end
  end



  private
  def blog_params
    params.require(:blog).permit(:title, :content, :owner)
  end



end
