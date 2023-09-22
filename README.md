# IS-Lab1
Intelektualiosios sistemos. Pirmojo laboratorinio darbo atlinkta užduotis.
# Tikslas
Išmokti savarankiškai suprogramuoti paprasto tiesinio klasifikatoriaus mokymo (parametrų skaičiavimo) algoritmą.
# Užduotys (maks. 8 balai)
1. Sukurkite paprasto klasifikatoriaus (Perceptrono) išėjimui apskaičiuoti skirtą programą. Klasifikatorius turi skirstyti objektus į dvi klases, pagal du požymius. Išėjimo skaičiavimas atliekamas pagal formulę:
y = 1, kai x1\*w1 + x2\*w2 + b > 0; y = -1, kai x1\*w1 + x2\*w2 + b <= 0; čia w1, w2 ir b parametrai, kurie turi būti sugeneruojami naudojant atsitiktinių skaičių generatorių (MATLAB pvz.: w1 = randn(1);) pirmąją programos veikimo iteraciją ir vėliau atnaujinami mokymo algoritmu; x1 ir x2 yra objektų požymiai, apskaičiuoti Matlab funkcijomis, esančiomis paruoštame kodo ruošinyje arba Data.txt faile (kiekvienoje eilutėje yra toks duomenų formatas: *požymis1, požymis2, norimas_atsakymas*), jei ketinate naudoti ne Matlab.
2. Parašykite mokymo algoritmą sukurto klasifikatoriaus parametrams apskaičiuoti. Naudokite šią parametrų atnaujinimo formulę:
w1(n+1) = w1(n) + eta\*e(n)\*x1(n); čia 0 < eta < 1; e(n) = d(n) - y(n); - klaida (momentinė klaida), apskaičiuota palyginus norimą atsakymą su tuo, kuris gautas klasifikatoriaus išėjime.
w2(n+1) = w2(n) + eta\*e(n)\*x2(n);
b(n+1) = b(n) + eta\*e(n);
# Papildoma užduotis (papildomi 2 balai). Neatlikta.
