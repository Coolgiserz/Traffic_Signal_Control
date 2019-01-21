function [guanlian,gsort,ind] = gray_correlation(comparison,posi,nege,refer,rho)
%% ��ɫ��������[guanlian,gsort,ind] = gray_correlation(a,[1 5:9],[2:4],cankao,rho)
%% ���� �˴������˵�Ȩ�ؼ������Ĺ�����
% rho:�ֱ�ϵ��
% comparision���Ƚ϶���
% refer���ο�����
% posi��Ч��ָ������
% nege���ɱ�ָ������
%% ��һ��
a = comparison;
for i=posi   %Ч����ָ���׼��
    a(i,:)=(a(i,:)-min(a(i,:)))/(max(a(i,:))-min(a(i,:)));
end
for i=nege  %�ɱ���ָ���׼��
   a(i,:)=(max(a(i,:))-a(i,:))/(max(a(i,:))-min(a(i,:))); 
end
%% ���������
[m,n]=size(a);
t=repmat(refer,[1,n])-a;  %��ο�������ÿһ�����еĲ�
mmin=min(min(t));   %������С��
mmax=max(max(t));  %��������
xishu=(mmin+rho*mmax)./(t+rho*mmax)  %�����ɫ����ϵ��
guanlian=mean(xishu)   %ȡ��Ȩ�أ����������
[gsort,ind]=sort(guanlian,'descend')  %�Թ����Ȱ��մӴ�С����
end