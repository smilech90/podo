DROP TABLE "TB_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "TB_REVIEW";
DROP TABLE "TB_LIKE";
DROP TABLE "TB_FILM" CASCADE CONSTRAINTS;
DROP TABLE "TB_DETAIL_FILM" CASCADE CONSTRAINTS;
DROP TABLE "TB_BOARD";
DROP TABLE "TB_RATING_FILM";
DROP TABLE "TB_COMMENT";
DROP TABLE "TB_INQUIRY";
DROP TABLE "TB_NOTICE";
DROP TABLE "TB_COLLECTION" CASCADE CONSTRAINTS;
DROP TABLE "TB_FILM_COLLECTION";
DROP TABLE "TB_REPORT";
DROP TABLE "TB_BLACK_MEMBER";
DROP TABLE "TB_ACTOR" CASCADE CONSTRAINTS;
DROP TABLE "TB_IMAGE";
DROP TABLE "TB_FILM_IMAGE";
DROP TABLE "TB_FILM_ACTOR";
DROP TABLE "TB_RATING_REVIEW";
DROP TABLE "TB_GENRE" CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MEMBER_ID;
DROP SEQUENCE SEQ_REVIEW_ID;
DROP SEQUENCE SEQ_LIKE_ID;
DROP SEQUENCE SEQ_FILM_ID;
DROP SEQUENCE SEQ_DFILM_ID;
DROP SEQUENCE SEQ_BOARD_ID;
DROP SEQUENCE SEQ_RATING_FILM_ID;
DROP SEQUENCE SEQ_COMMENT_ID;
DROP SEQUENCE SEQ_INQUERY_ID;
DROP SEQUENCE SEQ_NOTICE_ID;
DROP SEQUENCE SEQ_COLLECTION_ID;
DROP SEQUENCE SEQ_REPORT_ID;
DROP SEQUENCE SEQ_BLACK_ID;
DROP SEQUENCE SEQ_ACTOR_ID;
DROP SEQUENCE SEQ_IMAGE_ID;
DROP SEQUENCE SEQ_FIMAGE_ID;
DROP SEQUENCE SEQ_RATING_REVIEW_ID;
DROP SEQUENCE SEQ_GENRE_ID;

CREATE SEQUENCE SEQ_MEMBER_ID;
CREATE SEQUENCE SEQ_REVIEW_ID;
CREATE SEQUENCE SEQ_LIKE_ID;
CREATE SEQUENCE SEQ_FILM_ID;
CREATE SEQUENCE SEQ_DFILM_ID;
CREATE SEQUENCE SEQ_BOARD_ID;
CREATE SEQUENCE SEQ_RATING_FILM_ID;
CREATE SEQUENCE SEQ_COMMENT_ID;
CREATE SEQUENCE SEQ_INQUERY_ID;
CREATE SEQUENCE SEQ_NOTICE_ID;
CREATE SEQUENCE SEQ_COLLECTION_ID;
CREATE SEQUENCE SEQ_REPORT_ID;
CREATE SEQUENCE SEQ_BLACK_ID;
CREATE SEQUENCE SEQ_ACTOR_ID;
CREATE SEQUENCE SEQ_IMAGE_ID;
CREATE SEQUENCE SEQ_FIMAGE_ID;
CREATE SEQUENCE SEQ_RATING_REVIEW_ID;
CREATE SEQUENCE SEQ_GENRE_ID;


CREATE TABLE "TB_MEMBER" (
	"ID"	NUMBER		NOT NULL,
	"IMAGE"	VARCHAR2(200)	DEFAULT 'DEFAULT IMAGE PATH'	NOT NULL,
	"EMAIL"	VARCHAR2(30)		NOT NULL,
	"PWD"	VARCHAR2(1000)		NOT NULL,
	"NICKNAME"	VARCHAR2(30)		NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"ENROLL_DATE"	TIMESTAMP		NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NOT NULL,
	"GOOGLE_ID"	NUMBER		NULL,
	"KAKAO_ID"	NUMBER		NULL,
  "AUTHO" NUMBER  DEFAULT 1 NOT NULL
);

