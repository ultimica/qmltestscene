
# Command Descriptions:

## Help Display:
* _**fatekupdate**_ –h

## Simple Sample:
  * _**<font color='purple'>fatekupdate</font>**_ **–-ip** 127.0.0.1 **–-port** 8787 **--password** fatektest **–f** newprj.lpdw **-l** fateklog.xml


    Parameter| Description
    ---------|----------
    <b><font color='blue'>-h</font></b>      |    	<b>display help page
    <b><font color='blue'>--ip</font></b>    |    	<b>ip address or hostname
    <b><font color='blue'>--port</font></b>   |    	<b>port number
    <b><font color='blue'>-f</font></b>       |    	<b>update lpdw file path
    <b><font color='blue'>--pw</font></b>   	|	<b>password of lpdw file
    <b><font color='blue'>-l ,--log</font></b>    | <b>xml log file path<br>default is <font color='green'>fateklog.xml</font> beside the _**<font color='purple'>fatekupdate</font>**_

# Xml Log: (Also Display in std out) 
    ``` xml
    <?xml version="1.0" encoding="utf-8"?>
    <result>
    <code>200</code>
       <message>Firmware update is completed</message>
       <desc>Successful</desc>
       <datetime>2013-12-19 11:30:00</datetime>
       <previous>1.12.8</previous>
       <version>1.13.9</version>
    </result> 
    ```

