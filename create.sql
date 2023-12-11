-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-11 01:36:52.063

-- tables
-- Table: AdAccountJoinings
CREATE TABLE AdAccountJoinings (
    userID int  NOT NULL,
    accountID int  NOT NULL,
    CONSTRAINT AdAccountJoinings_pk PRIMARY KEY (userID,accountID)
);

-- Table: AdAccounts
CREATE TABLE AdAccounts (
    accountID int  NOT NULL,
    creator_userID int  NOT NULL,
    CONSTRAINT AdAccounts_pk PRIMARY KEY (accountID)
);

-- Table: AdGroups
CREATE TABLE AdGroups (
    ad_materialID int  NOT NULL,
    name text  NOT NULL,
    locations text  NOT NULL,
    devices text  NOT NULL,
    carriers text  NOT NULL,
    placements text  NOT NULL,
    budget decimal(15,2)  NOT NULL,
    bid text  NOT NULL,
    schedule text  NOT NULL,
    time_of_day time  NOT NULL,
    campaignID int  NOT NULL,
    CONSTRAINT AdGroups_pk PRIMARY KEY (ad_materialID)
);

-- Table: Ads
CREATE TABLE Ads (
    ad_materialID int  NOT NULL,
    name text  NOT NULL,
    type text  NOT NULL,
    headline text  NOT NULL,
    image text  NOT NULL,
    thumbnail_image text  NOT NULL,
    destination_url text  NOT NULL,
    display_url text  NOT NULL,
    call_to_action text  NOT NULL,
    ad_groupID int  NOT NULL,
    CONSTRAINT Ads_pk PRIMARY KEY (ad_materialID)
);

-- Table: AdvertisingMaterials
CREATE TABLE AdvertisingMaterials (
    ad_materialID int  NOT NULL,
    status text  NOT NULL,
    impressions int  NOT NULL,
    eCPM decimal(15,3)  NOT NULL,
    click int  NOT NULL,
    CPC decimal(10,2)  NOT NULL,
    CTR decimal(10,2)  NOT NULL,
    accountID int  NOT NULL,
    transactionID int  NOT NULL,
    CONSTRAINT AdvertisingMaterials_pk PRIMARY KEY (ad_materialID)
);

-- Table: AudienceTargetings
CREATE TABLE AudienceTargetings (
    ad_materialID int  NOT NULL,
    audienceID int  NOT NULL,
    CONSTRAINT AudienceTargetings_pk PRIMARY KEY (ad_materialID,audienceID)
);

-- Table: Audiences
CREATE TABLE Audiences (
    audienceID int  NOT NULL,
    type text  NOT NULL,
    interests text  NOT NULL,
    CONSTRAINT Audiences_pk PRIMARY KEY (audienceID)
);

-- Table: Campaigns
CREATE TABLE Campaigns (
    postID int  NOT NULL,
    ad_materialID int  NOT NULL,
    destination_url text  NOT NULL,
    call_to_action text  NOT NULL,
    allow_comments boolean  NOT NULL,
    target_type text  NOT NULL,
    locations text  NOT NULL,
    daily_budget decimal(15,3)  NOT NULL,
    CONSTRAINT Campaigns_pk PRIMARY KEY (postID,ad_materialID)
);

-- Table: CommentRegulations
CREATE TABLE CommentRegulations (
    modID int  NOT NULL,
    comID int  NOT NULL,
    CONSTRAINT CommentRegulations_pk PRIMARY KEY (modID,comID)
);

-- Table: Comments
CREATE TABLE Comments (
    comID int  NOT NULL,
    content text  NOT NULL,
    postID int  NULL,
    reply_to_comID int  NULL,
    commenter_userID int  NOT NULL,
    CONSTRAINT Comments_pk PRIMARY KEY (comID)
);

-- Table: FlairCreations
CREATE TABLE FlairCreations (
    modID int  NOT NULL,
    flairID int  NOT NULL,
    CONSTRAINT FlairCreations_pk PRIMARY KEY (modID,flairID)
);

