//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Jose Patino on 2/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favTweet(_ sender: Any)
    {
        let toBeFav = !favorited
        
        if (toBeFav)
        {
            TwitterAPICaller.client?.favTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure:{ (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
                
            })
        }
    }
    
    func setFavorite(_ isFavorited:Bool)
    {
        favorited = isFavorited
        if (favorited)
        {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func retweet(_ sender: Any)
    {
        let toBeRetweeted = !retweeted
        
        if (toBeRetweeted)
        {
            TwitterAPICaller.client?.favTweet(tweetId: tweetId, success: {
                self.setRetweet(true)
            }, failure:{ (error) in
                print("Retweet did not succeed: \(error)")
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavTweet(tweetId: tweetId, success: {
                self.setRetweet(false)
            }, failure: { (error) in
                print("Unretweet did not succeed: \(error)")
                
            })
        }
    }
    
    func setRetweet(_ isRetweeted:Bool)
    {
        retweeted = isRetweeted
        if (retweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else
        {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
}
