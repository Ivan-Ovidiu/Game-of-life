# Game-of-life
Conway’s Game of Life este un zero-player game bidimensional, inventat de matematicianul John
Horton Conway in anul 1970. Scopul acestui joc este de a observa evolutia unui sistem de celule,
pornind de la o configuratie initiala, introducand reguli referitoare la moartea, respectiv crearea unei
noi celule in sistem.
> [!NOTE]
> Starea unui sistem este descrisa de starea cumulata a celulelor componente, iar pentru acestea
avem urmatoarele reguli:
1. Subpopulare. Fiecare celula (care este in viata in generatia curenta) cu mai putin de doi
vecini in viata, moare in generatia urmatoare.
2. Continuitate celule vii. Fiecare celula (care este in viata in generatia curenta), cu doi sau
trei vecini in viata, va exista si in generatia urmatoare.
3. Ultrapopulare. Fiecare celula (care este in viata in generatia curenta), care are mai mult de
trei vecini in viata, moare in generatia urmatoare.
4. Creare. O celula moarta care are exact trei vecini in viata, va fi creata in generatia urmatoare.
5. Continuitate celule moarte. Orice alta celula moarta, care nu se incadreaza in regula de
creare, ramane o celula moarta.

Vecinii unei celule se considera urmatorii 8, intr-o matrice bidimensionala:<br>
![image](https://github.com/user-attachments/assets/c7b48c8d-56a3-4a0b-ba1e-467f717db19a)

Definim starea unui sistem la generația n ca fiind o matrice Sn∈Mm×n({0,1})S_n \in \mathcal{M}_{m \times n}(\{0, 1\})
Sn​∈Mm×n​({0,1}) (m - numărul de linii, respectiv n - numărul de coloane), unde elementul 0 reprezintă o celulă moartă, respectiv 1 reprezintă o celulă în viață (în generația curentă).

Definim o kk
k-evoluție (k≥0k \geq 0
k≥0) a sistemului o iterație S0→S1→⋯→SkS_0 \rightarrow S_1 \rightarrow \cdots \rightarrow S_k
S0​→S1​→⋯→Sk​, unde fiecare Si+1S_{i+1}
Si+1​ se obține din SiS_i
Si​, aplicând cele cinci reguli enunțate mai sus.

Observație. Pentru celulele aflate pe prima linie, prima coloană, ultima linie, respectiv ultima coloană, se consideră extinderea la 8 vecini, prin considerarea celor care nu se află în matrice ca fiind celule moarte.
Exemplificare. Fie următoarea configurație inițială S0S_0
S0​:<br>
![image](https://github.com/user-attachments/assets/7719ccc7-8d01-41d7-b005-bddd0805b651)<br>
In primul rand, vom considera extinderea acestei matrice S0 de dimensiuni 3 × 4 intr-o matrice
extinsa S0 de dimensiuni 5 × 6, astfel:
![image](https://github.com/user-attachments/assets/2e9bc919-d9d4-4919-8f1f-a39f2facd649)

In cele ce urmeaza, vom lucra doar in interiorul matricei principale, dar considerand extinderea
pentru procesarea corecta a vecinilor. Vom parcurge fiecare element, si vom vedea ce regula evolutiva
putem aplica. De exemplu, pentru elementul de pe pozitia (0,0) in matricea initiala, vom aplica
regula de continuitate a celulelor moarte, deoarece este o celula moarta si nu are exact trei vecini in
viata.
Urmatoarea celula este in viata, si are exact doi vecini in viata, astfel ca se aplica regula continuitatii celulelor in viata.
Pentru celula de pe pozitia (0,2) in S0, observam ca are un singur vecin, astfel ca se aplica
regula de subpopulare - celula va muri in generatia urmatoare.
Urmand acelasi rationament pentru toate celulele, configuratia sistemului intr-o iteratie (in S1)
va fi:<br>
![image](https://github.com/user-attachments/assets/16de8097-0d48-455e-b715-48cc7787b386)
