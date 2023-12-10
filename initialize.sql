-- drop the trax database if it exists
DROP database if EXISTS project;

-- create it afresh
CREATE database project;
\c project

\i create.SQL

-- load the data


\copy Users(userID) FROM data/users.csv csv header;
\copy RegisteredUsers(userID, email, password, gender, display_language, content_languages, local_customization, display_name, about) FROM data/registered_users.csv csv header;
\copy Subreddits(subredID, about, created_timestamp, visibility, rules, faqs, creator_userID) FROM data/subreddits.csv csv header;
\copy Subscriptions(subscriptionID, purchase_date, expr_date, holder_userID) FROM data/subscriptions.csv csv header;
\copy AdAccounts(accountID, creator_userID) FROM data/ad_accounts.csv csv header;
\copy Payments(amount, timestamp, method, note, payer_userID, subscriptionID, payer_ad_accountID) FROM data/payments.csv csv header; -- add one more attr!; deleted tID (serialized)
\copy Flairs(flairID, name, subredID) FROM data/flairs.csv csv header;
\copy UserFlairs(flairID) FROM data/user_flairs.csv csv header;
\copy PostFlairs(flairID) FROM data/post_flairs.csv csv header;
\copy Posts(IP, timestamp, title, content, original_content_tag, spoiler_tag, NSFW_tag, poster_userID, flairID, subredID) FROM data/posts.csv csv header; -- serialized ID
\copy AdvertisingMaterials(status, impressions, eCPM, click, CPC, CTR, accountID, transactionID) FROM data/ad_materials.csv csv header; -- serialized ID, normalized (deleted amount_spent)
\copy Campaigns(postID, ad_materialID, destination_url, call_to_action, allow_comments, target_type, locations, daily_budget) FROM data/campaigns.csv csv header;  -- changed comments to allow_comments; normalized (deleted headline & media)
\copy AdGroups(ad_materialID, name, locations, devices, carriers, placements, budget, bid, schedule, time_of_day, campaignID) FROM data/ad_groups.csv csv header;
\copy Ads(ad_materialID, name, type, headline, image, thumbnail_image, destination_url, display_url, call_to_action, ad_groupID) FROM data/ads.csv csv header;
\copy Audiences(audienceID, type, interests) FROM data/audiences.csv csv header;
\copy AudienceTargetings(ad_materialID, audienceID) FROM data/audience_targetings.csv csv header;
\copy AdAccountJoinings(userID, accountID) FROM data/ad_account_joinings.csv csv header;
\copy Guests(userID, IP, timestamp) FROM data/guests.csv csv header;
\copy Moderators(userID, subredID) FROM data/moderators.csv csv header;
\copy SubredditJoinings(userID, subredID) FROM data/subreddit_joinings.csv csv header;
\copy SubredditInvolvements(audienceID, subredID) FROM data/subreddit_involvements.csv csv header; -- new!
\copy UserRegulations(modID, userID) FROM data/user_regulations.csv csv header;
\copy PostRegulations(modID, postID) FROM data/post_regulations.csv csv header;
\copy FlairCreations(modID, flairID) FROM data/flair_creations.csv csv header; -- name changed!
\copy UserLabelings(userID, flairID) FROM data/user_labelings.csv csv header;
\copy Polls(postID, voting_length) FROM data/polls.csv csv header;
\copy PollOptions(optionID, content, postID) FROM data/poll_options.csv csv header;
\copy Comments(content, postID, reply_to_comID, commenter_userID) FROM data/comments.csv csv header;
\copy CommentRegulations(modID, comID) FROM data/comment_regulations.csv csv header;
\copy Interactions(type, postID, done_by_userID, comID) FROM data/interactions.csv csv header; -- delete id (it's serialized now)

DROP FUNCTION IF EXISTS fn_update_popularity();
CREATE FUNCTION fn_update_popularity()
RETURNS trigger
LANGUAGE plpgsql AS
$$
BEGIN
    if new.postID IS NOT NULL then
        if  new.type = 'upvote' or new.type = 'share' then 
            UPDATE Posts
            SET popularity = popularity + 1
            WHERE postID = new.postID;
        elsif (new.postID IS NOT NULL) AND (new.type = 'downvote') then
            UPDATE Posts
            SET popularity = popularity - 1
            WHERE postID = new.postID;
        end if;
    end if;

    return null;
END
$$ ;

CREATE TRIGGER tr_update_popularity
AFTER INSERT ON Interactions
FOR EACH ROW
EXECUTE FUNCTION fn_update_popularity()