CREATE TABLE "TB_REVIEW" (
	"ID"	NUMBER		NOT NULL,
	"CONTENT"	CLOB		NOT NULL,
	"INAPPROPRIATE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"SPOILER_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"LIKE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"SPOILER_CHECK"	VARCHAR2(2)	DEFAULT 'N'	NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"FILM_ID"	NUMBER		NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_LIKE" (
	"ID"	NUMBER		NOT NULL,
	"TYPE"	NUMBER		NOT NULL,
	"TARGET_ID"	NUMBER		NOT NULL,
	"USER_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_FILM" (
	"ID"	NUMBER		NOT NULL,
	"TITLE_KOR"	VARCHAR2(100)		NULL,
	"TITLE_ENG"	VARCHAR2(100)		NULL,
	"DIRECTOR"	VARCHAR2(50)		NULL,
	"RELEASE_YEAR"	NUMBER		NOT NULL,
	"PRODUCTION_COUNTRY"	VARCHAR2(50)		NOT NULL,
	"PRODUCTION_STATUS"	VARCHAR2(30)		NOT NULL,
	"GENRE_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_DETAIL_FILM" (
	"ID"	NUMBER		NOT NULL,
	"SYNOPSYS"	CLOB		NULL,
	"TRIVIA"	CLOB		NULL,
	"TRAILER"	VARCHAR2(200)		NULL,
	"FOOTAGE"	VARCHAR2(200)		NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL,
	"FILM_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_BOARD" (
	"ID"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(300)		NOT NULL,
	"CONTENT"	CLOB		NOT NULL,
	"VIEW_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"INAPPROPRIATE_COUNT"	NUMBER		NULL,
	"SPOILER_COUNT"	NUMBER		NULL,
	"LIKE_COUNT"	NUMBER		NULL,
	"MODIFY_DATE"	TIMESTAMP		NOT NULL,
	"CREATE_DATE"	TIMESTAMP		NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL,
	"IMAGE_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_RATING_FILM" (
	"ID"	NUMBER		NOT NULL,
	"STAR"	NUMBER		NULL,
	"SAW"	VARCHAR2(2)	DEFAULT 'N'	NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL,
	"FILM_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_COMMENT" (
	"ID"	NUMBER		NOT NULL,
	"TYPE"	NUMBER		NOT NULL,
	"CONTENT"	CLOB		NOT NULL,
	"INAPPROPRIATE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"SPOILER_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"LIKE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	TIMESTAMP		NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"LEVEL"	NUMBER	DEFAULT 0	NOT NULL,
	"MEMBER_ID"	NUMBER		NULL,
	"BOARD_ID"	NUMBER		NULL,
	"REVIEW_ID"	NUMBER		NULL
);

CREATE TABLE "TB_INQUIRY" (
	"ID"	NUMBER		NOT NULL,
	"TYPE"	NUMBER		NOT NULL,
	"CONTENT"	CLOB		NOT NULL,
	"CREATE_DATE"	TIMESTAMP		NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"USER_ID"	NUMBER		NOT NULL,
	"ANSWER"	CLOB		NULL,
	"ANSWER_DATE"	TIMESTAMP		NULL,
	"ADMIN_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_NOTICE" (
	"ID"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	CLOB		NOT NULL,
	"VIEW_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	TIMESTAMP		NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NOT NULL,
	"IMAGE_ID"	NUMBER		NOT NULL,
	"ADMIN_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_COLLECTION" (
	"ID"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	CLOB		NULL,
	"LIKE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"INAPPROPRIATE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"SPOILER_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	TIMESTAMP		NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NOT NULL,
	"STATUS"	VARCHAR2(2)	DEFAULT 'Y'	NOT NULL,
	"PRIVATE"	VARCHAR2(2)	DEFAULT 'N'	NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_FILM_COLLECTION" (
	"COLLECTION_ID"	NUMBER		NOT NULL,
	"FILM_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_REPORT" (
	"ID"	NUMBER		NOT NULL,
	"TYPE"	NUMBER		NOT NULL,
	"TARGET_ID"	NUMBER		NOT NULL,
	"CONTENT"	NUMBER		NOT NULL,
	"REPORT_ID"	NUMBER		NOT NULL,
	"REPORTED_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_BLACK_MEMBER" (
	"ID"	NUMBER		NOT NULL,
	"DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"TARGET_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_ACTOR" (
	"ID"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NOT NULL,
	"PROFILE_IMG"	VARCHAR2(300)		NOT NULL
);

CREATE TABLE "TB_IMAGE" (
	"ID"	NUMBER		NOT NULL,
	"PATH"	VARCHAR2(1000)		NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(1000)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)		NOT NULL,
	"TYPE"	NUMBER		NOT NULL
);

CREATE TABLE "TB_FILM_IMAGE" (
	"ID"	NUMBER		NOT NULL,
	"TYPE"	NUMBER		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)		NOT NULL,
	"DFILM_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_FILM_ACTOR" (
	"ACTOR_ID"	NUMBER		NOT NULL,
	"DFILM_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_RATING_REVIEW" (
	"ID"	NUMBER		NOT NULL,
	"RATING_SOUND"	NUMBER		NOT NULL,
	"RATING_VISUAL"	NUMBER		NOT NULL,
	"RATING_ACTING"	NUMBER		NOT NULL,
	"RATING_POP"	NUMBER		NOT NULL,
	"RATING_SCRIPT"	NUMBER		NOT NULL,
	"RATING_DIRECT"	NUMBER		NOT NULL,
	"REVIEW_ID"	NUMBER		NOT NULL,
	"MEMBER_ID"	NUMBER		NOT NULL
);

CREATE TABLE "TB_GENRE" (
	"ID"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(30)		NOT NULL
);

ALTER TABLE "TB_MEMBER" ADD CONSTRAINT "PK_TB_MEMBER" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "PK_TB_REVIEW" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "PK_TB_LIKE" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_FILM" ADD CONSTRAINT "PK_TB_FILM" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_DETAIL_FILM" ADD CONSTRAINT "PK_TB_DETAIL_FILM" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "PK_TB_BOARD" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_RATING_FILM" ADD CONSTRAINT "PK_TB_RATING_FILM" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "PK_TB_COMMENT" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_INQUIRY" ADD CONSTRAINT "PK_TB_INQUIRY" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_COLLECTION" ADD CONSTRAINT "PK_TB_COLLECTION" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "PK_TB_FILM_COLLECTION" PRIMARY KEY (
	"COLLECTION_ID",
	"FILM_ID"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_BLACK_MEMBER" ADD CONSTRAINT "PK_TB_BLACK_MEMBER" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_ACTOR" ADD CONSTRAINT "PK_TB_ACTOR" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_IMAGE" ADD CONSTRAINT "PK_TB_IMAGE" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_FILM_IMAGE" ADD CONSTRAINT "PK_TB_FILM_IMAGE" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "PK_TB_FILM_ACTOR" PRIMARY KEY (
	"ACTOR_ID",
	"DFILM_ID"
);

ALTER TABLE "TB_RATING_REVIEW" ADD CONSTRAINT "PK_TB_RATING_REVIEW" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_GENRE" ADD CONSTRAINT "PK_TB_GENRE" PRIMARY KEY (
	"ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "FK_FILM_COLLECTION_C" FOREIGN KEY (
	"COLLECTION_ID"
)
REFERENCES "TB_COLLECTION" (
	"ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "FK_FILM_COLLECTION_F" FOREIGN KEY (
	"FILM_ID"
)
REFERENCES "TB_FILM" (
	"ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "FK_FILM_ACTOR_A" FOREIGN KEY (
	"ACTOR_ID"
)
REFERENCES "TB_ACTOR" (
	"ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "FK_FILM_ACTOR_D" FOREIGN KEY (
	"DFILM_ID"
)
REFERENCES "TB_DETAIL_FILM" (
	"ID"
);

ALTER TABLE "TB_FILM" ADD CONSTRAINT "FK_FILM_GENRE" FOREIGN KEY (
	"GENRE_ID"
)
REFERENCES "TB_GENRE" (
	"ID"
);


-- 장르
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '드라마');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '액션');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '다큐멘터리');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '스릴러');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '미스터리');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '범죄');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '공포');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '뮤지컬');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '로맨스');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, 'SF');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '판타지');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '모험');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '코미디');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '가족');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '서부극');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '애니메이션');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '전쟁');

