
% Sabit frekans değeri
f1 = 50; 
% İstenen gerilim değerlerini içeren vektör
v1 = 400;
Gerilimler = [v1, (v1*0.75), (v1*0.5), (v1*0.25)];

% Her gerilim değeri için elde edilen sonuçlar
for i = 1:length(Gerilimler)
    V1 = Gerilimler(i);
    filename = sprintf('%dV_%dHz.mat', V1, f1); % Dosya adını oluştur
    Results(V1, f1, filename);
end

%Grafik###############################################

figure('Position', [10, 0, 1600, 1200]); % [x, y, genişlik, yükseklik]
grid on;

hold on;
load("workspaces\400V_50Hz.mat");
plot(M, nr, 'DisplayName', '400V-50Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

load("workspaces\300V_50Hz.mat");
plot(M, nr, 'DisplayName', '300V-50Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

load("workspaces\200V_50Hz.mat");
plot(M, nr, 'DisplayName', '200V-50Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

load("workspaces\100V_50Hz.mat");
plot(M, nr, 'DisplayName', '100V-50Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
%Grafiğin okunmasını kolaylaştırmak için bir doğru
line([0, 80], [nd, nd], 'Color', 'black', 'LineStyle', '--', 'LineWidth', 0.5, 'HandleVisibility', 'off');
clear;

xlabel('Moment(N.m)');
ylabel('Hız(rpm)');
title('Hız-Moment');
legend('Location','southeast');

% Klasör adını belirle
folder_name = 'graphs';

% Eğer klasör zaten mevcut değilse oluştur
if ~isfolder(folder_name)
    mkdir(folder_name);
end
saveas(gcf, fullfile(folder_name, 'GerilimKontrollü.jpg'));

clear;