CREATE TABLE user_profile (
    id UUID PRIMARY KEY,

    key TEXT,
    value TEXT,

    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
