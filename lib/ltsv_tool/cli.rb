require 'thor'

module LtsvTool
  class CLI < Thor

    package_name "package_name"
    default_command :tailf

    desc 'convert ltsv', 'convert standard outputs from ltsv to hash'

    # option :from, type: :string, default: "none"
    # class_option :silent, type: :boolean, default: false, desc: 'Not write log messages', aliases: '-s'

    # bundle exec bin/disksizerec hello world --from=John
    def tailf
      puts LtsvTool.tailf
    end


    desc 'convert ltsv', 'convert log from ltsv to hash'
    def convert(logfilename)
      puts LtsvTool.converter(logfilename)
    end

  end
end