-- 영화
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '감쪽같은 그녀', 'A Little Princess', '허인무', 2019, '한국', '개봉예정', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '안녕 베일리', 'A Dog'||CHR(39)||'s Journey', '게일 맨쿠소', 2019, '미국', '개봉', 14);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '기생충', 'PARASITE', '봉준호', 2019, '한국', '개봉', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '조커', 'JOKER', '토드 필립스', 2019, '미국', '개봉', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '녹차의 중력', 'Gravity of the Tea', '정성일', 2018, '한국', '개봉예정', 3);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '어벤져스: 인피니티 워', 'Avengers: Infinity War', '안소니 루소,조 루소', 2018, '미국', '개봉', 11);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '카메라를 멈추면 안 돼!', 'One Cut of the Dead', '우에다 신이치로', 2017, '일본', '개봉', 13);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '세 번째 살인', 'The Third Murder', '고레에다 히로카즈', 2017, '일본', '개봉', 4);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '너는 여기에 없었다', 'You Were Never Really Here', '린 램지', 2017, '미국', '개봉', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '라라랜드', 'La La Land', '데이미언 셔젤', 2016, '미국', '개봉', 8);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '너의 이름은.', 'your name.', '신카이 마코토', 2016, '일본', '개봉', 16);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '미인어', 'The Mermaid', '주성치', 2016, '중국', '개봉', 13);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '더 위치', 'The Witch', '로버트 에거스', 2015, '미국', '개봉', 7);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '5일의 마중', 'Coming Home', '장예모', 2014, '중국', '개봉', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '그랜드 부다페스트 호텔', 'The Grand Budapest Hotel', '웨스 앤더슨', 2014, '미국', '개봉', 5);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '나이트 크롤러', 'Nightcrawler', '댄 길로이', 2014, '미국', '개봉', 6);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '매드 맥스: 분노의 도로', 'Mad Max: Fury Road', '조지 밀러', 2015, '미국', '개봉', 2);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '그녀', 'Her', '스파이크 존즈', 2013, '미국', '개봉', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '콜 미 바이 유어 네임', 'Call Me by Your Name', '루카 구아다니노', 2017, '미국', '개봉', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '미드나잇 인 파리', 'Midnight In Paris', '우디 앨런', 2011, '미국', '개봉', 13);

