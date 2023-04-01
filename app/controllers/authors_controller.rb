class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if (@author.update(author_params))
      redirect_to @author
    else
      render 'authors/edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  def create
    # render plain: params[:post].inspect
    @author = Author.new(author_params)

    if (@author.save)
      redirect_to @author
    else
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  private def author_params
    params.require(:author).permit(:name)
  end
end
