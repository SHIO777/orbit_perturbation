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
set(0, 'DefaultLineLineWidth', 0.8 ) % default 0.5pt
set(0, 'DefaultAxesLineWidth', 0.8)
set(0, 'DefaultTextLineWidth', 0.8)


%% settings
% choose integrator
integrator = "GaussForm";
% integrator = "CowellForm";
% integrator = "First-orSo";
% integrator = "KwokForm";


% choose spacecraft
SSN = "00513U_LEO";       % LEO / Calsphere 1A
% SSN = "04882U_GTO";       % GTO / Atlas Centaur R/B
% SSN = "01324U_Molniya";   % Molniya / Molniya 1-1
% SSN = "12472U_GEO";       % GEO / GOES-5


% SSN = "00081U_LEO";        % Explorer 9
% SSN = "08134U_GTO"         % Delta-1 R/B
% SSN = "00898U_GTO";        % GTO-like/ Cosms 41 R/B
% SSN = "02151U_Molniya";    % Molniya / Molniya 1-3
% SSN = "12564U_GEO";        % GEO / EKRAN-7





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 読み込み
% column:
% Time(day),a(km),e,i(deg),n(deg),w(deg),m(deg),hp(km)

% data = readmatrix('data/test.csv');
filename = append(integrator, "_", SSN, ".csv");
data = readmatrix(fullfile("data", filename));

time = data(:, 1);
a    = data(:, 2);  % 軌道長半径 semi-major axis
e    = data(:, 3);  % 離心率 ecentricity
i    = data(:, 4);  % 傾斜角 inclination
n    = data(:, 5);  % 平均運動 mean motion
w    = data(:, 6);  % 近点引数 argument of perigee
m    = data(:, 7);  % 平均離角
hp   = data(:, 8);  % 近点高度


%% plot
% LEO, GTO, MTO, GEO
folder = "figure/cowell/LEO"
if not(exist(folder, 'dir'))
    % もしoutputフォルダがなければ新規作成する
    mkdir(folder);
end


f = figure("Name", "semi-major axis a")
f.Position = [100 100 800 300];
plot(time, a, "Color", "b")
xlabel("time [day]"); ylabel("$a$ [km]")
grid on
exportgraphics(f, fullfile(folder, "a.pdf"))

f = figure("Name", "e")
f.Position = [100 100 800 300];
plot(time, e, "Color", "b")
xlabel("time [day]"); ylabel("$e$ [deg]")
grid on
exportgraphics(f, fullfile(folder, "e.pdf"))

f = figure("Name", "i")
f.Position = [100 100 800 300];
plot(time, i, "Color", "b")
xlabel("time [day]"); ylabel("$i$ [deg]")
grid on
exportgraphics(f, fullfile(folder, "i.pdf"))

f = figure("Name", "mean motion")
f.Position = [100 100 800 300];
plot(time, n, "Color", "b")
xlabel("time [day]"); ylabel("$n$ [deg]")
grid on
exportgraphics(f, fullfile(folder, "n.pdf"))

f = figure("Name", "w")
f.Position = [100 100 800 300];
plot(time, w, "Color", "b")
xlabel("time [day]"); ylabel("$\omega$ [deg]")
grid on
exportgraphics(f, fullfile(folder, "w.pdf"))

f = figure("Name", "m")
f.Position = [100 100 800 300];
plot(time, m, "Color", "b")
xlabel("time [day]"); ylabel("$m$ [deg]")
grid on
exportgraphics(f, fullfile(folder, "m.pdf"))

f = figure("Name", "hp")
f.Position = [100 100 800 300];
plot(time, hp, "Color", "b")
xlabel("time [day]"); ylabel("$hp$ [km]")
grid on
exportgraphics(f, fullfile(folder, "hp.pdf"))

