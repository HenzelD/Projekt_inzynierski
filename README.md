# Opis
Projekt polega na automatyzacji konfiguracji środowiska IT dla aplikacji webowych przy użyciu dwóch podejść: lokalnego z wykorzystaniem Vagranta oraz chmurowego w AWS z użyciem Terraform. Implementacja obejmuje przygotowanie infrastruktury dla systemu Moodle, automatyczne tworzenie instancji bazy danych oraz aplikacji, a także konfigurację load balancera do równoważenia ruchu.

## Wymagania:
- Lokalnie: Vagrant, VirtualBox
- Chmurowo: Konto AWS, Terraform

## Instalacja:
```bash
git clone https://github.com/HenzelD/Projekt_inzynierski.git
cd Projekt_inzynierski
```
W przypadku konfiguracji chmurowych dodatkowo
```bash
aws configure
```
## Wybierz sposób wdrożenia:

### Lokalnie:
Edytować plik zmiennych według potrzeb - variables.rb
#### Użycie
W konsoli uruchomić komendę
```bash
vagrant up
```
Wpisać adres IP w przeglądarce, który skonfigorowaliśmy w pliku zmiennych 
#### Opis
Skrypt obejmuje przygotowanie infrastruktury dla systemu Moodle, automatyczne tworzenie dwóch maszyn wirtualnych — jednej dedykowanej bazie danych, a drugiej aplikacji Moodle. Obie maszyny są w pełni automatycznie konfigurowane.
### Chmurowo:
Edytować plik zmiennych według potrzeb - vars.tf
#### Użycie
W konsoli uruchomić komendę
```bash
terraform init
terraform apply 
```
Wpisać adres IP w przeglądarce, który skonfigorowaliśmy w pliku vars.tf
#### Opis
Skrypt obejmuje przygotowanie infrastruktury dla systemu Moodle, automatyczne tworzenie dwóch instancji — jednej dedykowanej bazie danych, a drugiej aplikacji Moodle. Obie maszyny są w pełni automatycznie konfigurowane.
### Zaawansowane chmurowo:
Edytować plik zmiennych według potrzeb - vars.tf
#### Użycie
W konsoli uruchomić komendę
```bash
terraform init
terraform apply 
```
Wpisać adres IP w przeglądarce, który skonfigorowaliśmy w pliku vars.tf, a następnie przejść przez cały proces instalacyjny moodle, założyć swój kurs. Skopiować pliki z folderu part 2 i wkleic do folderu part 1. Ponownie uruchomić komendy.
```bash
terraform init
terraform apply 
```
#### Opis
Skrypt obejmuje przygotowanie infrastruktury dla systemu Moodle, automatyczne tworzenie dwóch instancji — jednej dedykowanej bazie danych, a drugiej aplikacji Moodle. Obie maszyny są w pełni automatycznie konfigurowane.
Part 2  w zaawansowanej konfiguracji chmurowej służy do utworzenia obrazu z naszej skonfigurowanej maszyny, tworzy na tej podstawie następne, a ruch jest rozdzielany na nie wszystkie przez load balancera.





