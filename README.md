# Swift4.1<->Python3.6.5

### Python3.6.5 https --version localhost Setting

### Mac Terminal command 

 1.python cyrptoRSA.py

 2.openssl req -x509 -newkey rsa:2048 -keyout private-key.pem -out cert.pem -days 365

 settings...
 
 3.Drag and drop it to the created cert.pem simulator
 
 General->About->Certificate Trust Settings->Enable certificate->Restart the simulator
 
 <img src="https://github.com/daisukenagata/RsaAuthentication/blob/master/Certificate.png?raw=true" width="280px">
 
 4.python httpsServer.py
	
 password input
 
 5.Application launch
 
 6.Character input
 
![](https://github.com/daisukenagata/RsaAuthentication/blob/master/httpsVersion.gif?raw=true)

 7.In case of real machine

 httpsServer/call.py
	
 ` server = HTTPServer(('IP', int(8000)), handler)`
 
 httpsServer/ViewController
 
`let urlString = "https://IP/?\(txt.replacingOccurrences(of: " ", with: "+"))"`

 1~6 Set!
