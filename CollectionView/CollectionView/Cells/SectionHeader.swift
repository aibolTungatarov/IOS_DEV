import UIKit

class SectionHeader: UICollectionReusableView {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var flagImage: UIImageView!
  @IBOutlet private weak var countLabel: UILabel!
  
  var section: Section! {
    didSet {
      titleLabel.text = section.title
      flagImage.image = UIImage(named: section.title ?? "")
      countLabel.text = "\(section.count)"
    }
  }
  
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
  
  
}
