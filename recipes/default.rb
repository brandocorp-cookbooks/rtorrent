package 'screen'
package 'rtorrent'

user node['rtorrent']['username'] do
  home node['rtorrent']['home']
  password node['rtorrent']['password']
end

%w(downloads watch .rtorrent-session).each do |dir|
  directory "#{node['rtorrent']['home']}/#{dir}" do
    owner node['rtorrent']['username']
    group node['rtorrent']['group']
  end
end

template "#{node['rtorrent']['home']}/.rtorrent.rc" do
  source "rtorrent.rc.erb"
  owner node['rtorrent']['username']
  group node['rtorrent']['group']
  mode '0600'
end

template '/etc/init.d/rtorrent' do
  source 'rtorrent.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'rtorrent' do
  action [:start, :enable]
end
