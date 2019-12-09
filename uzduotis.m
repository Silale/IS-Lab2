%lab2. 
%·Îjimas
x = 0.1:1/22:1;
q = 0.1; %mokymo zingsnis
% svoriai

w11_1 =  randn(1);
w12_1 =  randn(1);
w13_1 =  randn(1);
w14_1 =  randn(1);
w15_1 =  randn(1);
b1 = randn(1);
b2 = randn(1);
b3 = randn(1);
b4 = randn(1);
b5 = randn(1);
w11_2 =  randn(1);
w21_2 =  randn(1);
w31_2 =  randn(1);
w41_2 =  randn(1);
w51_2 =  randn(1);
b6 = randn(1);

for j = 1:1000000
    for i = 1:20
        % skai2iavimas
        v1_1 = x(i)*w11_1 + b1;
        v2_1 = x(i)*w12_1 + b2;
        v3_1 = x(i)*w13_1 + b3;
        v4_1 = x(i)*w14_1 + b4;
        v5_1 = x(i)*w15_1 + b5;
        %sigmoidine aktyvavimo funkcija
        y1_1 = 1/(1+exp(-v1_1));
        y2_1 = 1/(1+exp(-v2_1));
        y3_1 = 1/(1+exp(-v3_1));
        y4_1 = 1/(1+exp(-v4_1));
        y5_1 = 1/(1+exp(-v5_1));

        v1_2 = y1_1*w11_2 + y2_1*w21_2 + y3_1*w31_2 + y4_1*w41_2 + y5_1*w51_2 + b6;
        %tiesine aktyvavimo funkcija ?
        y = v1_2;

        %kalidos skaiciavimas
        d = (1 + 0.6*sin(2*pi*x(i)/0.7)) + 0.3*sin(2*pi*x(i))/2;
        e = d - y;

        %atnaujinami svoriai

        w11_2 = w11_2 + q*e * y1_1;
        w21_2 = w21_2 + q*e * y2_1;
        w31_2 = w31_2 + q*e * y3_1;
        w41_2 = w41_2 + q*e * y4_1;
        w51_2 = w51_2 + q*e * y5_1;

        w11_1 = w11_1 + q * y1_1 * (1- y1_1)*(e * w11_2)*x(i);
        b1 = b1 + q * y1_1 * (1 - y1_1)*(e * w11_2) * 1;

        w12_1 = w12_1 + q * y2_1 * (1- y2_1)*(e * w21_2)*x(i);
        b2 = b2 + q * y2_1 * (1 - y2_1)*(e * w21_2) * 1;

        w13_1 = w13_1 + q * y3_1 * (1- y3_1)*(e * w31_2)*x(i);
        b3 = b3 + q * y3_1 * (1 - y3_1)*(e * w31_2) * 1;

        w14_1 = w14_1 + q * y4_1 * (1- y4_1)*(e * w41_2)*x(i);
        b4 = b4 + q * y4_1 * (1 - y4_1)*(e * w41_2) * 1;

        w15_1 = w15_1 + q * y5_1 * (1- y5_1)*(e * w51_2)*x(i);
        b5 = b5 + q * y5_1 * (1 - y5_1)*(e * w51_2) * 1;
    end
end
Y=zeros(20,1);
for i = 1:20
% skai2iavimas
v1_1 = x(i)*w11_1 + b1;
v2_1 = x(i)*w12_1 + b2;
v3_1 = x(i)*w13_1 + b3;
v4_1 = x(i)*w14_1 + b4;
v5_1 = x(i)*w15_1 + b5;
%sigmoidine aktyvavimo funkcija
y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));

v1_2 = y1_1*w11_2 + y2_1*w21_2 + y3_1*w31_2 + y4_1*w41_2 + y5_1*w51_2 + b6;
%tiesine aktyvavimo funkcija ?
y = v1_2;
Y(i)=y;
end

d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

plot(x,d,'ko',x,Y,'r*')




