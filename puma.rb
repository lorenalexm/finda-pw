workers 1
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV['PORT'] || 9292
environment ENV['RACK_ENV'] || 'development'
