function [pred] = adaboost(y1,y2,y3,actual)
l1=(y1==-1);
l2=(y2==-1);
l3=(y3==-1);
pred=zeros(size(y1,1),1);
for s=1:size(y1,1)
    pred(s)=-1;
end;
for i=1:size(y1,1)
    w(i)=1/size(y1,1);
end;
s1(1)=sum(l1);
s1(2)=sum(l2);
s1(3)=sum(l3);
[val,h1(1)] = min(s1);
E(1)=val/size(y1,1);
alpha(1)=0.5*((log((1-E(1))/E(1))));
d(1)=h1(1)
q=1;
for i=2:3
    for j=1:size(y1,1)
	    if h1(i-1)==1
		   if y1(j)==-1
		      w(j)=0.5*(w(j)/E(i-1));
		   else
		      w(j)=0.5*(w(j)/(1-E(i-1)));
           end;
        end			
           
        if h1(i-1)==2
		   if y2(j)==-1
		      w(j)=0.5*(w(j)/E(i-1));
		      
           else
		      w(j)=0.5*(w(j)/(1-E(i-1)));
            end;
        end	

        if h1((i-1))==3
		   if y3(j)==-1
		      w(j)=0.5*(w(j)/E(i-1));
		    
           else
		      w(j)=0.5*(w(j)/(1-E(i-1)));
            end;
        end	
    end; 
  
        
        m(1)=w*l1;
		  m(2)=w*l2;
		    m(3)=w*l3;
for f=1:3
    for g=1:q
	    if f==d(g)
           m(f)=9999999999999;
        end;
	end;	
end;		
m		
    [val,h1(i)]=min(m);
	E(i)=m(h1(i));
	alpha(i)=0.5*(log((1-E(i))/E(i)));
	d(i)=h1(i)
q++;
end;	
alpha
for i=1:size(y1,1)
    ho=0;
    for j=1:3
	if h1(j)==1
    ho=ho+alpha(3)*y1(i)*actual(i);
	end;
	if h1(j)==2
    ho=ho+alpha(2)*y2(i)*actual(i);
	end;
	if h1(j)==3
    ho=ho+alpha(1)*y3(i)*actual(i);
	end;
	end;
	ho
	if ho>0
	   pred(i)=1;
	end;
end;
	
