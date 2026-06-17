CREATE TABLE jobs (
    id UUID PRIMARY KEY,
    hash VARCHAR(64),

    title TEXT,
    company TEXT,
    location TEXT,
    salary TEXT,

    description TEXT,

    url TEXT,
    source TEXT,

    date_posted TIMESTAMP,
    date_found TIMESTAMP,

    score INTEGER,
    recommendation TEXT,

    reasons JSONB,
    red_flags JSONB,
    role_categories JSONB,

    ai_summary TEXT,

    status TEXT,
    notification_sent BOOLEAN,

    date_applied TIMESTAMP,
    notes TEXT,

    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
