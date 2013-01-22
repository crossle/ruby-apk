module Android
  class AAPT
    @@aapt = File.dirname(__FILE__) + "/../binaries/aapt"
    attr_reader :apk

    def initialize(apk_path)
      @apk = apk_path
    end

    def aapt(commands)
      `#{@@aapt} #{commands} #{@apk}`
    end

    def dump
      attrs = {}
      info = aapt('dump badging')
      package = info.match(/package:\s*(.*)/)[1] rescue nil
      application = info.match(/application:\s*(.*)/)[1] rescue nil
      attrs[:name] = package.match(/name='([^']*)'/)[1] rescue nil
      attrs[:version_code] = package.match(/versionCode='([^']*)'/)[1] rescue nil
      attrs[:version_name] = package.match(/versionName='([^']*)'/)[1] rescue nil
      attrs[:label] = info.match(/application-label:\s*'([^']*)'/)[1] rescue nil
      attrs[:icon] = application.match(/icon='([^']*)'/)[1] rescue nil
      attrs[:api_level] = info.match(/sdkVersion:\s*'(.*)'/)[1] rescue nil
      attrs
    end

  end
end
