package main

import (
    "fmt"
    "github.com/gen2brain/raylib-go/raylib"
)

var (
	texPlayerIdle rl.Texture2D
	texZombie     rl.Texture2D
	texBullet     rl.Texture2D
)

func loadResources() {
	texGrass = rl.LoadTexture("images/grass.png")
	texBullet = rl.LoadTexture("images/bullet.png")
	texPlayerIdle = rl.LoadTexture("images/Top_Down_Survivor/Top_Down_Survivor/shotgun/idle/survivor-idle_shotgun_0.png")
	texZombie = rl.LoadTexture("images/tds_zombie/export/Movement/skeleton-move_0.png")
}

func unloadResources() {
	rl.UnloadTexture(texGrass)
	rl.UnloadTexture(texBullet)
	rl.UnloadTexture(texPlayerIdle)
	rl.UnloadTexture(texZombie)
}

func drawUI() {
	var alpha uint8
	switch player.HP {
	case 3: alpha = 60
	case 2: alpha = 130
	case 1: alpha = 200
	}

	if alpha > 0 {
		rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.NewColor(255, 0, 0, alpha))
	}
	rl.DrawText(fmt.Sprintf("SCORE: %d", score), 20, 20, 20, rl.RayWhite)
	rl.DrawText(fmt.Sprintf("HP: %d/4", player.HP), 20, 50, 20, rl.Red)
}
