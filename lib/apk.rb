require 'android/aapt'
require 'android/resource'

class APK

  attr_reader :apk, :aapt, :resource

  def initialize(apk_path)
    @apk = apk_path
    @aapt = AAPT.new(@apk)
    @resource = Resource.new(@apk)
  end

  def icon
    dst = "/tmp/ruby-apk-#{Time.now.to_i}"
    @resource.extract('icon.png', dst)
    dst
  end

  def method_missing(method, *args, &block)
    @aapt.dump[method]
  end

end
