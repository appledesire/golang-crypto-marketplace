--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-20 13:26:58 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 49955)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    name_en character varying(255) NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- TOC entry 2313 (class 0 OID 49955)
-- Dependencies: 187
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (name_en) FROM stdin;
Costa Rica
Eritrea
Cambodia
Turkey
Chad
Cyprus
Samoa
Kiribati
Cayman Islands
Slovenia
Vietnam
Jamaica
Kuwait
Antigua and Barbuda
Cameroon
Republic of the Congo
Cape Verde
Saudi Arabia
Bonaire, Saint Eustatius and Saba 
Macedonia
Bosnia and Herzegovina
Guinea-Bissau
Curacao
Gambia
Netherlands
Nigeria
Western Sahara
Lebanon
Sint Maarten
Cook Islands
Faroe Islands
Australia
Bahamas
Uganda
Argentina
Belize
Slovakia
Turks and Caicos Islands
Burkina Faso
Cuba
Liechtenstein
Azerbaijan
Brazil
Marshall Islands
Mongolia
Senegal
East Timor
Hungary
San Marino
Burundi
Mozambique
Uzbekistan
Solomon Islands
Mexico
Taiwan
Mayotte
Cocos Islands
Sri Lanka
Palau
Estonia
Kosovo
Peru
Bhutan
Anguilla
Isle of Man
Algeria
Saint Pierre and Miquelon
South Sudan
Central African Republic
Kyrgyzstan
Malaysia
Svalbard and Jan Mayen
Saint Barthelemy
Spain
Serbia
Belarus
Jordan
South Korea
Niger
Zimbabwe
Djibouti
Ireland
Haiti
Malawi
Iceland
Dominica
Nauru
Jersey
North Korea
Puerto Rico
Trinidad and Tobago
Austria
Panama
Monaco
South Africa
Somalia
Poland
Palestinian Territory
Honduras
Laos
Mauritania
Albania
Comoros
Croatia
Luxembourg
Tunisia
Italy
Sweden
Niue
Malta
India
Paraguay
Morocco
Philippines
Pitcairn
Qatar
Wallis and Futuna
Saint Vincent and the Grenadines
Guadeloupe
Sudan
United Arab Emirates
Tanzania
Bulgaria
Norway
Fiji
Namibia
Guatemala
Libya
Germany
Singapore
Madagascar
France
Iraq
Colombia
American Samoa
Japan
Reunion
Sao Tome and Principe
Ecuador
Saint Lucia
Nepal
Grenada
Denmark
Russia
Syria
Bangladesh
Lithuania
Barbados
Swaziland
Guinea
Dominican Republic
Togo
Christmas Island
Egypt
Zambia
Maldives
Guyana
Sierra Leone
Suriname
Bermuda
Georgia
United States
Equatorial Guinea
Benin
Angola
Vatican
Nicaragua
Oman
Seychelles
Turkmenistan
Afghanistan
Czech Republic
Ghana
Gibraltar
Ethiopia
Guernsey
Ivory Coast
Gabon
Israel
Chile
Falkland Islands
New Zealand
El Salvador
Botswana
French Southern Territories
Finland
Papua New Guinea
Latvia
Montenegro
Thailand
Venezuela
Saint Helena
Vanuatu
Bahrain
Micronesia
Aruba
Uruguay
Iran
Macao
Lesotho
Ukraine
Tonga
Democratic Republic of the Congo
British Virgin Islands
U.S. Virgin Islands
French Guiana
Hong Kong
Portugal
Norfolk Island
Liberia
Romania
Canada
Aland Islands
China
Moldova
Tajikistan
Kenya
Saint Martin
Mauritius
New Caledonia
Brunei
United Kingdom
Kazakhstan
Saint Kitts and Nevis
Pakistan
Armenia
Greece
Guam
Myanmar
Yemen
Andorra
Montserrat
Greenland
Switzerland
Northern Mariana Islands
Indonesia
Tuvalu
Belgium
Bolivia
Rwanda
Martinique
Mali
South Georgia and the South Sandwich Islands
French Polynesia
Worldwide
Other
Interwebs
\.


--
-- TOC entry 2176 (class 2606 OID 55690)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (name_en);


-- Completed on 2017-09-20 13:26:58 MSK

--
-- PostgreSQL database dump complete
--

