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

figure('Position', [100, 100, 1200, 400]); % [x, y, genişlik, yükseklik]
grid on;

%Bakır Kayıpları
subplot(1,2,1);
hold on;
load("workspaces\400V_50Hz.mat");
plot(Pcu, nr);
clear;
load("workspaces\300V_50Hz.mat");
plot(Pcu, nr);
clear;
load("workspaces\200V_50Hz.mat");
plot(Pcu, nr);
clear;
load("workspaces\100V_50Hz.mat");
plot(Pcu, nr);
clear;

xlabel('Toplam Bakır Kaybı(Watt)');
ylabel('Hız(rpm)');
title('Hız-Toplam Bakır Kaybı');
legend('400V-50Hz', '300V-50Hz', '200V-50Hz', '100V-50Hz');

%Demir Kayıpları
subplot(1,2,2);
hold on;
load("workspaces\400V_50Hz.mat");
plot(Pfe, nr);
clear;
load("workspaces\300V_50Hz.mat");
plot(Pfe, nr);
clear;
load("workspaces\200V_50Hz.mat");
plot(Pfe, nr);
clear;
load("workspaces\100V_50Hz.mat");
plot(Pfe, nr);
clear;

xlabel('Demir Kaybı(Watt)');
ylabel('Hız(rpm)');
title('Hız-Demir Kaybı');
legend('400V-50Hz', '300V-50Hz', '200V-50Hz', '100V-50Hz');

% Klasör adını belirle
folder_name = 'graphs';

% Eğer klasör zaten mevcut değilse oluştur
if ~isfolder(folder_name)
    mkdir(folder_name);
end
saveas(gcf, fullfile(folder_name, 'Kayıplar.jpg'));

clear;