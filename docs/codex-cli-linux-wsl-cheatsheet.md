# Codex CLI/TUI na Linux/WSL - sciaga

Ta sciaga jest napisana "dla czlowieka", nie dla autora kodu.
Ma szybko odpowiedziec na 3 pytania:

1. Jak wkleic obraz lub plik?
2. Co robi kazdy najwazniejszy skrot?
3. Ktore rzeczy sa pewne, a ktore zaleza od terminala?

## Najkrotsza odpowiedz

Jesli chcesz po prostu skutecznie pracowac:

- Obraz ze schowka: nacisnij `Ctrl+V`.
- Obraz w WSL: najlepiej nacisnij `Ctrl+Alt+V`.
- Obraz z dysku: wklej jego sciezke albo uzyj `@`.
- Dowolny plik niebedacy obrazem: podaj jego sciezke przez `@` albo wklej path jako tekst.
- Jesli chcesz dolaczyc obraz poza TUI, uzyj:

```bash
codex -i obraz.png "Twoje polecenie"
```

## Slownik prostych pojec

- `composer`: glowne pole, w ktorym piszesz wiadomosc do Codexa.
- `task running`: Codex juz cos robi. Na przyklad czyta pliki, pisze kod albo uruchamia komende.
- `queued message`: wiadomosc ustawiona "w kolejce". Nie idzie od razu, tylko po obecnym zadaniu.
- `transcript`: historia rozmowy i dzialan w sesji.
- `popup`: male okno wyboru, ktore otwiera sie nad glownym ekranem.
- `approval overlay`: ekran z pytaniem o zgode, np. czy wolno uruchomic komende.
- `backtrack`: powrot do starszej wiadomosci, zeby ja poprawic lub wznowic od tamtego miejsca.

## Jak czytac zapis skrotow

- `Ctrl+V` znaczy: przytrzymaj `Ctrl`, nacisnij `V`, potem pusc oba klawisze.
- `Shift+Enter` znaczy: przytrzymaj `Shift`, nacisnij `Enter`.
- `Alt+Up` znaczy: przytrzymaj `Alt`, nacisnij strzalke w gore.
- `Esc, potem Esc` znaczy: nacisnij `Esc`, a potem drugi raz `Esc`.
- `1..N` znaczy: nacisnij cyfre odpowiadajaca pozycji na ekranie, np. `1`, `2`, `3`.

## Obrazy i pliki na Linux/WSL

### Co dziala pewnie

- `Ctrl+V` w TUI wkleja obraz ze schowka jako zalacznik obrazu.
- W WSL bezpieczniej uzywac `Ctrl+Alt+V`, bo zwykle `Ctrl+V` bywa przechwytywane przez terminal.
- Jesli wkleisz tekst, ktory wyglada jak sciezka do obrazka, Codex sprobuje dolaczyc ten obraz.
- `@` pozwala wyszukac i wskazac plik z dysku.

### Co to oznacza w praktyce

- Jesli skopiowales screenshot i chcesz go wrzucic do rozmowy:
  nacisnij `Ctrl+V`, a w WSL najlepiej `Ctrl+Alt+V`.
- Jesli masz plik `/home/primo/obraz.png`:
  mozesz wkleic te sciezke do composera.
- Jesli nie pamietasz sciezki:
  nacisnij `@`, znajdz plik i wybierz go z listy.

### Czego nie ma jako osobnej funkcji

- Nie ma ogolnego "uploadu dowolnego pliku binarnego" tak jak w typowym GUI.
- Dla plikow niebedacych obrazami Codex zwykle dostaje ich sciezke, a nie zawartosc jako zalacznik.

To znaczy:

- PDF, ZIP, CSV, TXT i inne pliki najlepiej przekazywac przez sciezke.
- Obrazy sa traktowane specjalnie i maja lepsza obsluge niz zwykle pliki.

### Rzeczy niepewne

- `Shift+Insert`: moze dzialac, ale zalezy od tego, czy Twoj terminal sam zamieni to na zwykly paste.
- Drag and drop: nie ma tu twardo potwierdzonego wsparcia UI. Jesli gdzies dziala, to nie jako jasno opisana funkcja produktu.

## Najwazniejsze skroty w glownym polu pisania

### `?` - pokaz liste skrotow

