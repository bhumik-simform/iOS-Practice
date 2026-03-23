//
//  ViewController.swift
//  Demo_UI_Elements_3
//
//  Created by Bhumik Poshiya on 27/03/26.
//

import UIKit

class QuantityViewController: UIViewController {

    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var bikePartsSegments: UISegmentedControl!
    @IBOutlet weak var quantityStepper: UIStepper!
    
   let allParts = ["Matte Black Exhaust", "Clip-on Handlebars", "LED Headlight", "Leather Solo Seat", "Bar-end Mirrors"]
    
    var filterParts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeOrderLabel()
        filterParts = allParts
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let currQuantity = Int(sender.value)
        changeOrderLabel(partName: bikePartsSegments.titleForSegment(at: bikePartsSegments.selectedSegmentIndex), quantity: currQuantity )
    }
    
    @IBAction func partsCategoryChanged(_ sender: UISegmentedControl) {
        let selectedPart = sender.titleForSegment(at: sender.selectedSegmentIndex)
        changeOrderLabel(partName: selectedPart, quantity: Int(quantityStepper.value))
        
    }
    
    func changeOrderLabel(partName: String? = nil, quantity: Int = 0) {

        guard let partName, quantity != 0 else {
            orderLabel.text = "Please Order Somthing."
            return
        }
        orderLabel.text = "Ordering \(quantity) \(partName)."
    }
    
    @IBOutlet weak var searchBarForParts: UISearchBar!
}


extension QuantityViewController: UISearchBarDelegate {
    //Tracks User Interaction when it types searches and cancel
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if filterParts.isEmpty {
            filterParts = allParts
        } else {
            filterParts = allParts.filter{ part in
                part.lowercased().contains(searchText.lowercased())
            }
        }
        print(filterParts)
    }
    
    //Called when user hit search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Try to find its usecase
        searchBar.resignFirstResponder()
    }
    
    //Called when user hits cancelbutton
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filterParts = allParts
        searchBar.resignFirstResponder()
    }
}
