# 更换软件源
sudo mv /etc/apt/sources.list /etc/apt/sources.bak
sudo cp sources.list /etc/apt/sources.list

#安装前置软件
sudo apt update
sudo apt install -y git vim screen python3-pip python-pip

#更换pip源
sudo cp pip.conf /etc/pip.conf

#### Fixes old pip in apt repo
yes | sudo pip3 install --upgrade pip
yes | sudo pip install --upgrade pip

#### IPython is nice to have
yes | sudo pip3 install ipython
yes | sudo pip install ipython

#### UDPCOMMS
sudo bash UDPComms/install.sh

#### uDHCPd
sudo bash uDHCPd/install.sh

#本地安装whl
sudo pip install numpy-1.19.1-cp37-cp37m-linux_armv7l.whl
sudo pip3 install numpy-1.19.1-cp37-cp37m-linux_armv7l.whl
sudo pip install pigpio-1.46-py2.py3-none-any.whl
sudo pip3 install pigpio-1.46-py2.py3-none-any.whl
sudo pip install pyserial-3.4-py2.py3-none-any.whl
sudo pip3 install pyserial-3.4-py2.py3-none-any.whl
sudo pip install transforms3d-0.3.1-py3-none-any.whl
sudo pip3 install transforms3d-0.3.1-py3-none-any.whl