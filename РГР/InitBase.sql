CREATE TABLE fuel_types (
    fid SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    octane_rating SMALLINT CHECK (octane_rating BETWEEN 80 AND 110),
    price_per_liter NUMERIC(8,2) NOT NULL CHECK (price_per_liter > 0),
    CONSTRAINT chk_fuel_name_len CHECK (char_length(name) >= 2)
);

CREATE TABLE positions (
    posid SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    base_salary NUMERIC(10,2) NOT NULL CHECK (base_salary >= 20000)
);

CREATE TABLE customers (
    cid SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20) UNIQUE CHECK (phone IS NULL OR phone ~ '^\+?[0-9\- ]{7,20}$'),
    loyalty_card VARCHAR(20) UNIQUE,
    discount_pct NUMERIC(5,2) NOT NULL DEFAULT 0 CHECK (discount_pct BETWEEN 0 AND 30),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT chk_customer_contact CHECK (phone IS NOT NULL OR loyalty_card IS NOT NULL)
);

CREATE TABLE employees (
    eid SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE CHECK (phone ~ '^\+?[0-9\- ]{7,20}$'),
    position_id INT NOT NULL
        REFERENCES positions(posid)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    fire_date DATE,
    CONSTRAINT chk_emp_age CHECK (birth_date <= CURRENT_DATE - INTERVAL '18 years'),
    CONSTRAINT chk_hire_date CHECK (hire_date <= CURRENT_DATE),
    CONSTRAINT chk_fire_date CHECK (fire_date IS NULL OR fire_date >= hire_date)
);

CREATE TABLE pumps (
    puid SERIAL PRIMARY KEY,
    pump_number SMALLINT NOT NULL UNIQUE CHECK (pump_number BETWEEN 1 AND 100),
    fid INT NOT NULL
        REFERENCES fuel_types(fid)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    installed_at DATE NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'active'
        CHECK (status IN ('active','maintenance','broken')),
    last_check DATE,
    CONSTRAINT chk_last_check CHECK (last_check IS NULL OR last_check >= installed_at)
);

CREATE TABLE shifts (
    shid SERIAL PRIMARY KEY,
    eid INT NOT NULL
        REFERENCES employees(eid)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    started_at TIMESTAMPTZ NOT NULL,
    ended_at TIMESTAMPTZ,
    CONSTRAINT chk_shift_period CHECK (ended_at IS NULL OR ended_at > started_at)
);

CREATE TABLE sales (
    said BIGSERIAL PRIMARY KEY,
    sale_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    cid INT
        REFERENCES customers(cid)
        ON UPDATE CASCADE ON DELETE SET NULL,
    eid INT NOT NULL
        REFERENCES employees(eid)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    puid INT NOT NULL
        REFERENCES pumps(puid)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    total_sum NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (total_sum > 0),
    payment_type VARCHAR(15) NOT NULL
        CHECK (payment_type IN ('cash','card','loyalty'))
);
