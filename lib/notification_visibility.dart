class NotificationVisibility {

  /*
  * Notification visibility: Show this notification in its entirety on all lockscreens.
  *
  * {@see #visibility}
  */
  static const int VISIBILITY_PUBLIC = 1;

  /*
     * Notification visibility: Show this notification on all lockscreens, but conceal sensitive or
     * private information on secure lockscreens.
     *
     * {@see #visibility}
     */
  static const int VISIBILITY_PRIVATE = 0;

  /*
     * Notification visibility: Do not reveal any part of this notification on a secure lockscreen.
     *
     * {@see #visibility}
     */
  static const int VISIBILITY_SECRET = -1;
}
