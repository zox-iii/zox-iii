%����myimrotate:����˫���Բ�ֵ��ʵ��ͼ����ת
%�������:Iԭͼ��
%        alpha:��ת�ĽǶȣ�>0Ϊ��ʱ�룩
%�������:OUT��ת�任���ͼ��
%ʹ�ú���:mod(m,n):��m/nȡ��
%         abs(x):ȡ����ֵ
%         ceil(x):����ȡ��
%         pi:3.1415926......��ֱ��ʹ��
%         floor(x):����ȡ��
function OUT=myimrotate(I,alpha)
J=double(I);
HW=size(J);%��ȡԭͼ���С
alpha=mod(alpha,360);%����ת�Ƕ�ת����0~360֮�����
alpha=alpha*pi/180;%�õ���ת����
%ȷ����ת���ͼƬ��������ϵ��
nHW(1)=ceil(HW(1)*abs(cos(abs(alpha)))+HW(2)*abs(sin(abs(alpha))));%��ͼ��ĸ�heighth
nHW(2)=ceil(HW(1)*abs(sin(abs(alpha)))+HW(2)*abs(cos(abs(alpha))));%��ͼ��Ŀ�width?
OUT=zeros(nHW);%�½��µ�ͼ�����
OUT(1:nHW(1),1:nHW(2))=inf;%��ʼΪ�հ�
u0=HW(2)*sin(alpha);u2=HW(1)*cos(alpha);%��ֱ��������ƽ����
u1=HW(1)*sin(alpha);u3=HW(2)*cos(alpha);%ˮƽ��������ƽ����
T=[cos(alpha),sin(alpha);-sin(alpha),cos(alpha)];%�任����
for i = 1:nHW(1)%��i,j������ͼ�����꣬�任��ԭͼ������(x,y)�С�
    for j=1:nHW(2)
        if(alpha>=0 && alpha<=pi/2)
            XY=T*([i;j]-[u0;0]);%��֤�����ͼ�������
        elseif(alpha>pi/2 && alpha<=pi)
            XY=T*([i;j]-[u0-u2;-u3]);%��֤�����ͼ������� 
        elseif(alpha>pi && alpha<=3*pi/2)
            XY=T*([i;j]-[-u2;-u3-u1]);%��֤�����ͼ�������
        elseif(alpha>3*pi/2 && alpha<=2*pi)
            XY=T*([i;j]-[0;-u1]);%��֤�����ͼ�������
        end
        x=XY(1);%�任�õ���ԭ����
        y=XY(2);
        if x>=1 && x<=HW(1) && y>=1 && y<=HW(2) %���任����x��y��ԭͼ��Χ��???????????????
        u = x - floor(x);
        v = y - floor(y); %�õ�С����������
        %��ԭͼ���ĸ���ʵ���ص���˫���Բ�ֵ��á��顱���ص�����ֵ
        OUT(i, j) = J(floor(x), floor(y)) * u * v + ...
                    J(floor(x), ceil(y)) * (1-u) * v + ...
                    J(ceil(x), floor(y)) * u * (1-v) + ...
                    J(ceil(x), ceil(y)) *(1-u) * (1-v);
        end
    end
end
OUT=uint8(OUT);
end