%------------a)-----------------%
j = 600000;
b = 20000;
k = 1;

TF = tf(k, [j b k])


%------------b)-----------------%
State_Space = ss(TF)



%------------f)-----------------%
% as K increases, overshoot increses and rise time decreases
k = 200;
TF1 = tf(k, [j b k]);
info1 = stepinfo(TF1 , 'RiseTimeThreshold', [0 1]);
legend1 = compose('K=200, Overshoot=%f, RiseTime=%f', info1.Overshoot, info1.RiseTime);

k = 400;
TF2 = tf(k, [j b k]);
info2 = stepinfo(TF2, 'RiseTimeThreshold', [0 1]);
legend2 = compose('K=400, Overshoot=%f, RiseTime=%f', info2.Overshoot, info2.RiseTime);

k = 1000;
TF3 = tf(k, [j b k]);
info3 = stepinfo(TF3, 'RiseTimeThreshold', [0 1]);
legend3 = compose('K=1000, Overshoot=%f, RiseTime=%f', info3.Overshoot, info3.RiseTime);

k = 2000;
TF4 = tf(k, [j b k]);
info4 = stepinfo(TF4 , 'RiseTimeThreshold', [0 1]);
legend4 = compose('K=2000, Overshoot=%f, RiseTime=%f', info4.Overshoot, info4.RiseTime);

figure(1);
step(TF1, TF2, TF3 , TF4);
legend(string(legend1) , string(legend2), string(legend3) , string(legend4));



%------------g)-----------------%
% as we increase K, the poles location increases verticlly
figure(2);
pzplot(TF1, TF2, TF3 , TF4)
legend('K=200', 'K=400', 'K=1000', 'K=2000')
%grid on



%------------h)-------------------%
% error is very close to zero, confirming the theortical solution
[theta1 t] = step(TF1);
ess1 = 1 - theta1(end);

[theta2 t] = step(TF2);
ess2 = 1 - theta2(end);

[theta3 t] = step(TF3);
ess3 = 1 - theta3(end);

[theta4 t] = step(TF4);
ess4 = 1 - theta4(end);






