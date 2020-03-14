(select 'contacthistory' as 'Table', c.`datecreated` as 'LastUpdate' from ny.`contacthistory` as c
group by str_to_date(c.`datecreated`, "%m/%d/%Y")
order by str_to_date(c.`datecreated`, "%m/%d/%Y") DESC
limit 1)

UNION

(select 'activistcodes'as 'Table', a.`datecreated` as 'LastUpdate' from ny.`activistcodes` as a
group by str_to_date(a.`datecreated`, "%m/%d/%Y")
order by str_to_date(a.`datecreated`, "%m/%d/%Y") DESC
limit 1)

UNION

(select 'surveyquestions' as 'Table', s.`datecreated` as 'LastUpdate' from ny.`surveyquestions` as s
group by str_to_date(s.`datecreated`, "%m/%d/%Y")
order by str_to_date(s.`datecreated`, "%m/%d/%Y") DESC
limit 1)
