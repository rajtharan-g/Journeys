//
//  SearchAddressViewController.swift
//  Journeys
//
//  Created by Rajtharan Gopal on 20/07/18.
//  Copyright © 2018 Rajtharan Gopal. All rights reserved.
//

import UIKit

protocol SearchAddressViewControllerDelegate: class {
    func selectedAddress(address: Address)
}

class SearchAddressViewController: UIViewController {
    
    // MARK: - Types
    
    // Constants for Storyboard/ViewControllers.
    static let storyboardName = "Main"
    static let viewControllerIdentifier = "SearchAddressViewController"
    
    static let tableViewCellIdentifier = "AddressCellID"

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var addressArray: [Address] = []
    weak var delegate: SearchAddressViewControllerDelegate?
    
    // MARK: - Initialization
    
    class func searchAddressViewController() -> SearchAddressViewController {
        let storyboard = UIStoryboard(name: SearchAddressViewController.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: SearchAddressViewController.viewControllerIdentifier) as! SearchAddressViewController
        return viewController
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addressTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Configuration
    
    func configureCell(_ cell: UITableViewCell, forAddress address: Address) {
        cell.textLabel?.text = address.formattedAddress
    }
    
    // MARK: - Custom methods
    
    func fetchAddressForPlaceName(placeName: String) {
        if placeName.isEmpty {
            addressArray = []
            tableView.reloadData()
        } else {
            Manager.shared.geocode(placeName: placeName) { (addressArray, error) in
                self.addressArray = addressArray ?? []
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: - UITextFieldDelegate

extension SearchAddressViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var finalString = ""
        if string.count > 0 { // if it was not delete character
            finalString = addressTextField.text! + string
        } else if addressTextField.text!.count > 0 { // if it was a delet character
            finalString = String(addressTextField.text!.dropLast())
        }
        fetchAddressForPlaceName(placeName: finalString)
        return true
    }
    
}

// MARK: - UITableViewDataSource

extension SearchAddressViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchAddressViewController.tableViewCellIdentifier, for: indexPath)
        
        let address = addressArray[indexPath.row]
        configureCell(cell, forAddress: address)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SearchAddressViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedAddress(address: addressArray[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
}
