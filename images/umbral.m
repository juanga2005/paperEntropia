%Function that calculates the threshold

function [H1,H2]=umbral(I,t,alpha)
	%I comes from imread('bla')
	%t is the threshold value

	%H1 is the entropy of the first group
	%H2 is the entropy of the second group

	[n,d]=size(I);

	h=imhist(I);
	p=h/(n*d); %Vector with probabilities

	%Group into 2 classes
	[l1,l2]=gruping(p,t);
	[H1,H2]=entropies(l1,l2,alpha);

	

end

function [lambda1,lambda2]=gruping(p,t)
	aux=t+1;
	L1=p(1:t);C1=sum(L1);	
	L2=p(aux:255);
	C2=sum(L2);	


	
	lambda1=L1/C1;
	lambda2=L2/C2;
end

function [H1,H2]=entropies(l1,l2,alpha)


	H1=(1-alpha)^(-1)*sum(l1.^alpha);
	H2=(1-alpha)^(-1)*sum(l2.^alpha);
end
