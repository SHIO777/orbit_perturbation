## このリポジトリについて

- データ: data/
- コード: main.m
- 出力画像: figure/

## データファイルの命名

`積分器名_SSN_OrbitType.csv`

e.g., `CowellForm_00513U_LEO.csv`

## 積分器と宇宙機の種類

```.m
% choose integrator
integrator = "GaussForm";
integrator = "CowellForm";
integrator = "First-orSo";
integrator = "KwokForm";
```

```.m
SSN = "00513U_LEO";       % LEO / Calsphere 1A
SSN = "04882U_GTO";       % GTO / Atlas Centaur R/B
SSN = "01324U_Molniya";   % Molniya / Molniya 1-1
SSN = "12472U_GEO";       % GEO / GOES-5

SSN = "00081U_LEO";        % Explorer 9
SSN = "08134U_GTO"         % Delta-1 R/B
SSN = "00898U_GTO";        % GTO-like/ Cosms 41 R/B
SSN = "02151U_Molniya";    % Molniya / Molniya 1-3
SSN = "12564U_GEO";        % GEO / EKRAN-7
```
