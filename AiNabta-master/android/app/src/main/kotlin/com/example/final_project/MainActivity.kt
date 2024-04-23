package com.example.final_project
//
//import io.flutter.embedding.android.FlutterActivity
//
//class MainActivity : FlutterActivity() {
//}
// MainActivity.kt
//package com.example.bluetooth_flutter

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothSocket
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.IOException
import java.io.InputStream
import java.util.*

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/sensors"
    private lateinit var bluetoothAdapter: BluetoothAdapter
    private lateinit var bluetoothSocket: BluetoothSocket
    private lateinit var input: InputStream
    private lateinit var handler: Handler

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "connectToBluetooth" -> connectToBluetooth(result)
                else -> result.notImplemented()
            }
        }
    }

    private fun connectToBluetooth(result: MethodChannel.Result) {
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        val device = bluetoothAdapter.bondedDevices.find { it.name == "YourBluetoothDeviceName" }
        if (device != null) {
            bluetoothSocket = device.createRfcommSocketToServiceRecord(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"))
            bluetoothSocket.connect()
            input = bluetoothSocket.inputStream
            handler = Handler(Looper.getMainLooper())
            listenForData()
            result.success("Connected to Bluetooth")
        } else {
            result.error("DEVICE_NOT_FOUND", "Bluetooth device not found", null)
        }
    }

    private fun listenForData() {
        Thread {
            while (true) {
                try {
                    val buffer = ByteArray(1024)
                    val bytes: Int = input.read(buffer)
                    val data = String(buffer, 0, bytes)
                    handler.post {
                        // Send data to Flutter
                        sendToFlutter(data)
                    }
                } catch (e: IOException) {
                    break
                }
            }
        }.start()
    }

    private fun sendToFlutter(data: String) {
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("receiveData", data)
    }
}
