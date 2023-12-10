from common import *

us='''
* Complex operational US 2

   As a:  Reader
 I want:  To upvote on posts that I like
So That:  I can show my appreciation to the poster and recommend this post to more users
'''

print(us)

def upvote_posts(p_postID, p_userID, p_postIDAgain):
    tmpl =  f'''
    INSERT INTO Interactions(type, postID, done_by_userID)
    VALUES('upvote', %s, %s);

    SELECT postID, popularity
    FROM Posts
    WHERE postID = %s
    '''
    cmd = cur.mogrify(tmpl, (p_postID, p_userID, p_postIDAgain,))
    print_cmd(cmd)
    cur.execute(cmd)

    rows = cur.fetchall()
    pp(rows)
    # show_table( rows, 'IP,popularity' )
    # show_table( rows, cols )

postID, userID = 6, 1
upvote_posts(postID, userID, postID)    
