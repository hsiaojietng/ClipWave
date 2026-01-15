# ClipWave

## Business Context
ClipWave is a fast‑growing short‑form video platform operating across Southeast Asia, with a large user base in Singapore and neighboring markets. As the platform scales, user‑generated “claims” content (statements that sound factual) is surging, raising reputational, regulatory, and user‑trust risks if misleading or unverifiable claims go unmoderated.
​
Content Moderation & Integrity (Trust & Safety) owns policies for claims, while Operations handles review queues and escalations. Senior leadership wants standardized reporting on how claims flow through the system and which types of claims drive exposure, appeals, or enforcement actions such as author bans.
​
## Problem Background
The platform has received increased scrutiny from advertisers and regulators about misinformation risk, especially around science, health, and civic topics that can appear in seemingly “fun facts” videos. Internal audits show inconsistent moderation outcomes: some high‑reach claim videos are left “not verified” with no action, while others lead to bans even at similar view levels.

Currently, teams pull ad‑hoc spreadsheets of claims with limited breakdowns by status, reach, and enforcement decisions, making it hard to answer questions like “Where are our biggest misinformation exposures?” or “Which claims should be prioritized for fact‑checking?” Leadership wants a robust analytics view built from the raw claims‑level dataset already exported from the platform.

Ps. This dataset is obtained from Kaggle website from Murilo Zangari: https://www.kaggle.com/datasets/murilozangari/tiktok-claim-analysis.
​
## Stakeholder Request (Problem Statement)
“We need a clear, repeatable report on claims content: how much of it we have, how widely it is viewed, how it’s being moderated, and where the biggest risks are so we can refine our policies and reviewer guidelines.”
​
## Phase 1: Define problem
Based on the stakeholder, he/she wants a clear report on claims content and these are the data he/she needs to visualize:
- How much of those content we have?
- What is the view count for these content? 
- What are the moderations currently being done?
- Which claims content bring about the most risk to the company? Then with that data, what are some policies and guidelines that needs to be refined to reduce the risk?

So based on the above questions, I have come up with some objectives to be met:
- Quantify exposure of claims/opinions on the platform: Compare the reach and engagement of the claims vs opinions to differentiate which content dominates the platform
- Identify failing moderations workflow: Find out where exactly is the content that is not verified and the author has not been banned yet
- Segregate content by topics: Find out which type of content by topics domininate ClipWave's space
- Provide a clear view of potentially high-risk claims/opinions content: To pinpoint potential high-risk claims/opinion content so that logic rules can be put in place to quickly flag them for review
- Suggest revised guidelines: Based on the data analyzed, provide revision to guidelines to tackle pressing claims/opinion content

## Phase 2: Clean dataset
Since the dataset is from Kaggle and already collected, we can move on to cleaning the dataset.

Looking through the dataset, I noticed multiple records that have (Blanks) as the "claim_status". Since it does not provide any insights, I deleted these records.

These are the columns in the dataset for understanding:
- id: Unique identifier for a video with claim or opinion
- claims_status: Video that is identified as a claim or opinion. In this dataset, an “opinion” refers to an individual’s or group’s personal belief or thought. A “claim” refers to information that is either unsourced or from a unverified source. (based on author)
- video_id: Random unique identifier number for a published video on ClipWave
- video_duration_sec: Duration of video in seconds
- video_transcription_text: Text transcripted from the published video
- verified_status: Verification status of the user that published the video ("verified" or "not verified")
- author_ban_status: Status of the user in terms of their permissions ("active", "under scrutiny", "banned")
- video_view_count: Total number of times the published video was viewed
- video_like_count: Total number of times the published video was liked
- video_share_count: Total number of times the published video was shared
- video_download_count: Total number of times the published video was downloaded
- video_comment_count: Total number of comments on the published video

## Phase 3: Analyze dataset
To better analyze the dataset, I decided to import the CSV data into MySQL.

First we want to look at engagement and reach of the videos between claims vs opinions to have an understanding of which one dominates the platform.
I created this query to find the average of the metrics of engagement and reach (view count, likes, shares, downloads and comments) for us to easily differentiate between claims and opinions.
![Engagement and reach of claims vs opinions](Screenshots/engagement_claims_opinions.png)

