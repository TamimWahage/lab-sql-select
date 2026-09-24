/* Challenge 1 */
SELECT authors.au_id AS 'AUTHOR ID', au_fname AS 'FIRST NAME', au_lname AS 'LAST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER' FROM authors
	INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id;
	
SELECT COUNT(authors.au_id) AS 'COUNT',  (SELECT COUNT(*) FROM titleauthor) AS 'TITLE AUTHOR COUNT' FROM authors 
	INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id;
	
/* Challenge 2*/
SELECT authors.au_id AS 'AUTHOR ID', au_fname AS 'FIRST NAME', au_lname AS 'LAST NAME', pub_name AS 'PUBLISHER', COUNT(titles.title_id) AS 'TITLE COUNT'
FROM authors
	INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id


SELECT titles.title AS 'TITLE', COUNT(titles.title_id) as 'TITLE COUNT PER AUTHOR'
FROM authors
	INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id
GROUP BY authors.au_id

UNION ALL

SELECT  'SUM TITLE AUTHOR' AS 'TITLE',  COUNT(titleauthor.au_id) AS 'TITLE COUNT PER AUTHOR'
FROM titleauthor

UNION ALL

SELECT 'SUM' AS 'TITLE', SUM(single_sums.agg_sum) as 'TITLE COUNT PER AUTHOR'
FROM (
	SELECT COUNT(authors.au_id) AS agg_sum FROM authors
		INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
		INNER JOIN titles ON titles.title_id=titleauthor.title_id
		INNER JOIN publishers ON titles.pub_id=publishers.pub_id
	GROUP BY authors.au_id
) AS single_sums

/* Challenge 3 */
SELECT authors.au_id AS 'AUTHOR ID', au_fname AS 'FIRST NAME', au_lname AS 'LAST NAME', COUNT(titles.title_id) AS 'TOTAL'
FROM authors
	INNER JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY COUNT(titles.title_id) DESC	LIMIT 3


/* Challenge 4 */
SELECT authors.au_id AS 'AUTHOR ID', au_fname AS 'FIRST NAME', au_lname AS 'LAST NAME', COUNT(titles.title_id) AS 'TOTAL'
FROM authors
	LEFT JOIN titleauthor ON authors.au_ID=titleauthor.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY COUNT(titles.title_id) DESC