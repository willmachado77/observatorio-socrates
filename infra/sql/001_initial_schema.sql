-- Observatório Sócrates — migração inicial (NÃO EXECUTAR sem aprovação operacional)
-- PostgreSQL 16+

BEGIN;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE source_status AS ENUM ('proposed', 'active', 'paused', 'archived');
CREATE TYPE item_status AS ENUM ('registered', 'transcribed', 'review_ready', 'archived');
CREATE TYPE comparison_status AS ENUM ('draft', 'needs_context', 'insufficient_evidence', 'approved_private', 'rejected');
CREATE TYPE review_decision AS ENUM ('discard', 'request_context', 'insufficient_evidence', 'approve_private');

CREATE TABLE sources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  public_name text NOT NULL,
  source_type text NOT NULL CHECK (source_type IN ('institutional_channel', 'individual_professional', 'public_text')),
  base_url text NOT NULL CHECK (base_url ~ '^https://'),
  inclusion_rationale text NOT NULL,
  status source_status NOT NULL DEFAULT 'proposed',
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (base_url)
);

CREATE TABLE items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id uuid NOT NULL REFERENCES sources(id) ON DELETE RESTRICT,
  canonical_url text NOT NULL CHECK (canonical_url ~ '^https://'),
  title text NOT NULL,
  published_at timestamptz,
  captured_at timestamptz NOT NULL DEFAULT now(),
  content_format text NOT NULL CHECK (content_format IN ('video', 'podcast', 'article', 'public_post')),
  duration_seconds integer CHECK (duration_seconds IS NULL OR duration_seconds >= 0),
  ingestion_status item_status NOT NULL DEFAULT 'registered',
  content_sha256 char(64),
  UNIQUE (canonical_url)
);

CREATE TABLE transcript_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id uuid NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
  version_no integer NOT NULL CHECK (version_no > 0),
  language_code text NOT NULL DEFAULT 'pt-BR',
  origin text NOT NULL CHECK (origin IN ('manual', 'source', 'local_model')),
  body text NOT NULL,
  body_sha256 char(64) NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (item_id, version_no),
  UNIQUE (item_id, body_sha256)
);

CREATE TABLE claims (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id uuid NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
  transcript_version_id uuid REFERENCES transcript_versions(id) ON DELETE RESTRICT,
  excerpt text NOT NULL,
  starts_at_seconds integer CHECK (starts_at_seconds IS NULL OR starts_at_seconds >= 0),
  ends_at_seconds integer CHECK (ends_at_seconds IS NULL OR ends_at_seconds >= starts_at_seconds),
  topic text NOT NULL,
  claim_kind text NOT NULL CHECK (claim_kind IN ('fact', 'opinion', 'prediction', 'rhetoric', 'uncertain')),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE cases (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  theme text NOT NULL,
  factual_description text NOT NULL,
  time_window_start date NOT NULL,
  time_window_end date NOT NULL CHECK (time_window_end >= time_window_start),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE case_items (
  case_id uuid NOT NULL REFERENCES cases(id) ON DELETE RESTRICT,
  item_id uuid NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
  club_context text NOT NULL,
  PRIMARY KEY (case_id, item_id)
);

CREATE TABLE comparisons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_id uuid NOT NULL REFERENCES cases(id) ON DELETE RESTRICT,
  equivalence_rationale text NOT NULL,
  status comparison_status NOT NULL DEFAULT 'draft',
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE comparison_claims (
  comparison_id uuid NOT NULL REFERENCES comparisons(id) ON DELETE RESTRICT,
  claim_id uuid NOT NULL REFERENCES claims(id) ON DELETE RESTRICT,
  analytical_role text NOT NULL CHECK (analytical_role IN ('corinthians', 'comparison', 'context')),
  PRIMARY KEY (comparison_id, claim_id)
);

CREATE TABLE analysis_runs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id uuid NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
  model_name text NOT NULL,
  prompt_version text NOT NULL,
  output_json jsonb NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE review_decisions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  comparison_id uuid NOT NULL REFERENCES comparisons(id) ON DELETE RESTRICT,
  decision review_decision NOT NULL,
  reviewer_ref text NOT NULL,
  rationale text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX items_source_published_idx ON items (source_id, published_at DESC);
CREATE INDEX claims_item_idx ON claims (item_id);
CREATE INDEX comparisons_case_idx ON comparisons (case_id);
CREATE INDEX review_decisions_comparison_created_idx ON review_decisions (comparison_id, created_at DESC);

COMMIT;
