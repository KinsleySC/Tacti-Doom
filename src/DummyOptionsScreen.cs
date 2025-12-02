using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace TactiDoom {
	public class DummyOptionsScreen : IScreen {
		public bool IsOverlay => false;
		public bool IsFinished { get; private set; }

		public void Update(GameTime gameTime) {
			if (Input.BackPressed) IsFinished = true;
		}

		public void Draw(SpriteBatch spriteBatch, SpriteFont font, Viewport viewport) {
			if (font == null) return;
			var cx = viewport.Width / 2;
			var cy = viewport.Height / 2;
			spriteBatch.DrawString(font, "OPTIONS (placeholder)", new Vector2(cx, cy), Color.LightBlue, 0, font.MeasureString("OPTIONS (placeholder)") / 2, 1f, SpriteEffects.None, 0);
			spriteBatch.DrawString(font, "Échap pour revenir", new Vector2(cx, cy + 40), Color.Gray, 0, font.MeasureString("Échap pour revenir") / 2, 1f, SpriteEffects.None, 0);
		}
	}
}
