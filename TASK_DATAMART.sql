DATAMART


with 
Shakespear as (
SELECT 
work.id,
work.title as "Judul",
work.year as "Tahun_Drama",
work.genre_type as "Genre",
chapter.description as "Chapter",
character.name as "Nama",
character.description as "Peran",
character.speech_count 
	FROM work 
   join chapter 
	on work.id =  chapter.work_id 
	join character 
	on work.id = character.id 
	
	
	where genre_type = 'h'
;

group_by
SELECT COUNT(work.title),  work.year
FROM work 
GROUP BY year

;

//fungsi agregasi//
select count(title) as "jumlah_karya",
(year/10)*10 as "karya_per_10_tahun",
sum (total_words) as "jumlah_kata_yang_ditulis",
count (distinct genre_type) as "jumlah_genre"

from work
group by karya_per_10_tahun
order by jumlah_karya desc ;

Novel Tertebal dan karakter teraktif
select 
w.long_title as "judul",
w."year" as "tahun",
w.total_words,
c.name,
c.speech_count

from "work" w

left join "character_work" cw on w.id = cw.work_id 
left join "character" c on cw.work_id = c.id 
left join "paragraph" p on w.id = p.work_id  and p.character_id = c.id 

order by w.total_words desc 
limit 1;

select from * work

where work.year between 1550 and 1600 ;

select 
character.speech_count  as "dialog",
character.name

from character c 

SELECT MAX(speech_count,character.name)

FROM character c ;

SELECT 
character.name,
character.speech_count  
FROM character  
order by speech_count desc
limit  1
;




