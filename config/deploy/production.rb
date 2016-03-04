set :password, ask('Server password:', nil)
set :rails_env, 'production'


server '192.168.33.19',
  user: 'root',
  roles: %w{web app db},
  hosts: %w{host},
  ssh_options: {
    port: 45118,
    forward_agent: true,
        auth_methods: %w(publickey, password)
  }
