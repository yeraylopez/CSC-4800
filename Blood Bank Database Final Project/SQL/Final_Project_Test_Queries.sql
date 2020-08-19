-- donation sites that had blood sent to a hospital in minnesota
SELECT distinct(d.donation_site_id), d.address from donation_site d, hospital h, blood b
where b.hospital_sent_to = (select h.hospital_id from hospital h where h.hospital_address LIKE '%MN%')
and d.donation_site_id = b.donation_location;

-- number of donations in oregon
SELECT count(b.blood_id) from donation_site d, blood b
where b.donation_location = d.donation_site_id
and d.address LIKE '%OR%';

--number of blood donations of each blood type
SELECT count(b.blood_id), b.blood_type from blood b
group by b.blood_type
order by count(b.blood_id) desc;

--Find donors who are eligible to donate and have donated in colorado
SELECT * from donors d join blood b on d.ssn = b.donor_ssn;