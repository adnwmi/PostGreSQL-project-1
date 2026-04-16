select * from audio_cards;
select * from audiobooks;
select * from listenings;

#task-1
#FfE3OnJS - coraline code, 13013 - duration
select count(state) from audio_cards
where audiobook_uuid = 'FfE3OnJS'
and progress > 1301.3; #more than 10% from coraline duration

#task-2
select l.os_name, a.title as audiobook_title, count(distinct l.user_id) as unique_users,
sum (l.position_to - l.position_from) / 3600 as total_listen_hours
from listenings l
join audiobooks a on l.audiobook_uuid = a.uuid
where l.is_test = 0
group by l.os_name, a.title;

#task-3
select audiobook_uuid, count(*) as listeners_count from audio_cards
where state = 'listening'
group by audiobook_uuid
order by listeners_count desc
limit 1;

#task-4
select audiobook_uuid, count(*) finished_book from audio_cards
where state = 'finished'
group by audiobook_uuid
order by finished_book desc
limit 1;

