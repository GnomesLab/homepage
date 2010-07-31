include Term::ANSIColor

@report = { }

def run_rake_task(name)
  key = name.gsub(/:/, '_').to_sym

  if @report.values.include? :FAILED
    @report[key] = :SKIPPED

    puts ['', "==> #{bold(cyan('SKIPPING'))} :: #{name} <==", '']
    return
  else
    puts ['', "==> #{bold(yellow('EXECUTING'))} :: #{name} <==", '']
  end

  begin
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
      run_rake_task 'db:seed'

      puts ['', "#{bold('Report:')}", '========================================================', '']

      @report.each do |k,v|
        puts "#{magenta(k.to_s.gsub(/_/,':'))} [ #{bold(case v when :OK then green(v.to_s) when :FAILED then red(v.to_s) when :SKIPPED then cyan(v.to_s) end)} ]"
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
