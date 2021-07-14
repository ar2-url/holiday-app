import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var products : [Product] = [Product]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createProductArray()
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ProductCell
        
        let currentLastItem = products[indexPath.row]
        //cell.textLabel?.text = currentLastItem.productName
        //cell.imageView?.image = currentLastItem.productImage
        cell.product = currentLastItem
        
        //cell.textLabel?.text = currentLastItem.productDesc
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func createProductArray() {
                products.append(Product(productName: "Holiday", productImage: #imageLiteral(resourceName: "icons8-holiday-48"), productDesc: ""))
                products.append(Product(productName: "Umbrella", productImage: #imageLiteral(resourceName: "icons8-beach-umbrella-64"), productDesc: "Beach umbrella"))
                products.append(Product(productName: "Cocktail", productImage: #imageLiteral(resourceName: "icons8-beach-cocktail-64") , productDesc: "Holiday drink"))
                products.append(Product(productName: "Ball", productImage:  #imageLiteral(resourceName: "icons8-beach-ball-64"), productDesc: "Beach ball"))
                products.append(Product(productName: "Chair", productImage:  #imageLiteral(resourceName: "icons8-beach-chair-64"), productDesc: "Beach chair"))
                products.append(Product(productName: "Flops", productImage:  #imageLiteral(resourceName: "icons8-flip-flops-64"), productDesc: "Beach flip-flops"))
    }

}

