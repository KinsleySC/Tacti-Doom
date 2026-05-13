package main

import (
	"github.com/gen2brain/raylib-go/raylib"
	"time"
)

const (
	screenWidth  = 1280
	screenHeight = 720
)

var (
	player       Player
	zombies      []*Zombie
	bullets      []*Bullet
	texGrass     rl.Texture2D
	gameOver     bool
	score        int
	lastHitTime  time.Time
)

func main() {
	rl.InitWindow(screenWidth, screenHeight, "Tacti-Doom")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	loadResources()
	initGame()

	for !rl.WindowShouldClose() {
		update()
		draw()
	}

	unloadResources()
}

func initGame() {
	player = NewPlayer()
	zombies = []*Zombie{}
	bullets = []*Bullet{}
	score = 0
	gameOver = false
}

func update() {
	if gameOver {
		if rl.IsKeyPressed(rl.KeyR) {
			initGame()
		}
		return
	}

	player.Update()

	if time.Since(lastHitTime).Seconds() > 5 && player.HP < 4 {
		player.HP = 4
	}

	for i := len(bullets) - 1; i >= 0; i-- {
		bullets[i].Update()
		if !bullets[i].Active {
			bullets = append(bullets[:i], bullets[i+1:]...)
		}
	}

	if rl.GetRandomValue(0, 100) < 2 {
		zombies = append(zombies, NewZombie())
	}

	for i := len(zombies) - 1; i >= 0; i-- {
		zombies[i].Update(&player)
		for j := len(bullets) - 1; j >= 0; j-- {
			if rl.CheckCollisionCircles(zombies[i].Pos, 30, bullets[j].Pos, 5) {
				zombies = append(zombies[:i], zombies[i+1:]...)
				bullets[j].Active = false
				score++
				break
			}
		}
	}

	if player.HP <= 0 {
		gameOver = true
	}
}

func draw() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.Black)

	for x := -1; x <= 1; x++ {
		for y := -1; y <= 1; y++ {
			rl.DrawTexture(texGrass, int32(x*1280), int32(y*720), rl.White)
		}
	}

	for _, b := range bullets { b.Draw() }
	for _, z := range zombies { z.Draw() }
	player.Draw()

	drawUI()

	if gameOver {
		rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.NewColor(0, 0, 0, 220))
		rl.DrawText("YOU DIED", screenWidth/2-150, screenHeight/2-30, 60, rl.Red)
		rl.DrawText("PRESS R TO RESTART", screenWidth/2-100, screenHeight/2+50, 20, rl.White)
	}

	rl.EndDrawing()
}
