import Flutter
import UIKit
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "com.example.parawarga_apps/env", binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler { (call, result) in
        if call.method == "setApiKey", let args = call.arguments as? [String: Any],
           let apiKey = args["GOOGLE_KEY"] as? String {
            GMSServices.provideAPIKey(apiKey)
            result("Google API Key Set Successfully")
        } else {
            result(FlutterError(code: "ERROR", message: "Invalid API Key", details: nil))
        }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
