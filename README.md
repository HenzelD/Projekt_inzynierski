Projekt polega na automatyzacji konfiguracji środowiska IT dla aplikacji webowych przy użyciu dwóch podejść: lokalnego z wykorzystaniem Vagranta oraz chmurowego w AWS z użyciem Terraform. Implementacja obejmuje przygotowanie infrastruktury dla systemu Moodle, automatyczne tworzenie instancji bazy danych oraz aplikacji, a także konfigurację load balancera do równoważenia ruchu.

Wymagania:
- Lokalnie: Vagrant, VirtualBox
- Chmurowo: Konto AWS, Terraform

Wybierz sposób wdrożenia:

Lokalnie:
- Użycie:
    edytować pliki zmiennych według potrzeb variables.rb
    w konsoli uruchomić komendę vagrant up
    
  
Instalacja:
- git clone https://github.com/HenzelD/Projekt_inzynierski.git
- cd Projekt_inzynierski



Chmurowo:
- terraform init
- terraform apply

Part 2  w zaawansowanej konfiguracji chmurowej służy do utworzenia obrazu z naszej skonfigurowanej maszyny, tworzy na tej podstawie następne, a ruch jest rozdzielany na nie wszystkie przez load balancera.

Użycie:
- edytować pliki zmiennych według potrzeb variables.rb(konfiguracja lokalna), vars.tf(konfiguracje chmurowe)
- po wdrożeniu zaloguj się do Moodle pod adresem przydzielonym przez AWS(konfiguracja chmurowa) lub pod adres według pliku variables.rb(konfiguracja lokalna) 




