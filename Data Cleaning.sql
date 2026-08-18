-- See all the data imported
select * from blinkit_data

select count(*) from blinkit_data

-- Data Cleaning

update blinkit_data
set Item_Fat_Content = 
case
when Item_Fat_Content IN ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end

-- Query To Check Data has been cleaned or not

select distinct (Item_Fat_Content)  from blinkit_data