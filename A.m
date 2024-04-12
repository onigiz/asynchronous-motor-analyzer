V1 = 400;
f1 = 50;
filename = '400V_50Hz.mat';
Results(V1, f1, filename);
load(fullfile('workspaces', filename));

figure('Position', [10, 0, 1600, 1200]); % [x, y, genişlik, yükseklik]

%Hız-Moment Grafiği###########################################

subplot(2, 2, 1);
plot(M, nr);
title('Hız-Moment');
xlabel('Moment(N.m)');
ylabel('Hız(rpm)');
grid on;
hold on;
%Yol verme(kalkış) momenti
Myv = ((m * p) / (2 * pi * f)) * R2 * (E1(1)^2 / abs((R2 + R1)^2 + (X1 + X2)^2));
plot(abs(Myv), 0, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black');
text(abs(Myv), 0, ['(', num2str(abs(Myv)), ', ', num2str(0), ')'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
%Devrilme momenti
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');
hold off;


%Hız-Çıkış Gücü Grafiği#######################################
subplot(2, 2, 2);
grid on;
hold on;
plot(Po, nr, 'red');
title('Hız-Çıkış Gücü');
xlabel('Çıkış Gücü(Watt)');
ylabel('Hız(rpm)');
[Pox, index1] = max(Po);
no = nr(index1);
plot(abs(Pox), no, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black');
text(abs(Pox), no, ['(', num2str(abs(Pox)), ', ', num2str(no), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');
hold off;



%Hız-Verim Grafiği############################################
subplot(2, 2, 3);
hold on;
grid on;
plot(Eff, nr, 'green');
title('Hız-Verim');
xlabel('Verim(%)');
ylabel('Hız(rpm)');
[Effx, index2] = max(Eff);
neff = nr(index2);
plot(abs(Effx), neff, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black');
text(abs(Effx), neff, ['(', num2str(abs(Effx)), ', ', num2str(neff), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');
hold off;


%Hız-Güç Faktörü Grafiği######################################
subplot(2, 2, 4);
grid on;
hold on;
plot(PF, nr, 'black');
title('Hız-Güç Faktörü');
xlabel('Güç Faktörü');
ylabel('Hız(rpm)');
[PFx, index3] = max(PF);
npf = nr(index3);
plot(abs(PFx), npf, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black');
text(abs(PFx), npf, ['(', num2str(abs(PFx)), ', ', num2str(npf), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');
hold off;


% Klasör adını belirle
folder_name = 'graphs';

% Eğer klasör zaten mevcut değilse oluştur
if ~isfolder(folder_name)
    mkdir(folder_name);
end
saveas(gcf, fullfile(folder_name, '400V_50Hz_Analiz.jpg'));

clear;