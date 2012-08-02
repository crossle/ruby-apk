require 'apk/aapt'

class APK

  attr_reader :apk, :aapt

  def initialize(apk_path)
    @apk = apk_path
    @aapt = AAPT.new(@apk)
  end

  def name
    @aapt.dump[:name]
  end

end
