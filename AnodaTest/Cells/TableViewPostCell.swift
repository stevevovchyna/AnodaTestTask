//
//  TableViewPostCell.swift
//  AnodaTestApp
//
//  Created by Steven Vovchyna on 11.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit
import SnapKit
import ScrollingPageControl

class TableViewPostCell: UITableViewCell {
    
    let screenSize = UIScreen.main.bounds.size
    var postImageCollectionViewModel: PostImageCollectionViewModel?
    let boldFontAttributedStringKey = [
        NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 14.0)!]
    let lightFontAttributesStringKey = [
        NSAttributedString.Key.font: UIFont(name: "Helvetica-Light", size: 14.0)!]

    let backView: UIView = ordinaryView()
    let topView: UIView = ordinaryView()
    let avatarView: UIView = ordinaryView()
    let usernameLabel: UILabel = ordinaryLabel(UIFont(name: "Helvetica", size: 14)!, UIColor.label, 1)
    let locationLabel: UILabel = ordinaryLabel(UIFont(name: "Helvetica-Light", size: 12)!, UIColor.label, 1)
    let optionsButtonView: UIView = ordinaryView()
    let optionsButton: UIButton = ordinaryButton("options")
    let mainImageView: UIView = ordinaryView()
    let bottomView: UIView = ordinaryView()
    let likeButton: UIButton = ordinaryButton("like")
    let commentButton: UIButton = ordinaryButton("comment")
    let sendButton: UIButton = ordinaryButton("send")
    let saveButton: UIButton = ordinaryButton("save")
    let likesView: UIView = ordinaryView()
    let commentsView: UIView = ordinaryView()
    let datePostedView: UIView = ordinaryView()
    let likesLabel: UILabel = ordinaryLabel(UIFont(name: "Helvetica-Light", size: 14)!, .label, 0)
    let commentsLabel: UILabel = ordinaryLabel(UIFont(name: "Helvetica", size: 14)!, .label, 0)
    let datePostedLabel: UILabel = ordinaryLabel(UIFont(name: "Helvetica-Light", size: 10)!, .gray, 1)
    
    let usernameAndLocationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 0
        return stackView
    }()
    
    let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "avatar1")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 36 / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainImageCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 0
        viewLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    let pageControl: ScrollingPageControl = {
        let view = ScrollingPageControl()
        view.dotColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.selectedColor = #colorLiteral(red: 0.2470588235, green: 0.6470588235, blue: 1, alpha: 1)
        view.maxDots = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupPostImage(images: [String]) {
        self.postImageCollectionViewModel = PostImageCollectionViewModel(
            images: images,
            control: self.pageControl)
        mainImageCollectionView.delegate = self.postImageCollectionViewModel
        mainImageCollectionView.dataSource = self.postImageCollectionViewModel
        mainImageCollectionView.register(
            PostImageCell.self,
            forCellWithReuseIdentifier: PostImageCell.identifier)
        mainImageCollectionView.reloadData()
    }
    
    private func addSubviews() {
        addSubview(backView)
        backView.addSubview(topView)
        backView.addSubview(mainImageView)
        backView.addSubview(bottomView)
        backView.addSubview(likesView)
        backView.addSubview(commentsView)
        backView.addSubview(datePostedView)
        topView.addSubview(avatarView)
        topView.addSubview(usernameAndLocationStackView)
        topView.addSubview(optionsButtonView)
        avatarView.addSubview(avatarImageView)
        usernameAndLocationStackView.addArrangedSubview(usernameLabel)
        usernameAndLocationStackView.addArrangedSubview(locationLabel)
        optionsButtonView.addSubview(optionsButton)
        bottomView.addSubview(likeButton)
        bottomView.addSubview(commentButton)
        bottomView.addSubview(sendButton)
        bottomView.addSubview(saveButton)
        bottomView.addSubview(pageControl)
        likesView.addSubview(likesLabel)
        commentsView.addSubview(commentsLabel)
        datePostedView.addSubview(datePostedLabel)
        mainImageView.addSubview(mainImageCollectionView)
    }
    
    func setupViews() {
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
                .inset(
                    UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        // MARK:- TOP VIEW CONSTRAINTS SETUP
        topView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(backView).offset(0)
            make.leading.equalTo(backView).offset(0)
            make.trailing.equalTo(backView).offset(0)
            make.height.equalTo(50)
        }
        
        avatarView.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.top.equalTo(topView.snp.top).offset(0)
            make.left.equalTo(topView.snp.left).offset(0)
            make.bottom.equalTo(topView.snp.bottom).offset(0)
            make.right
                .equalTo(usernameAndLocationStackView.snp.left)
                .offset(0)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(36)
            make.edges.equalTo(avatarView)
                .inset(
                    UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 10))
        }
        
        usernameAndLocationStackView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.top).offset(7)
            make.left.equalTo(avatarView.snp.right).offset(0)
            make.right.equalTo(optionsButtonView.snp.left).offset(0)
            make.bottom.equalTo(topView.snp.bottom).offset(-7)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.left
                .equalTo(usernameAndLocationStackView.snp.left)
                .offset(5)
                .priority(900)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left
                .equalTo(usernameAndLocationStackView.snp.left)
                .offset(5)
                .priority(900)
        }

        optionsButtonView.snp.makeConstraints { make in
            make.width.equalTo(42)
            make.top.equalTo(topView.snp.top).offset(0)
            make.left
                .equalTo(self.usernameAndLocationStackView.snp.right)
                .offset(0)
            make.right.equalTo(topView.snp.right).offset(0)
            make.bottom.equalTo(topView.snp.bottom).offset(0)
        }
        
        optionsButton.snp.makeConstraints { make in
            make.edges
                .equalTo(optionsButtonView)
                .inset(
                    UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        // MARK:- MAIN IMAGE VIEW CONSTRAINTS SETUP
        mainImageView.snp.makeConstraints { make in
            make.height.equalTo(screenSize.width).priority(900)
            make.width.equalTo(screenSize.width).priority(900)
            make.top.equalTo(topView.snp.bottom).offset(0)
            make.left.equalTo(backView.snp.left).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(0)
            make.bottom.equalTo(bottomView.snp.top).offset(0)
        }
        
        mainImageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.top).offset(0)
            make.left.equalTo(mainImageView.snp.left).offset(0)
            make.right.equalTo(mainImageView.snp.right).offset(0)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(0)
        }
        
        // MARK:- BOTTOM VIEW CONSTRAINTS SETUP
        bottomView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(mainImageView.snp.bottom).offset(0)
            make.left.equalTo(backView.snp.left).offset(0)
            make.right.equalTo(backView.snp.right).offset(0)
            make.bottom.equalTo(likesView.snp.top).offset(0)
            make.height.equalTo(50)
        }
        
        likeButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.top.equalTo(bottomView.snp.top).offset(0)
            make.left.equalTo(bottomView.snp.left).offset(5)
            make.bottom.equalTo(bottomView.snp.bottom).offset(0)
            make.right.equalTo(commentButton.snp.left).offset(0)
        }
        
        commentButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.top.equalTo(bottomView.snp.top).offset(0)
            make.left.equalTo(likeButton.snp.right).offset(0)
            make.bottom.equalTo(bottomView.snp.bottom).offset(0)
            make.right.equalTo(sendButton.snp.left).offset(0)
        }
        
        sendButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.top.equalTo(bottomView.snp.top).offset(0)
            make.left.equalTo(commentButton.snp.right).offset(0)
            make.bottom.equalTo(bottomView.snp.bottom).offset(0)
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(0)
            make.bottom.equalTo(bottomView.snp.bottom).offset(0)
            make.center.equalTo(bottomView)
        }
        
        saveButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.top.equalTo(bottomView.snp.top).offset(0)
            make.bottom.equalTo(bottomView.snp.bottom).offset(0)
            make.right.equalTo(bottomView.snp.right).offset(-6)
        }
        
        // MARK:- LIKES VIEW CONSTRAINTS SETUP
        likesView.snp.makeConstraints { make in
            make.height.equalTo(1).priority(1)
            make.top.equalTo(bottomView.snp.bottom).offset(0)
            make.left.equalTo(backView.snp.left).offset(0)
            make.right.equalTo(backView.snp.right).offset(0)
            make.bottom.equalTo(commentsView.snp.top).offset(0)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(0)
            make.edges
                .equalTo(likesView)
                .inset(
                    UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        }
        
        // MARK:- COMMENTS VIEW CONSTRAINTS SETUP
        setupCommentsViewConstraints(heightZero: false)
        commentsLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(0)
            make.edges
                .equalTo(commentsView)
                .inset(
                    UIEdgeInsets(top: 8, left: 14, bottom: 5, right: 14))
        }
        
        // MARK:- DATE POSTED VIEW CONSTRAINTS SETUP
        datePostedView.snp.makeConstraints { make in
            make.top.equalTo(commentsView.snp.bottom).offset(0)
            make.leading.equalTo(backView).offset(0)
            make.trailing.equalTo(backView).offset(0)
            make.bottom.equalTo(backView.snp.bottom).offset(0)
        }
        
        datePostedLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.edges
                .equalTo(datePostedView)
                .inset(
                    UIEdgeInsets(top: 5, left: 14, bottom: 10, right: 14))
        }
 
    }
    
    private func setupLocationLabel(with location: String?) {
        if let locationText = location {
            self.locationLabel.text = locationText
        } else {
            self.locationLabel.isHidden = true
        }
    }
    
    private func setupPageControl(for number: Int) {
        switch number {
        case 1:
            self.pageControl.isHidden = true
        case 2..<5:
            self.pageControl.maxDots = 5
            self.pageControl.centerDots = 5
        default:
            self.pageControl.maxDots = 7
            self.pageControl.centerDots = 3
        }
        self.pageControl.pages = number
    }
    
    private func formDateText(from date: String) -> String {
        guard let dateDouble = Double(date), let dateInterval = TimeInterval(exactly: dateDouble) else {
            return "time data unavailable".uppercased()
        }
        return Date(timeIntervalSince1970: dateInterval).timeAgoSinceNow.uppercased()
    }
    
    private func setupCommentsViewConstraints(heightZero: Bool) {
        commentsView.snp.makeConstraints { make in
            make.top.equalTo(likesView.snp.bottom).offset(0)
            make.leading.equalTo(backView).offset(0)
            make.trailing.equalTo(backView).offset(0)
            make.bottom.equalTo(datePostedView.snp.top).offset(0)
            if heightZero {
                make.height.equalTo(0)
            } else {
                make.height.greaterThanOrEqualTo(0)
            }
        }
    }
    
    private func setupCommentsView(with text: String, username: String) {
        if text.isEmpty {
            commentsLabel.snp.remakeConstraints { make in
                make.height.equalTo(0)
                make.edges
                    .equalTo(commentsView)
                    .inset(
                        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            }
            setupCommentsViewConstraints(heightZero: true)
        } else {
            self.commentsLabel.attributedText = formUserComment(username: username, comment: text)
        }
    }
    
    func setupCellData(with post: PostData) {
        self.usernameLabel.text = post.username
        setupLocationLabel(with: post.locationName)
        self.avatarImageView.image = UIImage(named: post.userAvatar)
        self.setupPostImage(images: post.postImages)
        self.likesLabel.attributedText = formLikesString(from: post.lastLikers, with: post.numberOfLikes)
        setupCommentsView(with: post.postText, username: post.username)
        self.datePostedLabel.text = formDateText(from: post.postDate)
        self.setupPageControl(for: post.postImages.count)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}

extension TableViewPostCell {
    private func formLikesString(from likers: [String], with numberOfLikes: Int) -> NSAttributedString {
        // setting initial string
        if !likers.isEmpty {
            let finalString = NSMutableAttributedString(string: "Liked by")
            //adding users' names separated with comma
            for liker in likers {
                let usernameString = NSMutableAttributedString(
                    string: " \(liker),",
                    attributes: boldFontAttributedStringKey)
                finalString.append(usernameString)
            }
            // deleting last unnecessary comma
            finalString.deleteCharacters(
                in: NSRange(
                    location: finalString.length - 1,
                    length: 1))
            finalString.append(
                NSAttributedString(
                    string: " and "))
            // adding string wit number of likes
            finalString.append(
                NSAttributedString(
                    string: "\(numberOfLikes - likers.count) others",
                    attributes: boldFontAttributedStringKey))
            // setting line height
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 1.5
            finalString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSRange(location: 0, length: finalString.length))
            return finalString
        } else {
            return NSMutableAttributedString(string: "\(numberOfLikes) likes", attributes: boldFontAttributedStringKey)
        }
    }
    
    // method to find first occurrence of symbols not highlighted with hashtag or username
    private func getFirstOccurence(of symbols: String, in word: String) -> Character? {
        return word.first { (el) -> Bool in
            return !el.isLetter && !symbols.contains(el)
        }
    }
    
    // get the part of the word from the beginning to the first occurrence of the forbidden symbol
    private func getFirstPartOfTheWord(_ word: String, by occurence: Character) -> String {
        return word.components(separatedBy: occurence.description).first!
    }
    
    
    private func formatCommentString(_ finalString: inout NSMutableAttributedString, word: String) {
        // in case string has symbols that are not included in the hashtag or username mention
        if let occurence = getFirstOccurence(of: "@#_", in: word) {
            let firstWord = getFirstPartOfTheWord(word, by: occurence)
            finalString
                .append(
                    NSAttributedString(
                        string: "#\(firstWord)",
                        attributes: getHashTagTextAttributes()))
            // formatting rest of the string as an ordinaly string
            if let index = word.firstIndex(of: occurence) {
                finalString
                    .append(
                        NSAttributedString(
                            string: String(word[index...]),
                            attributes: lightFontAttributesStringKey))
            }
        } else {
            if word != "" {
                finalString
                    .append(
                        NSAttributedString(
                            string: "#\(word)",
                            attributes: getHashTagTextAttributes()))
            }
        }
    }
    
    private func getHashTagTextAttributes() -> [NSAttributedString.Key : Any] {
        var hashtagAttributes = [NSAttributedString.Key : Any]()
        hashtagAttributes[NSAttributedString.Key.font] = UIFont(name: "Helvetica-Light", size: 14.0)
        hashtagAttributes[NSAttributedString.Key.foregroundColor] = UIColor(named: "hashColor")
        return hashtagAttributes
    }
    
    private func formUserComment(username: String, comment: String) -> NSAttributedString {
        // counting occurences of "@" in the comment text to be able to replace them in the final string
        let mentionIndexes: [Int] = comment.indices(of: "@")
        // setting initial string
        var finalString = NSMutableAttributedString(
            string: "\(username) ",
            attributes: boldFontAttributedStringKey)
        // separating string by #s and @s
        let words = comment.components(separatedBy: ["#", "@"])
        // setting initial index
        var index = words.index(0, offsetBy: 0)
        // in case first word has # or @, we have to handle first element of the array(it is empty)
        if words.first == "", words.count > 1 {
            formatCommentString(&finalString, word: words[1])
            index = words.index(0, offsetBy: 2)
        } else if words.count > 1, !words.first!.isEmpty {
            finalString.append(
                NSAttributedString(
                    string: "\(words[0])",
                    attributes: lightFontAttributesStringKey))
            index = words.index(0, offsetBy: 1)
        }
        // iterating trough the array and formatting string where needed(all #s and @s will be replaced with #)
        for word in words[index...] {
            if !word.isEmpty {
                formatCommentString(&finalString, word: word)
            }
        }
        // replacing all # positions with @ where needed
        for position in mentionIndexes {
            let location = position + username.count + 1
            let replaceRange = NSRange(
                location: location,
                length: 1)
            finalString.replaceCharacters(
                in: replaceRange,
                with: NSAttributedString(
                    string: "@",
                    attributes: getHashTagTextAttributes()))
        }
        // setting line height
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.5
        finalString.addAttributes(
            [NSAttributedString.Key.paragraphStyle : paragraphStyle],
            range: NSRange(
                location: 0,
                length: finalString.length))
        return finalString
    }
}

extension TableViewPostCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
