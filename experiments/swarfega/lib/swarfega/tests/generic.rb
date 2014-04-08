module Swarfega
  module Test
    class Generic

      include Methadone::CLILogging
      include Methadone::ExitNow

      def self.run(opts)
        debug("Running Swarfega::Generic - #{opts.inspect}")

        a = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
        }

        a.get(opts[:url]) do |page|
          debug("M: #{page.title.class} S: #{opts[:title].class}")
          if page.title.strip == opts[:title].strip
            exit_now!(0, "Title OK")
          else
            exit_now!(2, "Title CRITICAL - #{opts[:title]} not found.")
          end
        end
      end
    end
  end
end
