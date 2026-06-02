//
//  Untitled.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

import UIKit

extension UIImageView {
    
    func loadImagefrom(url urlStr: String) {
        self.image = UIImage(resource: .icPlaceholderImg)
        
        guard let url = URL(string: urlStr) else {
            self.image = UIImage(resource: .icErrorImg)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                self.image = UIImage(resource: .icErrorImg)
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
