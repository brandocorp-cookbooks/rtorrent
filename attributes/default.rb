# system account to use for running rtorrent
default['rtorrent']['username'] = 'rtorrent'
default['rtorrent']['password'] = 'rtorrent'
default['rtorrent']['group'] = 'rtorrent'

default['rtorrent']['home'] = '/opt/rtorrent'

# options passed to the rtorrent.rc template
default['rtorrent']['config'].tap do |config|
  config['min_peers'] = nil
  config['max_peers'] = nil
  config['min_peers_seed'] = nil
  config['max_peers_seed'] = nil
  config['max_uploads'] = nil
  config['download_rate'] = nil
  config['upload_rate'] = nil
  config['directory'] = "#{node['rtorrent']['home']}/downloads"
  config['session'] = "#{node['rtorrent']['home']}/.rtorrent-session"
  config['schedule'] = 'low_diskspace,5,60,close_low_diskspace=100M'
  config['ip'] = nil
  config['bind'] = nil
  config['port_range'] = '6790-6999'
  config['port_random'] = nil
  config['check_hash'] = nil
  config['use_udp_trackers'] = 'yes'
  config['schedule'] = nil
  config['encryption'] = 'allow_incoming,enable_retry,try_outgoing'
  config['dht'] = 'auto'
  config['dht_port'] = 6881
  config['peer_exchange'] = 'yes'
  config['hash_read_ahead'] = nil
  config['hash_interval'] = nil
  config['scgi_port'] = '0.0.0.0:5000'
end

# The webserver to use for hosting rutorrent
default['rtorrent']['webserver'] = 'nginx'

# The rtorrent gui to serve via the webserver
default['rtorrent']['gui'] = 'rutorrent'
