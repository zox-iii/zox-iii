% ����myiteration:������ֵ��
% �������:I:ԭͼ��
% �������:��ֵthreshold
% ʹ�ú���:im2double(I):��Ϊ˫����
%         min():��СԪ��
%         max():���Ԫ��
%         find(A):��������A��Ԫ��
%         mean():������ƽ��ֵ
%         abs():�����ֵ
function threshold=myiteration(I)
I=im2double(I);     %��Ϊ˫���ȣ���0-1
T0=0.01;            %����T0
T1=(min(I(:))+max(I(:)))/2;%ѡȡͼ����������غ���С���ص�����ֵ��ΪT1
r1=find(I>T1);%�Ҷ�ֵ����T1��
r2=find(I<=T1);%����
T2=(mean(I(r1))+mean(I(r2)))/2;%�µ���ֵT2    %mean������һ��������ƽ��ֵ�ĺ���
while abs(T2-T1)<T0
    T1=T2;
    r1=find(I>T1);%�Ҷ�ֵ����T1��
    r2=find(I<=T1);%����
    T2=(mean(I(r1))+mean(I(r2)))/2;%�µ���ֵT2
end
threshold=T2;