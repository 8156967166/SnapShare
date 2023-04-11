import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var cllctnView: UICollectionView!
    var imageArry = ["image1","image2","image3","image4","image5","image6", "image7", "image8"]
    var emptyArry = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonActionArchive(_ sender: UIButton) {
        
    }
    
    @IBAction func buttonActionDelete(_ sender: UIButton) {
        if emptyArry.count > 0 {
            for i in imageArry {
                if emptyArry.contains(i) {
                    let indxss = imageArry.lastIndex(of: i)
                    imageArry.remove(at: indxss ?? 0)
                }
            }
        }
        cllctnView.reloadData()
    }
}

extension UploadViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UploadCollectionViewCell", for: indexPath) as! UploadCollectionViewCell
        cell.imageUpload.image = UIImage(named: imageArry[indexPath.row])
        if emptyArry.contains(imageArry[indexPath.row]) {
            cell.imageTik.image = UIImage(named: "tik")
        }else {
            cell.imageTik.image = UIImage(named: "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !emptyArry.contains(imageArry[indexPath.row]) {
            emptyArry.append(imageArry[indexPath.row])
        }else {
            let indx = emptyArry.lastIndex(of: imageArry[indexPath.row])
            emptyArry.remove(at: indx ?? 0)
        }
        cllctnView.reloadData()
    }
}


class UploadCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageTik: UIImageView!
    @IBOutlet weak var imageUpload: UIImageView!
}
