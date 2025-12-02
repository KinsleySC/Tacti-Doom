# Tacti-Doom

Projet 2D en C# (MonoGame) avec un menu Doom-like:
- Menu vertical (Start, Options, Quit)
- Navigation clavier: Haut/Bas/Entrée/Échap
- Écrans: MainMenu, Game, Options

## Installation
1. Installer MonoGame (DesktopGL ou WindowsDX).
2. Cloner le dépôt dans `c:\Users\KSC\Documents\Ydays\Tacti-Doom`.
3. Ouvrir le projet MonoGame et pointer `src` dans le namespace.

## Contenu
- `src/Program.cs`: point d’entrée.
- `src/Game1.cs`: initialisation, boucle de jeu.
- `src/ScreenManager.cs`: gestion des écrans (pile).
- `src/Input.cs`: clavier (détection appui).
- `src/MainMenuScreen.cs`: menu Doom-like.
- `src/DummyGameScreen.cs`: écran jeu placeholder.
- `src/DummyOptionsScreen.cs`: écran options placeholder.
- `Content/DefaultFont.spritefont`: police pour le texte (à ajouter via Content Pipeline).

## Lancement
- Charger `DefaultFont` dans `Game1.LoadContent()`:
  // ...existing code...
  `_font = Content.Load<SpriteFont>("DefaultFont");`
  // ...existing code...
- Exécuter le projet, utiliser ↑ ↓ Entrée Échap.

## Style de code (B1 / Epitech-like)
- Fonctions ≤ 20 lignes.
- ≤ 4 paramètres par fonction.
- Découper avec helpers si nécessaire.
²- Noms simples, code clair.

## Migration
- Projet C# uniquement (MonoGame).
