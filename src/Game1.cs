using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace TactiDoom {
	public class Game1 : Game {
		GraphicsDeviceManager _graphics;
		SpriteBatch _spriteBatch;
		ScreenManager _screens;
		SpriteFont _font;
		Texture2D _bg;

		public Game1() {
			_graphics = new GraphicsDeviceManager(this);
			Content.RootDirectory = "Content";
			IsMouseVisible = true;
		}

		protected override void Initialize() {
			_screens = new ScreenManager();
			base.Initialize();
		}

		protected override void LoadContent() {
			_spriteBatch = new SpriteBatch(GraphicsDevice);
			_bg = new Texture2D(GraphicsDevice, 1, 1);
			_bg.SetData(new[] { new Color(8, 8, 8) });
            // Trouver un sprite doom

			_screens.Push(new MainMenuScreen(
				onStart: () => _screens.Push(new DummyGameScreen()),
				onOptions: () => _screens.Push(new DummyOptionsScreen()),
				onQuit: Exit
			));
		}

		protected override void Update(GameTime gameTime) {
			if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed) Exit();
			Input.Update();
			_screens.Update(gameTime);
			base.Update(gameTime);
		}

		protected override void Draw(GameTime gameTime) {
			GraphicsDevice.Clear(Color.Black);
			_spriteBatch.Begin();
			_spriteBatch.Draw(_bg, new Rectangle(0, 0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height), Color.Black);
			_screens.Draw(_spriteBatch, _font, GraphicsDevice.Viewport);
			_spriteBatch.End();
			base.Draw(gameTime);
		}
	}
}