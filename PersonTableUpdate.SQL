
##1.UNION AC, SQ, CH VANIDs -- find which ones are not in the Person Table

select p.VANID, b.VANID from (SELECT ny.activistcodes.VANID FROM ny.activistcodes
UNION DISTINCT
SELECT ny.contacthistory.VANID FROM ny.contacthistory
UNION DISTINCT
SELECT ny.surveyquestions.VANID FROM ny.surveyquestions) as b
left join ny.person p on b.VANID = p.VANID where p.VANID is null

##2. Export the above
##3. Bulk Import to VAN & Save as “Person20190318” to 2019NYCET
##4. Export Standard Text with custom fields existing in Person Table (use pre-set “Person” export format)
##VANID    DWID    StateFileID    HHID    Sex    Race    Ethnicity    DoB    DoR    RegStatus    County    Party    Lat    Long    ##2012G    2013G    2014G    2015G    2016G    2017G    2018G    2012P    2013P    2014P    2015P    2016P    2017P    2018P    ##ED    CD        AD SD    NYCCD     CensusCounty    CensusTract

##5. Add new vote history columns
##6. Change column names and check that data is consistent with person table
##7. Upload person table
##** Also ** in order to also update existing Person Table records with new vote history
##A. query all people that don’t have vote history in the server person table:

SELECT p.VANID FROM ny.person p WHERE p.2019P IS null

## if it's too big, then iterate through this

SELECT p.VANID FROM ny.person p
where p.VANID not in (select * from ny.test t)
and p.2019P IS null


##B. Import that list to VAN
##C. Filter that list in VAN to people that DID vote in the election
##D. export that as standard text in VAN with Person table format
##E. import to existing person table and “replace”
##8. Code that UNION DISTINCT scores table & person table (to get both the missing vanids and the new ones, since we will do a ##massive import of the old & the new scores)

Select p.VANID from ny.person p UNION DISTINCT select s.VANID from ny.scores s

##9. Bulk import to VAN
##10. Export Standard Text with Scores
##VANID, DWID, Scores
##11. Change column names of scores and add new scores
##12. Import Scores table to server
