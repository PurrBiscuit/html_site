ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :ssh_options, { keys: [File.join(ENV["HOME"], ".ssh", "app")], user: "app", forward_agent: true }

server '192.168.50.4', roles: %w{web app}, primary: true