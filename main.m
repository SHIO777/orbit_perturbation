close all; clc; clear all;

%% plotsettings
% font size
set(0, "DefaultTextFontSize", 20)
set(0, "DefaultAxesFontSize", 20)
% font name
set(0, "DefaultTextFontName", "Times New Roman")
set(0, "DefaultAxesFontName", "Times New Roman")
set(0, "DefaultTextInterpreter", "latex")
set(0, "DefaultLegendInterpreter", "latex")
set(0, 'DefaultLineLineWidth', 2);
% line width
set(0, 'DefaultLineLineWidth', 1.0 ) % default 0.5pt
set(0, 'DefaultAxesLineWidth', 0.8)
set(0, 'DefaultTextLineWidth', 0.8)


%% settings
% choose spacecraft
% SSN = "00513U_LEO";       % LEO / Calsphere 1A
% start_row = 0;
% end_row = 268;

SSN = "04882U_GTO";       % GTO / Atlas Centaur R/B
% start_row = 0;
% end_row =

% SSN = "01324U_Molniya";   % Molniya / Molniya 1-1
% Molniyaは、time=4500以降発散？しているので、データ範囲を指定して表示
% start_row = 1;
% end_row = 549;

% SSN = "12472U_GEO";       % GEO / GOES-5
% start_row = 0;
% end_row = 7556;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 読み込み
% column: Time(day),a(km),e,i(deg),n(deg),w(deg),m(deg),hp(km)



filename = append("GaussForm_", SSN, ".csv");
data = readmatrix(fullfile("data", filename));

time_gauss = data(:, 1);
a_gauss    = data(:, 2);  % 軌道長半径 semi-major axis
e_gauss    = data(:, 3);  % 離心率 ecentricity
i_gauss    = data(:, 4);  % 傾斜角 inclination
n_gauss    = data(:, 5);  % 平均運動 mean motion
w_gauss    = data(:, 6);  % 近点引数 argument of perigee
m_gauss    = data(:, 7);  % 平均離角
hp_gauss   = data(:, 8);  % 近点高度


filename = append("CowellForm_", SSN, ".csv");
data = readmatrix(fullfile("data", filename));
time_cowell = data(:, 1);
a_cowell    = data(:, 2);  % 軌道長半径 semi-major axis
e_cowell    = data(:, 3);  % 離心率 ecentricity
i_cowell    = data(:, 4);  % 傾斜角 inclination
n_cowell    = data(:, 5);  % 平均運動 mean motion
w_cowell    = data(:, 6);  % 近点引数 argument of perigee
m_cowell    = data(:, 7);  % 平均離角
hp_cowell   = data(:, 8);  % 近点高度


filename = append("First-orSo_", SSN, ".csv");
data = readmatrix(fullfile("data", filename));
time_first = data(:, 1);
a_first    = data(:, 2);  % 軌道長半径 semi-major axis
e_first    = data(:, 3);  % 離心率 ecentricity
i_first    = data(:, 4);  % 傾斜角 inclination
n_first    = data(:, 5);  % 平均運動 mean motion
w_first    = data(:, 6);  % 近点引数 argument of perigee
m_first    = data(:, 7);  % 平均離角
hp_first   = data(:, 8);  % 近点高度



%% 以下はデータ範囲を指定するときに使用
% filename = append("GaussForm_", SSN, ".csv");
% data = readmatrix(fullfile("data", filename));

% time_gauss = data(start_row:end_row, 1);
% a_gauss    = data(start_row:end_row, 2);  % 軌道長半径 semi-major axis
% e_gauss    = data(start_row:end_row, 3);  % 離心率 ecentricity
% i_gauss    = data(start_row:end_row, 4);  % 傾斜角 inclination
% n_gauss    = data(start_row:end_row, 5);  % 平均運動 mean motion
% w_gauss    = data(start_row:end_row, 6);  % 近点引数 argument of perigee
% m_gauss    = data(start_row:end_row, 7);  % 平均離角
% hp_gauss   = data(start_row:end_row, 8);  % 近点高度


