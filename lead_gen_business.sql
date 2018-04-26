-- What query would you run to get the total revenue for March of 2012?
SELECT  monthname(charged_datetime) as month, sum(billing.amount) AS revenue
FROM billing WHERE Year(charged_datetime)  = 2012 AND Month(charged_datetime) = 03;

--  What query would you run to get total revenue collected from client=2?
SELECT  client_id as client, sum(billing.amount) AS revenue
FROM billing WHERE client_id = 2;

-- What query would you run to get all the sites that client = 10 owns?
SELECT sites.domain_name AS website, clients.client_id AS client_id
FROM clients
JOIN sites ON clients.client_id = sites.client_id WHERE clients.client_id = 10;

-- .What query would you run to get total # of sites created each month for client=1 ? What about for client=20?
SELECT clients.client_id, (1+ CONVERT(sites.domain_name, SIGNED)) AS number_of_website, monthname(sites.created_datetime) AS month_created, Year(created_datetime)
FROM clients
JOIN sites ON clients.client_id = sites.client_id WHERE clients.client_id = 1;

SELECT clients.client_id, (1+ CONVERT(sites.domain_name, SIGNED)) AS number_of_website, monthname(sites.created_datetime) AS month_created, Year(created_datetime)
FROM clients
JOIN sites ON clients.client_id = sites.client_id WHERE clients.client_id = 20;

-- What query would you run to get the total # of leads we have generated for each of our sites between January
-- 1st 2011 to February 15th 2011?

SELECT sites.domain_name AS website, leads.leads_id AS number_of_leads, date_format(sites.created_datetime,'%M %w %Y') AS date_generated
FROM sites
JOIN leads ON sites.site_id = leads.site_id WHERE sites.created_datetime BETWEEN  '2011-01-01' AND '2011-02-15'
GROUP BY sites.domain_name;

-- What query would you run to get a list of client name and the total # of leads we have generated for each of our
-- client between January 1st 2011 to December 31st 2011?

SELECT DISTINCT concat(clients.first_name, clients. last_name) AS name, sites.domain_name AS domain, date_format(sites.created_datetime,'%M %w %Y') AS date_generated
FROM clients
JOIN sites ON clients.client_id = sites.client_id 
JOIN leads ON sites.site_id = leads.site_id
WHERE sites.created_datetime BETWEEN '2011-01-01' AND '2011-12-31'
ORDER BY clients.client_id;

SELECT DISTINCT concat(clients.first_name, clients. last_name) AS name, sites.domain_name AS domain, leads.leads_id
FROM clients
JOIN sites ON clients.client_id = sites.client_id 
JOIN leads ON sites.site_id = leads.site_id
ORDER BY clients.client_id;

-- What query would you run to get a list of client name and the total # of leads we have generated for each client
-- each month between month 1 - 6 of Year 2011?


-- 9.Write a single query that retrieves total revenue collected from each client each month of the year?
SELECT concat(clients.first_name, ' ' ,clients.last_name) AS client_name, billing.amount AS total_revenue, monthname(billing.charged_datetime) AS month_charged, 
Year(billing.charged_datetime) AS year_charged FROM billing, clients WHERE billing.client_id = clients.client_id
GROUP BY clients.client_id, billing.charged_datetime;

-- Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client. 
-- It will become clearer when you add a new field called 'sites' that has all the sites that the client owns.
SELECT CONCAT(clients.first_name,' ',clients.last_name) as client_name, GROUP_CONCAT(sites.domain_name SEPARATOR ' / ') as sites
FROM clients, sites WHERE  clients.client_id = sites.client_id  GROUP BY  clients.client_id;














