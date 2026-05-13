package main

import (
	"github.com/gen2brain/raylib-go/raylib"
	"math"
	"time"
)

type Player struct {
	Pos      rl.Vector2
	Rotation float32
	HP       int
	Texture  rl.Texture2D
}

func NewPlayer() Player {
	return Player{
		Pos:     rl.Vector2{X: 640, Y: 360},
		HP:      4,
		Texture: texPlayerIdle,
	}
}

func (p *Player) Update() {
	if rl.IsKeyDown(rl.KeyW) { p.Pos.Y -= 3 }
	if rl.IsKeyDown(rl.KeyS) { p.Pos.Y += 3 }
	if rl.IsKeyDown(rl.KeyA) { p.Pos.X -= 3 }
	if rl.IsKeyDown(rl.KeyD) { p.Pos.X += 3 }

	mouse := rl.GetMousePosition()
	p.Rotation = float32(math.Atan2(float64(mouse.Y-p.Pos.Y), float64(mouse.X-p.Pos.X)) * (180 / math.Pi))

	if rl.IsMouseButtonPressed(rl.MouseLeftButton) || rl.IsKeyPressed(rl.KeySpace) || rl.IsKeyPressed(rl.KeyEnter) {
		bullets = append(bullets, &Bullet{Pos: p.Pos, Angle: p.Rotation, Speed: 12, Active: true})
	}
}

func (p *Player) Draw() {
	origin := rl.Vector2{X: float32(p.Texture.Width) / 2, Y: float32(p.Texture.Height) / 2}
	dest := rl.Rectangle{X: p.Pos.X, Y: p.Pos.Y, Width: float32(p.Texture.Width) * 0.4, Height: float32(p.Texture.Height) * 0.4}
	rl.DrawTexturePro(p.Texture, rl.Rectangle{0, 0, float32(p.Texture.Width), float32(p.Texture.Height)}, dest, origin, p.Rotation, rl.White)
}

type Zombie struct {
	Pos   rl.Vector2
	Angle float32
}

func NewZombie() *Zombie {
	return &Zombie{Pos: rl.Vector2{X: float32(rl.GetRandomValue(0, 1280)), Y: 0}}
}

func (z *Zombie) Update(p *Player) {
	dir := rl.Vector2Normalize(rl.Vector2Subtract(p.Pos, z.Pos))
	z.Pos.X += dir.X * 2
	z.Pos.Y += dir.Y * 2
	z.Angle = float32(math.Atan2(float64(dir.Y), float64(dir.X)) * (180 / math.Pi))

	if rl.CheckCollisionCircles(z.Pos, 25, p.Pos, 20) {
		p.HP--
		lastHitTime = time.Now()
		z.Pos.X -= dir.X * 60
		z.Pos.Y -= dir.Y * 60
	}
}

func (z *Zombie) Draw() {
	origin := rl.Vector2{X: float32(texZombie.Width) / 2, Y: float32(texZombie.Height) / 2}
	dest := rl.Rectangle{X: z.Pos.X, Y: z.Pos.Y, Width: float32(texZombie.Width) * 0.4, Height: float32(texZombie.Height) * 0.4}
	rl.DrawTexturePro(texZombie, rl.Rectangle{0, 0, float32(texZombie.Width), float32(texZombie.Height)}, dest, origin, z.Angle, rl.White)
}

type Bullet struct {
	Pos    rl.Vector2
	Angle  float32
	Speed  float32
	Active bool
}

func (b *Bullet) Update() {
	b.Pos.X += float32(math.Cos(float64(b.Angle)*math.Pi/180)) * b.Speed
	b.Pos.Y += float32(math.Sin(float64(b.Angle)*math.Pi/180)) * b.Speed
	if b.Pos.X < 0 || b.Pos.X > 1280 || b.Pos.Y < 0 || b.Pos.Y > 720 { b.Active = false }
}

func (b *Bullet) Draw() {
	rl.DrawTextureEx(texBullet, b.Pos, b.Angle, 1.0, rl.White)
}
