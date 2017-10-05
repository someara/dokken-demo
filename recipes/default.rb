
user 'notroot' do
  action :create
end

package 'netcat' do
  action :install
end

template '/etc/systemd/system/echo.service' do
  source 'echo.service.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    description: 'an echo server',
    system_user: 'notroot',
    exec_start: '/bin/netcat -ll -p 9001 -c /bin/cat'
  )
  action :create
end

service 'echo' do
  provider Chef::Provider::Service::Systemd
  supports status: true
  action [:enable, :start]
end
