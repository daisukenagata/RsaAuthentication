# Swift4<->Python3.6.3

### Python3.6.3 https --version localhost Setting

### Mac Terminal command 

 1.python cyrptoRSA.py

 2.openssl req -x509 -newkey rsa:2048 -keyout private-key.pem -out cert.pem -days 365

 settings...
 
 3.Drag and drop it to the created cert.pem simulator
 General->About->Certificate Trust Settings->Enable certificate
 
 <img src="https://github.com/daisukenagata/RsaAuthentication/blob/master/Certificate.png?raw=true" width="280px">
 
 4.info.Plistセッテイング
 
 <dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>localhost</key>
			<dict>
				<key>NSExceptionAllowsInsecureHTTPLoads</key>
				<true/>
			</dict>
		</dict>

 5.python httpsServer.py
 
 password input
 
 6.Application launch
 
 7.Character input
 
![](https://github.com/daisukenagata/RsaAuthentication/blob/master/httpsVersion.gif?raw=true)
