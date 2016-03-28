Eye.config do
  logger "/var/www/task_chat/current/log/eye.log"
end

Eye.application :cable do
  working_dir "/var/www/task_chat/current/"
  trigger :flapping, :times => 10, :within => 1.minute
  env 'RAILS_ENV' => 'production'
 
  process :puma do
    daemonize true
    pid_file "/var/www/task_chat/current/tmp/pids/puma.pid"
    stdall "/var/www/task_chat/current/log/puma.log"

    start_command "bundle exec puma -p 28080 cable/config.ru"
    stop_signals [:TERM, 5.seconds, :KILL]
    restart_command 'kill -9 {PID}'

    restart_grace 10.seconds

    check :cpu, :every => 30, :below => 80, :times => 3
    check :memory, :every => 30, :below => 2000.megabytes, :times => [3,5]
  end
  process :sidekiq do
    daemonize true
    pid_file "/var/www/task_chat/current/tmp/pids/sidekiq.pid"
    stdall "/var/www/task_chat/current/log/sidekiq.log"
    start_command " bundle exec sidekiq -c 1"
    stop_signals [:TERM, 5.seconds, :KILL]
    restart_command 'kill -9 {PID}'
  end
end
