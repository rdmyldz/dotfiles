

sudo cp caps2ctrl /usr/local/bin/
sudo cp caps2ctrl.service /etc/systemd/system/
sudo systemctl daemon-reload
systemctl enable --now caps2ctrl.service 
sudo systemctl status caps2ctrl.service
