##
## This is the content of a Vagrantfile for Vagrant (https://www.vagrantup.com),
## which allows for running of these Jupyter notebooks via a Vagrant VM
## You need VirtualBox (https://www.virtualbox.org) or another VM application to use Vagrant
## Why use a VM? I found installing dependencies on my base environment to be a headache.
## This Linux VM seems more reliable.
##
## In short, once you have Vagrant installed, execute:
## vagrant up ##This will take awhile, as all the dependencies have to get installed
## vagrant ssh
## cd /vagrant
## run_jupyter.sh
##

Vagrant.configure("2") do |config|
  config.vm.box = "sylabs/singularity-3.7-ubuntu-bionic64"
  config.vm.provider "virtualbox" do |v|
    v.cpus = 4
    v.memory = 2048
  end
  config.vm.network "forwarded_port", guest: 13337, host: 13337, protocol: "tcp",
    auto_correct: true
  config.vm.network "forwarded_port", guest: 5900, host: 59007, protocol: "tcp",
    auto_correct: true
  config.ssh.forward_x11 = true
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y cifs-utils ##So can access SMB shares
    apt-get install -y smbclient ##If SMB mounting problems, an alternative
    apt-get install -y build-essential curl
    apt-get install -y libgl1-mesa-glx 
    apt-get install -y python-natsort
    apt-get install -y texlive-extra-utils
    apt-get install -y wine ## :) 
    apt-get install -y steam-installer ## :) 
    apt-get install -y genometools libgenometools0 libgenometools0-dev
    apt-get install -y bc htop
    apt-get install -y xvfb xfce4 x11vnc ##For https://github.com/abiyani/automate-save-page-as
    apt-get install -y cargo libssl-dev ##For https://github.com/Y2Z/monolith
    apt-get install -y g++ cmake make qtbase5-dev libqt5sql5-sqlite uuid-dev libcap-dev uuid-runtime ## For https://github.com/tycho-kirchner/shournal
    apt-get install -y python3-gi python3-opengl gir1.2-gtk-3.0 mesa-utils libgl1-mesa-glx ##For pycam
    MINICONDA="Miniconda3-latest-Linux-x86_64.sh"
    if [[ ! -f "/home/vagrant/${MINICONDA}" ]]; then
       wget -P /home/vagrant https://repo.anaconda.com/miniconda/${MINICONDA} 2>/dev/null
       chmod +x /home/vagrant/${MINICONDA}
       su --login -c "/home/vagrant/${MINICONDA} -b -p" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda init" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda update -n base -c defaults conda" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda config --add channels bioconda" vagrant 
       su --login -c "/home/vagrant/miniconda3/bin/conda config --add channels conda-forge" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y nextflow" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y snakemake" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y natsort" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y biopython" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y jupyter" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y jupyterlab" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y fcsparser" vagrant
       su --login -c "/home/vagrant/miniconda3/bin/conda install -y seaborn" vagrant
    echo "alias moore-mount='sudo mkdir -p /mnt/moorelab;sudo mount -t cifs -o "username=tfallon,domain=AD,vers=3.0" //sio-smb.ucsd.edu/moorelab /mnt/moorelab'" >> /home/vagrant/.bashrc
    fi
SHELL
end
