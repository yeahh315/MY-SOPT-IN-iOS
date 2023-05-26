//
//  EditRecallViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/22.
//

import UIKit

import SnapKit
import Then


final class EditRecallViewController: UIViewController {
    
    private let addNavigationbar = Customnavigationbar("회고 수정").then{
        $0.navigationBack.addTarget(self, action: #selector(popToEditRecallViewController), for: .touchUpInside)
    }
    
    private let backcolor = UIView().then {
        $0.backgroundColor = UIColor.Gray.gray_50
    }
    
    private let recallView = RecallView()
    
    private let editdateLabel = UILabel().then {
        $0.text = "2023년 5월 7일"
        $0.font = UIFont.title2Font()
        $0.textColor = UIColor.Gray.gray_800
    }
    
    private let saverecallButton = UIButton().then() {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = UIFont.subtitleFont()
        $0.setTitleColor(UIColor.Primary.primary_900, for: .normal)
        $0.backgroundColor = UIColor.Primary.primary
        $0.addTarget(self, action: #selector(tappedSaveEditRecall), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setUI(){
        view.backgroundColor = .white
        view.addSubviews(
            addNavigationbar,
            backcolor,
            editdateLabel,
            recallView,
            saverecallButton
        )
        
        addNavigationbar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        backcolor.snp.makeConstraints {
            $0.top.equalTo(addNavigationbar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        editdateLabel.snp.makeConstraints {
            $0.bottom.equalTo(recallView.recallTextView.snp.top).offset(-57)
            $0.leading.equalToSuperview().offset(16)
        }
        
        recallView.snp.makeConstraints {
            $0.top.equalTo(addNavigationbar.snp.bottom).offset(55)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        saverecallButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(71)
        }
        
    }
    
    @objc
    private func popToEditRecallViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func tappedSaveEditRecall() {
        RetroAPI.shared.postAddRetro(dateRequest: ["isPublic" : "true",
                                                   "descRoutine" : recallView.recallTextView.text,
                                                   "descBest" : recallView.bestTextView.text,
                                                   "descSelf" : recallView.wantsayTextView.text,
                                     "writtenDate" : "2023-05-11"], completion: { result in
                switch result {
                case .success(_):
                    print("Success")
                default:
                    print("Failed")
                    return
                }
            })
    }
}
