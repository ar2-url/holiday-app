import UIKit

protocol ProductCellDelegate {
    func increaseNumber(cell: ProductCell, number: Int)
    func decreaseNumber(cell: ProductCell, number: Int)
}

class ProductCell: UITableViewCell {
    
    var delegate: ProductCellDelegate?
    let minValue = 0
    
    var product: Product? {
        
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDesc
            
        }
    }
    
    private let productNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let productDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let decreaseButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "icons8-minus-24"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let increaseButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "icons8-plus-math-24"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    var productQuantity: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .blue
        return label
    }()
    
    
    private let productImage: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "icons8-holiday-48"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    @objc func increaseFunc() {
        changeQuantity(by: 1)
    }
    
    @objc func decreaseFunc() {
        changeQuantity(by: -1)
    }
    
    func changeQuantity(by amount: Int) {
        var quality = Int(productQuantity.text!)!
        quality += amount
        if quality < minValue {
            quality = 0
            productQuantity.text = "0"
        } else {
            productQuantity.text = "\(quality)"
        }
        delegate?.decreaseNumber(cell: self, number: quality)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(decreaseButton)
        addSubview(productQuantity)
        addSubview(increaseButton)
        
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingBottom: 5, paddingRight: 0, paddingLeft: 20, height: 0, width: 50, enableInsets: false)
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingBottom: 10, paddingRight: 0, paddingLeft: 0, height: 0, width: frame.size.width / 2, enableInsets: false)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingBottom: 10, paddingRight: 0, paddingLeft: 0, height: frame.size.width / 2, width: 0,  enableInsets: false)
        
        
        let stackView = UIStackView(arrangedSubviews: [increaseButton, productQuantity, decreaseButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingBottom: 5, paddingRight: 15, paddingLeft: 5, height: 70, width: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
