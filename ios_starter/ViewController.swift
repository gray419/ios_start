//
//  ViewController.swift
//  ios_starter
//
//  Created by Robert Gray on 5/5/19.
//  Copyright © 2019 Robert Gray. All rights reserved.
//

import UIKit
import SnapKit
import Snail
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "iOS Starter"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }

        let client = URLSession.shared
        guard let url = URL(string: "https://gist.githubusercontent.com/gray419/a0d58d14a6105c7f423d52210f723f4c/raw/c0ffb5c4ae3d8f417f3fd249f078e2f51ce02d35/movies.json") else {
            return
        }
        client.data(request: URLRequest(url: url)).subscribe(onNext: { data, _ in
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return
            }
            movieResponse.movies?.forEach {
                print("\($0.name ?? "No Title") - \($0.rating ?? 0.0)")
            }
        })
    }
}
