# 🧟 Tacti-Doom

**Tacti-Doom** est un shooter tactique en vue de dessus (top-down) développé en **Go** avec la bibliothèque graphique **Raylib**. Plongez dans une ambiance sombre où chaque mouvement compte. Le jeu combine la réactivité du combo clavier/souris avec un gameplay nerveux rendant hommage aux classiques du survival-horror.

<p align="center">
  <img src="https://via.placeholder.com/800x400?text=Bannière+Tacti-Doom" alt="Bannière Tacti-Doom" width="100%">
</p>

---

## 🕹️ Contrôles
Le système a été optimisé pour une précision maximale.

### **Déplacements & Visée**
* **Z, Q, S, D** : Déplacements du personnage.
* **Souris** : Orientation du regard et visée (système de rotation à 360°).
* **Clic Gauche** : Faire parler la poudre (Tirer).

### **Actions secondaires**
* **Recharger** : `R`
* **Interagir** : `E`
* **Changer d'arme** : `&`, `é`, `"` (1, 2, 3)
* **Restart (Game Over)** : `R`

---

## 🛠️ Stack Technique
* **Langage** : [Go (Golang)](https://go.dev/)
* **Moteur Graphique** : [Raylib-go](https://github.com/gen2brain/raylib-go)
* **Genre** : Top-Down Tactic Shooter
* **Systèmes cibles** : Windows / Linux

---

## 🚀 Installation & Compilation
Pour compiler ce projet, vous devez avoir un environnement Go fonctionnel et les dépendances CGO installées.

### **Dépendances système (Linux)**
Sur Ubuntu/Debian, installez les bibliothèques de développement nécessaires :
```bash
sudo apt update && sudo apt install libwayland-dev libx11-dev libxcursor-dev libxinerama-dev libxrandr-dev libxi-dev libasound2-dev libgl1-mesa-dev xorg-dev libxkbcommon-dev -y

## 🤝 Crédits
Développé par l'**équipe Tacti-Doom**.
