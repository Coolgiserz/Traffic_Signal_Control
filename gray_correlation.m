function [guanlian,gsort,ind] = gray_correlation(comparison,posi,nege,refer,rho)
%% 灰色关联分析[guanlian,gsort,ind] = gray_correlation(a,[1 5:9],[2:4],cankao,rho)
%% 参数 此处采用了等权重计算最后的关联度
% rho:分辨系数
% comparision：比较对象
% refer：参考对象
% posi：效益指标索引
% nege：成本指标索引
%% 归一化
a = comparison;
for i=posi   %效益型指标标准化
    a(i,:)=(a(i,:)-min(a(i,:)))/(max(a(i,:))-min(a(i,:)));
end
for i=nege  %成本型指标标准化
   a(i,:)=(max(a(i,:))-a(i,:))/(max(a(i,:))-min(a(i,:))); 
end
%% 计算关联度
[m,n]=size(a);
t=repmat(refer,[1,n])-a;  %求参考序列与每一个序列的差
mmin=min(min(t));   %计算最小差
mmax=max(max(t));  %计算最大差
xishu=(mmin+rho*mmax)./(t+rho*mmax)  %计算灰色关联系数
guanlian=mean(xishu)   %取等权重，计算关联度
[gsort,ind]=sort(guanlian,'descend')  %对关联度按照从大到小排序
end