-- 멤버
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'admin01@gmail.com', 'admin01', '관리자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 2);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'admin02@gmail.com', 'admin02', '관리자02', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 2);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user01@naver.com', 'user01', '사용자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user02@naver.com', 'user02', '사용자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user03@naver.com', 'user03', '사용자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user04@naver.com', 'user04', '사용자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user05@naver.com', 'user05', '사용자01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'test@test.test', '$2a$10$Qniqrgu.rkuttWzD7Opn3e/HF.UbcwGEenI2jOANJYIyLd0J7qmW.', 'test', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);

-- 배우
INSERT INTO TB_ACTOR
VALUES(SEQ_ACTOR_ID.NEXTVAL, '호아킨 피닉스', 'NULL');

-- 영화 상세정보
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '이것은 시놉시스', '이것은 트리비아', '예고편 링크', '스틸영상', DEFAULT, 1, 1);

-- 영화상세정보 <->  배우
INSERT INTO TB_FILM_ACTOR
VALUES(1,1);

-- 리뷰
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '리뷰내용 1', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '리뷰 내용 2', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '리뷰 내용 03', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 4, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '뤼뷰 내용 04', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 5, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '리뷰 내용 05', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 6, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 06', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 07', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 3, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 08', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 4, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 09', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 10', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 3, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 11', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 4, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 12', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 13', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 6, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 14', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 7, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 15', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 8, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 16', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 9, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 17', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 10, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 18', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 19', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 3, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '이것은 리뷰 내용 20', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 4, 3);


-- 리뷰 평점
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,2,3,4,5,6,1,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,2,3,4,5,6,2,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,5,5,5,5,6,3,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,4,4,3,4,5,6,4,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,3,4,5,4,5,6,5,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,6,5,3,4,5,6,6,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,6,4,3,4,5,6,7,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,5,4,4,5,6,8,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,9,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,10,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,11,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,12,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,13,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,14,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,15,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,16,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,17,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,18,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,19,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,20,1);

-- 영화 별점
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 3, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 3, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 4, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 4, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 5, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 5, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 6, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 6, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 6, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 6, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 7, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 7, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 7, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 7, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 8, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 8, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 8, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 8, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 1);


DROP VIEW VI_FILM_AVG_STAR;
-- 영화별 평균 별점 VIEW
CREATE OR REPLACE VIEW VI_FILM_AVG_STAR
AS SELECT R.*, FF.GENRE_ID, G.NAME AS NAME
   FROM (SELECT F.ID AS FILM_ID, F.TITLE_KOR AS TITLE_KOR, AVG(STAR) AS AVG_STAR
         FROM TB_RATING_FILM RT
         JOIN TB_FILM F ON (RT.FILM_ID = F.ID)
         GROUP BY F.ID, F.TITLE_KOR) R
   JOIN TB_FILM FF ON (FILM_ID = FF.ID)
   JOIN TB_GENRE G ON (FF.GENRE_ID = G.ID);

COMMIT;
