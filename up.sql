CREATE TABLE IF NOT EXISTS users
(
    user_id BIGINT NOT NULL,
--     user_id    BIGINT NOT NULL,
--     offer_id   BIGINT NOT NULL,
--     upsell_id  BIGINT NOT NULL          DEFAULT 0,
--     sub_id     BIGINT NOT NULL          DEFAULT 0,
    type_visit visit_type,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);