- Co nacisnac: `?`
- Kiedy dziala: gdy pole pisania jest puste.
- Co robi: pokazuje na dole ekran z podpowiedzia najwazniejszych skrotow.
- Kiedy uzyc: gdy zapomnisz, co robi `@`, `Ctrl+G`, `Ctrl+T` itd.

### `/` - komendy Codexa

- Co nacisnac: `/`
- Co robi: otwiera liste komend, np. `/clear`, `/review`, `/model`.
- Jak myslec o tym prosto: to menu "funkcji Codexa", a nie zwykla tresc wiadomosci.

### `!` - komenda shellowa

- Co nacisnac: `!`
- Co robi: przechodzi w tryb wpisania komendy systemowej.
- Jak myslec o tym prosto: zamiast prosic Codexa slowami, od razu piszesz komende.

### `Enter` - wyslij wiadomosc

- Co nacisnac: `Enter`
- Co robi: wysyla to, co napisales.
- Uwaga: jesli myslisz "chce nowa linie", to samo `Enter` zwykle nie jest dobrym wyborem.

### `Shift+Enter` albo `Ctrl+J` - nowa linia bez wysylki

- Co nacisnac: `Shift+Enter`
- Jesli to nie dziala w Twoim terminalu: `Ctrl+J`
- Co robi: dodaje nowy wiersz w tej samej wiadomosci.
- Kiedy uzyc: gdy chcesz napisac dluzszy prompt albo liste punktow.

### `Tab` - kolejkuj albo wyslij

- Co nacisnac: `Tab`
- Co robi:
  - jesli Codex juz pracuje, ustawia Twoja wiadomosc w kolejce,
  - jesli nic nie trwa, zwykle wysyla.
- Jak myslec o tym prosto: to "wyslij pozniej, gdy obecna robota sie skonczy".

### `@` - wybierz plik z dysku

- Co nacisnac: `@`
- Co robi: pokazuje wyszukiwarke plikow.
- Co sie stanie dalej:
  - jesli wybierzesz obraz, Codex potraktuje go jak obraz,
  - jesli wybierzesz zwykly plik, najczesciej wstawi jego sciezke.
- Kiedy uzyc: gdy nie chcesz recznie przepisywac path.

### `Ctrl+V` - wklej obraz

- Co nacisnac: `Ctrl+V`
- Co robi: probuje pobrac obraz ze schowka i dolaczyc go do wiadomosci.
- Kiedy uzyc: po zrobieniu screenshota albo skopiowaniu obrazka z przegladarki.

### `Ctrl+Alt+V` - wariant dla WSL

- Co nacisnac: `Ctrl+Alt+V`
- Kiedy uzyc: glownie w WSL.
- Dlaczego: bo w wielu terminalach WSL zwykle `Ctrl+V` jest przechwytywane przez sam terminal.
- Jak myslec o tym prosto: to "bezpieczniejszy Ctrl+V dla WSL".

### `Ctrl+G` - otworz zewnetrzny edytor

- Co nacisnac: `Ctrl+G`
- Co robi: przenosi tresc wiadomosci do zewnetrznego edytora.
- Kiedy uzyc:
  - przy dlugim promptcie,
  - gdy latwiej Ci poprawiac tekst w pelnym edytorze niz w terminalu.

Wazne:

- Codex preferuje `VISUAL`, a jesli go nie ma, probuje `EDITOR`.
- W buildach z fallbackiem WSL, gdy obie zmienne sa puste, Codex sprobuje kolejno: `code --wait`, `nano`, `vim`, `vi`.
- Jesli chcesz wymusic konkretny edytor albo ominac konflikt PATH (na przyklad `code` wskazuje Cursor zamiast VS Code), ustaw `VISUAL` jawnie przed startem Codexa.
- W obecnych wydaniach stabilniej jest ustawic `VISUAL` na wrapper bez spacji w sciezce, bo wpis typu `"/mnt/c/.../code --wait"` moze skonczyc sie komunikatem `Failed to open editor: No such file or directory (os error 2)`.
- Jesli zobaczysz blad:

```text
Cannot open external editor: set $VISUAL or $EDITOR before starting Codex.
```

to znaczy:

- Codex nie wie, jaki program ma otworzyc.
- Musisz ustawic zmienna srodowiskowa i dopiero potem uruchomic `codex` jeszcze raz, albo przejsc na build z fallbackiem WSL.

Najprostsze opcje:

- Terminalowy edytor:

```bash
export EDITOR=nano
codex
```

- Vim:

```bash
export EDITOR=vim
codex
```

