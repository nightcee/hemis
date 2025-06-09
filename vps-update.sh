#! /bin/bash
echo "Installing unzip"
sudo apt install unzip -y
echo "unzip installed"
echo "Fetching latest Hemis version"
wget --quiet https://raw.githubusercontent.com/nightcee/hemis/main/Hemis-Linux.zip && sudo unzip Hemis-Linux.zip -d /usr/local/bin
echo "Hemis succesfully update"
echo "Cleanup excess files"
rm Hemis-Linux.zip && rm Hemis-params.zip
chmod +x /usr/local/bin/Hemis-cli && chmod +x /usr/local/bin/Hemisd && chmod +x /usr/local/bin/Hemis-tx
Hemisd || true
sleep 4
Hemis-cli stop
echo "Hemis successfully configured."
exit
