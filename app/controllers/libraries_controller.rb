class LibrariesController < ApplicationController
  def index
    @library = Library.all
  end

  def new
    @library = Library.new
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if (@library.update(library_params))
      redirect_to @library
    else
      render 'libraries/edit'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    redirect_to libraries_path
  end

  def create
    # render plain: params[:post].inspect
    @library = Library.new(library_params)

    if (@library.save)
      redirect_to @library
    else
      render 'new'
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  private def library_params
    params.require(:library).permit(:title, :body)
  end
end
