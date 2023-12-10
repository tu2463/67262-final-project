from common import *

us='''
* Simple operational US 3

   As a:  Reader
 I want:  To upvote on posts that I like
So That:  I can show my appreciation to the poster and recommend this post to more users
'''

print(us)

def reply_to_comment(p_content,p_reply_to_comID,p_commenter_userID):
    tmpl =  f'''
INSERT INTO Commnets(content,reply_to_comID,commenter_userID)
VALUES(%s,%s,%s);
'''
    cmd = cur.mogrify(tmpl, (p_content,p_reply_to_comID,p_commenter_userID, ))
    print_cmd(cmd)
    cur.execute(cmd)


content = "Glad to hear that my advice does work."
reply_to_comID,commenter_userID = 9,23
reply_to_comment(content, reply_to_comID, commenter_userID)    