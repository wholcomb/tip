SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[rpt_competency_ge2013_proc] 
--	@start_year int,
--	@end_year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	DELETE FROM [dbo].[rpt_competency_ge2013]
	DELETE FROM [dbo].[rpt_competency_ge2013_tree_map]
	DELETE FROM [dbo].[rpt_competency_ge2013_metric]
	DELETE FROM [dbo].[rpt_competency_ge2013_score]

	--
	-- Generate the tree of metrics
	--

	DECLARE @CurrentID INT
	DECLARE @ParentID INT

	-- Root
	SET IDENTITY_INSERT [dbo].[rpt_competency_ge2013] ON
 	INSERT INTO [dbo].[rpt_competency_ge2013] (id, name) VALUES (1, '')
	SET @ParentID = SCOPE_IDENTITY()
	SET IDENTITY_INSERT [dbo].[rpt_competency_ge2013] OFF

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Core Clerkship Shelf Exam Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neurology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Psychiatry')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Gynecology/Obstetrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Surgery')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Medicine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pediatrics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Descend
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pre-Clinical Course Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )
	SET @ParentID = @CurrentID

 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Scientific Foundations of Medicine')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

	-- Leaf
 	INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Macromolecules')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cell Physiology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Metabolism')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genetics')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Pharmacology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Move to sibling
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society I')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology I')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Microbiology/Infectious Disease')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Immunology II')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Hematology/Oncology')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society II')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Brain, Mind, & Behavior')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Nervous System and Special Senses')
	SET @ParentID = @CurrentID
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroanatomy')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('NSS: Exam 2')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Neuroscience')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	-- Recurse
	SET @ParentID = ( SELECT node_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society III')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Cardiovascular')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Respiratory')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Renal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Genes to Society IV')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('GI Liver')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Endocrine')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Reproductive')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )
    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Musculoskeletal')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

	SET @ParentID = ( SELECT node_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science Exam')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Comprehensive Basic Science')
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @CurrentID, SCOPE_IDENTITY() )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clinical Skills Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

  	SET @ParentID = @CurrentID

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clinical Foundations of Medicine')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

	INSERT INTO [dbo].[rpt_competency_ge2013_score] ( competency_id, score, student_id )
		SELECT @CurrentID, grade_equivalent, student_id
			FROM [dbo].[student_course_details] d
			--WHERE course_id = @course_id
			WHERE course_master_title = 'Clinical Foundations of Medicine'

	SET @ParentID = ( SELECT node_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

    INSERT INTO [dbo].[rpt_competency_ge2013] (name) VALUES ('Clerkship Performance')
	SET @CurrentID = SCOPE_IDENTITY()
	INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] (node_id, child_id) VALUES ( @ParentID, @CurrentID )

  	SET @ParentID = @CurrentID

	DECLARE @course_id INT
	DECLARE @title VARCHAR(MAX)
	DECLARE c CURSOR FOR
		SELECT student_ref_course_id as id, course_master_title as title
			FROM [dbo].[student_ref_course] WHERE course_type = 'core clerkship'
	OPEN c
		FETCH next FROM c INTO @course_id, @title
		PRINT @title
		WHILE @@Fetch_Status = 0 BEGIN
		    INSERT INTO [dbo].[rpt_competency_ge2013] ( name ) VALUES ( @title )
			SET @CurrentID = SCOPE_IDENTITY()
			INSERT INTO [dbo].[rpt_competency_ge2013_tree_map] ( node_id, child_id )
				VALUES ( @ParentID, @CurrentID )
			INSERT INTO [dbo].[rpt_competency_ge2013_score] ( competency_id, score, student_id )
				SELECT @CurrentID, grade_equivalent, student_id
					FROM [dbo].[student_course_details] d
					--WHERE course_id = @course_id
					WHERE course_master_title = @title
			FETCH next FROM c INTO @course_id, @title
		END
	CLOSE c
	DEALLOCATE c

	SET @ParentID = ( SELECT node_id FROM [dbo].[rpt_competency_ge2013_tree_map] WHERE child_id = @ParentID )

	--
	-- Add scores for section leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT c.id, course_section_grade, student_id
			FROM [dbo].[rpt_competency_ge2013] c
				INNER JOIN [dbo].[student_section_grade] g ON c.name = g.section_title

	--
	-- Add scores for shelf exam leaf nodes
	--

	INSERT INTO [dbo].[rpt_competency_ge2013_score]
		( competency_id, score, student_id )
		SELECT c.id, shlf_exm_std_a_grd / 100.0, student_id
			FROM [dbo].[rpt_competency_ge2013] c
				INNER JOIN [dbo].[student_shlf_exm_a] e ON c.name = e.shlf_exm_dsc

	--
	-- Calculate metrics for combinations of scores
	--

	DECLARE @nodes TABLE( id INT, desc_id INT, depth INT, path VARCHAR(MAX) )

	-- Insert all descendant nodes in the tree
	;WITH nodes ( id, desc_id, depth, path ) AS
	( SELECT tree.node_id, tree.child_id, 1, '|' + CAST(tree.node_id AS VARCHAR(MAX)) + '|'
	    FROM rpt_competency_ge2013_tree_map tree
	    WHERE tree.node_id IN ( SELECT DISTINCT id FROM rpt_competency_ge2013 )
	  UNION ALL
	  SELECT supertree.id, tree.child_id, depth + 1, supertree.path + '|' + CAST(tree.node_id AS VARCHAR(MAX)) + '|'
	    FROM rpt_competency_ge2013_tree_map tree
	    INNER JOIN nodes supertree -- recursive join
	      ON supertree.desc_id = tree.node_id
	   WHERE supertree.path NOT LIKE '%|' + CAST(tree.node_id AS VARCHAR(MAX)) + '|%' -- Avoid cycles
	)
	INSERT INTO @nodes( id, desc_id, depth, path ) SELECT * FROM nodes

	-- Make leaf nodes descendands of themselves
	INSERT INTO @nodes( id, desc_id, depth, path )
	  SELECT desc_id, desc_id, depth, nodes.path + '|'
	    FROM @nodes as nodes
	   WHERE desc_id NOT IN ( SELECT id FROM @nodes )

	INSERT INTO rpt_competency_ge2013_func ( title, sql, [order] ) VALUES ( 'Average', 'AVG', 1 )
	INSERT INTO rpt_competency_ge2013_func ( title, sql, [order] ) VALUES ( 'Standard Deviation', 'STDEV', 2 )
	INSERT INTO rpt_competency_ge2013_func ( title, sql, [order] ) VALUES ( 'Number of Scores', 'COUNT', 3 )

	DECLARE @CompetencyID INT
	DECLARE @year INT
	DECLARE @avg REAL
	DECLARE @stddev REAL
	DECLARE @count REAL
	DECLARE c CURSOR FOR
		SELECT node.id, class_of_desc,
		       AVG(score) AS avg, STDEV(score) as stddev, COUNT(score) as count
		FROM @nodes node
		INNER JOIN rpt_competency_ge2013_score score ON score.competency_id = node.desc_id
		INNER JOIN student_degree_object_status status ON status.student_id = score.student_id
		WHERE class_of_desc <> 'Hold'
		GROUP BY node.id, class_of_desc
	OPEN c
		FETCH next FROM c INTO @CompetencyID, @year, @avg, @stddev, @count
		WHILE @@Fetch_Status = 0 BEGIN

