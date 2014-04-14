module Swarfega
  class Test

    def initialize(platform, opts)
      @platform = platform
      @opts     = opts
    end

    include Methadone::CLILogging
    include Methadone::ExitNow

    def run
      #TODO: run the rspec tests and output in selected format
      case @opts[:output]
      when 'report'
        info("TODO: run the specs for #{@platform.capitalize} and produce a report.")
      when 'nagios'
        info("TODO: run the specs for #{@platform.capitalize} and output in nagios plugin format.")
      end
    end
  end
end



__END__

# nagios plugin format
exit_now!(0, "Title OK")
exit_now!(2, "Title CRITICAL - err message goes here")

