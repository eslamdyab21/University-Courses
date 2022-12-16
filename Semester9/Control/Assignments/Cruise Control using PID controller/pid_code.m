m = 1000;
b = 50;

s = tf('s');
P = 1/(m*s + b);

Kp = 600;
Ki = 85.7;
Kd = 120;

C = pid(Kp,Ki,Kd);

T = feedback(P*C, 1);

step(T);
stepinfo(T)