-- Table: Flairs
CREATE TABLE Flairs (
    flairID int  NOT NULL,
    name text  NOT NULL,
    subredID int  NOT NULL,
    CONSTRAINT Flairs_pk PRIMARY KEY (flairID)
);

-- Table: Guests
CREATE TABLE Guests (
    userID int  NOT NULL,
    IP text  NOT NULL,
    timestamp timestamp  NOT NULL,
    CONSTRAINT Guests_pk PRIMARY KEY (userID)
);

-- Table: Interactions
CREATE TABLE Interactions (
    interactionID int  NOT NULL,
    type text  NOT NULL,
    postID int  NULL,
    done_by_userID int  NOT NULL,
    comID int  NULL,
    CONSTRAINT Interactions_pk PRIMARY KEY (interactionID)
);

-- Table: Moderators
CREATE TABLE Moderators (
    userID int  NOT NULL,
    subredID int  NOT NULL,
    CONSTRAINT Moderators_pk PRIMARY KEY (userID)
);

-- Table: Payments
CREATE TABLE Payments (
    transactionID int  NOT NULL,
    amount decimal(10,2)  NOT NULL,
    timestamp timestamp  NOT NULL,
    method text  NOT NULL,
    note text  NULL,
    payer_userID int  NULL,
    subscriptionID int  NULL,
    payer_ad_accountID int  NULL,
    CONSTRAINT Payments_pk PRIMARY KEY (transactionID)
);

-- Table: PollOptions
CREATE TABLE PollOptions (
    optionID int  NOT NULL,
    content text  NOT NULL,
    postID int  NOT NULL,
    CONSTRAINT PollOptions_pk PRIMARY KEY (optionID)
);

-- Table: Polls
CREATE TABLE Polls (
    postID int  NOT NULL,
    voting_length text  NOT NULL,
    CONSTRAINT Polls_pk PRIMARY KEY (postID)
);

-- Table: PostFlairs
CREATE TABLE PostFlairs (
    flairID int  NOT NULL,
    CONSTRAINT PostFlairs_pk PRIMARY KEY (flairID)
);

-- Table: PostRegulations
CREATE TABLE PostRegulations (
    modID int  NOT NULL,
    postID int  NOT NULL,
    CONSTRAINT PostRegulations_pk PRIMARY KEY (modID,postID)
);

-- Table: Posts
CREATE TABLE Posts (
    postID int  NOT NULL,
    IP text  NOT NULL,
    timestamp timestamp  NOT NULL,
    title text  NOT NULL,
    content text  NOT NULL,
    original_content_tag boolean  NOT NULL,
    spoiler_tag boolean  NOT NULL,
    NSFW_tag boolean  NOT NULL,
    poster_userID int  NULL,
    subredID int  NOT NULL,
    flairID int  NULL,
    popularity int  NOT NULL,
    CONSTRAINT Posts_pk PRIMARY KEY (postID)
);

-- Table: RegisteredUsers
CREATE TABLE RegisteredUsers (
    userID int  NOT NULL,
    email text  NOT NULL,
    password text  NOT NULL,
    gender text  NOT NULL,
    display_language text  NOT NULL,
    content_languages text  NOT NULL,
    local_customization text  NOT NULL,
    display_name text  NOT NULL,
    about text  NOT NULL,
    CONSTRAINT RegisteredUsers_pk PRIMARY KEY (userID)
);

-- Table: SubredditInvolvements
CREATE TABLE SubredditInvolvements (
    audienceID int  NOT NULL,
    subredID int  NOT NULL,
    CONSTRAINT SubredditInvolvements_pk PRIMARY KEY (audienceID,subredID)
);

-- Table: SubredditJoinings
CREATE TABLE SubredditJoinings (
    userID int  NOT NULL,
    subredID int  NOT NULL,
    CONSTRAINT SubredditJoinings_pk PRIMARY KEY (userID,subredID)
);

