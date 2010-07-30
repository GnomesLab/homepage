include Term::ANSIColor

@report = { }

def run_rake_task(name)
  key = name.gsub(/:/, '_').to_sym

  begin
    puts ['', "==> #{bold(yellow('EXECUTING'))} :: #{name} <==", '']

    Rake::Task[name].execute

    @report[key] = :OK
  rescue StandardError => e
    @report[key] = :FAILED
  end
end

namespace :gnomeslab do

  namespace :dev do

    desc "Executes a series of development database related commands."
    task :bootstrap => :environment do
      begin
        system('bundle install')
        @report[:bundle] = :OK
      rescue StandardError => e
        @report[:bundle] = :FAILED
      end

      run_rake_task 'db:drop:all'
      run_rake_task 'db:schema:load'
      run_rake_task 'db:test:load'
      run_rake_task 'spec'
      run_rake_task 'cucumber:ok'

      puts ['', "#{bold('Report:')}", '========================================================', '']

      @report.each do |k,v|
        puts "#{magenta(k.to_s.gsub(/_/,':'))} [ #{bold(v == :OK ? green(v.to_s) : red(v.to_s))} ]"
      end

      if @report.values.include? :FAILED
        puts ['',
              '[a gnome rushes into your command center...]',
              "Sir, #{bold(red('WE ARE LE TIRED!'))}. Fix our working conditions if you want get some work done today!",
              '']
      else
        puts ['',
              '[gnome lead engineer on the speaker...]',
              "Sir, engineering gnomes report that #{bold(green('ALL SISTEMS ARE GO!'))}", '',
              "Gnome rocketeers, #{bold(red('LAUNCH ZA MISSILES!!'))}", '', '']
      end
    end

  end

end
