question 1
SELECT quantityOnHand
FROM item
WHERE itemDescription = 'bottle of antibiotics';

question 2
SELECT volunteerName
FROM volunteer
WHERE (volunteerTelephone is NULL or volunteerTelephone NOT LIKE '2%')
AND volunteerName NOT LIKE '%Jones';

question 3
SELECT volunteer.volunteerName
FROM volunteer as v
JOIN assignment 
ON v.volunteerId = assignment.volunteerId
JOIN task as t
ON assignment.taskCode = t.taskCode
JOIN task_type as tt
ON task.taskTypeId = tt.taskTypeId 
WHERE tt.taskTypeName = 'transporting';

question 4
SELECT task.taskDescription
FROM task
LEFT JOIN assignment 
ON task.taskCode = assignment.taskCode
WHERE assignment.taskCode IS NULL;

question 5
SELECT DISTINCT pt.packageTypeName
FROM package_type as pt
JOIN package as p 
ON pt.packageTypeId = p.packageTypeId
JOIN package_contents as pc
ON p.packageId = pc.packageId 
JOIN item 
ON pc.itemId = item.itemId 
WHERE item.itemDescription LIKE '%bottle%';

question 6
SELECT item.itemDescription
FROM item
LEFT JOIN package_contents
ON item.itemId = package_contents.itemId
WHERE package_contents.itemId IS NULL;

question 7
SELECT DISTINCT task.taskDescription
FROM volunteer
JOIN assignment
ON volunteer.volunteerId = assignment.volunteerId
JOIN task 
ON assignment.taskCode = task.taskCode
WHERE volunteerAddress LIKE '%NJ%';

question 8
SELECT DISTINCT volunteer.volunteerName
FROM volunteer
JOIN assignment
ON volunteer.volunteerId = assignment.volunteerId
WHERE assignment.startDateTime >= '2021-01-01'
AND assignment.startDateTime < '2021-07-01';

question 9
SELECT DISTINCT volunteer.volunteerName
FROM volunteer
JOIN assignment
ON volunteer.volunteerId = assignment.volunteerId
JOIN task
ON assignment.taskCode = task.taskCode 
JOIN package 
ON task.taskCode = package.taskCode
JOIN package_contents
ON package.packageId = package_contents.packageId
JOIN item
ON package_contents.itemId = item.itemId
WHERE item.itemDescription = 'can of spam';


question 10
SELECT DISTINCT item.itemDescription
FROM item
JOIN package_contents
ON item.itemId = package_contents.itemId
WHERE item.itemValue * package_contents.itemQuantity = 100;


Question 11
SELECT ts.taskStatusName, COUNT(DISTINCT a.volunteerId) AS numVolunteers
FROM task_status as ts
JOIN task 
ON ts.taskStatusId = task.taskStatusId
JOIN assignment as a
ON task.taskCode = a.taskCode 
GROUP BY ts.taskStatusName 
ORDER BY numVolunteers DESC;

question 12
SELECT task.taskCode, SUM(package.packageWeight) AS totalWeight
FROM task
JOIN package
ON task.taskCode = package.taskCode
GROUP BY task.taskCode
ORDER BY totalWeight DESC
LIMIT 1;

question 13
SELECT COUNT (*) AS numTasks
FROM task
JOIN task_type as tt
ON task.taskTypeId = tt.taskTypeId 
WHERE tt.taskTypeName NOT LIKE '%packing%';


question 14
SELECT item.itemDescription
FROM item
JOIN package_contents as pc 
ON item.itemId = pc.itemId
JOIN package
ON pc.packageId = package.packageId
JOIN task
ON package.taskCode = task.taskCode
JOIN assignment 
ON task.taskCode = assignment.taskCode
GROUP BY item.itemDescription
HAVING COUNT(DISTINCT assignment.volunteerId) < 3;


question 15
SELECT pc.packageId, SUM(item.itemValue * pc.itemQuantity) AS totalValue
FROM package_contents as pc
JOIN item
ON pc.itemId = item.itemId
GROUP BY pc.packageId
HAVING totalValue > 100
ORDER BY totalValue ASC;







