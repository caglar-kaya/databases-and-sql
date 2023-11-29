CALL RETRIEVE_ALL;                      -- Caller query

CALL UPDATE_SALEPRICE(1, 'BAD');        -- Caller query

CALL UPDATE_SALEPRICE(3, 'WORSE');      -- Caller query
