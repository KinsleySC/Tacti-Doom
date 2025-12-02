using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace TactiDoom {
	public class MainMenuScreen : IScreen {
		private readonly string[] _items = { "START GAME", "OPTIONS", "QUIT" };
		private int _index;
		private readonly Action _onStart, _onOptions, _onQuit;
		private bool _finished;

		public bool IsOverlay => false;
		public bool IsFinished => _finished;

		public MainMenuScreen(Action onStart, Action onOptions, Action onQuit) {
			_onStart = onStart; _onOptions = onOptions; _onQuit = onQuit;
		}

		public void Update(GameTime gameTime) {
			if (Input.UpPressed) _index = (_index - 1 + _items.Length) % _items.Length;
			if (Input.DownPressed) _index = (_index + 1) % _items.Length;
			if (Input.ConfirmPressed) {
				if (_index == 0) _onStart?.Invoke();
				else if (_index == 1) _onOptions?.Invoke();
				else { _onQuit?.Invoke(); _finished = true; }
			}
		}

		public void Draw(SpriteBatch spriteBatch, SpriteFont font, Viewport viewport) {
			if (font == null) return;
			var cx = viewport.Width / 2;
			var y0 = viewport.Height / 3;

			DrawCentered(spriteBatch, font, "TACTI-DOOM", new Vector2(cx, y0 - 80), Color.DarkRed, 1.3f);
			for (int i = 0; i < _items.Length; i++) {
				var selected = i == _index;
				var color = selected ? Color.Gold : Color.Gray;
				var y = y0 + i * 42;
				DrawCentered(spriteBatch, font, _items[i], new Vector2(cx, y), color, selected ? 1.1f : 1.0f);
				if (selected) {
					spriteBatch.DrawString(font, ">>", new Vector2(cx - 160, y), Color.DarkRed, 0, font.MeasureString(">>") / 2, 1f, SpriteEffects.None, 0);
					spriteBatch.DrawString(font, "<<", new Vector2(cx + 160, y), Color.DarkRed, 0, font.MeasureString("<<") / 2, 1f, SpriteEffects.None, 0);
				}
			}
			DrawCentered(spriteBatch, font, "↑/↓ naviguer • Entrée valider • Échap quitter", new Vector2(cx, viewport.Height - 60), Color.DimGray, 0.9f);
		}

		private void DrawCentered(SpriteBatch sb, SpriteFont font, string text, Vector2 pos, Color color, float scale) {
			var size = font.MeasureString(text) * scale;
			sb.DrawString(font, text, pos, color, 0, size / 2f, scale, SpriteEffects.None, 0);
		}
	}
}
