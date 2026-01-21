CREATE DATABASE clip_wave_videos;
USE clip_wave_videos;

-- Obtain the average video duration in seconds, view count, likes, shares, downloads and comments
-- and then group them by the claims_type (claims or opinions)
SELECT
	claim_status,
	ROUND(AVG(video_duration_sec), 2) AS avg_video_duration_sec,
    ROUND(AVG(video_view_count), 2) AS avg_video_view_count,
    ROUND(AVG(video_like_count), 2) AS avg_video_like_count,
	ROUND(AVG(video_share_count), 2) AS avg_video_share_count,
    ROUND(AVG(video_download_count), 2) AS avg_video_download_count,
    ROUND(AVG(video_comment_count), 2) AS avg_video_comment_count
FROM video
GROUP BY claim_status;

SELECT 
	claim_status,
    COUNT(video_id) AS total_videos
FROM video
GROUP BY claim_status;

SELECT 
	claim_status,
    SUM(video_view_count) AS total_video_views
FROM video
GROUP BY claim_status;

SELECT *
FROM video;



SELECT 
	claim_status,
    SUM(video_view_count) AS total_video_views
FROM video
WHERE author_ban_status IN ('under review', 'banned')
GROUP BY claim_status;

-- Obtain the list of claim videos where the author is not verified and he/she is still yet to be banned
WITH cte_claim_videos AS (
	SELECT *
    FROM video
    WHERE claim_status = 'claim'
)
, cte_claim_author_not_verified_videos AS (
SELECT *
FROM cte_claim_videos
WHERE verified_status = 'not verified'
AND author_ban_status = 'active'
)

SELECT 
	SUBSTRING_INDEX(video_transcription_text, ' ', 6) AS first_five_text,
    COUNT(*) AS num_of_videos_with_starting_text,
    SUM(video_like_count) AS total_like_count,
    SUM(video_share_count) AS total_share_count,
    SUM(video_download_count) AS total_video_download_count, 
    SUM(video_comment_count) AS total_video_comment_count,
    ROW_NUMBER() OVER (
		ORDER BY SUM(video_like_count) DESC) AS ranking
FROM cte_claim_author_not_verified_videos
GROUP BY 
	SUBSTRING_INDEX(video_transcription_text, ' ', 6)
LIMIT 3;



