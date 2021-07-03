require 'pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        # @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
        # @files ||= Dir["#{path}/*.mp3"].collect{ |f| f.gsub("#{path}/", "") }
        # binding.pry
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end

    def import
        files.each {|f| Song.new_by_filename(f)}
    end

end