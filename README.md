# autoiota-dongle
Runtime for OBD IOT Hardware

## Prepare saltstack minion
1. Install saltstack minion: https://repo.saltstack.com/#bootstrap
2. Clone this repository
```
git clone --recurse-submodules https://github.com/chroonag/autoiota-dongle.git
```
3. Copy minion configuration
```
sudo cp -f autoiota-dongle/cfg/minion-dev /etc/salt/minion
```
4. Copy salt files
```
sudo cp -r autoiota-dongle/srv/* /srv/
```
5. Restart saltstack minion
```
sudo systemctl restart salt-minion
```

## Run Salt local
```
sudo salt-call --local state.apply saltenv=base [-l debug] [test=True]
```
