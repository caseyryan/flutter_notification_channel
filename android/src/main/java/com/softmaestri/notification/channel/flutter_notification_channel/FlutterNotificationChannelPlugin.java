package com.softmaestri.notification.channel.flutter_notification_channel;

import static androidx.core.content.ContextCompat.getSystemService;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.ContentResolver;
import android.content.Context;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterNotificationChannelPlugin */
public class FlutterNotificationChannelPlugin
    implements FlutterPlugin, MethodCallHandler {

  static String TAG = "ChannelPlugin";
  private MethodChannel channel;
  private Context context;

  @Override
  public void
  onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(),
                                "flutter_notification_channel");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    String methodName = call.method;
    Log.i(TAG, methodName);
    if (methodName.equals("registerNotificationChannel")) {
      Log.i(TAG, "Version code is: " + Build.VERSION.SDK_INT);
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        Log.i(TAG, "Version code is good, start registering...");
        try {
          String id = call.argument("id");
          String name = call.argument("name");
          String description = call.argument("description");
          int importance = (int)call.argument("importance");
          int visibility = (int)call.argument("visibility");
          boolean allowBubbles = (boolean)call.argument("allowBubbles");
          boolean enableVibration = (boolean)call.argument("enableVibration");
          boolean enableSound = (boolean)call.argument("enableSound");
          boolean showBadge = (boolean)call.argument("showBadge");
          String customSound = call.argument("customSound");
          Log.i(TAG, "Channel Settings: \n"
                         + "id: " + id + "\n"
                         + "name: " + name + "\n"
                         + "description: " + description + "\n"
                         + "importance: " + importance + "\n"
                         + "visibility: " + visibility + "\n"
                         + "allowBubbles: " + allowBubbles + "\n"
                         + "showBadge: " + showBadge + "\n"
                         + "enableVibration: " + enableVibration + "\n"
                         + "enableSound: " + enableSound + "\n"
                         + "customSound: " + customSound);

          NotificationChannel notificationChannel =
              new NotificationChannel(id, name, importance);
          notificationChannel.setDescription(description);
          notificationChannel.setShowBadge(showBadge);
          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            notificationChannel.setAllowBubbles(allowBubbles);
          }
          notificationChannel.setLockscreenVisibility(visibility);
          notificationChannel.enableVibration(enableVibration);
          if (enableSound || customSound != null) {
            AudioAttributes attributes =
                new AudioAttributes.Builder()
                    .setUsage(AudioAttributes.USAGE_NOTIFICATION)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                    .build();
            Uri uri;
            if (customSound == null) {
              uri = Settings.System.DEFAULT_NOTIFICATION_URI;
            } else {
              uri = Uri.parse(ContentResolver.SCHEME_ANDROID_RESOURCE + "://" +
                              context.getPackageName() + "/raw/" + customSound);
            }
            Log.i(TAG, "Sound uri: " + uri.toString() + " \n");
            notificationChannel.setSound(uri, attributes);
          }
          NotificationManager notificationManager =
              (NotificationManager)context.getSystemService(
                  Context.NOTIFICATION_SERVICE);
          notificationManager.createNotificationChannel(notificationChannel);
          result.success(
              "Notification channel has been registered successfully!");
        } catch (Exception e) {
          Log.e(TAG, e.getMessage());
          result.success("Could not register channel: " + e.getMessage());
        }
      } else {
        result.success("Android version code must be at least Oreo");
      }
    } else {
      Log.i(TAG, "Method " + methodName + " is not supported!");
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
