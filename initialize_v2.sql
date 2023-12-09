-- drop the trax database if it exists
DROP database if EXISTS project;

-- create it afresh
CREATE database project;
\c project

\i create_v4.SQL

-- load the data

\copy AdAccounts(accountID, creator_userID) FROM data/ad_accounts.csv csv header;
\copy AdAccountJoinings(userID, accountID) FROM data/ad_account_joinings.csv csv header;
\copy AdGroups(ad_materialID, name, locations, devices, carriers, placements, budget, bid, schedule, time_of_day, campaignID) FROM data/ad_groups.csv csv header;
\copy Ads(ad_materialID, name, type, headline, image, thumbnail_image, destination_url, display_url, call_to_action, ad_groupID) FROM data/ads.csv csv header;
\copy AdvertisingMaterials(ad_materialID, status, impressions, eCPM, click, CPC, CTR, amount_spent, accountID, transactionID) FROM data/ad_materials.csv csv header;
\copy Audiences(audienceID, type, interests) FROM data/audiences.csv csv header;
\copy AudienceTargetings(ad_materialID, audienceID) FROM data/audience_targetings.csv csv header;
\copy Campaigns(postID, ad_materialID, media, headline, destination_url, call_to_action, allow_comments, target_type, locations, daily_budget) FROM data/campaigns.csv csv header; -- changed comments to allow_comments
\copy Comments(comID, content, postID, reply_to_comID, commenter_userID) FROM data/comments.csv csv header;
\copy CommentRegulations(modID, comID) FROM data/comment_regulations.csv csv header;
\copy FlairCreations(modID, flairID) FROM data/flair_grantings.csv csv header; -- name changed!
\copy Flairs(flairID, name, subredID) FROM data/flairs.csv csv header;
\copy Guests(userID, IP, timestamp) FROM data/guests.csv csv header;
\copy Interactions(interactionID, type, postID, done_by_userID, comID) FROM data/interactions.csv csv header;
\copy Moderators(userID, subredID) FROM data/moderators.csv csv header;
\copy Payments(transactionID, amount, timestamp, method, note, payer_userID, subscriptionID, payer_ad_accountID) FROM data/payments.csv csv header; -- added one more attr!
\copy PollOptions(optionID, content, postID) FROM data/poll_options.csv csv header;
\copy Polls(postID, voting_length) FROM data/polls.csv csv header;
\copy PostFlairs(flairID) FROM data/post_flairs.csv csv header;
\copy PostRegulations(modID, postID) FROM data/post_regulations.csv csv header;
\copy Posts(postID, IP, timestamp, title, content, original_content_tag, spoiler_tag, NSFW_tag, poster_userID, flairID, subredID) FROM data/posts.csv csv header;
\copy RegisteredUsers(userID, email, password, gender, display_language, content_languages, local_customization, display_name, about) FROM data/registered_users.csv csv header;
\copy SubredditInvolvements(audienceID, subredID) FROM data/subreddit_involvements.csv csv header; -- new!
\copy SubredditJoinings(userID, subredID) FROM data/subreddit_joinings.csv csv header;
\copy Subreddits(subredID, about, created_timestamp, visibility, rules, faqs, creator_userID) FROM data/subreddits.csv csv header;
\copy Subscriptions(subscriptionID, purchase_date, expr_date, holder_userID) FROM data/subscriptions.csv csv header;
\copy Users(userID) FROM data/users.csv csv header;
\copy UserFlairs(flairID) FROM data/user_flairs.csv csv header;
\copy UserLabelings(userID, flairID) FROM data/user_labelings.csv csv header;
\copy UserRegulations(modID, userID) FROM data/user_regulations.csv csv header;