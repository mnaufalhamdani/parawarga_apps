package com.example.parawarga_apps

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    // bugfix = Recent Screen shows flickering and black screen
    override fun onPause() {
        super.onPause()
        try {
            Thread.sleep(200)
        } catch (e: InterruptedException) {
            e.printStackTrace()
        }
    }
}