-- Table: Subreddits
CREATE TABLE Subreddits (
    subredID int  NOT NULL,
    about text  NOT NULL,
    created_timestamp timestamp  NOT NULL,
    visibility text  NOT NULL,
    rules text  NOT NULL,
    faqs text  NOT NULL,
    creator_userID int  NOT NULL,
    CONSTRAINT Subreddits_pk PRIMARY KEY (subredID)
);

-- Table: Subscriptions
CREATE TABLE Subscriptions (
    subscriptionID int  NOT NULL,
    purchase_date date  NOT NULL,
    expr_date date  NOT NULL,
    holder_userID int  NOT NULL,
    CONSTRAINT Subscriptions_pk PRIMARY KEY (subscriptionID)
);

-- Table: UserFlairs
CREATE TABLE UserFlairs (
    flairID int  NOT NULL,
    CONSTRAINT UserFlairs_pk PRIMARY KEY (flairID)
);

-- Table: UserLabelings
CREATE TABLE UserLabelings (
    userID int  NOT NULL,
    flairID int  NOT NULL,
    CONSTRAINT UserLabelings_pk PRIMARY KEY (flairID,userID)
);

-- Table: UserRegulations
CREATE TABLE UserRegulations (
    modID int  NOT NULL,
    userID int  NOT NULL,
    CONSTRAINT UserRegulations_pk PRIMARY KEY (modID,userID)
);

-- Table: Users
CREATE TABLE Users (
    userID int  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (userID)
);

