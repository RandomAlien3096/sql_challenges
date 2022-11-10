/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted 
alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, 
respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

SELECT Doctor, Professor, Singer, Actor
FROM(
    SELECT NameOrder, 
        max(case Occupation when 'Doctor' then Name end) as Doctor,
        max(case Occupation when 'Professor' then Name end) as Professor,
        max(case Occupation when 'Singer' then Name end) as Singer,
        max(case Occupation when 'Actor' then Name end) as Actor
    From(
        Select
            Occupation, Name, row_number() over(partition by Occupation order by Name asc) as NameOrder
        From Occupations
    ) as NameLists
    Group By NameOrder
) as Names



/*
You are given a table, BST, containing two columns: N and P, 
where N represents the value of a node in Binary Tree, and P is the parent of N.



Write a query to find the node type of Binary Tree ordered by the value of the node. 
Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

SELECT N,
CASE 
    WHEN P IS NULL THEN 'Root'
    WHEN (SELECT COUNT(*) FROM BST WHERE B.N=P)>0 THEN 'Inner'
    ELSE 'Leaf'
END AS PLACE
FROM BST B
ORDER BY N
