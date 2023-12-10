from common import *

us='''
* Simple operational US 3

   As a:  Reader
 I want:  To leave comments under another comment
So That:  I can discuss with other users
'''

print(us)

def reply_to_comment(p_content,p_reply_to_comID,p_commenter_userID,p_reply_to_comIDAgain,p_commenter_userIDAgain):
    tmpl =  f'''
INSERT INTO Comments(content,reply_to_comID,commenter_userID)
VALUES(%s,%s,%s);

SELECT content,reply_to_comID,commenter_userID
  FROM Comments
 WHERE reply_to_comID = %s AND commenter_userID = %s
'''
    cmd = cur.mogrify(tmpl, (p_content,p_reply_to_comID,p_commenter_userID,p_reply_to_comIDAgain,p_commenter_userIDAgain, ))
    print_cmd(cmd)
    cur.execute(cmd)

    rows = cur.fetchall()
    pp(rows)

content = "Glad to hear that my advice does work."
reply_to_comID,commenter_userID = 9,23
reply_to_comment(content, reply_to_comID, commenter_userID, reply_to_comID, commenter_userID)    