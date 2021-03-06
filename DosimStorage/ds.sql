-- 테이블 삭제

	-- 회원(member)
DROP TABLE ds_member CASCADE CONSTRAINTS;

	-- 관리자(master)
DROP TABLE ds_master CASCADE CONSTRAINTS;

	-- 지점(branch)
DROP TABLE ds_branch CASCADE CONSTRAINTS;

	-- 창고서비스(service)
DROP TABLE ds_service CASCADE CONSTRAINTS;

	-- 창고목록(storage_list)
DROP TABLE ds_storage_list CASCADE CONSTRAINTS;

	-- 주문(order)
DROP TABLE ds_order CASCADE CONSTRAINTS;

	-- 계좌(account)
DROP TABLE ds_account CASCADE CONSTRAINTS;

	-- 1:1게시판(board1)
DROP TABLE ds_board1 CASCADE CONSTRAINTS;

	-- Q&A게시판(board2)
DROP TABLE ds_board2 CASCADE CONSTRAINTS;



--테이블 생성

	-- 회원(member)
CREATE TABLE ds_member (
	m_id      VARCHAR2(12) NOT NULL, -- 회원ID
	m_pw      VARCHAR2(12) NOT NULL, -- 회원PW
	m_name    VARCHAR2(20) NOT NULL, -- 이름
	m_email   VARCHAR2(20) NOT NULL, -- 이메일
	m_tel     VARCHAR2(20) NOT NULL, -- 전화번호
	m_regdate DATE         NOT NULL, -- 가입일
	total_use NUMBER(4)    NOT NULL, -- 누적이용일
	m_del     CHAR(1)      NOT NULL -- 탈퇴여부
);

	-- 회원(member)
ALTER TABLE ds_member
    MODIFY m_regdate DEFAULT sysdate; -- 가입일
ALTER TABLE ds_member
    MODIFY total_use DEFAULT 0; -- 누적이용일
ALTER TABLE ds_member
    MODIFY m_del DEFAULT 'n'; -- 탈퇴여부
    
	-- 회원(member)    
ALTER TABLE ds_member 
	ADD
		CONSTRAINT PK_member -- 회원(member) 기본키
		PRIMARY KEY (
			m_id -- 회원ID            
		);

		
	-- 관리자(master)
CREATE TABLE ds_master (
	master_id VARCHAR2(12) NOT NULL, -- 관리자ID
	master_pw VARCHAR2(12) NOT NULL  -- 관리자PW
);

	-- 관리자(master)
ALTER TABLE ds_master
	ADD
		CONSTRAINT PK_ds_master -- 관리자(master) 기본키
		PRIMARY KEY (
			master_id -- 관리자ID
		);
		

	-- 지점(branch)
CREATE TABLE ds_branch (
	b_code  NUMBER(3)   NOT NULL, -- 지점코드
	b_title VARCHAR2(20) NOT NULL, -- 지점명
	b_tel   VARCHAR2(20) NOT NULL, -- 지점전화번호
	b_addr  VARCHAR2(50) NOT NULL  -- 지점주소
);

	-- 지점(branch)
ALTER TABLE ds_branch
	ADD
		CONSTRAINT PK_ds_branch -- 지점(branch) 기본키
		PRIMARY KEY (
			b_code -- 지점코드
		);

		
	-- 창고서비스(service)
CREATE TABLE ds_service (
	s_kind  VARCHAR2(10) NOT NULL, -- 창고서비스종류
	s_price NUMBER(10)   NOT NULL  -- 창고서비스가격
);

	-- 창고서비스(service)
ALTER TABLE ds_service
	ADD
		CONSTRAINT PK_ds_service -- 창고서비스(service) 기본키
		PRIMARY KEY (
			s_kind -- 창고서비스종류
		);
		

	-- 창고목록(storage_list)
CREATE TABLE ds_storage_list (
	st_code     VARCHAR2(10) NOT NULL, -- 창고코드
	b_code      NUMBER(3)   NOT NULL, -- 지점코드
	s_kind      VARCHAR2(10) NOT NULL, -- 창고서비스종류
	borrower_id VARCHAR2(12) NULL,     -- 대여자ID
	rented      CHAR(1)      NOT NULL, -- 대여중
	usable      CHAR(1)      NOT NULL -- 사용가능여부
);

	-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT PK_ds_storage_list -- 창고목록(storage_list) 기본키
		PRIMARY KEY (
			st_code -- 창고코드
		);

	-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
    MODIFY rented DEFAULT 'n'; -- 대여중
ALTER TABLE ds_storage_list
    MODIFY usable DEFAULT 'y';-- 사용가능여부

    
	-- 주문(order)
