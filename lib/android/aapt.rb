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
      package = info.match(/package:\s*(.*)/)[1]
      attrs[:name] = package.match(/name='(\S*)'/)[1]
      attrs[:version_code] = package.match(/versionCode='(\S*)'/)[1]
      attrs[:version_name] = package.match(/versionName='(\S*)'/)[1]
      attrs[:label] = info.match(/application-label:\s*'(\S*)'/)[1]
      attrs
    end

  end
end
