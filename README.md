# Powershell scripts

This is meant to be a library of useful powershell scripts to be used on Windows-based servers for website deployments.

## Installation

Make sure to obtain a certificate to sign script files. 

In case you need to run it manually you can modify execution policy by running the command:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

To change the execution policy back to default the following command can be used: 

```
Set-ExecutionPolicy -ExecutionPolicy AllSigned -Scope CurrentUser
```

## Usage
```
Website-Exists  -websiteName 'anyName'  # returns 'True' if website exists

Create-Website -websiteName 'Some-Web-Site' -bindings '@{protocol="http";bindingInformation=":80:Some-Web-Site"}' -physicalPath 'c:\Default-Web-Site' # creates website if it does not exist

Drop-Website -websiteName 'Some-Web-Site' # drops website if that website found

```

## Contributing

Pull requests are welcome.

If you see a bug please open an issue.

## License