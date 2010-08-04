# Included behavior
include Term::ANSIColor

namespace :gnomeslab do

  namespace :dev do

    desc "Executes a series of development database related commands."
    task :bootstrap => ['db:drop:all', 'db:create', 'db:schema:load'] do
      `rake db:test:load`
      Rake::Task['spec'].execute
      Rake::Task['cucumber:ok'].execute
      `rake db:seed`
      
      puts ['',
            '[gnome lead engineer on the speaker...]',
            "Sir, engineering gnomes report that #{bold(green('ALL SISTEMS ARE GO!'))}", '',
            "Gnome rocketeers, #{bold(red('THEN FIRE ZA MISSILES!!'))}", '', '']

    end

  end

end
