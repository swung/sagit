module Sagit
  module Watchdog
    def all_exist_shiphomes
      shiphomes = []
      Dir.foreach('/home/jbi/fileserver/shiphomes/JDEVADF_MAIN_GENERIC') do |file|
        shiphomes << file.sub(/.jar/,'') if file != "." && file != ".."
      end
      shiphomes
    end

    def all_exist_vmimages
      images = []
      Dir.foreach('/home/jbi/fileserver/image/ADFdi') do |file|
        images << file.sub(/.zip/,'') if file =~ /^WinXP_Office2k7.*\.zip$/
      end
      images
    end
  end
end
