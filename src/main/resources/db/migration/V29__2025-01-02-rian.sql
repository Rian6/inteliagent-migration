alter table usuario drop column latitude;
alter table usuario drop column longitude;

alter table usuario add column latitude DOUBLE;
alter table usuario add column longitude DOUBLE;