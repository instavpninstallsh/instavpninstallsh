[ -d instavpn ] && rm -rf instavpn/
if [[ ! -z $(which apt-get) ]]; then
    echo "Update"
	apt-get update > /dev/null
    echo "Upgrade"
	apt-get -y upgrade > /dev/null
    echo "Fail2ban"
	apt-get -y install fail2ban > /dev/null
    echo "Installing git,cron,python"
    apt-get install -y git cron python > /dev/null
    echo "Ok"
else
    echo "You must use Ubuntu"
    exit 1
fi
echo "Cloning git repo"
git clone https://github.com/sockeye44/instavpn.git --quiet || exit 1
echo "Ok"
cd instavpn
sudo python install.py
instavpn list