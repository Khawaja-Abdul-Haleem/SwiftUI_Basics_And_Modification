//
//  StudentModel.swift
//  UISearchBar using UIViewRepresentable
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import Foundation
    
struct Employee: Identifiable {
    let id = UUID()
    let name: String
}

var employees: [Employee] = [
    
    Employee(name: "KAH"),
    Employee(name: "Imran"),
    Employee(name: "Faisal"),
    Employee(name: "Maryam"),
    Employee(name: "Junaid"),
    Employee(name: "Fiza")
    
]
