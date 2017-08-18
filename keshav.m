clc
clear all
syms p g z s
n=input('How many web-pages are there ?');
F=input('Enter the number of outbound links corresponding to each webpage:');
g=zeros([1,n]);
d=0.85;
p=ones([1,n]);
z=ones([1,n]);
for i=1:1:n
    for j=1:n
        g(i)=g(i)+F(j,i);
    end
end
k=1;
 
     for q=1:1:2000
                for i=1:1:n
                    s=0;
                    for j=1:n
                        if F(i,j)~=0
                            s=s+p(j)/g(j);
                        end
                    end
                    z(i)=(1-d)+d*s;
                end
                 for i=1:n
                    p(1,i)=z(1,i);
                end
               
     end
 disp('The page rank is : ')
for i=1:1:n
    disp(p(i));
end

