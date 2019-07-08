select * from review;

update board set hits = hits+1 where b_id=24;
update board set hits = hits-1 where b_id=24;
update member set pw = 'test' where id = 'test';

select * from board;

select * from review;

select * from member;

select * from(select ROW_NUMBER() over(order by day desc)as rn, board.* from board) where rn >= 1 and rn <=10;


select * from(select ROW_NUMBER() over(order by day desc)as rn, board.* from board) where rn >= 1 and rn <=10";

select * from(select ROW_NUMBER() over(order by day desc)as rn, review.* from review) where rn >= 1 and rn <=10;
select * from board;

select * from board order by day desc;



select * from member;