--			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, func_id, value, student_class_of, [order] )
--													  VALUES ( @CompetencyID, 'Average', @avg, @year, '0.0%', 1 )
			FETCH next FROM c INTO @CompetencyID, @year, @avg, @stddev, @count
		END
	CLOSE c
	DEALLOCATE c

	-- Getting the scores matrix space entries correctly is a non-trivial issue
	-- This is a quick and dirty solution of filling in the empty spaces will NULLs
	DECLARE c CURSOR FOR
		SELECT DISTINCT student_class_of FROM rpt_competency_ge2013_metric
	OPEN c
		FETCH next FROM c INTO @year
		WHILE @@Fetch_Status = 0 BEGIN
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, 'Average', @avg, @year, '0.0%', 1 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, 'Standard Deviation', @stddev, @year, '0.00', 2 )
			INSERT INTO [dbo].[rpt_competency_ge2013_metric] ( competency_id, name, value, student_class_of, format, [order] )
													  VALUES ( @CompetencyID, '# of Scores', @count, @year, '0', 3 )
			FETCH next FROM c INTO @CompetencyID, @year, @avg, @stddev, @count
		END
	CLOSE c
	DEALLOCATE c


	-- Remove placeholder metrics
	-- ToDo: Replace with generic removal of single-child links
--    DELETE [dbo].[rpt_competency_ge2013_metric]
--		FROM [dbo].[rpt_competency_ge2013_metric] as m
--			INNER JOIN [dbo].[rpt_competency_ge2013] as c
--			ON m.competency_id = c.id
--			WHERE c.name = 'Comprehensive Basic Science Exam'
END