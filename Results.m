% Değişken gerilim ve frekanslar ile 
% motor kontrolünü modelleyen fonksiyon

function Results(V1, f1, filename)
    
    %Değişkenler####################################################
    V = V1/sqrt(3);
    f = f1;

    %Faz sayısı
    m = 3;
    %Kutup çifti sayısı
    p = 2;
    %Senkron hız(rpm)
    ns = 60 * f / p;
    
    R1 = 0.457;
    R2 = 0.557;
    Rfe = 795.7;
    X1 = 2.57j;
    X2 = 3.57j;
    Xm = 52.57j;
    
    %Kayma değerleri vektörü
    s = (0.001:0.001:1);
    %Rotor hızı
    nr = ns .* (1-s);
    
    %Eşdeğer empedans hesabı
    Z1 = R1 + X1;
    Z2 = (Rfe * Xm) / (Rfe + Xm);
    Z3 = (R2 + X2) + (R2 .* (1-s) ./ s);
    Zes = Z1 + (Z2 .* Z3) ./ (Z2 + Z3);
    
    %Akım ve gerilim hesapları######################################
    I1 = V ./ Zes;
    E1 = V - I1 .* Z1;%E1 = E2
    Ife = E1 ./ Rfe;
    Im = E1 ./ Xm;
    I0 = Ife + Im;
    I2 = I1 - I0;
    %Güç faktörü
    PF = cos(angle(I1));
    
    %Güç Hesapları ve Verim#########################################
    
    %Giriş gücü
    Pg = m * V .* abs(I1) .* cos(angle(I1));
    %Milden alınan güç
    Po = m .* abs(I2).^2 .* (R2 .* (1-s) ./ s);
    %Verim
    Eff = Po ./ Pg * 100;
    %Milden alınan moment
    wr = (2 * pi .* nr) / 60;
    M = Po ./ wr;
    
    %Kayıplar
    Pcu1 = m .* abs(I1).^2 * R1;
    Pcu2 = m .* abs(I2).^2 * R2;
    Pfe = m .* abs(Ife).^2 * Rfe;
    %Toplam 'Bakır' Kaybı
    Pcu = Pcu1 + Pcu2; 
    
    
    % Sonuçları kaydet
    folder_name = 'workspaces';
    if ~isfolder(folder_name)
        mkdir(folder_name);
    end
    filePath = fullfile(folder_name, filename);
    save(filePath);

    clear;
end    
