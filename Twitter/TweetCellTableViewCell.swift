//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Matthew Kight on 10/11/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageVIew: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var rtBtn: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setRted(_ isrted:Bool){
        if(isrted)
        {
            rtBtn.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            rtBtn.isEnabled = false
        }else{
            rtBtn.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            rtBtn.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool)
    {
        favorited = isFavorited
        if(favorited)
        {
            favBtn.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favBtn.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func fav(_ sender: Any) {
            let toBeFav = !favorited
        if(toBeFav)
        {
            TwitterAPICaller.client?.favTweet(tweeetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("fav fail \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavTweet(tweeetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfav fail \(error)")
            })
        }
    }
    
    @IBAction func rt(_ sender: Any) {
        TwitterAPICaller.client?.rtTweet(tweetId: tweetId, success: {
            self.setRted(true)
        }, failure: { (error) in
            print("rt error \(error)")
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
