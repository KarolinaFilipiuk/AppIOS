# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

USStonks

## Autorzy

- Karolina Filipiuk, kfilipiuk@student.agh.edu.pl
- Dawid Jarosz, meqeq@student.agh.edu.pl

## Wizja aplikacji

Aplikacja będzie pozwalała użytkownikowi śledzić kursy wyszczególnionych akcji, a także będzie wyświetlać wykresy notowań. Użytkownik będzie miał możliwość dodawania oraz usuwania wybranych akcji z listy ulubionych. Na stronie głównej aplikacji umieszczona zostanie informacja o tym, czy giełda jest aktualnie otwarta czy zamknięta.

## Wymagania
### Wymagania pozafunkcjonalne

1. Urządzenie mobilne (tylko iPhone)
2. System operacyjny IOS z minimalną wersją 14

### Wymagania funkcjonalne
1. Wyświetlenie listy aktywów notowanych na giełdzie 
2. Wyświetlenie wykresu kursu danego aktywa
3. Zapis wybranej pozycji do listy ulubionych aktywów
4. Umożliwienie usunięcia pozycji z listy ulubionych aktywów
5. Możliwość dodania widgetu z aktualną ceną / zmianą w kursie do ekranu głównego
6. Wyświetlanie czasów otwarcia/zamknięcia giełdy

## Wykorzystane narzędzia

### Framework(i) iOS SDK

WidgetKit - https://developer.apple.com/documentation/WidgetKit

### Frameworki/biblioteki zewnętrzne

1. stock-charts, https://github.com/denniscmartin/stock-charts, biblioteka zostanie wykorzystana do narysowania wykresów
2. SwiftClockUI, https://github.com/renaudjenny/SwiftClockUI, biblioteka zostanie wykorzystana do wyświetlenia aktualnej godziny podawanych kursów
3. Alamofire, https://github.com/Alamofire/Alamofire, biblioteka będzie wykorzystana do  wykonywania zapytań do API

## Dane

Dane przetwarzane i przechowywane w aplikacji to będą ulubione aktywa. Persystencji będzie podlegała nazwa wybranej pozycji wraz z jej symbolem oraz opisem. 

## Repozytorium
https://github.com/KarolinaFilipiuk/AppIOS
