
-- create metadata aspect table
create table metadata_aspect_v2 (
  urn                           varchar(500) not null,
  aspect                        varchar(200) not null,
  version                       bigint not null,
  metadata                      text not null,
  systemmetadata                text,
  createdon                     timestamp not null,
  createdby                     varchar(255) not null,
  createdfor                    varchar(255),
  constraint pk_metadata_aspect_v2 primary key (urn,aspect,version)
);

insert into metadata_aspect_v2 (urn, aspect, version, metadata, createdon, createdby) values(
  'urn:li:corpuser:datahub',
  'corpUserInfo',
  0,
  '{"displayName":"Data Hub","active":true,"fullName":"Data Hub","email":"datahub@linkedin.com"}',
  now(),
  'urn:li:corpuser:__datahub_system'
), (
  'urn:li:corpuser:datahub',
  'corpUserEditableInfo',
  0,
  '{"skills":[],"teams":[],"pictureLink":"https://raw.githubusercontent.com/datahub-project/datahub/master/datahub-web-react/src/images/default_avatar.png"}',
  now(),
  'urn:li:corpuser:__datahub_system'
);

-- create metadata index table
CREATE TABLE metadata_index (
 id NOT NULL BIGSERIAL,
 urn VARCHAR(200) NOT NULL,
 aspect VARCHAR(150) NOT NULL,
 path VARCHAR(150) NOT NULL,
 longVal BIGINT,
 stringVal VARCHAR(200),
 doubleVal DOUBLE precision,
 CONSTRAINT id_pk PRIMARY KEY (id)
);

CREATE INDEX longIndex ON metadata_index (urn,aspect,path,longVal);
CREATE INDEX stringIndex ON metadata_index (urn,aspect,path,stringVal);
CREATE INDEX doubleIndex ON metadata_index (urn,aspect,path,doubleVal);