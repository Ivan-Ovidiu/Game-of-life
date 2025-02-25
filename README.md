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

Definim starea unui sistem la generația n ca fiind o matrice S_n din M_m×n({0, 1}) (m - numărul de 
linii, respectiv n - numărul de coloane), unde elementul 0 reprezintă o celulă moartă, respectiv 1 
reprezintă o celulă în viață (în generația curentă).
<br>
Definim o k-evoluție (k ≥ 0) a sistemului o iterație S_0 → S_1 → ··· → S_k, unde fiecare S_i+1 se 
obține din S_i, aplicând cele cinci reguli enunțate mai sus.
<br>
> [!NOTE]
> **Observație.** Pentru celulele aflate pe prima linie, prima coloană, ultima linie, respectiv ultima 
coloană, se consideră extinderea la 8 vecini, prin considerarea celor care **nu** se află în matrice 
ca fiind celule moarte.<br>

**Exemplificare.** Fie următoarea configurație inițială S_0:<br>
![image](https://github.com/user-attachments/assets/7719ccc7-8d01-41d7-b005-bddd0805b651)<br>

In primul rand, vom considera extinderea acestei matrice S0 de dimensiuni 3 × 4 intr-o matrice
extinsa S0 de dimensiuni 5 × 6, astfel:
![image](https://github.com/user-attachments/assets/2e9bc919-d9d4-4919-8f1f-a39f2facd649)

In cele ce urmeaza, vom lucra doar in interiorul matricei principale, dar considerand extinderea
pentru procesarea corecta a vecinilor. Vom parcurge fiecare element, si vom vedea ce regula evolutiva
putem aplica. De exemplu, pentru elementul de pe pozitia (0,0) in matricea initiala, vom aplica
regula de continuitate a celulelor moarte, deoarece este o celula moarta si nu are exact trei vecini in
viata.<br>
Urmatoarea celula este in viata, si are exact doi vecini in viata, astfel ca se aplica regula continuitatii celulelor in viata.<br>

Pentru celula de pe pozitia (0,2) in S0, observam ca are un singur vecin, astfel ca se aplica
regula de subpopulare - celula va muri in generatia urmatoare.<br>
Urmand acelasi rationament pentru toate celulele, configuratia sistemului intr-o iteratie (in S1)
va fi:<br>
![image](https://github.com/user-attachments/assets/16de8097-0d48-455e-b715-48cc7787b386)

# Input & Output
* Se citesc de la tastatura (STDIN) numarul de linii m, numarul de coloane n, numarul de celule vii
p, pozitiile celulelor vii din matrice, respectiv un numar intreg k. Atentie! In citirea inputului se
considera matricea initiala, neextinsa: se citeste configuratia initiala S0, si NU S0! De exemplu,
pentru matricea din prezentarea proiectului, inputul ar fi urmatorul:<br>
<pre>
3       // m - numarul de linii<br>
4        // n - numarul de coloane<br>
5       // p - numarul celulelor vii<br>
0<br>
1       // prima celula vie este in (0,1)<br>
0<br>
2       // a doua celula vie este in (0,2)<br>
1<br>
0       // a treia celula vie este in (1,0)<br>
2<br>
2       // a patra celula vie este in (2,2)<br>
2<br>
3       // a cincea celula vie este in (2,3)<br>
5       // numarul intreg k<br>
</pre>
> [!IMPORTANT]
> Afisarea la STDOUT a configuratiei sistemului dupa o k-evolutie.<br>
>In acest caz, rezultatul este
> <pre>
0 0 0 0<br>
0 0 0 0<br>
0 0 0 0<br>
</pre>

