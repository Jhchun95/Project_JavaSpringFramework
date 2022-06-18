insert into BOARD (BID, UID, TITLE, STATE, BTYPE, CATEGORY, LOC, LOC2, CONTENT, LIKES, VIEWS, IMG)
values (1,'apple','그릇 가져가세요~','미완료', '나눔','생활용품','금천구','광명','예쁜 그릇 가져가세요~^^', 0,0,NULL);
commit;

select BID, UID, TITLE, STATE, BTYPE, CATEGORY, LOC, LOC2, CONTENT, LIKES, VIEWS, IMG, TIME_OF_UPLOAD
from BOARD
where BID = 1;

select BID, UID, TITLE, STATE, BTYPE, CATEGORY, LOC, LOC2, CONTENT, LIKES, VIEWS, IMG, TIME_OF_UPLOAD
from BOARD
order by TIME_OF_UPLOAD desc