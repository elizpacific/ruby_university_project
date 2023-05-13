require 'csv'
class LibrariesController < ApplicationController
  def index
    @library = Library.all.page(params[:page])
  end

  def new
    @library = Library.new
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(library_params)
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

  def purge_image
    @library = Library.find(params[:id])
    @library.images.purge

    redirect_to libraries_path, notice: "success"
  end

  private def library_params
    params.require(:library).permit(:name, :street_address, :library_id, :city, :zip_code, images: [])
  end

  def download
    pdf = LibrariesPdf.new(@library)
    send_data(pdf.render,
        filename: 'libraries.pdf',
        type: 'application/pdf',
        disposition: 'inline'
    )
  end

  def download_one
    library = Library.find(params[:id])
    pdf = LibraryPdf.new(library)
    send_data(pdf.render,
              filename: 'library.pdf',
              type: 'application/pdf',
              disposition: 'inline'
    )
  end

  def csv_download
    @library = Library.all
    @csv = CSV.generate(
      :write_headers=> true,
      :headers => ["Library ID","Name","City", "Street Address", "Zip Code"]
    ) do |csv|
      @library.map do |lib|
      csv << [lib.library_id,lib.name ,lib.city, lib.street_address, lib.zip_code]
      end
    end
    send_data( @csv,
               filename: 'libraries.csv'
    )
  end

end
