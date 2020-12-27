-- postgres database creation

DROP DATABASE IF EXISTS tradetheta

CREATE DATABASE tradetheta

-- ---
-- Table 'stonks'
--
-- ---

create SCHEMA IF NOT EXISTS vol;

DROP TABLE IF EXISTS vol.stocks;

CREATE TABLE vol.stocks (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  asof_date timestamp,
  ticker text,
  open NUMERIC(8,2) NOT NULL CONSTRAINT positive_open CHECK (open > 0),
  high NUMERIC(8,2) NOT NULL CONSTRAINT positive_high CHECK (high > 0),
  low NUMERIC(8,2) NOT NULL CONSTRAINT positive_low CHECK (low > 0),
  close NUMERIC(8,2) NOT NULL CONSTRAINT positive_close CHECK (close > 0),
  volume NUMERIC NOT NULL CONSTRAINT positive_volume CHECK (volume >= 0),
  interval NUMERIC NOT NULL
)


-- ---
-- Table 'options'
--
-- ---

DROP TABLE IF EXISTS vol.options

CREATE TABLE vol.options (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  asof_date timestamp NOT NULL,
  stock_ticker text NOT NULL,
  options_ticker char NOT NULL,
  strike int NOT NULL,
  expiration date NOT NULL,
  open NUMERIC(8,2) NOT NULL CONSTRAINT positive_open CHECK (open > 0),
  high NUMERIC(8,2) NOT NULL CONSTRAINT positive_high CHECK (high > 0),
  low NUMERIC(8,2) NOT NULL CONSTRAINT positive_low CHECK (low > 0),
  close NUMERIC(8,2) NOT NULL CONSTRAINT positive_close CHECK (close > 0),
  volume NUMERIC NOT NULL CONSTRAINT positive_volume CHECK (volume >= 0)
)


-- ---
-- Table 'crypto'
--
-- ---

DROP TABLE IF EXISTS vol.crypto

CREATE TABLE vol.crypto (
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  asof_date timestamp,
  asset_id_base char(20) NOT NULL,
  asset_id_quote char(20) NOT NULL,
  rate NUMERIC(25, 10) NOT NULL CONSTRAINT positive_rate CHECK (rate >= 0)
)



-- ---
-- Table 'wsb'
--
-- ---

DROP TABLE IF EXISTS vol.wsb

CREATE TABLE vol.wsb (
  created float DEFAULT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP),
  name text NOT NULL PRIMARY KEY,
  ticker text[] NOT NULL,
  score int NOT NULL,
  ups int NOT NULL,
  upvote_ratio float NOT NULL,
  num_comments int NOT NULL
)

-- CONSTRAINT fk_listings references herkbath.listings(id) ON DELETE CASCADE
--CONSTRAINT fk_listings references herkbath.listings(id)
-- CONSTRAINT fk_users references herkbath.users(id)
-- ---
-- Foreign Keys
-- ---
-- ---
-- Table Properties
-- ---

-- ALTER TABLE listings ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE bookings ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE users ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO listings (id,dailyPrice,weeklyDiscount,monthlyDiscount,max_guests,min_stay,max_stay) VALUES
-- ('','','','','','','');
-- INSERT INTO bookings (id,checkin,checkout,adults,children,infants,id_listings,id_users) VALUES
-- ('','','','','','','','');
-- INSERT INTO users (id,username) VALUES
-- ('','');