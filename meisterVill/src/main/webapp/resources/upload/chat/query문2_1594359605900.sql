insert into member values(MEMBER_SEQ.NEXTVAL,'test@email.com','1234','ȫ�浿','2020619','user01','01012345678',null,'��������','11012345678','09:00-20:00',0,0,null,null,null,null,null,null,sysdate );

insert into member values(MEMBER_SEQ.NEXTVAL,'user02','1234','������','2020619','user02','01012345678',null,'��������','11012345678','09:00-20:00',0,0,null,null,null,null,null,null,sysdate );
insert into member values(MEMBER_SEQ.NEXTVAL,'user03','1234','������','2020619','user03','01012345678',null,'��������','11012345678','09:00-20:00',0,0,null,null,null,null,null,null,sysdate );

select * from member;
insert into member values(member_seq.nextval,'admin','1234','admin','1996-04-26','������','01011112222','unnamed.png','����','701254-54-457812','09:00-20:00',2,0,'������ �����Դϴ�.',null,null,null,null,null,sysdate);
commit;

insert into message values(message_seq.nextval,'�˸�����2','�˸������̿�2','������','user02',to_char(SYSDATE,'YYYY-MM-DD HH24:mi:ss'),0);

commit;
delete from chat where chat_sender ='user02';
insert into chat values(chat_seq.nextval,'user03','user02','hi',to_char(SYSDATE,'YYYY/MM/DD/HH24/mi'),null,0,null,null);
select * from chat;
select * from message;
delete from message;
delete from chat;