- VS Code:

```bash
export VISUAL="$HOME/.local/bin/codex-editor-wrapper"
codex
```

Dlaczego `--wait`:

- Bez tego Codex moze uznac, ze edytor "juz sie zakonczyl" za szybko.
- Z `--wait` Codex czeka, az zamkniesz okno lub zakladke edytora.

Jak ustawic to na stale w bash:

```bash
echo 'export VISUAL="$HOME/.local/bin/codex-editor-wrapper"' >> ~/.bashrc
source ~/.bashrc
```

Jesli jestes w WSL i problem wraca mimo wpisu w `~/.bashrc`:

- sprawdz, czy Twoj launcher nie startuje Basha w trybie login/non-interactive,
- wtedy export musi byc wykonany przed guardem interaktywnosci w `~/.bashrc` albo w `~/.profile`,
- w praktyce: wpis dodany na samym dole `~/.bashrc` za blokiem `case $- in ... return` moze byc za pozno.

Jak ustawic to na stale w zsh:

```bash
echo 'export VISUAL="code --wait"' >> ~/.zshrc
source ~/.zshrc
```

Jesli uzywasz WSL:

- najczesciej najlepsza opcja to `code --wait`, jesli komenda `code` dziala w terminalu,
- jesli sciezka do VS Code zawiera spacje albo `Ctrl+G` zwraca `os error 2`, ustaw wrapper bez spacji i dopiero jego wpisz do `VISUAL`,
- jesli nie dziala, zacznij od `export EDITOR=nano`, bo to najprostszy pewny fallback.

### `Ctrl+L` - wyczysc ekran

- Co nacisnac: `Ctrl+L`
- Co robi: czysci widok terminala bez zaczynania nowej rozmowy.
- Jak myslec o tym prosto: "sprzatnij ekran, ale nie kasuj sesji".

### `Ctrl+C` - przerwij albo wyjdz

- Co nacisnac: `Ctrl+C`
- Co robi:
  - jesli Codex cos robi, najpierw probuje to przerwac,
  - jesli nic nie trwa, sluzy do wyjscia,
  - w obecnym TUI exit jest zabezpieczony podwojnym nacisnieciem.
- Jak myslec o tym prosto: to glowny przycisk "stop".

### `Ctrl+D` - wyjdz, gdy pole jest puste

- Co nacisnac: `Ctrl+D`
- Co robi: pomaga wyjsc z sesji, ale zwykle tylko gdy pole pisania jest puste i nie ma aktywnego popupu.
- Jak myslec o tym prosto: drugi wariant "zakoncz".

### `Ctrl+T` - pokaz historie sesji

- Co nacisnac: `Ctrl+T`
- Co robi: otwiera transcript, czyli pelniejszy widok historii rozmowy.
- Kiedy uzyc: gdy chcesz wrocic do starszej odpowiedzi, komendy albo zmiany.

### `Shift+Tab` - zmien tryb pracy

- Co nacisnac: `Shift+Tab`
- Co robi: przelacza collaboration mode.
- Kiedy uzyc: gdy masz wlaczone tryby wspolpracy i chcesz zmienic sposob pracy bez otwierania komendy.

### `Esc`, potem `Esc` albo `Enter` - edytuj poprzednia wiadomosc

- Co nacisnac: najpierw `Esc`, potem jeszcze raz `Esc` lub `Enter`.
- Co robi: przechodzi do poprzedniej wiadomosci uzytkownika, zeby ja poprawic lub odtworzyc.
- Jak myslec o tym prosto: "wroc do tego, co napisalem chwile temu".

### `Ctrl+K` - wytnij do konca linii

- Co nacisnac: `Ctrl+K`
- Co robi: usuwa fragment tekstu od kursora do konca linii i zapamietuje go.
- Jak myslec o tym prosto: szybkie "wytnij ogon zdania".

### `Ctrl+Y` - wklej to, co przed chwila wyciales

- Co nacisnac: `Ctrl+Y`
- Co robi: przywraca tekst zapamietany przez `Ctrl+K`.
- Jak myslec o tym prosto: "cofnij moje wyciecie".

### `Up` / `Down` - historia draftow

- Co nacisnac: strzalka w gore albo w dol.
- Co robi: porusza sie po historii poprzednich draftow wiadomosci.
- Kiedy uzyc: gdy napisales juz cos podobnego i chcesz to przywrocic.

