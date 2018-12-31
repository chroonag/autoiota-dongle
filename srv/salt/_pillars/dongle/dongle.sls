# wifi hotspot (hostapd-formula)
hostapd:
  cardlist:
    uap0:                                  # The interface used by the AP
      driver: nl80211                      # Use the nl80211 driver with the brcmfmac driver
      hw_mode: g                           # Use the 2.4GHz band (g)
      channel: 6                           # Use channel 6
      ignore_broadcast_ssid: 0             # Enable SSID broadcast
      auth_algs: 1                         # Use Open System Authentication
      # Raspberry Pi 3
      ieee80211n: 1                        # Enable 802.11n
      wmm_enabled: 1                       # QoS support
      ap_list:
        AutoIota-{{ grains["id"][-12:] }}:   # The name of the AP
          auth_algs: 1                     # 1=WPA, 2=WEP, 3=Both
          wpa: 2                           # Use WPA2
          wpa_key_mgmt: WPA-PSK            # Use a pre-shared key
          wpa_pairwise: TKIP
          rsn_pairwise: CCMP               # Use AES, instead of TKIP
          wpa_passphrase: autoiota2018

# dns server for wifi hotspot (dnsmasq-formula)
dnsmasq:
  dnsmasq_conf: salt://network/dnsmasq/dnsmasq.conf
  dnsmasq_hosts: salt://network/dnsmasq/dnsmasq.hosts
  settings:
    interface:
      - uap0
    dhcp-range: 192.168.4.2,192.168.4.20,255.255.255.0,24h
    domain-needed: true
  hosts:
    local.autoiota.io: 192.168.4.1
