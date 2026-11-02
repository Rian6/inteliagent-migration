-- Verification codes are transient; retain the most recent code per email.
DELETE older FROM email_liberacao older JOIN email_liberacao newer
  ON older.email = newer.email AND older.id < newer.id;
ALTER TABLE email_liberacao ADD COLUMN attempts INT NOT NULL DEFAULT 0;
ALTER TABLE email_liberacao ADD CONSTRAINT uq_email_liberacao_email UNIQUE (email);
