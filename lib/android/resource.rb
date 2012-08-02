require 'zip/zipfilesystem'

module Android
  class Resource

    attr_reader :apk

    def initialize(apk_path)
      @apk = apk_path
    end

    def extract(res, dst)
      Zip::ZipFile.open(@apk) do |zipfile|
        %w[xxhdpi xhdpi hdpi mdpi ldpi].each do |s|
          break unless zipfile.each do |file|
            if "res/drawable-#{s}/#{res}" == file.name
              zipfile.extract(file, dst)
              break
            end
          end
        end
      end
    end

  end
end
