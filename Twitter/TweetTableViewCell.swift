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
    
    @IBAction func retweet(_ sender: Any)
    {
        
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
    
}
