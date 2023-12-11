function dev = openSup(port)

try    
    dev_handle=serial(port);    
    set(dev_handle,'BaudRate',9600);  
    set(dev_handle,'InputBufferSize',1000);      	
    set(dev_handle,'DataBits',8);                  	 	 
    set(dev_handle,'StopBits',1);                   	 	 
    set(dev_handle,'Parity','none');              	 
    %ser.FlowControl='none';
    
    fopen(dev_handle);
    dev=dev_handle;
catch
    h = msgbox('error com port');
    fclose(dev_handle);
    instrreset
end
end
