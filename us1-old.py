from common import *

# import psycopg2
# import sys
# db, user = 'project', 'isdb'
# conn = psycopg2.connect(database=db, user=user)
# conn.autocommit = True
# cur = conn.cursor()

us='''
* Complex operational & analytical US 1

   As a:  Reader
 I want:  To view the most popular posts in a specific subreddit that I’m interested in
So That:  I can stay informed and actively engage in a topic that interests me
'''

print(us)

def view_posts_by_time_and_popularity(p_subredID):
    # cols = 'p.postID p.timestamp p.title p.content p.original_content_tag p.spoiler_tag p.NSFW_tag p.poster_userID p.flairID'
    cols = 'p.timestamp p.title p.content p.original_content_tag p.spoiler_tag p.NSFW_tag p.poster_userID p.flairID COUNT(i.interactionID)'
    tmpl =  f'''
SELECT {c(cols)} AS popularity
  FROM Posts AS p JOIN Interactions AS i ON p.postID = i.postID
  WHERE i.type = 'upvote' AND p.subredID = %s
  GROUP BY p.timestamp, p.title, p.content, p.original_content_tag, p.spoiler_tag, p.NSFW_tag, p.poster_userID, p.flairID, p.postID
  ORDER BY popularity DESC
'''
    cmd = cur.mogrify(tmpl, (p_subredID, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, 'time title content original_content_tag spoiler_tag NSFW_tag poster_userID flairID popularity' )
    # show_table( rows, cols )

view_posts_by_time_and_popularity(6)    
