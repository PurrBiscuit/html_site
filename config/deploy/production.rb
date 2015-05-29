ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :ssh_options, { keys: [File.join(ENV["HOME"], ".ssh", "app")], user: "app", forward_agent: true }

server 'www.purrbiscuit.com', roles: %w{web app}, primary: true
