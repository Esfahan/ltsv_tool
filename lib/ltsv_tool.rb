require "ltsv_tool/version"
require "ltsv_tool/cli"
#require Dir.pwd + "/lib/ltsv_tool/cli"
require "pp"

module LtsvTool

  class << self

    # convert Standard Output from ltsv to hash
    def tailf
      while true

        begin
          pp Hash[gets.split("\t").map{|f| f.split(":", 2)}]
        rescue Interrupt
          exit(0)
        end

      end
    end

    # convert logfile from ltsv to hash
    def converter(logfilename)
      #logfilename = first_argument

      unless logfilename?(logfilename) then
        puts 'Error : Logfile does not exists.'
        exit(0)
      end

      return hashes( read(logfilename) )
    end

    private

=begin
      # get ltsv logfile name from argument
      def first_argument
        return ARGV[0]
      end
=end

      # Required logfilename
      def logfilename?(logfilename)
        unless logfilename then
          return false
        else
          return File.exists?(logfilename)
        end
      end

      # read logfile
      def read(logfile)
        return open(logfile).read
      end

      # convert ltsv to hash
      def parser(line)
        return Hash[line.split("\t").map{|f| f.split(":", 2)}]
      end

      # convert ltsv to hash
      def hashes(log)
        return log.split("\n").map{|line| parser(line) }
      end

  end

end
