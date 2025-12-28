class NotificationImportance {
  static const int IMPORTANCE_MIN = 1;
  /*
  * Low notification importance: Shows in the shade, and potentially in the status bar
  * (see {@link #shouldHideSilentStatusBarIcons()}), but is not audibly intrusive.
  */
  static const int IMPORTANCE_LOW = 2;

  /*
  * Default notification importance: shows everywhere, makes noise, but does not visually
  * intrude.
  */
  static const int IMPORTANCE_DEFAULT = 3;

  /*
  * Higher notification importance: shows everywhere, makes noise and peeks. May use full screen
  * intents.
  */
  static const int IMPORTANCE_HIGH = 4;

  /*
  * Maximum notification importance: shows everywhere, makes noise, peeks, may use full screen
  * intents, and is generally more interruptive than IMPORTANCE_HIGH. This is the highest
  * importance level for notifications and should be used sparingly for the most critical
  * notifications only.
  */
  static const int IMPORTANCE_MAX = 5;
}
