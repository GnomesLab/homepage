include Term::ANSIColor

namespace :gnomeslab do

  namespace :dev do

    desc "Executes a series of development database related commands."
    task :bootstrap => :environment do
      puts `bundle install`

      ["db:drop:all",
       "db:create:all",
       "db:schema:load",
       "db:test:clone",
       "db:seed",
       "spec",
       "cucumber:ok"].each { |t| Rake::Task[t].execute }

      puts ['', '========================================================', '',
            "Sir, engineering gnomes report that #{bold(green('ALL SISTEMS ARE GO!'))}", '',
            "Gnome rocketeers, #{bold(red('LAUNCH ZA MISSILES!!'))}", '', '']
    end

  end

end
