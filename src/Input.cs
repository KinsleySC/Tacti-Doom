using Microsoft.Xna.Framework.Input;

namespace TactiDoom {
	public static class Input {
		private static KeyboardState _prev, _curr;

		public static void Update() {
			_prev = _curr;
			_curr = Keyboard.GetState();
		}

		private static bool IsDown(Keys k) => _curr.IsKeyDown(k);
		private static bool WasDown(Keys k) => _prev.IsKeyDown(k);
		private static bool Pressed(Keys k) => IsDown(k) && !WasDown(k);

		public static bool UpPressed => Pressed(Keys.Up) || Pressed(Keys.W);
		public static bool DownPressed => Pressed(Keys.Down) || Pressed(Keys.S);
		public static bool ConfirmPressed => Pressed(Keys.Enter) || Pressed(Keys.Space);
		public static bool BackPressed => Pressed(Keys.Escape);
	}
}
