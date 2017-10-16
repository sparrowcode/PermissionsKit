import UIKit

extension UIImageView {
    
    public func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit, withComplection complection: @escaping (UIImage?) -> () = {_ in }) {
        DispatchQueue.main.async {
            self.contentMode = mode
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { complection(nil); return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
                complection(image)
            }
            }.resume()
    }
    
    public func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit, withComplection complection: @escaping (UIImage?) -> () = {_ in }) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode, withComplection: complection)
    }
}


