set :password, ask('Server password:', nil)
set :rails_env, 'production'


server '176.9.9.86',
  user: 'root',
  roles: %w{web app db},
  hosts: %w{host},
  ssh_options: {
    port: 45130,
    forward_agent: true,
        auth_methods: %w(publickey, password)
  }