### `Esc` przy queued messages - wyslij kolejke od razu

- Co nacisnac: `Esc`
- Kiedy to ma sens: gdy masz juz wiadomosci ustawione w kolejce.
- Co robi: przerywa aktualna prace i szybciej przechodzi do tego, co czeka w kolejce.

### `Alt+Up` albo `Shift+Left` - edytuj ostatnia wiadomosc z kolejki

- Zwykly wariant: `Alt+Up`
- Niektore terminale zamiast tego: `Shift+Left`
- Co robi: bierze ostatnia zakolejkowana wiadomosc i znowu wrzuca ja do composera do edycji.
- Kiedy uzyc: gdy zakolejkowales cos za szybko i chcesz to poprawic przed wyslaniem.

## Skróty w transcript pager

To osobny ekran historii.

- `Up` / `Down`: przewijanie po jednej linii.
- `PageUp` / `PageDown`: przewijanie po wiekszym kawalku.
- `Home`: skok na poczatek.
- `End`: skok na koniec.
- `q`: zamknij transcript.

Jesli jestes w trybie backtrack:

- `Esc` lub `Left`: cofniecie.
- `Right` lub `Enter`: wybor wskazanej pozycji.

## Skróty w formularzach i popupach

To sa ekrany, w ktorych cos wybierasz albo potwierdzasz.

### Najczestszy zestaw

- `Up` / `Down`: przesun wybor w gore lub w dol.
- `Enter`: potwierdz.
- `Esc`: anuluj albo wroc.
- `Space`: zaznacz lub odznacz pozycje.
- `Tab`: przejdz do nastepnego pola.
- `Left` / `Right`: zmien pole albo przejdz miedzy sekcjami.

### Approval overlay

To ekran z pytaniem "czy pozwolic na X?".

- `Enter`: potwierdz.
- `Esc`: anuluj.
- `o`: otworz powiazany thread.
- Czasem widac tez litery typu `y`, `a`, `p`, `d`, `n`, `c`.
  Ich znaczenie zalezy od konkretnej etykiety na ekranie.

Najprostsza zasada:

- Jesli nie wiesz, nacisnij `Enter`, zeby zaakceptowac wskazana opcje.
- Jesli nie chcesz nic zmieniac, nacisnij `Esc`.

### Resume picker

To ekran wyboru starszej sesji.

- `Enter`: otworz zaznaczona sesje.
- `Esc`: nie wznawiaj, wracaj.
- `Ctrl+C`: wyjdz.
- `Tab`: zmien sposob sortowania.
- `Up` / `Down`: poruszanie po liscie.

### Menu numerowane

Jesli na ekranie widzisz:

- `1. Opcja A`
- `2. Opcja B`
- `3. Opcja C`

to mozesz po prostu nacisnac `1`, `2` albo `3`.

## Co polecam jako prosty zestaw startowy

Jesli masz zapamietac tylko kilka rzeczy, zapamietaj te:

- `Enter` = wyslij
- `Shift+Enter` = nowa linia
- `@` = wybierz plik
- `Ctrl+V` = wklej obraz
- `Ctrl+Alt+V` = wklej obraz w WSL
- `Ctrl+G` = otworz zewnetrzny edytor
- `Ctrl+T` = historia sesji
- `Ctrl+C` = stop / wyjdz
- `?` = pokaz podpowiedz skrotow

## Co jest nadal niepewne

- `Shift+Insert` jako paste: zalezy od terminala.
- Drag and drop: brak twardego potwierdzenia jako funkcji produktu.
- `$` do wstawiania appki: widac hint, ale bez twardego potwierdzenia handlera w zbadanym zakresie.

## Zrodla

- Lokalny kod i docs repo:
  - `codex-rs/tui/src/bottom_pane/footer.rs`
  - `codex-rs/tui/src/bottom_pane/chat_composer.rs`
  - `codex-rs/tui/src/chatwidget.rs`
  - `codex-rs/tui/src/pager_overlay.rs`
  - `codex-rs/tui/src/bottom_pane/pending_input_preview.rs`
  - `docs/tui-chat-composer.md`
  - `docs/exit-confirmation-prompt-design.md`
  - `codex-rs/tui/tooltips.txt`
- Oficjalne docs OpenAI:
  - `https://developers.openai.com/codex/cli/features/#running-in-interactive-mode`
  - `https://developers.openai.com/codex/cli/features/#image-inputs`