% filename = append("CowellForm_", SSN, ".csv");
% data = readmatrix(fullfile("data", filename));
% time_cowell = data(start_row:end_row, 1);
% a_cowell    = data(start_row:end_row, 2);  % 軌道長半径 semi-major axis
% e_cowell    = data(start_row:end_row, 3);  % 離心率 ecentricity
% i_cowell    = data(start_row:end_row, 4);  % 傾斜角 inclination
% n_cowell    = data(start_row:end_row, 5);  % 平均運動 mean motion
% w_cowell    = data(start_row:end_row, 6);  % 近点引数 argument of perigee
% m_cowell    = data(start_row:end_row, 7);  % 平均離角
% hp_cowell   = data(start_row:end_row, 8);  % 近点高度


% filename = append("First-orSo_", SSN, ".csv");
% data = readmatrix(fullfile("data", filename));
% time_first = data(start_row:end_row, 1);
% a_first    = data(start_row:end_row, 2);  % 軌道長半径 semi-major axis
% e_first    = data(start_row:end_row, 3);  % 離心率 ecentricity
% i_first    = data(start_row:end_row, 4);  % 傾斜角 inclination
% n_first    = data(start_row:end_row, 5);  % 平均運動 mean motion
% w_first    = data(start_row:end_row, 6);  % 近点引数 argument of perigee
% m_first    = data(start_row:end_row, 7);  % 平均離角
% hp_first   = data(start_row:end_row, 8);  % 近点高度




%% plot
% 新しい色順序を指定 (例): 黒、青、赤
newColorOrder = [0 0 0; 0 0 1; 1 0 0];
% 色順序を設定
set(groot, 'defaultAxesColorOrder', newColorOrder);


folder = fullfile("figure", SSN);
if not(exist(folder, 'dir'))
    % もしoutputフォルダがなければ新規作成する
    mkdir(folder);
end


f = figure("Name", "semi-major axis a")
f.Position = [100 100 800 300];
plot(time_gauss, a_gauss)
hold on; grid on;
plot(time_cowell, a_cowell)
plot(time_first, a_first)
xlabel("time [day]"); ylabel("$a$ [km]")
legend({"Gauss", "Cowell", "First-order"})
exportgraphics(f, fullfile(folder, "a.pdf"))

f = figure("Name", "e")
f.Position = [100 100 800 300];
plot(time_gauss, e_gauss)
hold on; grid on;
plot(time_cowell, e_cowell)
plot(time_first, e_first)
xlabel("time [day]"); ylabel("$e$ [deg]")
exportgraphics(f, fullfile(folder, "e.pdf"))

f = figure("Name", "i")
f.Position = [100 100 800 300];
plot(time_gauss, i_gauss)
hold on; grid on;
plot(time_cowell, i_cowell)
plot(time_first, i_first)
xlabel("time [day]"); ylabel("$i$ [deg]")
exportgraphics(f, fullfile(folder, "i.pdf"))

f = figure("Name", "mean motion")
f.Position = [100 100 800 300];
plot(time_gauss, n_gauss)
hold on; grid on;
plot(time_cowell, n_cowell)
plot(time_first, n_first)
xlabel("time [day]"); ylabel("$n$ [deg]")
exportgraphics(f, fullfile(folder, "n.pdf"))

f = figure("Name", "w")
f.Position = [100 100 800 300];
plot(time_gauss, w_gauss)
hold on; grid on;
plot(time_cowell, w_cowell)
plot(time_first, w_first)
xlabel("time [day]"); ylabel("$\omega$ [deg]")
exportgraphics(f, fullfile(folder, "w.pdf"))

f = figure("Name", "m")
f.Position = [100 100 800 300];
plot(time_gauss, m_gauss)
hold on; grid on;
plot(time_cowell, m_cowell)
plot(time_first, m_first)
xlabel("time [day]"); ylabel("$m$ [deg]")
exportgraphics(f, fullfile(folder, "m.pdf"))

f = figure("Name", "hp")
f.Position = [100 100 800 300];
plot(time_gauss, hp_gauss)
hold on; grid on;
plot(time_cowell, hp_cowell)
plot(time_first, hp_first)
xlabel("time [day]"); ylabel("$hp$ [km]")
exportgraphics(f, fullfile(folder, "hp.pdf"))

