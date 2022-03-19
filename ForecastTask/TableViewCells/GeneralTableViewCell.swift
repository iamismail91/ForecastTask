//
//  GeneralTableViewCell.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import UIKit
import Kingfisher

class GeneralTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var lblTmpMin: UILabel!
    @IBOutlet weak var lblTmpMax: UILabel!
    @IBOutlet weak var showIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - Helper Methods
    
    func updatedCell(humidity: Int, main: String, maxTmp: Double, minTmp: Double, iconName: String){
        lblHumidity.text = "Humidity : \(humidity)%"
        lblMain.text = main
        lblTmpMax.text = "\(convertFormula(kelvin: maxTmp))°C"
        lblTmpMin.text = "\(convertFormula(kelvin: minTmp))°C"
        let imageURL = "http://openweathermap.org/img/wn/\(iconName).png"
        if let url = URL(string: imageURL) {
            showIcon.kf.setImage(with: url, placeholder: UIImage(named: "icon"), options: nil, completionHandler: nil)

        }
    }
}

