//
// https://stackoverflow.com/questions/19439430/go-golang-traverse-through-struct/19439503
//
package main

import "fmt"

type InstallItems struct {
	desc        string
	installcmd  string
	validatecmd string
}

// OPTIONS="-y -q"

var InstallItemsCity = []InstallItems{
	{"always good to update the package manager apt",
		"sudo apt update",
		"sudo apt update"},
	{"see how we are configured with GitHub", "git config --list", "git config --list"},
	{"Check that GitHub can be reached via SSH", "ssh -vT git@github.com", "ssh -vT git@github.com"},
	{"NodeJS", "sudo apt install node", "node --version"},
	{"python", "sudo apt install python", "python --version"},
	{"python3", "sudo apt install python3", "python3 --version"},
	{"ansible", "sudo apt install ansible", "ansible --version"},
	{"test the ansible connection", "ansible -m ping TestClient", "ansible -m ping TestClient"},
	{"docker as sudo", "sudo docker run hello-world", "sudo docker run hello-world"},
	{"docker as regular-user", "docker run hello-world", "docker run hello-world"},
	{"tree", "sudo apt install tree", "tree --version"},
	{"ncdu", "sudo apt install ncdu", "ncdu --version"},
	{"vscode", "code --version", "code --version"},
	{"golang", "go --version", "go --version"},
	{"", "sudo apt install", " --version"},
	{"", "sudo apt install", " --version"},
}

// func GetTotalWeight(data_arr []InstallItems) int {
// 	total := 0
// 	for _, elem := range data_arr {
// 		total += elem.weight
// 	}
// 	return total
// }

func main() {
	fmt.Println("Hello, playground")
	// fmt.Println(GetTotalWeight(InstallItemsCity))
}

// GitHub CLI gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh 

kubectl
Update the apt package index and install packages needed to use the Kubernetes apt repository:

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
Download the Google Cloud public signing key:

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
Add the Kubernetes apt repository:

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
Update apt package index with the new repository and install kubectl:

sudo apt-get update
sudo apt-get install -y kubectl

Kind
https://kind.sigs.k8s.io/docs/user/quick-start/#installation

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin



doctl
doctl is able to interact with all of your DigitalOcean resources. Below are a few common usage examples #115
#115

Get the tar file

64 bit Linux OS

curl -s https://api.github.com/repos/digitalocean/doctl/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux-amd64 | wget -qi -
untar the file

curl -s https://api.github.com/repos/digitalocean/doctl/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux-amd64 | wget -qi -

tar xvf doctl-1.61.0-linux-amd64.tar.gz 

doctl  <-- this file was created
Move the file to someplace in the $PATH

sudo mv doctl /usr/local/bin

doctl version

doctl version 1.61.0-release

Git commit hash: c46d961


Digitalocean token
doctl auth init
Please authenticate doctl for use with your DigitalOcean account. You can generate a token in the control panel at https://cloud.digitalocean.com/account/api/tokens

Enter your access token: 
Validating token... OK

doctl account ratelimit
Limit    Remaining    Reset
5000     4998         2021-06-18 01:40:33 -0400 EDT

doctl balance get
Month-to-date Balance    Account Balance    Month-to-date Usage    Generated At
4.83                     0.00               4.83                   2021-06-18T05:29:24Z


