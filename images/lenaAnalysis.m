%Script to play a bit with lenna

clear all;close all;

I=imread('lena512.bmp');

list=unique(I);

fmax=0;

for aux = 1:length(list)
	t=list(aux);
	[H1,H2]=umbral(I,t,0.5);
	ftemp=H1+H2;
	if ftemp>fmax
		fmax=ftemp;
		tstar=t;
	end
end


%Comparing lennas
figure(1)
ts=[tstar-20,tstar,tstar+20];
for j=1:4
	Itemp=I;
	subplot(2,2,j)
	if j==4
		imagesc(I)
		title(['real deal'])
	else
		Itemp(I<=ts(j))=0;
		Itemp(I>ts(j))=1;
		imagesc(Itemp);
		colormap(gray);
		title(['t= ',num2str(ts(j))])
	end
end

%%Showing the histogram of lena
%h=imhist(I);
%
%p=h/512^2; %Normalized histogram
%p(p==0)=realmin;
%%Calculating the entropy of the image
%
%H=-sum(p.*log(p)); %Entropy at a point p\in \mathbb{R}^{256}
%
%%Selecting the threshold
%t=50;
%
%L1=p(1:t);C1=sum(L1);l1=L1/C1;
%L2=p((t+1):end);C2=sum(L2);l2=L2/C2;
