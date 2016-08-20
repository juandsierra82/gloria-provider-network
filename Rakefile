# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

task :deploy do
  sh 'git checkout production'
  sh 'git merge rails-served-html -m "Merging master for deployment"'
  sh 'rm -rf backend/public/assets'
  sh 'cd frontend && BROCCOLI_ENV=production broccoli build ../backend/public/assets && cd ..'

  unless `git status` =~ /nothing to commit, working directory clean/
    sh 'git add -A'
    sh 'git commit -m "Asset compilation for deployment"'
  end

  sh 'git subtree push -P backend heroku master'

  sh 'git checkout -'
end

Rails.application.load_tasks
