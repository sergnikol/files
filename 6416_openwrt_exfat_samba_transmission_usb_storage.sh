opkg update


opkg install block-mount
opkg install kmod-usb-storage
opkg install kmod-fs-exfat
mkdir /mnt/usb
sed -i -e '1 s/^/mount \/dev\/sda1 \/mnt\/usb\n/;' /etc/rc.local


opkg install samba36-server

echo “config samba
	option name 'OpenWrt'
	option workgroup 'OpenWrt'
	option description 'Samba on OpenWrt'
	option charset 'UTF-8'
	option homes '0'
	option interface 'loopback lan’ 

      config sambashare
	option name 'Shares'
	option path '/mnt/usb'
	option guest_ok 'yes'
	option create_mask '0700'
	option dir_mask '0700'
	option read_only ‘no’” > /etc/config/samba

/etc/init.d/samba enable


opkg install transmission-daemon
echo “config transmission
	option enabled '1'
	option config_dir '/tmp/transmission'
	option alt_speed_down '50'
	option alt_speed_enabled 'false'
	option alt_speed_time_begin '540'
	option alt_speed_time_day '127'
	option alt_speed_time_enabled 'false'
	option alt_speed_time_end '1020'
	option alt_speed_up '50'
	option bind_address_ipv4 '0.0.0.0'
	option bind_address_ipv6 '::'
	option blocklist_enabled 'false'
	option cache_size_mb '2'
	option dht_enabled 'true'
	option download_dir '/mnt/usb/downloads'
	option download_queue_enabled 'true'
	option download_queue_size '4'
	option encryption '1'
	option idle_seeding_limit '30'
	option idle_seeding_limit_enabled 'false'
	option incomplete_dir '/mnt/usb/downloads'
	option incomplete_dir_enabled 'false'
	option lazy_bitfield_enabled 'true'
	option lpd_enabled 'false'
	option message_level '1'
	option peer_limit_global '240'
	option peer_limit_per_torrent '60'
	option peer_port '51413'
	option peer_port_random_high '65535'
	option peer_port_random_low '49152'
	option peer_port_random_on_start 'false'
	option peer_socket_tos 'default'
	option pex_enabled 'true'
	option port_forwarding_enabled 'true'
	option preallocation '1'
	option prefetch_enabled 'true'
	option queue_stalled_enabled 'true'
	option queue_stalled_minutes '30'
	option ratio_limit '2.0000'
	option ratio_limit_enabled 'false'
	option rename_partial_files 'true'
	option rpc_authentication_required 'false'
	option rpc_bind_address '0.0.0.0'
	option rpc_enabled 'true'
	option rpc_port '9091'
	option rpc_url '/transmission/'
	option rpc_whitelist '127.0.0.1,192.168.100.*'
	option rpc_whitelist_enabled 'true'
	option scrape_paused_torrents_enabled 'true'
	option script_torrent_done_enabled 'false'
	option seed_queue_enabled 'false'
	option seed_queue_size '10'
	option speed_limit_down '100'
	option speed_limit_down_enabled 'false'
	option speed_limit_up '20'
	option speed_limit_up_enabled 'false'
	option start_added_torrents 'true'
	option trash_original_torrent_files 'false'
	option umask '18'
	option upload_slots_per_torrent '14'
	option utp_enabled 'true'
	option scrape_paused_torrents 'true'
	option watch_dir_enabled 'false'” > /etc/config/transmission
/etc/init.d/transmission enable
reboot




