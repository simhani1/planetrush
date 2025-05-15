create table default_planet_img
(
    default_planet_img_id bigint auto_increment
        primary key,
    upload_date           datetime(6)  not null,
    img_url               varchar(255) not null
);

create table job_log
(
    end_time     datetime(6)  not null,
    id           bigint auto_increment
        primary key,
    start_time   datetime(6)  not null,
    elapsed_time varchar(100) null,
    job_type     varchar(255) not null
);

create table member
(
    created_at datetime(6)                 not null,
    member_id  bigint auto_increment
        primary key,
    updated_at datetime(6)                 not null,
    nickname   varchar(10)                 not null,
    ci         varchar(255)                not null,
    email      varchar(255)                not null,
    provider   enum ('KAKAO')              not null,
    status     enum ('ACTIVE', 'INACTIVE') not null
);

create table challenge_history
(
    progress             double                                              not null,
    challenge_history_id bigint auto_increment
        primary key,
    member_id            bigint                                              null,
    challenge_content    varchar(255)                                        not null,
    planet_img_url       varchar(255)                                        not null,
    planet_name          varchar(255)                                        not null,
    category             enum ('BEAUTY', 'ETC', 'EXERCISE', 'LIFE', 'STUDY') not null,
    challenge_result     enum ('FAIL', 'SUCCESS')                            not null,
    constraint FK25mm5qqmdks88ir8st1h0ds4e
        foreign key (member_id) references member (member_id)
);

create table planet
(
    current_participants      int                                                                     not null,
    end_date                  date                                                                    not null,
    max_participants          int                                                                     not null,
    start_date                date                                                                    not null,
    created_at                datetime(6)                                                             not null,
    planet_id                 bigint auto_increment
        primary key,
    name                      varchar(10)                                                             not null,
    planet_img_url            varchar(300)                                                            null,
    standard_verification_img varchar(300)                                                            null,
    challenge_content         varchar(255)                                                            not null,
    verification_cond         varchar(255)                                                            not null,
    category                  enum ('BEAUTY', 'ETC', 'EXERCISE', 'LIFE', 'STUDY')                     not null,
    planet_status             enum ('COMPLETED', 'DESTROYED', 'IN_PROGRESS', 'READY', 'UNDER_REVIEW') not null
);

create table popular_keyword
(
    created_at datetime(6)                                         not null,
    keyword_id bigint auto_increment
        primary key,
    keyword    varchar(20)                                         not null,
    category   enum ('BEAUTY', 'ETC', 'EXERCISE', 'LIFE', 'STUDY') not null
);

create table progress_avg
(
    beauty_avg   double not null,
    etc_avg      double not null,
    exercise_avg double not null,
    life_avg     double not null,
    progress_id  int auto_increment
        primary key,
    study_avg    double not null,
    total_avg    double not null,
    member_id    bigint null,
    constraint UK_366pstfuccdop4x0xbjie1r1x
        unique (member_id),
    constraint FK34tf7y0c9qjyyidu506kpfa4e
        foreign key (member_id) references member (member_id)
);

create table resident
(
    is_banned   bit    not null,
    is_creator  bit    not null,
    member_id   bigint null,
    planet_id   bigint null,
    resident_id bigint auto_increment
        primary key,
    constraint FKasuw3yslhspfa3soomfgeempr
        foreign key (planet_id) references planet (planet_id),
    constraint FKfopwwhmmx6htu654exba6lxdi
        foreign key (member_id) references member (member_id)
);

create table verification_record
(
    similarity_score       double       null,
    verified               bit          null,
    member_id              bigint       null,
    planet_id              bigint       null,
    upload_date            datetime(6)  not null,
    verification_record_id bigint auto_increment
        primary key,
    img_url                varchar(256) not null,
    constraint FK5ll9rsdp7e9m0vjgnjne0tx2p
        foreign key (planet_id) references planet (planet_id),
    constraint FKs4lmxpuc6lw5uwq7uevnmps3j
        foreign key (member_id) references member (member_id)
);

