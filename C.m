
v1 = 400; 
f1 = 50; 

% İstenen gerilim ve frekans değerlerini içeren vektörler
Gerilimler = [v1, (v1*0.75), (v1*0.5), (v1*0.25)];
Frekanslar = [f1, (f1*0.75), (f1*0.5), (f1*0.25)];

% Her gerilim ve frekans çifti için elde edilen sonuçlar
for i = 1:length(Gerilimler)
        V1 = Gerilimler(i);
        f1 = Frekanslar(i);
        if i == 1 || i == 3
            filename = sprintf('%dV_%dHz.mat', V1, f1); % Dosya adını oluştur
        else
            filename = sprintf('%dV_%0.1fHz.mat', V1, f1); % Dosya adını oluştur
        end
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

load("workspaces\300V_37.5Hz.mat");
plot(M, nr, 'DisplayName', '300V-37.5Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

load("workspaces\200V_25Hz.mat");
plot(M, nr, 'DisplayName', '200V-25Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

load("workspaces\100V_12.5Hz.mat");
plot(M, nr, 'DisplayName', '100V-12.5Hz');
[Md, index] = max(M);
nd = nr(index);
plot(abs(Md), nd, 'rx', 'MarkerSize', 6, 'LineWidth', 3, 'Color', 'black', 'HandleVisibility','off');
text(abs(Md), nd, ['(', num2str(abs(Md)), ', ', num2str(nd), ')'], 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
clear;

xlabel('Moment(N.m)');
ylabel('Hız(rpm)');
title('Hız-Moment');
legend('Location', 'southeast');

% Klasör adını belirle
folder_name = 'graphs';

% Eğer klasör zaten mevcut değilse oluştur
if ~isfolder(folder_name)
    mkdir(folder_name);
end
saveas(gcf, fullfile(folder_name, 'Gerilim_ve_Frekans_Kontrollü.jpg'));

clear;