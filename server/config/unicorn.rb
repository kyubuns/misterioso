worker_processes 1

listen "/tmp/unicorn.sock"

stdout_path File.expand_path("log/unicorn.stdout.log")
stderr_path File.expand_path("log/unicorn.stderr.log")

preload_app true

pid File.expand_path("tmp/pids/unicorn.pid")

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

puts '===== SERVER START ====='
