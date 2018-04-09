//
//  HomeViewController.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.circleView.alpha = 0.0
        circleView.updateIndicator(with: 0.0)
        bind() 
    }
    
    private func bind() {
        viewModel.getReport()
        viewModel.report.bind { [unowned self] report in
            guard let _ = report else {
                //Handle error if needed
                return
            }
            self.showcircleView(show: true)
            self.maxScoreLabel.text = self.viewModel.maxScore
            self.incrementLabel(to: self.viewModel.score)
            self.circleView.updateIndicator(with: self.viewModel.percentageScore, isAnimated: true)
            self.descriptionLabel.text = self.viewModel.description
        }
    }
    
    private func incrementLabel(to endValue: Int?) {
        guard let endValue = endValue else {
            return
        }
        
        let duration: Double = 2.0 //seconds
        DispatchQueue.global().async {
            for i in 0 ..< (endValue + 1) {
                let sleepTime = (duration/Double(endValue) * 1000000.0)
                usleep(useconds_t(sleepTime))
                DispatchQueue.main.async {
                    self.scoreLabel.text = "\(i)"
                }
            }
        }
    }
    
    func showcircleView(show: Bool) {
        let animator = UIViewPropertyAnimator(duration: 0.0, curve: .easeInOut) {
            self.circleView.alpha = show ? 1.0 : 0.0
        }
        animator.startAnimation()
    }
}

