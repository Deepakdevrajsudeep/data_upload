class UploadedFile < ApplicationRecord
    has_one_attached :file

    def file_content
      file.download
    end
end
