INSERT INTO claims (ufn, client, category, concluded, fee_type, claimed, submission_id, provider_user_id)
SELECT'100323/765', 'McKenna', 'Immigration and Asylum', '2025-03-01', 'Fixed', 56.00, '550e8400-e29b-41d4-a716-446655440000', '123e4567-e89b-12d3-a456-426614174000' WHERE NOT EXISTS (
    SELECT 1 FROM CLAIMS WHERE CLIENT = 'McKenna'
);

INSERT INTO claims (ufn, client, category, concluded, fee_type, claimed, submission_id, provider_user_id)
SELECT '240301/101', 'Johnson', 'Immigration and Asylum', '2025-03-02', 'Hourly', 429.01, '6c5c142d-cb45-4ef6-865f-d4ecce40811c', 'd9c4b277-941c-451c-81c4-6b46b7f7ab59' WHERE NOT EXISTS (
    SELECT 1 FROM claims WHERE client = 'Johnson'
);