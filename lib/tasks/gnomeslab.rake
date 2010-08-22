require 'term/ansicolor'

# Included behavior
include Term::ANSIColor

namespace :gnomeslab do

  namespace :dev do

    desc "Resets the development environment"
    task :reset => ['db:drop:all', 'db:create', 'db:schema:load'] do
      puts ['', "Development environment database reset: [#{bold(green('OK'))}]", '']
    end

    desc "Setup the development environment without running any tests"
    task :setup => [:reset] do
      `rake db:test:load`
      `rake db:seed`

      puts ['', "Development database load and seed: [#{bold(green('OK'))}]", '']
    end

    desc "Executes a series of development database related commands."
    task :bootstrap => [:setup] do
      Rake::Task['spec'].execute
      Rake::Task['cucumber:ok'].execute

      puts ['',
            '[gnome lead engineer on the speaker...]',
            "Sir, engineering gnomes report that #{bold(green('ALL SISTEMS ARE GO!'))}", '',
            "Gnome rocketeers, #{bold(red('THEN FIRE ZA MISSILES!!'))}", '', '']
    end

  end

end