CREATE TABLE ds_order (
	order_no         NUMBER(12)   NOT NULL, -- 주문번호
	m_id             VARCHAR2(12) NOT NULL, -- 회원ID
	st_code          VARCHAR2(10) NOT NULL, -- 창고코드
	order_totalPrice NUMBER(10)   NOT NULL, -- 주문총액
	order_date       DATE         NOT NULL, -- 주문일
	hope_date	 	 DATE         not null, -- 이용개시희망일
	use_period	 	 NUMBER(2)    not null, -- 이용개월수
	start_date	 	 DATE,					-- 이용시작일
	expire_date      DATE,					-- 이용만료일
	account_no       VARCHAR2(20) NOT NULL, -- 계좌번호
	depo_dueDate     DATE         NOT NULL, -- 입금기한
	order_state      VARCHAR2(16) NOT NULL  -- 주문상태
);

	-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT PK_ds_order -- 주문(order) 기본키
		PRIMARY KEY (
			order_no -- 주문번호
		);

	-- 주문(order)
ALTER TABLE ds_order
    MODIFY order_state DEFAULT '입금대기'; -- 주문상태

    
	-- 계좌(account)
CREATE TABLE ds_account (
	account_no   VARCHAR2(20) NOT NULL, -- 계좌번호
	bank         VARCHAR2(20) NOT NULL, -- 은행
	account_name VARCHAR2(20) NOT NULL  -- 예금주
);

	-- 계좌(account)
ALTER TABLE ds_account
	ADD
		CONSTRAINT PK_ds_account -- 계좌(account) 기본키
		PRIMARY KEY (
			account_no -- 계좌번호
		);

		
	-- 1:1게시판(board1)
CREATE TABLE ds_board1 (
	num       NUMBER        NOT NULL, -- 게시글번호
	m_id      VARCHAR2(12)  NOT NULL, -- 회원ID
	order_no  NUMBER(12)    NULL,     -- 주문번호
	m_email   VARCHAR2(20)  NULL,     -- 이메일
	title     VARCHAR2(50)  NOT NULL, -- 제목
	content   VARCHAR2(1000) NOT NULL, -- 내용
	readcount NUMBER        NOT NULL, -- 조회수
	ip        VARCHAR2(39)  NULL,     -- 아이피
	ref       NUMBER        NOT NULL, -- 참조번호
	ref_level NUMBER        NOT NULL, -- 참조레벨
	reg_date  DATE          NOT NULL, -- 작성일
	reply     CHAR(1)       NULL     , -- 답변여부
	del       CHAR(1)       NOT NULL -- 삭제여부
);

	-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT PK_ds_board1 -- 1:1게시판(board1) 기본키
		PRIMARY KEY (
			num -- 게시글번호
		);
        
	-- 1:1게시판(board1)
ALTER TABLE ds_board1
    MODIFY readcount DEFAULT 0; -- 조회수
ALTER TABLE ds_board1
    MODIFY reg_date DEFAULT sysdate; -- 작성일
ALTER TABLE ds_board1
    MODIFY reply DEFAULT 'n'; -- 답변여부
ALTER TABLE ds_board1
    MODIFY del DEFAULT 'n'; -- 삭제여부
   
    
	-- Q&A게시판(board2)
CREATE TABLE ds_board2 (
	num       NUMBER        NOT NULL, -- 게시글번호
	writer    VARCHAR2(20)  NOT NULL, -- 작성자
	password  VARCHAR2(12)  NULL,     -- 비밀번호
	email     VARCHAR2(20)  NULL,     -- 이메일
	title     VARCHAR2(50)  NOT NULL, -- 제목
	content   VARCHAR2(1000) NOT NULL, -- 내용
	readcount NUMBER        NOT NULL, -- 조회수
	ip        VARCHAR2(39)  NULL,     -- 아이피
	ref       NUMBER        NOT NULL, -- 참조번호
	ref_level NUMBER        NOT NULL, -- 참조레벨
	reg_date  DATE          NOT NULL, -- 작성일
	priv   CHAR(1)       NOT NULL, -- 비밀글
	reply     CHAR(1)       NULL, -- 답변여부
	del       CHAR(1)       NOT NULL -- 삭제여부
);

	-- Q&A게시판(board2)
ALTER TABLE ds_board2
	ADD
		CONSTRAINT PK_ds_board2 -- Q&A게시판(board2) 기본키
		PRIMARY KEY (
			num -- 게시글번호
		);
        
	-- Q&A게시판(board2)
ALTER TABLE ds_board2
    MODIFY readcount DEFAULT 0; -- 조회수
ALTER TABLE ds_board2
    MODIFY reg_date DEFAULT sysdate; -- 작성일
