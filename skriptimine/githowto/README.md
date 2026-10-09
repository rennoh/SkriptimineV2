# GitHowTo praktiliste harjutuste projekt (`work`)

## Projekti kirjeldus
Selle projekti raames läbisin praktilised Git-käsujoone harjutused, kasvatades oma teadmisi versioonihaldusest ja selle põhitöövoogudest. Töö käigus loodi õpperepositoorium nimega `work`, kus katsetasin erinevaid käske alates esmasest seadistusest kuni harude (branching) ja liitmiseni (merging).

Projekt põhineb interaktiivsel õppematerjalil [GitHowTo eestikeelsel juhendil](https://githowto.com/et).

---

## Mida selle projekti käigus õppisin

Projekti raames sain ülevaate versioonihalduse tähtsusest tarkvaraarenduses ning õppisin turvaliselt koodi muudatusi jälgima, hallata ja jagama.

### Õpitud teemad:
* Git hoidla ehk repositooriumi algatamine ja seadistamine.
* Muudatuste jälgimine tööalast (Working Directory) vahe-alasse (Staging Area).
* Commit'ide tegemine ning selgete ja tähendusrikaste commit-sõnumite kirjutamine.
* Repositooriumi ajaloo sirvimine ja kontroll.
* Harude loomine, nende vahel liikumine ja koodiharude liitmine.
* Konfliktide mõistmine ja vältimine harude ühendamisel.

---

## Git'i põhitöövoog

Git'i põhitöövoog jaguneb kolmeks peamiseks alaks: **tööala** (Working Directory), **vahe-ala** (Staging Area ehk Index) ja **kohalik repositoorium** (Local Repository).

1. **Muudatuste tegemine:** Muudad või lood faile oma projekti tööalas.
2. **Muudatuste lisamine vahe-alasse:** Käsuga `git add <failinimi>` märgid failid, mida soovid järgmisesse salvestusse kaasata.
3. **Salvestuse tegemine:** Käsuga `git commit -m "sõnum"` kinnitad vahe-ala muudatused kohalikku repositooriumisse.
4. **Muudatuste üleslaadimine:** Käsuga `git push` saadad kohalikud salvestused kaugrepositooriumisse (näiteks GitHubi).

---

## Kasutatud Git käsud

Selles projektis kasutusel olnud peamised käsud:

| Käsk | Kirjeldus |
| :--- | :--- |
| `git status` | Näitab tööala ja vahe-ala hetkeseisu (millised failid on muudetud või lisamata). |
| `git add` | Lisab muudetud või uued failid vahe-alasse (`staging area`). |
| `git commit` | Salvestab vahe-alal olevad muudatused kohalikku repositooriumisse. |
| `git log` | Kuvab teostatud commit'ide ajalugu ja sõnumeid. |
| `git branch` | Kuvab olemasolevaid harusid või loob uue haru. |
| `git switch` | Vahetab töös olevat haru (või `git checkout`). |
| `git merge` | Liidab teise haru muudatused praegusele aktiivsele harule. |

### Käskude praktiline näide terminalis

```bash
# 1. Kontrollime hetkeseisu
git status

# 2. Lisame muudetud README.md faili vahe-alasse
git add README.md

# 3. Teeme salvestuse selgitava sõnumiga
git commit -m "docs: täienda README.md faili projekti kokkuvõttega"

# 4. Vaatame teostatud committi ajaloos
git log --oneline -n 3

# 5. Loome uue haru ja lülitume sellele
git branch funktsioon-x
git switch funktsioon-x

# 6. Pärast töö lõpetamist liidame haru peaharule
git switch main
git merge funktsioon-x

---

