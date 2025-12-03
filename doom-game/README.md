# Tacti-Doom - Godot Engine

Jeu tactique 2D style Doom avec Godot Engine 4.5

## Structure du projet

```
doom-game/
├── scenes/           # Scènes du jeu
│   ├── main_menu.tscn
│   ├── game_screen.tscn
│   └── options_screen.tscn
├── scripts/          # Scripts GDScript
│   ├── game_manager.gd
│   ├── screen_manager.gd
│   ├── main_menu.gd
│   ├── game_screen.gd
│   ├── options_screen.gd
│   ├── unit.gd
│   ├── battle_manager.gd
│   └── input_manager.gd
├── assets/           # Assets du jeu
│   └── fonts/
└── ui/              # Éléments UI
```

## Fonctionnalités

### Menu Principal
- Navigation au clavier (↑↓)
- Options: Start Game, Options, Quit
- Style Doom-like avec sélection rouge

### Écran de Jeu
- Grille tactique 10x10
- Déplacement au clavier (↑↓←→)
- Sélection de cellules
- Retour au menu (ESC)

### Écran d'Options
- Contrôle du volume (←→)
- Basculer plein écran
- Retour au menu

### Système de Combat
- Classes Unit et BattleManager
- Tour par tour
- Gestion des unités joueur/ennemi

## Lancement

1. Ouvrir le projet dans Godot Engine 4.5
2. La scène principale est `scenes/main_menu.tscn`
3. Appuyer sur F5 pour lancer

## Contrôles

- **↑↓←→** : Navigation/Déplacement
- **Entrée** : Valider/Sélectionner
- **ESC** : Annuler/Retour menu

## Développement

Le code suit les principes :
- Fonctions ≤ 20 lignes
- ≤ 4 paramètres par fonction
- Code clair et modulaire
- Scripts découplés

## Scripts principaux

- `game_manager.gd` : Gestion globale du jeu
- `screen_manager.gd` : Navigation entre écrans
- `battle_manager.gd` : Logique de combat
- `unit.gd` : Classe pour les unités
- `input_manager.gd` : Centralisation des inputs
