require 'android/aapt'
require 'android/resource'

class APK
  include Android

  attr_reader :apk, :aapt, :resource

  def initialize(apk_path)
    @apk = apk_path
    @aapt = AAPT.new(@apk)
    @resource = Resource.new(@apk)
  end

  def drawable(name = "icon.png")
    dst = "/tmp/ruby-apk-#{Time.now.to_i}"
    @resource.extract(name, dst)
    dst
  end

  def method_missing(method, *args, &block)
    @aapt.dump[method]
  end

end