ALTER TABLE ds_board2
    MODIFY reply DEFAULT 'n'; -- 답변여부
ALTER TABLE ds_board2
    MODIFY del DEFAULT 'n'; -- 삭제여부

    
-- FK 설정
    
	-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT FK_branch_TO_storage_list -- 지점(branch) -> 창고목록(storage_list)
		FOREIGN KEY (
			b_code -- 지점코드
		)
		REFERENCES ds_branch ( -- 지점(branch)
			b_code -- 지점코드
		);

	-- 창고목록(storage_list)
ALTER TABLE ds_storage_list
	ADD
		CONSTRAINT FK_service_TO_storage_list -- 창고서비스(service) -> 창고목록(storage_list)
		FOREIGN KEY (
			s_kind -- 창고서비스종류
		)
		REFERENCES ds_service ( -- 창고서비스(service)
			s_kind -- 창고서비스종류
		);

	-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_member_TO_order -- 회원(member) -> 주문(order)
		FOREIGN KEY (
			m_id -- 회원ID
		)
		REFERENCES ds_member ( -- 회원(member)
			m_id -- 회원ID
		);

	-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_account_TO_order -- 계좌(account) -> 주문(order)
		FOREIGN KEY (
			account_no -- 계좌번호
		)
		REFERENCES ds_account ( -- 계좌(account)
			account_no -- 계좌번호
		);

	-- 주문(order)
ALTER TABLE ds_order
	ADD
		CONSTRAINT FK_storage_list_TO_order -- 창고목록(storage_list) -> 주문(order)
		FOREIGN KEY (
			st_code -- 창고코드
		)
		REFERENCES ds_storage_list ( -- 창고목록(storage_list)
			st_code -- 창고코드
		);

	-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT FK_member_TO_board1 -- 회원(member) -> 1:1게시판(board1)
		FOREIGN KEY (
			m_id -- 회원ID
		)
		REFERENCES ds_member ( -- 회원(member)
			m_id -- 회원ID
		);

	-- 1:1게시판(board1)
ALTER TABLE ds_board1
	ADD
		CONSTRAINT FK_order_TO_board1 -- 주문(order) -> 1:1게시판(board1)
		FOREIGN KEY (
			order_no -- 주문번호
		)
		REFERENCES ds_order ( -- 주문(order)
			order_no -- 주문번호
		);
		

		
-- 기본 데이터 입력

	-- Master
insert into DS_MASTER values('master', '1234');	-- 관리자 아이디

	-- Member - master : 관리자 아이디와 같은 아이디를 유저가 생성하지 못하게 하기 위한 데이터
insert into DS_MEMBER values('master', 'asdcfhdae2', '마슷허', 'email@mail.com', '112', sysdate, 0, 'y');
	-- 창고목록에 상태표시용으로 쓰는 키워드로 유저가 가입 못하게 막기 위한 데이터
insert into DS_MEMBER values('입금대기', 'asdcfhdae2', '입금대기', 'email@mail.com', '112', sysdate, 0, 'y');
insert into DS_MEMBER values('에러', 'asdcfhdae2', '에러', 'email@mail.com', '112', sysdate, 0, 'y');
insert into DS_MEMBER values('폐쇄', 'asdcfhdae2', '폐쇄', 'email@mail.com', '112', sysdate, 0, 'y');

	-- 계좌
insert into DS_ACCOUNT values('123-4567-890123', '국민은행', '도심창고');
insert into DS_ACCOUNT values('246-13579-369-01', '신한은행', '도심창고');
insert into DS_ACCOUNT values('9876-54-321012', '카카오뱅크', '도심창고');

	-- 지점
insert into DS_BRANCH values('1', '광화문점', '02-123-4567', '서울특별시 종로구 세종대로 11');
insert into DS_BRANCH values('2', '신사점', '02-891-2345', '서울특별시 강남구 도산대로 25');
insert into DS_BRANCH values('3', '판교점', '031-678-9123', '경기도 성남시 분당구 판교로 37');

	-- 창고서비스
insert into DS_SERVICE values('small', 68000);
insert into DS_SERVICE values('medium', 98000);
insert into DS_SERVICE values('large', 168000);


-- 뷰 생성

	-- 지점*창고타입별 매진된 창고 표시하는 뷰
	-- 뷰 생성 권한이 없는 경우 system 계정 접속해서 grant create view to 계정명(ex: scott)
	-- 으로 권한 부여 후 생성할 것!
