require 'android/aapt'
require 'android/resource'

class APK
  include Android

  attr_reader :apk, :aapt, :resource, :dump

  def initialize(apk_path)
    @apk = apk_path
    @aapt = AAPT.new(@apk)
    @resource = Resource.new(@apk)
  end

  def drawable
    dst = "/tmp/ruby-apk-#{Time.now.to_i}"
    @resource.extract(self.icon, dst)
    dst
  end

  def sdk_version
    case self.api_level.to_i
    when 8
      '2.2'
    when 9..10
      '2.3'
    when 11..13
      '3.0'
    when 14..15
      '4.0'
    when 16
      '4.1'
    when 17
      '4.2'
    end
  end

  def method_missing(method, *args, &block)
    (@dump ||= @aapt.dump)[method]
  end

end
