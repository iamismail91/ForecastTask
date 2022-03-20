//
//  ForecastViewController.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var viewModel = ForecastViewModel()
    let locationManager = CLLocationManager()
    var currentCity = ""
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cityName: UILabel!{
        didSet {
            cityName.text = ""
        }
    }
    @IBOutlet weak var lblCelsius: UILabel!{
        didSet {
            lblCelsius.text = ""
        }
    }
    @IBOutlet weak var currentTemp: UILabel!{
        didSet {
            currentTemp.text = ""
        }
    }
    @IBOutlet weak var maxTemp: UILabel!{
        didSet {
            maxTemp.text = ""
        }
    }
    @IBOutlet weak var minTemp: UILabel!{
        didSet {
            minTemp.text = ""
        }
    }
    @IBOutlet weak var lblMain: UILabel!{
        didSet {
            lblMain.text = ""
        }
    }
    @IBOutlet weak var lblHumidity: UILabel!{
        didSet {
            lblHumidity.text = ""
        }
    }
    @IBOutlet weak var feelLike: UILabel!{
        didSet {
            feelLike.text = ""
        }
    }
    @IBOutlet weak var icon: UIImageView!
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
#if targetEnvironment(simulator)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.showAlert(message: "Please run on real iphone device")
        }
#endif
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                print("no")
            case.restricted, .denied:
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                    self?.showAlert(message: "Please turn on your mobile location")
                }
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("ok")
                
            default:
                ()
            }
        }
        
        configureTableView()
        getCurrentLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    
    
    // MARK: - Helping Methods
    
    func configureTableView() {
        /// TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        /// To remove the extra cells
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.estimatedSectionHeaderHeight = 0.1
        tableView.rowHeight = UITableView.automaticDimension
        
        // Register TableView Cell
        tableView.registerCell(with: GeneralTableViewCell.self)
    }
    
    func showAlert(message: String, title: String = "Sorry"){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func updatedUI() {
        let current = viewModel.currentWeatherModel?.main
        lblCelsius.text = "°C"
        cityName.text = currentCity
        currentTemp.text = "\(convertFormula(kelvin: current?.temp?.doubleValue ?? 0))"
        maxTemp.text = "High \(convertFormula(kelvin: current?.temp_max?.doubleValue ?? 0))°C"
        minTemp.text = "Low \(convertFormula(kelvin: current?.temp_min?.doubleValue ?? 0))°C"
        lblHumidity.text = "Humidity : \(current?.humidity?.intValue ?? 0)%"
        feelLike.text = "Feel Like : \(convertFormula(kelvin: current?.feels_like?.doubleValue ?? 0))°C"
        lblMain.text = viewModel.currentWeatherModel?.weather?[0].main?.stringValue ?? ""
        let imgName = viewModel.currentWeatherModel?.weather?[0].icon?.stringValue ?? ""
        let imageURL = "http://openweathermap.org/img/wn/\(imgName).png"
        if let url = URL(string: imageURL) {
            icon.kf.setImage(with: url, placeholder: UIImage(named: "icon"), options: nil, completionHandler: nil)

        }
    }
    
    func loader(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - API Methods
    
    func forecastDataLoad(completion: @escaping (Bool) -> Void ) {
        viewModel.forecastDataLoad(city: currentCity) {
            errorMessage in
            if let error = errorMessage {
                self.showAlert(message: error)
            } else {
                completion(true)
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func currentDataLoad(completion: @escaping (Bool) -> Void ) {
        loader()
        viewModel.currentWeatherLoad(city: currentCity) {
            errorMessage in
            if let error = errorMessage {
                self.dismiss(animated: false, completion: nil)
                self.showAlert(message: error)
            } else {
                completion(true)
            }
        }
    }
}


// MARK: - TableView Delegate

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(with: GeneralTableViewCell.self, at: indexPath) else {
            fatalError("xib not found")
        }
        let list = viewModel.forecastModel?.list?[indexPath.row]
        cell.updatedCell(humidity: list?.humidity?.intValue ?? 0, main: list?.weather?[0].main?.stringValue ?? "", maxTmp: list?.temp?.max?.doubleValue ?? 0, minTmp: list?.temp?.min?.doubleValue ?? 0, iconName: list?.weather?[0].icon?.stringValue ?? "")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - CLLocationManager Methods

extension ForecastViewController: CLLocationManagerDelegate {
    
    func getCurrentLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ zipCode:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       placemarks?.first?.postalCode,
                       error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        locationManager.stopUpdatingLocation()
        fetchCityAndCountry(from: location) { [self] city, country, zipCode, error in
            self.currentCity = city ?? ""
            if currentCity != "" {
                currentDataLoad() { success in
                    if success {
                        updatedUI()
                        forecastDataLoad() { success in
                            if success {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
           }
            
        }
    }
}
