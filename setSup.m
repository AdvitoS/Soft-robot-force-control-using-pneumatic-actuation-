
function setSup(v1,v2,v3,v4,v5,v6,v7,v8,s1,s2,s3,s4,s5,s6,dev_handle)

%%%%%%%%%%%%%  Servo Range 1 2 3  %%%%%%%%%%%%
%300--------------450-------------------900%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RangeMax=300;
RangeMin=900;

if (s1<RangeMax || s1>RangeMin)
    s1=450;
    msgbox('s1,out of range');
    return;
end

s1_temp=dec2bin(s1,16);
s1H=bin2dec(s1_temp(1:8));
s1L=bin2dec(s1_temp(9:16));

if (s2<RangeMax || s2>RangeMin)
    s2=450;
    msgbox('s2,out of range');
    return;
end
s2_temp=dec2bin(s2,16);
s2H=bin2dec(s2_temp(1:8));
s2L=bin2dec(s2_temp(9:16));

if (s3<RangeMax || s3>RangeMin)
    s3=450;
    msgbox('s3,out of range');
    return;
end
s3_temp=dec2bin(s3,16);
s3H=bin2dec(s3_temp(1:8));
s3L=bin2dec(s3_temp(9:16));

%%%%%%%%%%%%%  Servo Range 4 5 6  %%%%%%%%%%%%
%230--------------450-------------------900%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RangeMax1=230;
RangeMin1=900;

if (s4<RangeMax1 || s4>RangeMin1)
    s4=450;
   msgbox('s4,out of range');
    return;
end
s4_temp=dec2bin(s4,16);
s4H=bin2dec(s4_temp(1:8));
s4L=bin2dec(s4_temp(9:16));

if (s5<RangeMax1 || s5>RangeMin1)
    s5=450;
   msgbox('s5,out of range');
    return;
end
s5_temp=dec2bin(s5,16);
s5H=bin2dec(s5_temp(1:8));
s5L=bin2dec(s5_temp(9:16));

if (s6<RangeMax1 || s6>RangeMin1)
    s6=450;
   msgbox('s6,out of range');
    return;
end
s6_temp=dec2bin(s6,16);
s6H=bin2dec(s6_temp(1:8));
s6L=bin2dec(s6_temp(9:16));



%%%%%%%%%%%%% Chambers range%%%%%%%%%%%%%%%%
%0--------------------------------------255%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DATA=[106,v1,v2,v3,v4,v5,v6,v7,v8,s1L,s1H,s2L,s2H,s3L,s3H,s4L,s4H,s5L,s5H,s6L,s6H];


try
    fwrite(dev_handle,DATA);
catch
     h = msgbox('write error com port');
     delete(h)
end
