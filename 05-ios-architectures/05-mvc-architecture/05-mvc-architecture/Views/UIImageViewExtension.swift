//
//  UIImageViewExtension.swift
//  05-mvc-architecture
//
//  Created by Bhumik Poshiya on 25/06/26.
//

import UIKit

extension UIImageView {
    
    func loadImage(url urlStr: String) {
        
        guard let url =  URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data, error == nil,let image = UIImage(data: data) else {
                self.image = UIImage(resource: .icErrorImg)
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
