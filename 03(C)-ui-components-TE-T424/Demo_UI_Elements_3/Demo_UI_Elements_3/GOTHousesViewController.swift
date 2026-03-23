//
//  GOTHousesViewController.swift
//  Demo_UI_Elements_3
//
//  Created by Bhumik Poshiya on 27/03/26.
//

import UIKit

class GOTHousesViewController: UIViewController {

    @IBOutlet weak var greatHousesCollection: UICollectionView!
    
    @IBOutlet weak var housesSearchBar: UISearchBar!
    
    struct House {
        let name: String
        let sigilImageName: String
    }

    let westerosHouses: [House] = [
        House(name: "House Stark", sigilImageName: "stark_direwolf"),
        House(name: "House Targaryen", sigilImageName: "targaryen_dragon"),
        House(name: "House Lannister", sigilImageName: "lannister_lion"),
        House(name: "House Baratheon", sigilImageName: "baratheon_stag"),
        House(name: "House Greyjoy", sigilImageName: "greyjoy_kraken"),
        House(name: "House Tyrell", sigilImageName: "tyrell_rose"),
        House(name: "House Martell", sigilImageName: "martell_sun_spear"),
        House(name: "House Tully", sigilImageName: "tully_trout"),
        House(name: "House Arryn", sigilImageName: "arryn_falcon")
    ].sorted { $0.name < $1.name }
    
    
    var filteredHouse = [House] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredHouse = westerosHouses
        greatHousesCollection.keyboardDismissMode = .onDrag
        // Do any additional setup after loading the view.
    }
}

extension GOTHousesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredHouse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HouseCollectionViewCell", for: indexPath) as? HouseCollectionViewCell else {
            return HouseCollectionViewCell()
        }
        
        cell.houseNameLabel.text = filteredHouse[indexPath.item].name
        cell.houseSigilImageView.image = UIImage(named: filteredHouse[indexPath.item].sigilImageName )
        
        return cell
    }
}

extension GOTHousesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 30
        let collectionCellSize = (collectionView.frame.width - padding) / 2
        return CGSize(width: collectionCellSize, height: collectionCellSize * 1.2 )
    }
}

extension GOTHousesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedHouse = filteredHouse[indexPath.item].name
        print("\(selectedHouse) is selected.")
    }
}

extension GOTHousesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredHouse = westerosHouses
        } else {
            filteredHouse = westerosHouses.filter { house in
                house.name.lowercased().contains( searchText.lowercased() )
            }
        }
        
        greatHousesCollection.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        greatHousesCollection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredHouse = westerosHouses
        searchBar.resignFirstResponder()
        greatHousesCollection.reloadData()
    }
}
