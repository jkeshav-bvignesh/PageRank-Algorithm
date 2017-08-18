clc
clear all
syms p z g1 g2
n=input('How many web-pages are there ?');
F1=input('Enter the number of outbound links corresponding to each webpage:');
F2=input('Enter the number of inbound links corresponding to each webpage:');
g1=zeros([1,n]);
g2=zeros([1,n]);
d=0.85;
p=ones([1,n]);
z=ones([1,n]);
for i=1:1:n
    for j=1:n
        g1(i)=g1(i)+F1(j,i);
    end
end
for i=1:1:n
    for j=1:n
        g2(i)=g2(i)+F2(j,i);
    end
end
 
    for q=1:1:2000
        for i=1:1:n
            win=0;ip=0;wout=0;op=0;
            for j=1:1:n
                for o=1:1:n
                    if F1(i,o)~=0
                        ip=ip+g1(o);
                    end
                end
                for x=1:1:n
                    if F2(i,x)~=0
                        op=op+g2(x);
                    end
                end
                if F1(i,j)~=0
                    win=win+g1(j)/ip;
                end
                if F2(i,j)~=0
                    wout=wout+g2(j)/op;
                end
            end
            z(i)=(1-d)+d*win*wout*p(i);
        end
        for k=1:1:n
            p(k)=z(k);
        end
    end 
 disp('The weighted page rank is : ')
 disp(' ')
for i=1:1:n
    disp(p(i));
end
