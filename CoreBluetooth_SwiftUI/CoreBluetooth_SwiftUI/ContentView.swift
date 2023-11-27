//
//  ContentView.swift
//  CoreBluetooth_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 11/09/2023.
//

import SwiftUI
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject {
    var centralManager: CBCentralManager?
    var peripherals: [CBPeripheral] = []
    @State private var connectedPeripheral: CBPeripheral?
    @Published var peripheralNames: [String] = []
    
    override init() {
        super.init()
        startScanning()
        //self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            peripherals.append(peripheral)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        connectedPeripheral = peripheral
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        connectedPeripheral = nil
        startScanning() // Resume scanning when disconnected
    }
    
    private func startScanning() {
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    //    func centralManagerDidUpdateState(_ central: CBCentralManager) {
    //
    //        switch central.state {
    //
    //        case .poweredOn:
    //            self.centralManager?.scanForPeripherals(withServices: nil)
    //
    //        case .unsupported:
    //            print("unsupported")
    //
    //        default:
    //            print("")
    //        }
    //
    //    }
    //
    //    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
    //        if !peripherals.contains(peripheral) {
    //            self.peripherals.append(peripheral)
    //            self.peripheralNames.append(peripheral.name ?? "")
    //        }
    //    }
}

struct ContentView: View {
    @State private var isLoading = true
    @ObservedObject private var bluetoothModel = BluetoothViewModel()
    @State private var data: [String] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    // Show the activity indicator while loading
                    LoaderView()
                } else {
                    // Display the TableView when data is ready
                    
                    List(bluetoothModel.peripherals, id: \.identifier) { peripheral in
                        Button(action: {
                            
                            connectToPeripheral(peripheral)
                        }) {
                            Text(peripheral.name ?? "Unknown")
                        }
                        //Text(peripheral.name ?? "Unknown")
                    }
                    
                    //DevicesTableView(data: bluetoothModel.peripheralNames)
                }
            }
            .onAppear {
                loadData { loadedData in
                    
                    data = loadedData
                    isLoading = false // Data loading is complete
                }
                
            }
            
        }
        .navigationTitle("Bluetooth Devices")
    }
    
    private func connectToPeripheral(_ peripheral: CBPeripheral) {
        bluetoothModel.centralManager?.stopScan()
        bluetoothModel.centralManager?.connect(peripheral, options: nil)
    }
    
    // Simulated data loading function with a completion handler
    func loadData(completion: @escaping ([String]) -> Void) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2)
            let loadedData: [String] = [
                // Populate your data here
            ]
            // Call the completion handler when data is loaded
            DispatchQueue.main.async {
                completion(loadedData)
            }
        }
    }
}

struct DevicesTableView: View {
    let data: [String]
    
    var body: some View {
        // Your TableView code goes here
        List(data, id: \.self) { peripheral in
            Text(peripheral)
        }
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
