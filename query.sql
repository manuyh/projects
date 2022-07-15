-- name: GetAllCatalogs :many
SELECT
    ci.id,ci.identifier,ci.label,c.name
FROM catalogs_items AS ci
JOIN catalogs AS c
ON c.id = ci.catalog_id;

-- name: StoreResponse :execresult
INSERT INTO responses (
    identifier,
    gender,
    age,
    age_unit,
    birthdate,
    deathdate,
    variable1,
    variable2,
    a,
    time_a,
    time_unit_a,
    b,
    time_b,
    time_unit_b,    
    c,
    time_c,
    time_unit_c,    
    d,
    time_d,
    time_unit_d,    
    part_2,
    time_part_2,
    time_unit_part_2,    
    surgery,
    surgery_date,
    autopsy,
    used_foundings,
    manner_of_death,
    place_of_death,
    multiple_pregnancy,
    hours_alive,
    weight_in_grams,
    full_weeks_of_pregnancy,
    mother_age_in_years,
    woman_pregnancy_condition,
    pregnancy_contribution_to_death
) VALUES (
    ?,?,?,?,?,?,?,?,?,?,
    ?,?,?,?,?,?,?,?,?,?,
    ?,?,?,?,?,?,?,?,?,?,
    ?,?,?,?,?,?
);