create or replace view stock_view as
	select a.br_type, tot, ntot from
		(select s.s_kind||b.b_code br_type, count(s.st_code) tot
		from ds_branch b, ds_service v, ds_storage_list s
		where b.b_code=s.b_code and v.s_kind = s.s_kind
		group by s.s_kind, b.b_code) a,
		(select s.s_kind||b.b_code br_type, count(s.st_code) ntot
		from ds_branch b, ds_service v, ds_storage_list s
		where b.b_code=s.b_code and v.s_kind = s.s_kind and usable = 'n'
		group by s.s_kind, b.b_code) b
	where a.br_type = b.br_type and tot = ntot;

    -- 마이페이지에 있는 신청서비스조회에서 확인할 정보가 표시된 뷰
create or replace view v_orderList as 
	select o.order_no, o.m_id, o.order_date, o.order_totalprice, o.hope_date, o.use_period, o.order_state, s.s_kind, b.b_title
 	from ds_order o, ds_storage_list s, ds_branch b
    	where o.st_code=s.st_code and s.b_code=b.b_code;

    -- 관리자가 주문관리에 필요한 데이터를 보기 위한 뷰
create or replace view master_orderview as
    select order_no, o.m_id, m.m_name, o.st_code, order_totalprice, hope_date, use_period, start_date, expire_date, account_no, depo_duedate, order_state
    from ds_order o, ds_storage_list s, ds_member m
    where o.st_code = s.st_code and o.m_id = m.m_id;



-- 시퀀스 삭제
drop SEQUENCE order_no_seq;

-- 시퀀스 생성
    	
	-- 주문번호 시퀀스
CREATE SEQUENCE order_no_seq
MAXVALUE 9999
CYCLE;


-- 트리거 생성
-- ***	트리거 생성시 만약 에러가 난다면 오라클 SQL Developer에서
--		도구 > 환경설정. 데이터베이스 > PL/SQL 컴파일러 > PLScope 식별자 none으로 변경후 생성 ***

	-- 주문 정상 등록 시 해당 창고 중복주문 막고, 해당 창고 borrower_id에 입금대기표시
create or replace trigger payment_wait
    after insert on ds_order
    for each row
begin
    update ds_storage_list set usable = 'n', borrower_id = '입금대기' where st_code = :new.st_code;
end;
/
	-- 입금완료 처리시 창고목록 테이블 자동변경 트리거
create or replace trigger service_starter
    after update on ds_order
    for each row
begin    
    if :old.order_state = '입금대기' and :new.order_state = '입금완료' then        
        update ds_storage_list set usable = 'n', rented = 'y', borrower_id = :new.m_id where st_code = :new.st_code;
    end if;
end;
/

    -- 주문취소시 창고목록 테이블 자동변경 트리거
        -- 입금확인 전 취소
create or replace trigger service_cancel
    after update on ds_order
    for each row
begin    
    if :old.order_state = '입금대기' and :new.order_state = '주문취소' then        
        update ds_storage_list set usable = 'y', rented = 'n', borrower_id = null where st_code = :new.st_code;
    end if;
end;
/
        -- 입금확인되어 서비스 이용 개시 후 중도취소 
create or replace trigger service_cancel2
    after update on ds_order
    for each row
begin    
    if :old.order_state = '입금완료' and :new.order_state = '주문취소' then        
        update ds_storage_list set usable = 'n', rented = 'n', borrower_id = null where st_code = :new.st_code;
    end if;
end;
/


-- 프로시저 생성

    -- 서비스 이용중인 유저 total_use +1 시키고, 이용 만료일이 지난 창고의 borrower_id를 비우는 프로시저
create or replace procedure totaluse_and_expire
is
begin
   update ds_member set total_use = total_use + 1 where m_id in (select distinct(m_id) from ds_member m, ds_storage_list s where m.m_id = s.borrower_id and m_id not in ('입금대기', '에러', '폐쇄'));
   update ds_storage_list set borrower_id = null, rented = 'n' where st_code in (select st_code from ds_order where trunc(expire_date) = trunc(sysdate - 1));
end;
/

-- job 생성

    -- totaluse_and_expire 매일 자정에 실행시키는 job
DECLARE
    X NUMBER;
BEGIN
    SYS.DBMS_JOB.SUBMIT
    ( JOB => X,
    WHAT => 'totaluse_and_expire;',
    NEXT_DATE => SYSDATE,
    INTERVAL => 'TRUNC(SYSDATE) + 1',
    NO_PARSE => false );
    commit;
END;
/


    -- job 지우는 법
    -- select * from user_jobs; << 이걸로 현재 만들어진 job 목록을 볼 수 있다
    -- 지우려는 job 번호를
    -- EXECUTE dbms_job.REMOVE(num); << 저 num 자리에 넣으면 지울 수 있다
    -- 또는 오라클 sql 디벨로퍼에서 스케줄러>DBMS작업 에 들어가서 지울 수도 있다
