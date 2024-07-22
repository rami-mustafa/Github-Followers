//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 15.07.24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    
    enum Section{ case main }

    // MARK: - Variables
    var username: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower] = []
    

    // MARK: - UI Components
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers(username: username, page: 1)
        configureDataSource()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
     }
    
    
    private func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    private  func configureDataSource() {
          dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
              cell.set(follower: follower)
              return cell
          })
      }
    
    
    private func getFollowers(username: String, page: Int) {
          Task {
             do {
                 let followers = try await NetworkManager.shared.getFollowers(for: username, page: page)
                 self.updateData(on: followers)
                 print(followers)
             } catch {
                 if let gfError = error as? GFError {
                     presentGFAlert(title: "Bad Stuff Happend", message: gfError.rawValue, buttonTitle: "Ok")
                 } else {
                  }
              }
         }
     }
    
    private func updateData(on followers: [Follower]) {
           var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
           snapshot.appendSections([.main])
           snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
        
       }
    
    
    
  
    
    
    
    // MARK: - Selectors
    
   
    
    
}


extension FollowerListVC: UICollectionViewDelegate {

    
   
}
