import UIKit
import Lightbox
import SDWebImage

class ViewController: UIViewController {
  var lightboxController: LightboxController?
    
  lazy var showButton: UIButton = { [unowned self] in
    let button = UIButton()
    button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
    button.setTitle("Show me the lightbox", for: UIControl.State())
    button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
    button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
    button.frame = UIScreen.main.bounds
    button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    view.backgroundColor = UIColor.white
    view.addSubview(showButton)
    
//    LightboxConfig.loadImage = { imageView, URL, completion in
//        imageView.sd_setImage(with: URL, placeholderImage: nil, completed: { image, _, _, _ in
//            completion?(image)
//        })
//    }
    
    LightboxConfig.CloseButton.enabled = false
    LightboxConfig.DeleteButton.enabled = false
    LightboxConfig.InfoLabel.enabled = false
    LightboxConfig.PageIndicator.enabled = false
  }
  
  @objc func showLightbox() {
    let images = [
      LightboxImage(imageURL: URL(string: "https://cdn.artstationdev.com/p/assets/images/images/000/080/826/original/peter-brown-source.gif?1555341195")!),
      LightboxImage(
        image: UIImage(named: "photo1")!,
        text: "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film"
      ),
      LightboxImage(
        image: UIImage(named: "photo2")!,
        text: "Emoji 😍 (/ɪˈmoʊdʒi/; singular emoji, plural emoji or emojis;[4] from the Japanese 絵文字えもじ, pronounced [emodʑi]) are ideograms and smileys used in electronic messages and web pages. Emoji are used much like emoticons and exist in various genres, including facial expressions, common objects, places and types of weather 🌅☔️💦, and animals 🐶🐱",
        videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      ),
      LightboxImage(
        image: UIImage(named: "photo3")!,
        text: "A lightbox is a translucent surface illuminated from behind, used for situations where a shape laid upon the surface needs to be seen with high contrast."
      )
    ]
    
    lightboxController?.view.removeFromSuperview()
    lightboxController?.removeFromParent()
    
    let controller = LightboxController(images: images, startIndex: 1)
    lightboxController = controller
    controller.dynamicBackground = false
    controller.pageDelegate = self
    controller.transitionDelegate = self
    addChild(controller)
    view.addSubview(controller.view)
//    present(controller, animated: true, completion: nil)
  }
}

extension ViewController: LightboxControllerPageDelegate {
    func lightboxController(_ controller: LightboxController, didMoveToPage page: Int) {
    }
    
    func lightboxController(_ controller: LightboxController, remoteImageDidLoad image: UIImage?) {
    }
}

extension ViewController: LightboxControllerTransitionDelegate {
    func lightboxController(_ controller: LightboxController?, didChangeWithAlpha alpha: CGFloat) {
    }
    
    func lightboxController(_ controller: LightboxController?, didEndWithClosing closing: Bool) {
    }

}
