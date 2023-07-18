class UploadedFilesController < ApplicationController
  def index
    @uploaded_files = UploadedFile.all
  end


  def create
    params[:files].each do |file|
      uploaded_file = UploadedFile.create(name: file.original_filename, size: file.size)
      uploaded_file.file.attach(file)
    end
    redirect_to uploaded_files_path
  end

  def show
    @uploaded_file = UploadedFile.find(params[:id])

  end
end
