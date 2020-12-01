# averager

Aby program działał należycie, należy umieścić plik skrypt.ps1 w folderze, w którym znajdują się wyniki pomiarów.

Skrypt uruchomić można przez kliknięcie prawym przyciskiem myszy, a następnie wybranie "Run with Powershell".

Uruchamianie skryptu przez podwójne kliknięcie nie działa z założenia, ze względu na kwestię bezpieczeństwa. Powershell jest językiem, za pomocą którego można, między innymi, zmienić uprawnienia w komputerze oraz łatwością usuwać i modyfikować pliki.

Jest natomiast językiem który nadaje się do zadania bardzo dobrze - na Windowsie 10 jest, z tego co mi wiadomo, już zainstalowany fabrycznie, więc nie trzeba pobierać żadnego dodatkowego środowiska i go konfigurować (jak np. w Pythonie) i jest niezależny od wersji i rodzaju systemu (jest uruchamiany we własnym środowisku).

Po uruchomieniu skryptu pokaże się okno konsoli, w którym należy wpisać nazwę grupy. Program automatycznie wczytuje nazwy wszystich plików w folderze, które mają rozszerzenie '.txt', ale nie kończą się na '-spect.txt', '-spect_convert.txt' i '-mean.txt'.

Ważne jest, aby wpisać całą nazwę grupy. Przykładowo, jeśli posiadamy w folderze pliki:
* Plik_1.txt
* Plik_2.txt
* Plik_3.txt
* Plik_numer1.txt
* Plik_numer2.txt
* Plik_numer3.txt

to wpisując jako nazwę grupy 'Plik' wykryte zostaną wszystkie pliki do uśrednienia. Jeśli natomiast wpiszemy 'Plik_numer' to zostaną wykryte tylko 3 ostatnie pliki.

W skrócie: program wyszukuje wszystkie pliki o rozszerzeniu '.txt' w folderze, które zaczynają się od wartości podanej jako nazwa grupy, ale nie kończą się na '-spect.txt', '-spect_convert.txt' i '-mean.txt', a następnie uśrednia wartości z każdej kolumny.

Plik wyjściowy jest nazwany nazwą grupy, zakończony '-mean.txt'. Przykładowo więc, dla powyżej przedstawionych plików zostanie utworzony plik 'Plik_numer-mean.txt', który zawiera uśrednione wartości z kolumn, a także pliki, z których dane zostały uśrednione (uwzględnione w celu upewnienia się, że wszystkie potrzebne pliki zostały wczytane). Informacje te wyświetlą się również w konsoli.