# Web miner instructions
Note Created: 2022-05-06

> https://github.com/notgiven688/webminerpool

On ubuntu 18.04
Install the .net dependencies
```
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

```
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
```

```
sudo apt-get install -y dotnet-runtime-5.0
```

The in the server folder of the repository run 
> dotnet build -c Release

Then still in the server folder run with 
> dotnet run -c Release


Num connections is called batch_size