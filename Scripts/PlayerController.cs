using Godot;
using System;

[GlobalClass]
public partial class PlayerController : Node
{
	AnimationPlayer _player_an;
	Sprite2D _player_s2d;
	const float PLAYER_BASE_SPEED = 150f;
	CharacterBody2D _player_cb2d;
	Vector2 _PlayerInput = Vector2.Zero;
	Vector2 GetDirection()
	{
		Vector2 input = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
		input = new Vector2(Math.Sign(input.X), Math.Sign(input.Y));
		return input.Normalized();
	}

	void AnimatePLayer()
	{
		if (_PlayerInput==Vector2.Zero){}
	}

	public override void _Ready()
	{
		_player_cb2d = this.GetParent() as CharacterBody2D;
		_player_s2d = _player_cb2d.GetNode("Sprite2D") as Sprite2D;
		_player_an = _player_s2d.GetNode("AnimationPlayer") as AnimationPlayer;
	}

	void MovePlayer()
	{
		_PlayerInput = GetDirection();
		_player_cb2d.Velocity = _PlayerInput * PLAYER_BASE_SPEED;
		_player_cb2d.MoveAndSlide();
	}

	public override void _Process(double delta)
	{
		MovePlayer();
		AnimatePLayer();
	}
}
