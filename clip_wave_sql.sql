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




