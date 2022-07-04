START TRANSACTION;

CREATE TABLE account
(
    account_id   BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    oauth_id     VARCHAR(64)  NULL COMMENT 'OAuth ID',
    name         VARCHAR(32)  NULL COMMENT '이름',
    email        VARCHAR(32)  NULL COMMENT '이메일',
    avatar_url   VARCHAR(511) NULL COMMENT '아바타 이미지 URL',
    library_role VARCHAR(32)  NULL COMMENT '도서관 사용자등급'
);

CREATE TABLE category
(
    category_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NULL COMMENT '카테고리명'
);

CREATE TABLE bookcase
(
    bookcase_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    location    VARCHAR(127) NULL COMMENT '보관위치'
);

CREATE TABLE book
(
    book_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title            VARCHAR(255)    NULL COMMENT '책제목',
    description      VARCHAR(2047)   NULL COMMENT '책 설명',
    author           VARCHAR(255)    NULL COMMENT '저자',
    publisher        VARCHAR(255)    NULL COMMENT '발행사',
    publication_date TIMESTAMP       NULL COMMENT '발행날짜',
    image_url        VARCHAR(511)    NULL COMMENT '책 사진',
    isbn             VARCHAR(127)    NULL COMMENT 'ISBN',
    available        TINYINT(1)      NULL COMMENT '책 대여 가능 여부',
    recommend_count  BIGINT          NULL COMMENT '추천 수',
    category_id      BIGINT UNSIGNED NULL,
    bookcase_id      BIGINT UNSIGNED NULL,
    CONSTRAINT book_category_id_fk FOREIGN KEY (category_id) REFERENCES category (category_id),
    CONSTRAINT book_bookcase_id_fk FOREIGN KEY (bookcase_id) REFERENCES bookcase (bookcase_id)
);

CREATE TABLE recommend
(
    recommend_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    account_id   BIGINT UNSIGNED NULL,
    book_id      BIGINT UNSIGNED NULL,
    CONSTRAINT recommend_account_id_fk FOREIGN KEY (account_id) REFERENCES account (account_id),
    CONSTRAINT recommend_book_id_fk FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE TABLE rental
(
    rental_id   BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    begin_date  TIMESTAMP       NULL COMMENT '빌린 날짜',
    return_date TIMESTAMP       NULL COMMENT '반납 날짜',
    is_returned TINYINT(1)      NULL COMMENT '반납 여부',
    book_id     BIGINT UNSIGNED NULL,
    account_id  BIGINT UNSIGNED NULL,
    CONSTRAINT rental_book_id_fk FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT rental_account_id_fk FOREIGN KEY (account_id) REFERENCES account (account_id)
);

CREATE TABLE admin
(
    admin_id     BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    admin_name   VARCHAR(127) NULL COMMENT '관리자 ID',
    password     VARCHAR(127) NOT NULL COMMENT '비밀번호',
    library_role VARCHAR(32)  NULL COMMENT '도서관 사용자 등급'
);

COMMIT;
