using System.Collections.Generic;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace TactiDoom {
	public interface IScreen {
		void Update(GameTime gameTime);
		void Draw(SpriteBatch spriteBatch, SpriteFont font, Viewport viewport);
		bool IsOverlay { get; }
		bool IsFinished { get; }
	}

	public class ScreenManager {
		private readonly Stack<IScreen> _stack = new Stack<IScreen>();
		public void Push(IScreen screen) => _stack.Push(screen);

		public void Update(GameTime gameTime) {
			if (_stack.Count == 0) return;
			var top = _stack.Peek();
			top.Update(gameTime);
			while (_stack.Count > 0 && _stack.Peek().IsFinished) _stack.Pop();
		}

		public void Draw(SpriteBatch spriteBatch, SpriteFont font, Viewport viewport) {
			if (_stack.Count == 0) return;
			foreach (var screen in _stack) screen.Draw(spriteBatch, font, viewport);
		}
	}
}