-- foreign keys
-- Reference: AdAccountJoining_RegisteredUsers (table: AdAccountJoinings)
ALTER TABLE AdAccountJoinings ADD CONSTRAINT AdAccountJoining_RegisteredUsers
    FOREIGN KEY (userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdAccount_AdAccountJoining (table: AdAccountJoinings)
ALTER TABLE AdAccountJoinings ADD CONSTRAINT AdAccount_AdAccountJoining
    FOREIGN KEY (accountID)
    REFERENCES AdAccounts (accountID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdAccount_RegisteredUsers (table: AdAccounts)
ALTER TABLE AdAccounts ADD CONSTRAINT AdAccount_RegisteredUsers
    FOREIGN KEY (creator_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdGroups_AdvertisingMaterials (table: AdGroups)
ALTER TABLE AdGroups ADD CONSTRAINT AdGroups_AdvertisingMaterials
    FOREIGN KEY (ad_materialID)
    REFERENCES AdvertisingMaterials (ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdGroups_Campaigns (table: AdGroups)
ALTER TABLE AdGroups ADD CONSTRAINT AdGroups_Campaigns
    FOREIGN KEY (campaignID, campaignID)
    REFERENCES Campaigns (postID, ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ads_AdGroups (table: Ads)
ALTER TABLE Ads ADD CONSTRAINT Ads_AdGroups
    FOREIGN KEY (ad_groupID)
    REFERENCES AdGroups (ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ads_AdvertisingMaterials (table: Ads)
ALTER TABLE Ads ADD CONSTRAINT Ads_AdvertisingMaterials
    FOREIGN KEY (ad_materialID)
    REFERENCES AdvertisingMaterials (ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdvertisingMaterials_AdAccounts (table: AdvertisingMaterials)
ALTER TABLE AdvertisingMaterials ADD CONSTRAINT AdvertisingMaterials_AdAccounts
    FOREIGN KEY (accountID)
    REFERENCES AdAccounts (accountID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AdvertisingMaterials_Payments (table: AdvertisingMaterials)
ALTER TABLE AdvertisingMaterials ADD CONSTRAINT AdvertisingMaterials_Payments
    FOREIGN KEY (transactionID)
    REFERENCES Payments (transactionID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AudienceTargetings_AdGroups (table: AudienceTargetings)
ALTER TABLE AudienceTargetings ADD CONSTRAINT AudienceTargetings_AdGroups
    FOREIGN KEY (ad_materialID)
    REFERENCES AdGroups (ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: AudienceTargetings_Audiences (table: AudienceTargetings)
ALTER TABLE AudienceTargetings ADD CONSTRAINT AudienceTargetings_Audiences
    FOREIGN KEY (audienceID)
    REFERENCES Audiences (audienceID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Campaigns_AdvertisingMaterials (table: Campaigns)
ALTER TABLE Campaigns ADD CONSTRAINT Campaigns_AdvertisingMaterials
    FOREIGN KEY (ad_materialID)
    REFERENCES AdvertisingMaterials (ad_materialID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Campaigns_Posts (table: Campaigns)
ALTER TABLE Campaigns ADD CONSTRAINT Campaigns_Posts
    FOREIGN KEY (postID)
    REFERENCES Posts (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommentRegulation_Comments (table: CommentRegulations)
ALTER TABLE CommentRegulations ADD CONSTRAINT CommentRegulation_Comments
    FOREIGN KEY (comID)
    REFERENCES Comments (comID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CommentRegulation_Moderators (table: CommentRegulations)
ALTER TABLE CommentRegulations ADD CONSTRAINT CommentRegulation_Moderators
    FOREIGN KEY (modID)
    REFERENCES Moderators (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Comments_Comments (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Comments_Comments
    FOREIGN KEY (reply_to_comID)
    REFERENCES Comments (comID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Comments_Posts (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Comments_Posts
    FOREIGN KEY (postID)
    REFERENCES Posts (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Comments_RegisteredUsers (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Comments_RegisteredUsers
    FOREIGN KEY (commenter_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FlairGrantings_Flairs (table: FlairCreations)
ALTER TABLE FlairCreations ADD CONSTRAINT FlairGrantings_Flairs
    FOREIGN KEY (flairID)
    REFERENCES Flairs (flairID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FlairGrantings_Moderators (table: FlairCreations)
ALTER TABLE FlairCreations ADD CONSTRAINT FlairGrantings_Moderators
    FOREIGN KEY (modID)
    REFERENCES Moderators (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Flairs_Subreddits (table: Flairs)
ALTER TABLE Flairs ADD CONSTRAINT Flairs_Subreddits
    FOREIGN KEY (subredID)
    REFERENCES Subreddits (subredID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Interactions_Comments (table: Interactions)
ALTER TABLE Interactions ADD CONSTRAINT Interactions_Comments
    FOREIGN KEY (comID)
    REFERENCES Comments (comID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Interactions_RegisteredUsers (table: Interactions)
ALTER TABLE Interactions ADD CONSTRAINT Interactions_RegisteredUsers
    FOREIGN KEY (done_by_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Moderators_RegisteredUsers (table: Moderators)
ALTER TABLE Moderators ADD CONSTRAINT Moderators_RegisteredUsers
    FOREIGN KEY (userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Moderators_Subreddits (table: Moderators)
ALTER TABLE Moderators ADD CONSTRAINT Moderators_Subreddits
    FOREIGN KEY (subredID)
    REFERENCES Subreddits (subredID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Payments_AdAccounts (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_AdAccounts
    FOREIGN KEY (payer_ad_accountID)
    REFERENCES AdAccounts (accountID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Payments_RegisteredUsers (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_RegisteredUsers
    FOREIGN KEY (payer_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Payments_Subscription (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Payments_Subscription
    FOREIGN KEY (subscriptionID)
    REFERENCES Subscriptions (subscriptionID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PollOptions_Polls (table: PollOptions)
ALTER TABLE PollOptions ADD CONSTRAINT PollOptions_Polls
    FOREIGN KEY (postID)
    REFERENCES Polls (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Polls_Posts (table: Polls)
ALTER TABLE Polls ADD CONSTRAINT Polls_Posts
    FOREIGN KEY (postID)
    REFERENCES Posts (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PostFlairs_Flairs (table: PostFlairs)
ALTER TABLE PostFlairs ADD CONSTRAINT PostFlairs_Flairs
    FOREIGN KEY (flairID)
    REFERENCES Flairs (flairID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PostRegulations_Moderators (table: PostRegulations)
ALTER TABLE PostRegulations ADD CONSTRAINT PostRegulations_Moderators
    FOREIGN KEY (modID)
    REFERENCES Moderators (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PostRegulations_Posts (table: PostRegulations)
ALTER TABLE PostRegulations ADD CONSTRAINT PostRegulations_Posts
    FOREIGN KEY (postID)
    REFERENCES Posts (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Posts_Interactions (table: Interactions)
ALTER TABLE Interactions ADD CONSTRAINT Posts_Interactions
    FOREIGN KEY (postID)
    REFERENCES Posts (postID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Posts_PostFlairs (table: Posts)
ALTER TABLE Posts ADD CONSTRAINT Posts_PostFlairs
    FOREIGN KEY (flairID)
    REFERENCES PostFlairs (flairID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Posts_RegisteredUsers (table: Posts)
ALTER TABLE Posts ADD CONSTRAINT Posts_RegisteredUsers
    FOREIGN KEY (poster_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Posts_Subreddits (table: Posts)
ALTER TABLE Posts ADD CONSTRAINT Posts_Subreddits
    FOREIGN KEY (subredID)
    REFERENCES Subreddits (subredID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RegisteredUsers_Users (table: RegisteredUsers)
ALTER TABLE RegisteredUsers ADD CONSTRAINT RegisteredUsers_Users
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SubredditInvolvement_Audiences (table: SubredditInvolvements)
ALTER TABLE SubredditInvolvements ADD CONSTRAINT SubredditInvolvement_Audiences
    FOREIGN KEY (audienceID)
    REFERENCES Audiences (audienceID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SubredditInvolvement_Subreddits (table: SubredditInvolvements)
ALTER TABLE SubredditInvolvements ADD CONSTRAINT SubredditInvolvement_Subreddits
    FOREIGN KEY (subredID)
    REFERENCES Subreddits (subredID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SubredditJoinings_RegisteredUsers (table: SubredditJoinings)
ALTER TABLE SubredditJoinings ADD CONSTRAINT SubredditJoinings_RegisteredUsers
    FOREIGN KEY (userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SubredditJoinings_Subreddits (table: SubredditJoinings)
ALTER TABLE SubredditJoinings ADD CONSTRAINT SubredditJoinings_Subreddits
    FOREIGN KEY (subredID)
    REFERENCES Subreddits (subredID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Subreddits_RegisteredUsers (table: Subreddits)
ALTER TABLE Subreddits ADD CONSTRAINT Subreddits_RegisteredUsers
    FOREIGN KEY (creator_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Subscription_RegisteredUsers (table: Subscriptions)
ALTER TABLE Subscriptions ADD CONSTRAINT Subscription_RegisteredUsers
    FOREIGN KEY (holder_userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: UserFlairs_Flairs (table: UserFlairs)
ALTER TABLE UserFlairs ADD CONSTRAINT UserFlairs_Flairs
    FOREIGN KEY (flairID)
    REFERENCES Flairs (flairID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: UserLabeling_RegisteredUsers (table: UserLabelings)
ALTER TABLE UserLabelings ADD CONSTRAINT UserLabeling_RegisteredUsers
    FOREIGN KEY (userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: UserLabeling_UserFlairs (table: UserLabelings)
ALTER TABLE UserLabelings ADD CONSTRAINT UserLabeling_UserFlairs
    FOREIGN KEY (flairID)
    REFERENCES UserFlairs (flairID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: UserRegulation_Moderators (table: UserRegulations)
ALTER TABLE UserRegulations ADD CONSTRAINT UserRegulation_Moderators
    FOREIGN KEY (modID)
    REFERENCES Moderators (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: UserRegulation_RegisteredUsers (table: UserRegulations)
ALTER TABLE UserRegulations ADD CONSTRAINT UserRegulation_RegisteredUsers
    FOREIGN KEY (userID)
    REFERENCES RegisteredUsers (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Users_Guest3 (table: Guests)
ALTER TABLE Guests ADD CONSTRAINT Users_Guest3
    FOREIGN KEY (userID)
    REFERENCES Users (userID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

