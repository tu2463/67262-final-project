-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-08 06:23:58.537

-- foreign keys
ALTER TABLE AdAccountJoinings
    DROP CONSTRAINT AdAccountJoining_RegisteredUsers;

ALTER TABLE AdAccountJoinings
    DROP CONSTRAINT AdAccount_AdAccountJoining;

ALTER TABLE AdAccounts
    DROP CONSTRAINT AdAccount_RegisteredUsers;

ALTER TABLE AdGroups
    DROP CONSTRAINT AdGroups_AdvertisingMaterials;

ALTER TABLE AdGroups
    DROP CONSTRAINT AdGroups_Campaigns;

ALTER TABLE AdvertisingMaterials
    DROP CONSTRAINT AdvertisingMaterials_AdAccounts;

ALTER TABLE AdvertisingMaterials
    DROP CONSTRAINT AdvertisingMaterials_Payments;

ALTER TABLE AudienceTargetings
    DROP CONSTRAINT AudienceTargetings_AdGroups;

ALTER TABLE AudienceTargetings
    DROP CONSTRAINT AudienceTargetings_Audiences;

ALTER TABLE Campaigns
    DROP CONSTRAINT Campaigns_AdvertisingMaterials;

ALTER TABLE Campaigns
    DROP CONSTRAINT Campaigns_Posts;

ALTER TABLE CommentRegulations
    DROP CONSTRAINT CommentRegulation_Comments;

ALTER TABLE CommentRegulations
    DROP CONSTRAINT CommentRegulation_Moderators;

ALTER TABLE Comments
    DROP CONSTRAINT Comments_Comments;

ALTER TABLE Comments
    DROP CONSTRAINT Comments_Posts;

ALTER TABLE Comments
    DROP CONSTRAINT Comments_RegisteredUsers;

ALTER TABLE FlairGrantings
    DROP CONSTRAINT FlairGrantings_Flairs;

ALTER TABLE FlairGrantings
    DROP CONSTRAINT FlairGrantings_Moderators;

ALTER TABLE Flairs
    DROP CONSTRAINT Flairs_Subreddits;

ALTER TABLE Interactions
    DROP CONSTRAINT Interactions_Comments;

ALTER TABLE Interactions
    DROP CONSTRAINT Interactions_RegisteredUsers;

ALTER TABLE Moderators
    DROP CONSTRAINT Moderators_RegisteredUsers;

ALTER TABLE Moderators
    DROP CONSTRAINT Moderators_Subreddits;

ALTER TABLE Payments
    DROP CONSTRAINT Payments_RegisteredUsers;

ALTER TABLE Payments
    DROP CONSTRAINT Payments_Subscription;

ALTER TABLE PollOptions
    DROP CONSTRAINT PollOptions_Polls;

ALTER TABLE Polls
    DROP CONSTRAINT Polls_Posts;

ALTER TABLE PostFlairs
    DROP CONSTRAINT PostFlairs_Flairs;

ALTER TABLE PostRegulations
    DROP CONSTRAINT PostRegulations_Moderators;

ALTER TABLE PostRegulations
    DROP CONSTRAINT PostRegulations_Posts;

ALTER TABLE Interactions
    DROP CONSTRAINT Posts_Interactions;

ALTER TABLE Posts
    DROP CONSTRAINT Posts_PostFlairs;

ALTER TABLE Posts
    DROP CONSTRAINT Posts_RegisteredUsers;

ALTER TABLE Posts
    DROP CONSTRAINT Posts_Subreddits;

ALTER TABLE RegisteredUsers
    DROP CONSTRAINT RegisteredUsers_Users;

ALTER TABLE SubredditJoinings
    DROP CONSTRAINT SubredditJoinings_RegisteredUsers;

ALTER TABLE SubredditJoinings
    DROP CONSTRAINT SubredditJoinings_Subreddits;

ALTER TABLE Subreddits
    DROP CONSTRAINT Subreddits_RegisteredUsers;

ALTER TABLE Subscriptions
    DROP CONSTRAINT Subscription_RegisteredUsers;

ALTER TABLE Ads
    DROP CONSTRAINT Table_30_AdGroups;

ALTER TABLE Ads
    DROP CONSTRAINT Table_30_AdvertisingMaterials;

ALTER TABLE UserFlairs
    DROP CONSTRAINT UserFlairs_Flairs;

ALTER TABLE UserLabelings
    DROP CONSTRAINT UserLabeling_RegisteredUsers;

ALTER TABLE UserLabelings
    DROP CONSTRAINT UserLabeling_UserFlairs;

ALTER TABLE UserRegulations
    DROP CONSTRAINT UserRegulation_Moderators;

ALTER TABLE UserRegulations
    DROP CONSTRAINT UserRegulation_RegisteredUsers;

ALTER TABLE Guests
    DROP CONSTRAINT Users_Guest3;

-- tables
DROP TABLE AdAccountJoinings;

DROP TABLE AdAccounts;

DROP TABLE AdGroups;

DROP TABLE Ads;

DROP TABLE AdvertisingMaterials;

DROP TABLE AudienceTargetings;

DROP TABLE Audiences;

DROP TABLE Campaigns;

DROP TABLE CommentRegulations;

DROP TABLE Comments;

DROP TABLE FlairGrantings;

DROP TABLE Flairs;

DROP TABLE Guests;

DROP TABLE Interactions;

DROP TABLE Moderators;

DROP TABLE Payments;

DROP TABLE PollOptions;

DROP TABLE Polls;

DROP TABLE PostFlairs;

DROP TABLE PostRegulations;

DROP TABLE Posts;

DROP TABLE RegisteredUsers;

DROP TABLE SubredditJoinings;

DROP TABLE Subreddits;

DROP TABLE Subscriptions;

DROP TABLE UserFlairs;

DROP TABLE UserLabelings;

DROP TABLE UserRegulations;

DROP TABLE Users;

-- End of file.

