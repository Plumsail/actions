Disaster recovery
#################

The main goal of this document to show our customers that we take seriously to availability of our services. The high-level application infrastructure you can find in Architecture section. 
The document covers the main disaster scenario, reactions and recovery plans. 

System classification
---------------------

According to high-level `architecture`_ we have the following systems: 

* DNS
* CloudFlare
* Load balancer
* API servers
* Database
* Queues & Storages
* Worker’s servers

Monitoring, event alerting and escalation process 
-------------------------------------------------

We use Nagios to monitor our services. In case of any issues with API we will receive a notification about an incident. The available engineer should do a primary diagnostic and classification of the incident. The next steps depend on result of diagnostics in case where the incident cannot be fixed immediately it should be escalated to a manager and dev team. 

Time to diagnose: 5-30 min

DNS & CloudFlare
----------------

We use `CloudFlare`_ as DNS provider and DDoS protection firewall. In case of any issues with the network the administrator should switch DNS records directly to load balancer. 

| RTO: 5-10 min

Load balancer
-------------

We use a Linux machine with HAProxy as load balancer it allows us very flexible distribute network traffic between the API servers and guarantee zero downtime deployment. However, in case of issues with load balancer (invalid configuration or VM maintenance/corruption), the administrator should switch DNS records to backup server or directly to API server.
 
| RTO: 5-10 min

Database
--------

The API servers use the database to authenticate the requests, collect and save statistics. In case of unavailability the database the service will not work. To guarantee the DB availability we use `Azure SQL`_. 
In case of corruption the DB, we can restore it in any point of time for the last 7 days, additionally Azure guarantee geo-distributed storage for backup that allows us rely to azure infrastructure. 

| RPO: 5-10 min
| RTO: 5-10 min

API servers
-----------

To guarantee the SLA we have configured backup server that can receive load in case of corruption of the main server. Load balancer supports heath checks and constantly monitor heath of the API servers. 
Additionally, the load can be switched manually. 

| RTO: 1-5 min

Queues & Storages 
-----------------

We heavily rely on Azure Queue and Azure Storage, we don’t have any reservation mechanism. `Azure Storage SLA`_
In case of unavailability the only thing we can do it try to switch to the storage in the different region. 

| RPO: 10-20 min
| RTO: 10-20 min

Worker’s servers
----------------

To process the tasks, we use a group of workers that do all required processing. Usually this is not critical if some server in down for a short period of time. We can spawn the new servers in a few min depending on workload. 

| RTO: 10-30 min
 

.. _CloudFlare: https://www.cloudflare.com/
.. _Azure SQL: https://azure.microsoft.com/en-us/support/legal/sla/sql-database/v1_0/
.. _Azure Storage SLA: https://azure.microsoft.com/en-us/support/legal/sla/storage/v1_0/
.. _architecture: architecture.html
