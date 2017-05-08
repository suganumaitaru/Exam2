class PicsController < ApplicationController
 before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pics_params)
    if @pic.save
       redirect_to pics_path, notice:"投稿しました"
    else
       render 'new'
    end
  end

  def edit
  end

  def update
    if  @pic.update(pics_params)
        redirect_to pics_path, notice:"更新しました"
    else
        render 'new'
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_path, notice:"削除しました"
  end

  private
    def pics_params
      params.require(:pic).permit(:title,:content)
    end

    def set_pic
      @pic = Pic.find(params[:id])
    end

  end