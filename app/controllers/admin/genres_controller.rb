class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
    redirect_to admin_genres_path
    else
      flash[:notice] = "入力内容を確認してください"
      @genres = Genre.all
      render:"index"
    end
  end
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    flash[:notice] = "ジャンル登録情報を変更しました"
    redirect_to admin_genres_path(@genre.id)
    else
      flash[:notice] = "入力内容を確認してください"
    render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
