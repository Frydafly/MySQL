[c.org=Org]
  and
  [p.County=County]
  and
  [e.City=City]
  and
  [p.Ethnicity=Ethnicity]
  and
  [e.Township=Township]
  and
  [p.ED=ElectionDistrict]
  and
  [p.CD=CongressionalDistrict]
  and
  [p.SD=StateSenateDistrict]
  and
  [p.AD=StateAssemblyDistrict]
  and
  [p.Race=Race]
  and
  [c.Result=Result]
  and
  [p.NYCCD=NYCCouncil]
  and
  [c.ContactType=ContactType]
  and
  [c.CanvassedBy=Canvasser]
  and 
  [c.InputType=InputType]
  and
 case
    when c.DateCanvassed ilike '%DateCanvasse%'
      then null
    else case
      when length(split_part(c.DateCanvassed, '/', 3)) = 4
        then to_date(c.DateCanvassed, 'MM/DD/YYYY')
      else to_date(c.DateCanvassed, 'MM/DD/YY')
    end
  end > [daterange_start]
and case
    when c.DateCanvassed ilike '%DateCanvasse%'
      then null
    else case
      when length(split_part(c.DateCanvassed, '/', 3)) = 4
        then to_date(c.DateCanvassed, 'MM/DD/YYYY')
      else to_date(c.DateCanvassed, 'MM/DD/YY')
    end
  end <= [daterange_end]
and
[p.Party=Party]
