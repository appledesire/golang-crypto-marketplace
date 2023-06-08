--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-20 13:27:59 MSK

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
-- TOC entry 185 (class 1259 OID 49947)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cities (
    id integer NOT NULL,
    name_en character varying(255),
    country_en character varying(255),
    sub_country_en character varying(255)
);


ALTER TABLE cities OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 49953)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 186
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- TOC entry 2175 (class 2604 OID 50204)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- TOC entry 2317 (class 0 OID 49947)
-- Dependencies: 185
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, name_en, country_en, sub_country_en) FROM stdin;
291696	Khawr Fakkān	United Arab Emirates	Ash Shāriqah
292223	Dubai	United Arab Emirates	Dubai
292231	Dibba Al-Fujairah	United Arab Emirates	Al Fujayrah
292239	Dibba Al-Hisn	United Arab Emirates	Al Fujayrah
292672	Sharjah	United Arab Emirates	Ash Shāriqah
292688	Ar Ruways	United Arab Emirates	Abu Dhabi
292878	Al Fujayrah	United Arab Emirates	Al Fujayrah
292913	Al Ain	United Arab Emirates	Abu Dhabi
292932	Ajman	United Arab Emirates	Ajman
292953	Adh Dhayd	United Arab Emirates	Ash Shāriqah
292968	Abu Dhabi	United Arab Emirates	Abu Dhabi
1120985	Zaranj	Afghanistan	Nīmrūz
1123004	Taloqan	Afghanistan	Takhār
1125155	Shīnḏanḏ	Afghanistan	Herat
1125444	Shibirghān	Afghanistan	Jowzjān
1125896	Shahrak	Afghanistan	Ghowr
1127110	Sar-e Pul	Afghanistan	Sar-e Pol
1127628	Sang-e Chārak	Afghanistan	Sar-e Pol
1127768	Aībak	Afghanistan	Samangān
1128265	Rustāq	Afghanistan	Takhār
1129516	Qarqīn	Afghanistan	Jowzjān
1129648	Qarāwul	Afghanistan	Kunduz
1131316	Paghmān	Afghanistan	Kabul
1132495	Nahrīn	Afghanistan	Wilāyat-e Baghlān
1133453	Maymana	Afghanistan	Faryab
1133574	Mehtar Lām	Afghanistan	Laghmān
1133616	Mazār-e Sharīf	Afghanistan	Balkh
1134720	Lashkar Gāh	Afghanistan	Helmand
1135158	Kushk	Afghanistan	Herat
1135689	Kunduz	Afghanistan	Kunduz
1136469	Khōst	Afghanistan	Khowst
1136575	Khulm	Afghanistan	Balkh
1136863	Khāsh	Afghanistan	Nīmrūz
1137168	Khanabad	Afghanistan	Kunduz
1137807	Karukh	Afghanistan	Herat
1138336	Kandahār	Afghanistan	Kandahār
1138958	Kabul	Afghanistan	Kabul
1139715	Jalālābād	Afghanistan	Nangarhār
1139807	Jabal os Saraj	Afghanistan	Parvān
1140026	Herāt	Afghanistan	Herat
1141089	Ghormach	Afghanistan	Badghis
1141269	Ghazni	Afghanistan	Ghaznī
1141540	Gereshk	Afghanistan	Helmand
1141857	Gardēz	Afghanistan	Paktia
1142264	Farah	Afghanistan	Farah
1142404	Kafir Qala	Afghanistan	Herat
1145352	Charikar	Afghanistan	Parvān
1147066	Barakī Barak	Afghanistan	Lowgar
1147242	Bāmyān	Afghanistan	Bāmīān
1147290	Balkh	Afghanistan	Balkh
1147540	Baghlān	Afghanistan	Wilāyat-e Baghlān
1148106	Ārt Khwājah	Afghanistan	Takhār
1148205	Āsmār	Afghanistan	Konar
1148311	Asadābād	Afghanistan	Konar
1148658	Andkhōy	Afghanistan	Faryab
1429434	Bāzārak	Afghanistan	Panjshir
3576022	Saint John’s	Antigua and Barbuda	Saint John
3573374	The Valley	Anguilla	N/A
363243	Sarandë	Albania	Vlorë
782661	Kukës	Albania	Kukës
782756	Korçë	Albania	Korçë
783148	Gjirokastër	Albania	Gjirokastër
783263	Elbasan	Albania	Elbasan
783493	Burrel	Albania	Dibër
3183719	Vlorë	Albania	Vlorë
3183875	Tirana	Albania	Tiranë
3184081	Shkodër	Albania	Shkodër
3184517	Patos Fshat	Albania	Fier
3184862	Lushnjë	Albania	Fier
3184935	Lezhë	Albania	Lezhë
3185012	Laç	Albania	Lezhë
3185060	Kuçovë	Albania	Berat
3185082	Krujë	Albania	Durrës
3185211	Kavajë	Albania	Tiranë
3185670	Fier-Çifçi	Albania	Fier
3185672	Fier	Albania	Fier
3185728	Durrës	Albania	Durrës
3186084	Berat	Albania	Berat
174875	Kapan	Armenia	Syunik Province
174895	Goris	Armenia	Syunik Province
174972	Hats’avan	Armenia	Syunik Province
174991	Ararat	Armenia	Ararat Province
616052	Yerevan	Armenia	Yerevan
616062	Ejmiatsin	Armenia	Armavir Province
616199	Spitak	Armenia	Lori Province
616250	Sevan	Armenia	Gegharkunik Province
616435	Masis	Armenia	Ararat Province
616530	Vanadzor	Armenia	Lori Province
616599	Gavarr	Armenia	Gegharkunik Province
616629	Hrazdan	Armenia	Kotayk Province
616631	Armavir	Armenia	Armavir Province
616635	Gyumri	Armenia	Shirak Province
616877	Ashtarak	Armenia	Aragatsotn Province
617026	Abovyan	Armenia	Kotayk Province
145531	Saurimo	Angola	Lunda Sul
145724	Lucapa	Angola	Lunda Norte
876177	Luau	Angola	Moxico
2236568	Uíge	Angola	Uíge
2236967	Soio	Angola	Zaire
2239001	Nzeto	Angola	Zaire
2239520	Mbanza Congo	Angola	Zaire
2239862	Malanje	Angola	Malanje
2240449	Luanda	Angola	Luanda
2242001	Caxito	Angola	Bengo
2243271	Cabinda	Angola	Cabinda
3346015	Sumbe	Angola	Cuanza Sul
3347019	Namibe	Angola	Namibe
3347353	Menongue	Angola	Cuando Cubango
3347719	Luena	Angola	Moxico
3347762	Lubango	Angola	Huíla
3347853	Longonjo	Angola	Huambo
3347939	Lobito	Angola	Benguela
3348078	Cuito	Angola	Bié
3348313	Huambo	Angola	Huambo
3350246	Catumbela	Angola	Benguela
3041563	Andorra la Vella	Andorra	Andorra la Vella
291074	Ras al-Khaimah	United Arab Emirates	Raʼs al Khaymah
3351663	Benguela	Angola	Benguela
3427213	Zárate	Argentina	Buenos Aires
3427388	Villa Ocampo	Argentina	Santa Fe
3427408	Villa Lugano	Argentina	Buenos Aires F.D.
3427428	Villaguay	Argentina	Entre Rios
3427431	Villa Gesell	Argentina	Buenos Aires
3427761	Tigre	Argentina	Buenos Aires
3427833	Tandil	Argentina	Buenos Aires
3428068	San Vicente	Argentina	Misiones
3428071	Santo Tomé	Argentina	Corrientes
3428359	Santa Elena	Argentina	Entre Rios
3428577	San Pedro	Argentina	Misiones
3428759	San Lorenzo	Argentina	Corrientes
3428975	San Javier	Argentina	Santa Fe
3428992	San Isidro	Argentina	Buenos Aires
3429403	Saladas	Argentina	Corrientes
3429576	Retiro	Argentina	Buenos Aires F.D.
3429577	Resistencia	Argentina	Chaco
3429594	Reconquista	Argentina	Santa Fe
3429652	Quilmes	Argentina	Buenos Aires
3429732	Puerto Rico	Argentina	Misiones
3429777	Puerto Iguazú	Argentina	Misiones
3429786	Puerto Esperanza	Argentina	Misiones
3429790	Puerto Eldorado	Argentina	Misiones
3429886	Posadas	Argentina	Misiones
3429902	Pontevedra	Argentina	Buenos Aires
3429949	Pirané	Argentina	Formosa
3430104	Paso de los Libres	Argentina	Corrientes
3430340	Oberá	Argentina	Misiones
3430443	Necochea	Argentina	Buenos Aires
3430598	Monte Caseros	Argentina	Corrientes
3430601	Montecarlo	Argentina	Misiones
3430708	Mercedes	Argentina	Buenos Aires
3430709	Mercedes	Argentina	Corrientes
3430863	Mar del Plata	Argentina	Buenos Aires
3430988	Luján	Argentina	Buenos Aires
3432043	La Plata	Argentina	Buenos Aires
3432079	La Paz	Argentina	Entre Rios
3433349	Jardín América	Argentina	Misiones
3433658	Gualeguaychú	Argentina	Entre Rios
3433663	Gualeguay	Argentina	Entre Rios
3433715	Goya	Argentina	Corrientes
3433803	General José de San Martín	Argentina	Chaco
3433836	Garupá	Argentina	Misiones
3433899	Formosa	Argentina	Formosa
3433901	Fontana	Argentina	Chaco
3433956	Federal	Argentina	Entre Rios
3434095	Esquina	Argentina	Corrientes
3434291	El Soberbio	Argentina	Misiones
3435038	Dolores	Argentina	Buenos Aires
3435103	Curuzú Cuatiá	Argentina	Corrientes
3435217	Corrientes	Argentina	Corrientes
3435261	Concordia	Argentina	Entre Rios
3435264	Concepción del Uruguay	Argentina	Entre Rios
3435356	Colegiales	Argentina	Buenos Aires F.D.
3435486	Chajarí	Argentina	Entre Rios
3435810	Campana	Argentina	Buenos Aires
3435910	Buenos Aires	Argentina	Buenos Aires F.D.
3436124	Barranqueras	Argentina	Chaco
3436199	Azul	Argentina	Buenos Aires
3436230	Avellaneda	Argentina	Santa Fe
3436287	Aristóbulo del Valle	Argentina	Misiones
3832132	Zapala	Argentina	Neuquen
3832260	Yerba Buena	Argentina	Tucumán
3832647	Villa Regina	Argentina	Rio Negro
3832653	Villa Paula de Sarmiento	Argentina	San Juan
3832662	Villa Nueva	Argentina	Cordoba
3832694	Villa María	Argentina	Cordoba
3832756	Villa Dolores	Argentina	Cordoba
3832791	Villa Carlos Paz	Argentina	Cordoba
3832811	Villa Ángela	Argentina	Chaco
3832815	Villa Allende	Argentina	Cordoba
3832899	Viedma	Argentina	Rio Negro
3832934	Victoria	Argentina	Entre Rios
3833027	Vera	Argentina	Santa Fe
3833062	Venado Tuerto	Argentina	Santa Fe
3833112	Veinticinco de Mayo	Argentina	Buenos Aires
3833367	Ushuaia	Argentina	Tierra del Fuego
3833412	Unquillo	Argentina	Cordoba
3833794	Tres Isletas	Argentina	Chaco
3833859	Tres Arroyos	Argentina	Buenos Aires
3833883	Trelew	Argentina	Chubut
3834502	Termas de Río Hondo	Argentina	Santiago del Estero
3834601	Tartagal	Argentina	Salta
3834813	Tafí Viejo	Argentina	Tucumán
3834971	Sunchales	Argentina	Santa Fe
3835793	Santo Tomé	Argentina	Santa Fe
3835994	Santa Rosa	Argentina	La Pampa
3836194	Santa Lucía	Argentina	San Juan
3836277	Santa Fe de la Vera Cruz	Argentina	Santa Fe
3836564	San Salvador de Jujuy	Argentina	Jujuy
3836620	San Ramón de la Nueva Orán	Argentina	Salta
3836669	San Rafael	Argentina	Mendoza
3836772	San Pedro	Argentina	Jujuy
3836846	San Nicolás de los Arroyos	Argentina	Buenos Aires
3836873	San Miguel de Tucumán	Argentina	Tucumán
3836951	San Martín de los Andes	Argentina	Neuquen
3836992	San Martín	Argentina	Mendoza
3837056	San Luis	Argentina	San Luis
3837124	San Justo	Argentina	Santa Fe
3837213	San Juan	Argentina	San Juan
3837240	San José de Jáchal	Argentina	San Juan
3837441	San Jorge	Argentina	Santa Fe
3837675	San Francisco	Argentina	Cordoba
3837980	San Antonio Oeste	Argentina	Rio Negro
3838233	Salta	Argentina	Salta
3838506	Rufino	Argentina	Santa Fe
3838583	Rosario	Argentina	Santa Fe
3838793	Río Tercero	Argentina	Cordoba
3351014	Camacupa	Angola	Bié
3351024	Caluquembe	Angola	Huíla
3839307	Rawson	Argentina	Chubut
3839479	Rafaela	Argentina	Santa Fe
3839490	Quitilipi	Argentina	Chaco
3839982	Punta Alta	Argentina	Buenos Aires
3840092	Puerto Madryn	Argentina	Chubut
3840300	Presidencia Roque Sáenz Peña	Argentina	Chaco
3840860	Pocito	Argentina	San Juan
3840885	Plottier	Argentina	Neuquen
3841490	Pergamino	Argentina	Buenos Aires
3841500	Pérez	Argentina	Santa Fe
3841956	Paraná	Argentina	Entre Rios
3842190	Palpalá	Argentina	Jujuy
3842670	Olavarría	Argentina	Buenos Aires
3843123	Neuquén	Argentina	Neuquen
3843619	Morteros	Argentina	Cordoba
3843803	Monteros	Argentina	Tucumán
3844421	Mendoza	Argentina	Mendoza
3844899	Marcos Juárez	Argentina	Cordoba
3845330	Machagai	Argentina	Chaco
3846864	Lincoln	Argentina	Buenos Aires
3846915	Libertador General San Martín	Argentina	Jujuy
3848687	Las Breñas	Argentina	Chaco
3848950	La Rioja	Argentina	La Rioja
3851331	La Falda	Argentina	Cordoba
3852374	La Calera	Argentina	Cordoba
3852468	Laboulaye	Argentina	Cordoba
3853354	Junín	Argentina	Buenos Aires
3853491	Joaquín V. González	Argentina	Salta
3853510	Jesús María	Argentina	Cordoba
3854895	Granadero Baigorria	Argentina	Santa Fe
3854985	Gobernador Gálvez	Argentina	Santa Fe
3855065	General Roca	Argentina	Rio Negro
3855074	General Pinedo	Argentina	Chaco
3855116	General Enrique Mosconi	Argentina	Salta
3855244	Gálvez	Argentina	Santa Fe
3855554	Firmat	Argentina	Santa Fe
3855666	Famaillá	Argentina	Tucumán
3855974	Esquel	Argentina	Chubut
3856022	Esperanza	Argentina	Santa Fe
3856231	Embarcación	Argentina	Salta
3856235	Embalse	Argentina	Cordoba
3858765	El Bolsón	Argentina	Rio Negro
3859384	Diamante	Argentina	Entre Rios
3859512	Deán Funes	Argentina	Cordoba
3859552	Cutral-Có	Argentina	Neuquen
3859828	Cruz del Eje	Argentina	Cordoba
3859904	Crespo	Argentina	Entre Rios
3859965	Cosquín	Argentina	Cordoba
3860217	Coronda	Argentina	Santa Fe
3860259	Córdoba	Argentina	Cordoba
3860443	Comodoro Rivadavia	Argentina	Chubut
3861056	Cipolletti	Argentina	Rio Negro
3861061	Cinco Saltos	Argentina	Rio Negro
3861344	Chivilcoy	Argentina	Buenos Aires
3861416	Chimbas	Argentina	San Juan
3861445	Chilecito	Argentina	La Rioja
3861678	Charata	Argentina	Chaco
3861953	Chacabuco	Argentina	Buenos Aires
3862144	Centenario	Argentina	Neuquen
3862240	Caucete	Argentina	San Juan
3862254	Catriel	Argentina	Rio Negro
3862320	Castelli	Argentina	Chaco
3862351	Casilda	Argentina	Santa Fe
3862655	Carcarañá	Argentina	Santa Fe
3862738	Capitán Bermúdez	Argentina	Santa Fe
3863379	Caleta Olivia	Argentina	Santa Cruz
3864331	Bell Ville	Argentina	Cordoba
3864375	Bella Vista	Argentina	Tucumán
3865086	Bahía Blanca	Argentina	Buenos Aires
3865385	Arroyo Seco	Argentina	Santa Fe
3865424	Arroyito	Argentina	Cordoba
3865840	Añatuya	Argentina	Santiago del Estero
3866163	Alta Gracia	Argentina	Cordoba
3866242	Allen	Argentina	Rio Negro
3866367	Alderetes	Argentina	Tucumán
3866425	Albardón	Argentina	San Juan
3866496	Aguilares	Argentina	Tucumán
6693230	Villa Santa Rita	Argentina	Buenos Aires F.D.
7116866	Villa Mercedes	Argentina	San Luis
7647007	San Carlos de Bariloche	Argentina	Rio Negro
10172104	Adrogué	Argentina	Buenos Aires
5881576	Pago Pago	American Samoa	Eastern District
2760910	Wolfsberg	Austria	Carinthia
2761369	Vienna	Austria	Vienna
2761524	Wels	Austria	Upper Austria
2761669	Weinzierl bei Krems	Austria	Lower Austria
2762372	Villach	Austria	Carinthia
2763423	Traun	Austria	Upper Austria
2763460	Traiskirchen	Austria	Lower Austria
2763795	Ternitz	Austria	Lower Austria
2764359	Steyr	Austria	Upper Austria
2764786	Spittal an der Drau	Austria	Carinthia
2765388	Schwechat	Austria	Lower Austria
2766429	Sankt Pölten	Austria	Lower Austria
2766824	Salzburg	Austria	Salzburg
2766922	Saalfelden am Steinernen Meer	Austria	Salzburg
2771335	Mödling	Austria	Lower Austria
2772173	Lustenau	Austria	Vorarlberg
2772400	Linz	Austria	Upper Austria
2772635	Leonding	Austria	Upper Austria
2772649	Leoben	Austria	Styria
2773300	Kufstein	Austria	Tyrol
2773913	Klosterneuburg	Austria	Lower Austria
2774326	Klagenfurt am Wörthersee	Austria	Carinthia
2774773	Kapfenberg	Austria	Styria
2775220	Innsbruck	Austria	Tyrol
2776951	Hallein	Austria	Salzburg
2778067	Graz	Austria	Styria
2779674	Feldkirch	Austria	Vorarlberg
2780741	Dornbirn	Austria	Vorarlberg
2781503	Bregenz	Austria	Vorarlberg
2781520	Braunau am Inn	Austria	Upper Austria
2782067	Baden	Austria	Lower Austria
3838859	Río Gallegos	Argentina	Santa Cruz
3838902	Río Ceballos	Argentina	Cordoba
2062338	Rockingham	Australia	Western Australia
2062944	Prospect	Australia	South Australia
2063042	Port Hedland	Australia	Western Australia
2063523	Perth	Australia	Western Australia
2065176	Murray Bridge	Australia	South Australia
2065594	Mount Isa	Australia	Queensland
2065740	Morphett Vale	Australia	South Australia
2067119	Mandurah	Australia	Western Australia
2068079	Kwinana	Australia	Western Australia
2070571	Gosnells	Australia	Western Australia
2070998	Geraldton	Australia	Western Australia
2071059	Gawler	Australia	South Australia
2071223	Fremantle	Australia	Western Australia
2073124	Darwin	Australia	Northern Territory
2075265	Busselton	Australia	Western Australia
2075432	Bunbury	Australia	Western Australia
2077579	Armadale	Australia	Western Australia
2077895	Alice Springs	Australia	Northern Territory
2077963	Albany	Australia	Western Australia
2078025	Adelaide	Australia	South Australia
2143069	Woodridge	Australia	Queensland
2143285	Wodonga	Australia	Victoria
2144095	Werribee	Australia	Victoria
2144528	Warrnambool	Australia	Victoria
2144728	Wantirna South	Australia	Victoria
2144764	Wangaratta	Australia	Victoria
2146108	Traralgon	Australia	Victoria
2146142	Townsville	Australia	Queensland
2146268	Toowoomba	Australia	Queensland
2146793	Thornbury	Australia	Victoria
2146827	Thomastown	Australia	Victoria
2147357	Tarneit	Australia	Victoria
2147381	Taree	Australia	New South Wales
2147497	Tamworth	Australia	New South Wales
2147714	Sydney	Australia	New South Wales
2147849	Surfers Paradise	Australia	Queensland
2147892	Sunnybank	Australia	Queensland
2147914	Sunbury	Australia	Victoria
2148398	Port Stephens	Australia	New South Wales
2148591	Springvale	Australia	Victoria
2148928	Southport	Australia	Queensland
2148997	South Grafton	Australia	New South Wales
2149645	Shepparton	Australia	Victoria
2149975	Seaford	Australia	Victoria
2150660	Saint Kilda	Australia	Victoria
2150717	Saint Albans	Australia	Victoria
2150894	Rowville	Australia	Victoria
2151649	Richmond	Australia	Victoria
2151716	Reservoir	Australia	Victoria
2152286	Queanbeyan	Australia	New South Wales
2152329	Quakers Hill	Australia	New South Wales
2152558	Preston	Australia	Victoria
2152659	Port Macquarie	Australia	New South Wales
2152819	Point Cook	Australia	Victoria
2153951	Pakenham South	Australia	Victoria
2154219	Orange	Australia	New South Wales
2154787	Nowra	Australia	New South Wales
2155001	Northcote	Australia	Victoria
2155204	Noble Park	Australia	Victoria
2155472	Newcastle	Australia	New South Wales
2155542	Nerang	Australia	Queensland
2155718	Narre Warren	Australia	Victoria
2156340	Mulgrave	Australia	Victoria
2156578	Mount Martha	Australia	Victoria
2156643	Mount Gambier	Australia	South Australia
2156663	Mount Eliza	Australia	Victoria
2156813	Mosman	Australia	New South Wales
2156878	Mornington	Australia	Victoria
2156934	Morayfield	Australia	Queensland
2157343	Moe	Australia	Victoria
2157635	Mill Park	Australia	Victoria
2157698	Mildura	Australia	Victoria
2158151	Melton	Australia	Victoria
2158177	Melbourne	Australia	Victoria
2158562	Maryborough	Australia	Queensland
2158626	Marrickville	Australia	New South Wales
2158651	Maroubra	Australia	New South Wales
2159045	Maitland	Australia	New South Wales
2159220	Mackay	Australia	Queensland
2160063	Lismore	Australia	New South Wales
2160188	Lilydale	Australia	Victoria
2160517	Launceston	Australia	Tasmania
2160560	Lara	Australia	Victoria
2160582	Langwarrin	Australia	Victoria
2160706	Lalor	Australia	Victoria
2161532	Keysborough	Australia	Victoria
2161540	Kew	Australia	Victoria
2161776	Katoomba	Australia	New South Wales
2163137	Hornsby	Australia	New South Wales
2163355	Hobart	Australia	Tasmania
2163776	Hawthorn South	Australia	Victoria
2163990	Hampton Park	Australia	Victoria
2164422	Griffith	Australia	New South Wales
2164515	Greensborough	Australia	Victoria
2164837	Goulburn	Australia	New South Wales
2165087	Gold Coast	Australia	Queensland
2165200	Glenroy	Australia	Victoria
2165329	Glenferrie	Australia	Victoria
2165478	Gladstone	Australia	Queensland
2165798	Geelong	Australia	Victoria
2166143	Frankston East	Australia	Victoria
2166144	Frankston	Australia	Victoria
2166309	Forster	Australia	New South Wales
2167208	Essendon	Australia	Victoria
2167279	Epping	Australia	Victoria
2167280	Epping	Australia	New South Wales
2167312	Engadine	Australia	New South Wales
2167445	Eltham	Australia	Victoria
2167817	Echuca	Australia	Victoria
2167949	Earlwood	Australia	New South Wales
3323063	Ansfelden	Austria	Salzburg
2058430	Whyalla	Australia	South Australia
2169220	Deception Bay	Australia	Queensland
2169460	Dandenong	Australia	Victoria
2169956	Cronulla	Australia	New South Wales
2170078	Cranbourne	Australia	Victoria
2170079	Cranbourne	Australia	Victoria
2170089	Craigieburn	Australia	Victoria
2171168	Coburg	Australia	Victoria
2171400	Clayton	Australia	Victoria
2171507	Wollongong	Australia	New South Wales
2171845	Cessnock	Australia	New South Wales
2172111	Castle Hill	Australia	New South Wales
2172191	Carrum Downs	Australia	Victoria
2172264	Carnegie	Australia	Victoria
2172303	Carlingford	Australia	New South Wales
2172311	Caringbah	Australia	New South Wales
2172517	Canberra	Australia	Australian Capital Territory
2172686	Camberwell	Australia	Victoria
2172710	Caloundra	Australia	Queensland
2172797	Cairns	Australia	Queensland
2172832	Caboolture	Australia	Queensland
2173125	Burnie	Australia	Tasmania
2173323	Bundaberg	Australia	Queensland
2173605	Buderim	Australia	Queensland
2173741	Brunswick	Australia	Victoria
2174003	Brisbane	Australia	Queensland
2174580	Boronia	Australia	Victoria
2175411	Blacktown	Australia	New South Wales
2176031	Berwick	Australia	Victoria
2176187	Bendigo	Australia	Victoria
2176592	Baulkham Hills	Australia	New South Wales
2176632	Bathurst	Australia	New South Wales
2176934	Banora Point	Australia	New South Wales
2176947	Bankstown	Australia	New South Wales
2177091	Ballarat	Australia	Victoria
2177513	Auburn	Australia	New South Wales
2177565	Ashfield	Australia	New South Wales
2177671	Armidale	Australia	New South Wales
2178174	Albury	Australia	New South Wales
2207259	South Brisbane	Australia	Queensland
2207618	Cheltenham	Australia	Victoria
2208285	Randwick	Australia	New South Wales
2208305	Dee Why	Australia	New South Wales
2208313	Umina	Australia	New South Wales
6943558	Bracken Ridge	Australia	Queensland
7281782	North Ryde	Australia	New South Wales
7281807	Hoppers Crossing	Australia	Victoria
7281838	Logan City	Australia	Queensland
7281839	Carindale	Australia	Queensland
7281840	Paramatta	Australia	New South Wales
7281850	Ferntree Gully	Australia	Victoria
7302259	City of Parramatta	Australia	New South Wales
7302628	Adelaide Hills	Australia	South Australia
7302631	Canning Vale	Australia	Western Australia
7302642	Glenmore Park	Australia	New South Wales
7932612	Glen Iris	Australia	Victoria
7932629	Balwyn North	Australia	Victoria
7932636	Carnegie	Australia	Victoria
7932638	Malvern East	Australia	Victoria
7932646	Brighton East	Australia	Victoria
7932654	Booval	Australia	Queensland
8015209	St Albans	Australia	Victoria
8347325	Endeavour Hills	Australia	Victoria
8347717	Clayton	Australia	Victoria
8347896	Roxburgh Park	Australia	Victoria
8348078	Wyndham Vale	Australia	Victoria
8348101	Willetton	Australia	Western Australia
8348734	Thornbury	Australia	Victoria
8349108	Thornlie	Australia	Western Australia
8349243	Hillside	Australia	Victoria
8349381	Bundoora	Australia	Victoria
9957340	Forest Lake	Australia	Queensland
9957350	Sunnybank Hills	Australia	Queensland
9972518	Narre Warren South	Australia	Victoria
9972522	Dandenong North	Australia	Victoria
9972527	Frankston South	Australia	Victoria
9972578	Sunshine West	Australia	Victoria
9972579	Altona Meadows	Australia	Victoria
3577154	Oranjestad	Aruba	N/A
3577277	Babijn	Aruba	N/A
3577284	Angochi	Aruba	N/A
3041732	Mariehamn	Aland Islands	Mariehamns stad
146970	Xankandi	Azerbaijan	Xankǝndi
147059	Əhmədbəyli	Azerbaijan	Saatlı
147105	Shushi	Azerbaijan	Şuşa
147271	Salyan	Azerbaijan	Salyan
147288	Saatlı	Azerbaijan	Saatlı
147425	Neftçala	Azerbaijan	Neftçala
147429	Nakhchivan	Azerbaijan	Nakhichevan
147622	Lankaran	Azerbaijan	Lənkəran
147982	Imishli	Azerbaijan	İmişli
148106	Fizuli	Azerbaijan	Füzuli
148290	Dzhalilabad	Azerbaijan	Jalilabad
148340	Pushkino	Azerbaijan	Bilǝsuvar
148354	Beylagan	Azerbaijan	Beyləqan
148445	Astara	Azerbaijan	Astara
148565	Şirvan	Azerbaijan	Shirvan
148619	Ağdam	Azerbaijan	Ağdam
584614	Zabrat	Azerbaijan	Baki
584649	Yevlakh	Azerbaijan	Yevlax City
584716	Yelenendorf	Azerbaijan	Goygol Rayon
584717	Xaçmaz	Azerbaijan	Xaçmaz
584791	Ujar	Azerbaijan	Ucar
584871	Terter	Azerbaijan	Tǝrtǝr
584923	Sumqayıt	Azerbaijan	Sumqayit
585103	Qaraçuxur	Azerbaijan	Baki
585152	Shamkhor	Azerbaijan	Şǝmkir
585156	Shamakhi	Azerbaijan	Şamaxı
585170	Sheki	Azerbaijan	Shaki City
585184	Sabunçu	Azerbaijan	Baki
585187	Sabirabad	Azerbaijan	Sabirabad
585220	Qusar	Azerbaijan	Qusar
2168607	Doncaster	Australia	Victoria
2169145	Deer Park	Australia	Victoria
585514	Mingelchaur	Azerbaijan	Mingǝcevir
585557	Maştağa	Azerbaijan	Baki
585568	Mardakan	Azerbaijan	Baki
585630	Lökbatan	Azerbaijan	Baki
585763	Kyurdarmir	Azerbaijan	Kürdǝmir
586340	Yeni Suraxanı	Azerbaijan	Baki
586427	Geoktschai	Azerbaijan	Göyçay
586429	Hövsan	Azerbaijan	Baki
586523	Ganja	Azerbaijan	Gǝncǝ
586763	Divichibazar	Azerbaijan	Shabran
586925	Buzovna	Azerbaijan	Baki
586968	Biny Selo	Azerbaijan	Baki
587057	Barda	Azerbaijan	Bǝrdǝ
587078	Bilajari	Azerbaijan	Baki
587084	Baku	Azerbaijan	Baki
587261	Amirdzhan	Azerbaijan	Baki
587361	Aghsu	Azerbaijan	Ağsu
587378	Ağdaş	Azerbaijan	Ağdaş
587384	Agdzhabedy	Azerbaijan	Ağcabǝdi
824003	Bakıxanov	Azerbaijan	Baki
3187609	Visoko	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3188225	Velika Kladuša	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3188582	Tuzla	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3188893	Trebinje	Bosnia and Herzegovina	Republika Srpska
3188924	Travnik	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3191281	Sarajevo	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3192409	Prijedor	Bosnia and Herzegovina	Republika Srpska
3194828	Mostar	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3199744	Gradačac	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3199779	Gračanica	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3200396	Goražde	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3201984	Doboj	Bosnia and Herzegovina	Republika Srpska
3202822	Cazin	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3203099	Bugojno	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3203521	Brčko	Bosnia and Herzegovina	Brčko
3204186	Bijeljina	Bosnia and Herzegovina	Republika Srpska
3204222	Bihać	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3204541	Banja Luka	Bosnia and Herzegovina	Republika Srpska
3337476	Konjic	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3374036	Bridgetown	Barbados	Saint Michael
1185092	Thākurgaon	Bangladesh	Rangpur Division
1185095	Teknāf	Bangladesh	Chittagong
1185098	Tungi	Bangladesh	Dhaka
1185099	Sylhet	Bangladesh	Sylhet
1185100	Dohār	Bangladesh	Dhaka
1185106	Jamālpur	Bangladesh	Dhaka
1185108	Shibganj	Bangladesh	Rājshāhi
1185111	Sātkhira	Bangladesh	Khulna
1185115	Sirājganj	Bangladesh	Rājshāhi
1185116	Netrakona	Bangladesh	Dhaka
1185117	Narsingdi	Bangladesh	Dhaka
1185120	Sandwīp	Bangladesh	Chittagong
1185121	Shāhzādpur	Bangladesh	Rājshāhi
1185127	Rāmganj	Bangladesh	Chittagong
1185128	Rājshāhi	Bangladesh	Rājshāhi
1185138	Pirojpur	Bangladesh	Barisāl
1185141	Panchagarh	Bangladesh	Rangpur Division
1185148	Patiya	Bangladesh	Chittagong
1185149	Parbatipur	Bangladesh	Rangpur Division
1185155	Nārāyanganj	Bangladesh	Dhaka
1185156	Nālchiti	Bangladesh	Barisāl
1185159	Nāgarpur	Bangladesh	Dhaka
1185160	Nageswari	Bangladesh	Rangpur Division
1185162	Mymensingh	Bangladesh	Dhaka
1185164	Muktāgācha	Bangladesh	Dhaka
1185165	Mirzāpur	Bangladesh	Dhaka
1185166	Maulavi Bāzār	Bangladesh	Sylhet
1185167	Morrelgonj	Bangladesh	Khulna
1185171	Mehendiganj	Bangladesh	Barisāl
1185173	Mathba	Bangladesh	Barisāl
1185183	Lākshām	Bangladesh	Chittagong
1185186	Comilla	Bangladesh	Chittagong
1185188	Rangpur	Bangladesh	Rangpur Division
1185191	Kushtia	Bangladesh	Khulna
1185199	Kālīganj	Bangladesh	Khulna
1185204	Jhingergācha	Bangladesh	Khulna
1185206	Joypur Hāt	Bangladesh	Rājshāhi
1185207	Ishurdi	Bangladesh	Rājshāhi
1185209	Habiganj	Bangladesh	Sylhet
1185210	Gaurnadi	Bangladesh	Barisāl
1185218	Gafargaon	Bangladesh	Dhaka
1185224	Feni	Bangladesh	Chittagong
1185236	Rāipur	Bangladesh	Chittagong
1185239	Sarankhola	Bangladesh	Khulna
1185241	Dhaka	Bangladesh	Dhaka
1185247	Chilmāri	Bangladesh	Rangpur Division
1185249	Chhāgalnāiya	Bangladesh	Chittagong
1185251	Lālmohan	Bangladesh	Barisāl
1185252	Khagrachhari	Bangladesh	Chittagong
1185254	Chhātak	Bangladesh	Sylhet
1185262	Bherāmāra	Bangladesh	Khulna
1185263	Bhairab Bāzār	Bangladesh	Dhaka
1185270	Bāndarban	Bangladesh	Chittagong
1185272	Kālia	Bangladesh	Khulna
1185274	Baniachang	Bangladesh	Sylhet
1185276	Bājitpur	Bangladesh	Dhaka
1185283	Badarganj	Bangladesh	Rangpur Division
1185293	Narail	Bangladesh	Khulna
1185920	Tungipāra	Bangladesh	Dhaka
1188569	Sarishābāri	Bangladesh	Dhaka
1189056	Sakhipur	Bangladesh	Dhaka
1189638	Raojān	Bangladesh	Chittagong
1191139	Phultala	Bangladesh	Khulna
1191368	Pālang	Bangladesh	Dhaka
1192366	Pār Naogaon	Bangladesh	Rājshāhi
585225	Hacıqabul	Azerbaijan	Hacıqabul
585226	Qazax	Azerbaijan	Qazax
1201753	Hājīganj	Bangladesh	Chittagong
1203344	Farīdpur	Bangladesh	Dhaka
1203891	Dinājpur	Bangladesh	Rangpur Division
1205481	Uttar Char Fasson	Bangladesh	Khulna
1205733	Chittagong	Bangladesh	Chittagong
1207047	Char Bhadrāsan	Bangladesh	Dhaka
1209562	Bera	Bangladesh	Rājshāhi
1210565	Burhānuddin	Bangladesh	Barisāl
1336133	Sātkania	Bangladesh	Chittagong
1336135	Khulna	Bangladesh	Khulna
1336136	Bhola	Bangladesh	Barisāl
1336137	Barisāl	Bangladesh	Barisāl
1336140	Jessore	Bangladesh	Khulna
1336143	Pābna	Bangladesh	Rājshāhi
1336144	Tāngāil	Bangladesh	Dhaka
1337233	Bogra	Bangladesh	Rājshāhi
1337239	Pīrgaaj	Bangladesh	Rangpur Division
1337240	Nawābganj	Bangladesh	Rājshāhi
1337245	Mādārīpur	Bangladesh	Dhaka
1337248	Sherpur	Bangladesh	Dhaka
1337249	Kishorganj	Bangladesh	Dhaka
1462681	Manikchari	Bangladesh	Chittagong
1477498	Bhāndāria	Bangladesh	Barisāl
6414184	Fatikchari	Bangladesh	Chittagong
6545349	Saidpur	Bangladesh	Rājshāhi
7701354	Azimpur	Bangladesh	Dhaka
9827976	Paltan	Bangladesh	Dhaka
2783081	Zwijndrecht	Belgium	Flanders
2783089	Zwevegem	Belgium	Flanders
2783175	Zottegem	Belgium	Flanders
2783204	Zoersel	Belgium	Flanders
2783274	Zemst	Belgium	Flanders
2783293	Zele	Belgium	Flanders
2783308	Zedelgem	Belgium	Flanders
2783310	Zaventem	Belgium	Flanders
2783416	Wuustwezel	Belgium	Flanders
2783632	Willebroek	Belgium	Flanders
2783759	Wevelgem	Belgium	Flanders
2783763	Wetteren	Belgium	Flanders
2783801	Westerlo	Belgium	Flanders
2783820	Wervik	Belgium	Flanders
2783941	Wavre	Belgium	Wallonia
2783985	Waterloo	Belgium	Wallonia
2784068	Waregem	Belgium	Flanders
2784548	Visé	Belgium	Wallonia
2784604	Vilvoorde	Belgium	Flanders
2784821	Verviers	Belgium	Wallonia
2785141	Turnhout	Belgium	Flanders
2785169	Tubize	Belgium	Wallonia
2785341	Tournai	Belgium	Wallonia
2785364	Torhout	Belgium	Flanders
2785389	Tongeren	Belgium	Flanders
2785470	Tienen	Belgium	Flanders
2785476	Tielt	Belgium	Flanders
2785612	Tessenderlo	Belgium	Flanders
2785622	Tervuren	Belgium	Flanders
2785778	Temse	Belgium	Flanders
2786087	Stekene	Belgium	Flanders
2786344	Soumagne	Belgium	Wallonia
2786420	Soignies	Belgium	Wallonia
2786545	Sint-Truiden	Belgium	Flanders
2786559	Sint-Pieters-Leeuw	Belgium	Flanders
2786578	Sint-Niklaas	Belgium	Flanders
2786634	Sint-Kruis	Belgium	Flanders
2786641	Sint-Katelijne-Waver	Belgium	Flanders
2786694	Sint-Gillis-Waas	Belgium	Flanders
2786700	Sint-Genesius-Rode	Belgium	Flanders
2786824	Seraing	Belgium	Wallonia
2786963	Schoten	Belgium	Flanders
2787048	Schilde	Belgium	Flanders
2787416	Saint-Ghislain	Belgium	Wallonia
2787662	Rotselaar	Belgium	Flanders
2787769	Ronse	Belgium	Flanders
2787889	Roeselare	Belgium	Flanders
2787989	Rixensart	Belgium	Wallonia
2788088	Riemst	Belgium	Flanders
2788348	Ranst	Belgium	Flanders
2788499	Quaregnon	Belgium	Wallonia
2788506	Puurs	Belgium	Flanders
2788521	Putte	Belgium	Flanders
2788726	Poperinge	Belgium	Flanders
2788765	Pont-à-Celles	Belgium	Wallonia
2789162	Péruwelz	Belgium	Wallonia
2789232	Peer	Belgium	Flanders
2789413	Overijse	Belgium	Flanders
2789471	Oupeye	Belgium	Wallonia
2789529	Oudenaarde	Belgium	Flanders
2789751	Oostkamp	Belgium	Flanders
2790101	Nivelles	Belgium	Wallonia
2790114	Ninove	Belgium	Flanders
2790135	Nijlen	Belgium	Flanders
2790357	Neerpelt	Belgium	Flanders
2790471	Namur	Belgium	Wallonia
2790595	Mouscron	Belgium	Wallonia
2790676	Mortsel	Belgium	Flanders
2790697	Morlanwelz-Mariemont	Belgium	Wallonia
2790869	Mons	Belgium	Wallonia
2791067	Mol	Belgium	Flanders
2791194	Middelkerke	Belgium	Flanders
2791315	Merelbeke	Belgium	Flanders
2791343	Menen	Belgium	Flanders
2791424	Meise	Belgium	Flanders
2791744	Marche-en-Famenne	Belgium	Wallonia
2791814	Manage	Belgium	Wallonia
2791857	Maldegem	Belgium	Flanders
2791961	Maasmechelen	Belgium	Flanders
2791964	Maaseik	Belgium	Flanders
2792073	Louvain-la-Neuve	Belgium	Wallonia
2792165	Londerzeel	Belgium	Flanders
2792179	Lommel	Belgium	Flanders
2792196	Lokeren	Belgium	Flanders
2792235	Lochristi	Belgium	Flanders
2792360	Lille	Belgium	Flanders
2792397	Lier	Belgium	Flanders
2792413	Liège	Belgium	Wallonia
2792482	Leuven	Belgium	Flanders
2793077	Lede	Belgium	Flanders
2793144	Lebbeke	Belgium	Flanders
2793446	Lanaken	Belgium	Flanders
1196292	Lakshmīpur	Bangladesh	Chittagong
1197895	Kesabpur	Bangladesh	Khulna
2794117	Kontich	Belgium	Flanders
2794210	Knokke-Heist	Belgium	Flanders
2794663	Kasterlee	Belgium	Flanders
2794730	Kapellen	Belgium	Flanders
2794788	Kalmthout	Belgium	Flanders
2795009	Izegem	Belgium	Flanders
2795100	Ieper	Belgium	Flanders
2795113	Huy	Belgium	Wallonia
2795261	Houthalen	Belgium	Flanders
2795398	Hoogstraten	Belgium	Flanders
2795730	Hoboken	Belgium	Flanders
2795800	Heusden	Belgium	Flanders
2795908	Herzele	Belgium	Flanders
2795912	Herve	Belgium	Wallonia
2795930	Herstal	Belgium	Wallonia
2796012	Herent	Belgium	Flanders
2796132	Helchteren	Belgium	Flanders
2796153	Heist-op-den-Berg	Belgium	Flanders
2796491	Hasselt	Belgium	Flanders
2796542	Harelbeke	Belgium	Flanders
2796637	Hamme	Belgium	Flanders
2796696	Halle	Belgium	Flanders
2796833	Haaltert	Belgium	Flanders
2797114	Grimbergen	Belgium	Flanders
2797638	Geraardsbergen	Belgium	Flanders
2797656	Gent	Belgium	Flanders
2797670	Genk	Belgium	Flanders
2797713	Gembloux	Belgium	Wallonia
2797779	Geel	Belgium	Flanders
2798297	Fleurus	Belgium	Wallonia
2798301	Fléron	Belgium	Wallonia
2798307	Flémalle-Haute	Belgium	Wallonia
2798551	Evergem	Belgium	Flanders
2798573	Eupen	Belgium	Wallonia
2798615	Essen	Belgium	Flanders
2798987	Eeklo	Belgium	Flanders
2799007	Edegem	Belgium	Flanders
2799090	Duffel	Belgium	Flanders
2799226	Dour	Belgium	Wallonia
2799365	Dilbeek	Belgium	Flanders
2799369	Diksmuide	Belgium	Flanders
2799397	Diest	Belgium	Flanders
2799412	Diepenbeek	Belgium	Flanders
2799645	Dendermonde	Belgium	Flanders
2799647	Denderleeuw	Belgium	Flanders
2799746	Deinze	Belgium	Flanders
2800063	Courcelles	Belgium	Wallonia
2800220	Colfontaine	Belgium	Wallonia
2800438	Chaudfontaine	Belgium	Wallonia
2800448	Châtelet	Belgium	Wallonia
2800461	Chasse Royale	Belgium	Wallonia
2800481	Charleroi	Belgium	Wallonia
2800866	Brussels	Belgium	Brussels Capital
2800931	Brugge	Belgium	Flanders
2801106	Brecht	Belgium	Flanders
2801117	Brasschaat	Belgium	Flanders
2801150	Braine-le-Comte	Belgium	Wallonia
2801226	Boussu	Belgium	Wallonia
2801447	Bornem	Belgium	Flanders
2801494	Boom	Belgium	Flanders
2801858	Blankenberge	Belgium	Flanders
2801922	Binche	Belgium	Wallonia
2801924	Bilzen	Belgium	Flanders
2802031	Beveren	Belgium	Flanders
2802170	Beringen	Belgium	Flanders
2802433	Beersel	Belgium	Flanders
2802435	Beerse	Belgium	Flanders
2802743	Balen	Belgium	Flanders
2803010	Ath	Belgium	Wallonia
2803033	Asse	Belgium	Flanders
2803073	Arlon	Belgium	Wallonia
2803138	Antwerpen	Belgium	Flanders
2803160	Ans	Belgium	Wallonia
2803204	Andenne	Belgium	Wallonia
2803429	Aarschot	Belgium	Flanders
2803448	Aalst	Belgium	Flanders
2353197	Zorgo	Burkina Faso	Plateau-Central
2353688	Yako	Burkina Faso	Nord
2354176	Tougan	Burkina Faso	Boucle du Mouhoun
2354349	Titao	Burkina Faso	Nord
2354675	Tenkodogo	Burkina Faso	Centre-Est
2356228	Réo	Burkina Faso	Centre-Ouest
2356454	Pô	Burkina Faso	Centre-Sud
2357043	Ouahigouya	Burkina Faso	Nord
2357048	Ouagadougou	Burkina Faso	Centre
2358100	Manga	Burkina Faso	Centre-Sud
2358382	Léo	Burkina Faso	Centre-Ouest
2358738	Koupéla	Burkina Faso	Centre-Est
2358946	Koudougou	Burkina Faso	Centre-Ouest
2359142	Kongoussi	Burkina Faso	Centre-Nord
2359227	Kombissiri	Burkina Faso	Centre-Sud
2359317	Kokologo	Burkina Faso	Centre-Ouest
2359608	Kaya	Burkina Faso	Centre-Nord
2360073	Houndé	Burkina Faso	High-Basins
2360238	Gourcy	Burkina Faso	Nord
2360615	Garango	Burkina Faso	Centre-Est
2360886	Fada N'gourma	Burkina Faso	Est
2361082	Dori	Burkina Faso	Sahel
2361177	Djibo	Burkina Faso	Sahel
2361373	Diapaga	Burkina Faso	Est
2361477	Dédougou	Burkina Faso	Boucle du Mouhoun
2361845	Boussé	Burkina Faso	Plateau-Central
2361946	Boulsa	Burkina Faso	Centre-Nord
2362909	Banfora	Burkina Faso	Cascades
2577162	Gaoua	Burkina Faso	Southwest
2577164	Orodara	Burkina Faso	High-Basins
725578	Yambol	Bulgaria	Yambol
725712	Vratsa	Bulgaria	Vratsa
725905	Vidin	Bulgaria	Vidin
725988	Velingrad	Bulgaria	Pazardzhik
725993	Veliko Tŭrnovo	Bulgaria	Veliko Tŭrnovo
726050	Varna	Bulgaria	Varna
726174	Targovishte	Bulgaria	Tŭrgovishte
726320	Troyan	Bulgaria	Lovech
726418	Dobrich	Bulgaria	Dobrich
726534	Svishtov	Bulgaria	Veliko Tŭrnovo
726546	Svilengrad	Bulgaria	Khaskovo
726848	Stara Zagora	Bulgaria	Stara Zagora
2794055	Kortrijk	Belgium	Flanders
2794070	Kortenberg	Belgium	Flanders
727079	Sliven	Bulgaria	Sliven
727221	Silistra	Bulgaria	Silistra
727233	Shumen	Bulgaria	Shumen
727337	Sevlievo	Bulgaria	Gabrovo
727447	Sandanski	Bulgaria	Blagoevgrad
727462	Samokov	Bulgaria	Sofiya
727523	Ruse	Bulgaria	Ruse
727791	Rakovski	Bulgaria	Plovdiv
728075	Popovo	Bulgaria	Tŭrgovishte
728193	Plovdiv	Bulgaria	Plovdiv
728203	Pleven	Bulgaria	Pleven
728288	Petrich	Bulgaria	Blagoevgrad
728317	Peshtera	Bulgaria	Pazardzhik
728330	Pernik	Bulgaria	Pernik
728378	Pazardzhik	Bulgaria	Pazardzhik
728448	Panagyurishte	Bulgaria	Pazardzhik
728742	Nova Zagora	Bulgaria	Sliven
729114	Montana	Bulgaria	Montana
729559	Lovech	Bulgaria	Lovech
729581	Lom	Bulgaria	Montana
729794	Kardzhali	Bulgaria	Kŭrdzhali
730435	Haskovo	Bulgaria	Khaskovo
730442	Kharmanli	Bulgaria	Khaskovo
730496	Kazanlŭk	Bulgaria	Stara Zagora
730559	Karnobat	Bulgaria	Burgas
730565	Karlovo	Bulgaria	Plovdiv
731108	Gotse Delchev	Bulgaria	Blagoevgrad
731233	Gorna Oryakhovitsa	Bulgaria	Veliko Tŭrnovo
731549	Gabrovo	Bulgaria	Gabrovo
732263	Dimitrovgrad	Bulgaria	Khaskovo
732452	Chirpan	Bulgaria	Stara Zagora
732491	Cherven Bryag	Bulgaria	Pleven
732770	Burgas	Bulgaria	Burgas
733014	Botevgrad	Bulgaria	Sofiya
733191	Blagoevgrad	Bulgaria	Blagoevgrad
733264	Berkovitsa	Bulgaria	Montana
733579	Aytos	Bulgaria	Burgas
290104	Sitrah	Bahrain	Manama
290187	Madīnat ‘Īsá	Bahrain	Southern Governorate
290215	Jidd Ḩafş	Bahrain	Manama
290247	Madīnat Ḩamad	Bahrain	Central Governorate
290269	Dār Kulayb	Bahrain	Southern Governorate
290332	Al Muharraq	Bahrain	Muharraq
290340	Manama	Bahrain	Manama
385038	Ar Rifā‘	Bahrain	Southern Governorate
422232	Makamba	Burundi	Makamba
423328	Bururi	Burundi	Bururi
425378	Bujumbura	Burundi	Bujumbura Mairie
425551	Muramvya	Burundi	Muramvya
426272	Gitega	Burundi	Gitega
426700	Ruyigi	Burundi	Ruyigi
430569	Ngozi	Burundi	Ngozi
431748	Muyinga	Burundi	Muyinga
433635	Rutana	Burundi	Rutana
2391377	Tchaourou	Benin	Borgou
2391455	Tanguiéta	Benin	Atakora
2391893	Savé	Benin	Collines
2391895	Savalou	Benin	Collines
2392009	Sakété	Benin	Plateau
2392087	Porto-Novo	Benin	Quémé
2392108	Pobé	Benin	Plateau
2392204	Parakou	Benin	Borgou
2392308	Ouidah	Benin	Atlantique
2392505	Nikki	Benin	Borgou
2392601	Natitingou	Benin	Atakora
2392897	Lokossa	Benin	Mono
2393551	Kétou	Benin	Plateau
2393693	Kandi	Benin	Alibori
2394545	Dogbo	Benin	Kouffo
2394560	Djougou	Benin	Donga
2394711	Dassa-Zoumé	Benin	Collines
2394814	Cové	Benin	Zou
2394819	Cotonou	Benin	Littoral
2394824	Comé	Benin	Mono
2395049	Bohicon	Benin	Zou
2395182	Bembèrèkè	Benin	Borgou
2395261	Bassila	Benin	Donga
2395317	Banikoara	Benin	Alibori
2395568	Aplahoué	Benin	Kouffo
2395914	Abomey-Calavi	Benin	Atlantique
2395915	Abomey	Benin	Zou
3579132	Gustavia	Saint Barthelemy	N/A
3573197	Hamilton	Bermuda	Hamilton city
1820071	Tutong	Brunei	Tutong
1820187	Seria	Brunei	Belait
1820491	Kuala Belait	Brunei	Belait
1820906	Bandar Seri Begawan	Brunei	Brunei and Muara
3901178	Yacuiba	Bolivia	Tarija
3901301	Warnes	Bolivia	Santa Cruz
3901501	Villazón	Bolivia	Potosí
3901504	Villa Yapacaní	Bolivia	Santa Cruz
3901547	Villamontes	Bolivia	Tarija
3902202	Tupiza	Bolivia	Potosí
3903320	Tarija	Bolivia	Tarija
3903987	Sucre	Bolivia	Chuquisaca
3904666	Santiago del Torno	Bolivia	Santa Cruz
3904906	Santa Cruz de la Sierra	Bolivia	Santa Cruz
3905658	San Ignacio de Velasco	Bolivia	Santa Cruz
3905792	San Borja	Bolivia	El Beni
3906466	Riberalta	Bolivia	El Beni
3907080	Punata	Bolivia	Cochabamba
3907584	Potosí	Bolivia	Potosí
3909234	Oruro	Bolivia	Oruro
3910027	Montero	Bolivia	Santa Cruz
3910291	Mizque	Bolivia	Cochabamba
3911409	Llallagua	Bolivia	Potosí
3911925	La Paz	Bolivia	La Paz
3915350	Guayaramerín	Bolivia	El Beni
3918937	Cotoca	Bolivia	Santa Cruz
3919968	Cochabamba	Bolivia	Cochabamba
3919998	Cobija	Bolivia	Pando
3922414	Camiri	Bolivia	Santa Cruz
3513563	Kralendijk	Bonaire, Saint Eustatius and Saba 	Bonaire
3384986	Vitória do Mearim	Brazil	Maranhão
3384987	Vitória de Santo Antão	Brazil	Pernambuco
3385022	Viseu	Brazil	Pará
3385077	Conde	Brazil	Paraíba
3385088	Vigia	Brazil	Pará
3385106	Viçosa do Ceará	Brazil	Ceará
3385109	Viçosa	Brazil	Alagoas
727030	Smolyan	Bulgaria	Smolyan
3385538	Vargem Grande	Brazil	Maranhão
3385592	Valença do Piauí	Brazil	Piauí
3385742	União dos Palmares	Brazil	Alagoas
3385745	União	Brazil	Piauí
3385922	Tuntum	Brazil	Maranhão
3385935	Tucuruí	Brazil	Pará
3385980	Tucumã	Brazil	Pará
3386042	Trindade	Brazil	Pernambuco
3386177	Trairi	Brazil	Ceará
3386264	Toritama	Brazil	Pernambuco
3386361	Timon	Brazil	Maranhão
3386372	Timbiras	Brazil	Maranhão
3386396	Timbaúba	Brazil	Pernambuco
3386449	Tianguá	Brazil	Ceará
3386496	Teresina	Brazil	Piauí
3386567	São João dos Inhamuns	Brazil	Ceará
3386931	Tamandaré	Brazil	Pernambuco
3387082	Tabira	Brazil	Pernambuco
3387115	Surubim	Brazil	Pernambuco
3387202	Sousa	Brazil	Paraíba
3387204	Soure	Brazil	Pará
3387266	Solânea	Brazil	Paraíba
3387296	Sobral	Brazil	Ceará
3387663	Sertânia	Brazil	Pernambuco
3387786	Serra Talhada	Brazil	Pernambuco
3387926	Senador Pompeu	Brazil	Ceará
3387987	Satuba	Brazil	Alagoas
3388145	São Raimundo Nonato	Brazil	Piauí
3388269	São Miguel dos Campos	Brazil	Alagoas
3388270	São Miguel do Guamá	Brazil	Pará
3388318	São Mateus do Maranhão	Brazil	Maranhão
3388341	São Luís do Quitunde	Brazil	Alagoas
3388368	São Luís	Brazil	Maranhão
3388376	São Lourenço da Mata	Brazil	Pernambuco
3388435	São José do Egito	Brazil	Pernambuco
3388441	São José de Ribamar	Brazil	Maranhão
3388615	São João dos Patos	Brazil	Maranhão
3388714	São Gonçalo do Amarante	Brazil	Ceará
3388847	São Félix do Xingu	Brazil	Pará
3388868	São Domingos do Maranhão	Brazil	Maranhão
3388991	São Bento	Brazil	Paraíba
3389006	São Bento	Brazil	Maranhão
3389321	Santa Rita	Brazil	Paraíba
3389353	Santarém	Brazil	Pará
3389358	Santa Quitéria do Maranhão	Brazil	Maranhão
3389361	Santa Quitéria	Brazil	Ceará
3389384	Santana do Ipanema	Brazil	Alagoas
3389557	Santa Luzia	Brazil	Maranhão
3389609	Santa Inês	Brazil	Maranhão
3389622	Santa Helena	Brazil	Maranhão
3389652	Santa Cruz do Capibaribe	Brazil	Pernambuco
3389673	Santa Cruz	Brazil	Rio Grande do Norte
3389822	Salinópolis	Brazil	Pará
3389860	Salgueiro	Brazil	Pernambuco
3390160	Russas	Brazil	Ceará
3390288	Rio Largo	Brazil	Alagoas
3390295	Rio Formoso	Brazil	Pernambuco
3390326	Ribeirão	Brazil	Pernambuco
3390760	Recife	Brazil	Pernambuco
3390901	Quixeramobim	Brazil	Ceará
3391220	Presidente Dutra	Brazil	Maranhão
3391360	Santana	Brazil	Amapá
3391397	Porto Calvo	Brazil	Alagoas
3391412	Portel	Brazil	Pará
3391556	Pombos	Brazil	Pernambuco
3391571	Pombal	Brazil	Paraíba
3391908	Piripiri	Brazil	Piauí
3391991	Piracuruca	Brazil	Piauí
3392054	Pinheiro	Brazil	Maranhão
3392088	Pindaré Mirim	Brazil	Maranhão
3392126	Pilar	Brazil	Alagoas
3392167	Picos	Brazil	Piauí
3392242	Petrolina	Brazil	Pernambuco
3392243	Jatobá	Brazil	Pernambuco
3392345	Pentecoste	Brazil	Ceará
3392368	Penalva	Brazil	Maranhão
3392431	Pedro II	Brazil	Piauí
3392629	Pedra Branca	Brazil	Ceará
3392734	Paulo Afonso	Brazil	Bahia
3392740	Paulista	Brazil	Pernambuco
3392887	Patos	Brazil	Paraíba
3392998	Parnamirim	Brazil	Rio Grande do Norte
3393001	Parnaíba	Brazil	Piauí
3393008	Parintins	Brazil	Amazonas
3393017	Parelhas	Brazil	Rio Grande do Norte
3393091	Paraipaba	Brazil	Ceará
3393106	Paragominas	Brazil	Pará
3393115	Paracuru	Brazil	Ceará
3393400	Pacatuba	Brazil	Ceará
3393409	Pacajus	Brazil	Ceará
3393452	Ouricuri	Brazil	Pernambuco
3393465	Orós	Brazil	Ceará
3393471	Oriximiná	Brazil	Pará
3393536	Olinda	Brazil	Pernambuco
3393764	Oeiras	Brazil	Piauí
3393768	Ábidos	Brazil	Pará
3393832	Nova Russas	Brazil	Ceará
3393876	Nova Cruz	Brazil	Rio Grande do Norte
3393972	Nazaré da Mata	Brazil	Pernambuco
3394023	Natal	Brazil	Rio Grande do Norte
3394116	Murici	Brazil	Alagoas
3394453	Moreno	Brazil	Pernambuco
3394549	Monteiro	Brazil	Paraíba
3394605	Monte Alegre	Brazil	Pará
3394649	Mombaça	Brazil	Ceará
3394661	Moju	Brazil	Pará
3394682	Mossoró	Brazil	Rio Grande do Norte
3394745	Mocajuba	Brazil	Pará
3395062	Maués	Brazil	Amazonas
3395077	Matriz de Camaragibe	Brazil	Alagoas
3395380	Mari	Brazil	Paraíba
3395395	Marechal Deodoro	Brazil	Alagoas
3395458	Maragogi	Brazil	Alagoas
3395473	Maracanaú	Brazil	Ceará
3395503	Marabá	Brazil	Pará
3395717	Mamanguape	Brazil	Paraíba
3395998	Macau	Brazil	Rio Grande do Norte
3385467	Várzea Alegre	Brazil	Ceará
3385504	Varjota	Brazil	Ceará
3396277	Limoeiro	Brazil	Pernambuco
3396364	Lavras da Mangabeira	Brazil	Ceará
3396496	Lajedo	Brazil	Pernambuco
3396769	Lagoa do Itaenga	Brazil	Pernambuco
3397147	Juazeiro do Norte	Brazil	Ceará
3397230	José de Freitas	Brazil	Piauí
3397277	João Pessoa	Brazil	Paraíba
3397315	João Câmara	Brazil	Rio Grande do Norte
3397665	Jaguaruana	Brazil	Ceará
3397675	Jaguaribe	Brazil	Ceará
3397838	Jaboatão	Brazil	Pernambuco
3397851	Itupiranga	Brazil	Pará
3397893	Itacoatiara	Brazil	Amazonas
3397898	Itaporanga	Brazil	Paraíba
3397904	Itapissuma	Brazil	Pernambuco
3397909	Itapipoca	Brazil	Ceará
3397936	Itapecuru Mirim	Brazil	Maranhão
3397941	Itapagé	Brazil	Ceará
3397967	Itaituba	Brazil	Pará
3397969	Itaitinga	Brazil	Ceará
3398003	Itabaiana	Brazil	Paraíba
3398105	Ipubi	Brazil	Pernambuco
3398112	Ipu	Brazil	Ceará
3398115	Ipojuca	Brazil	Pernambuco
3398269	Imperatriz	Brazil	Maranhão
3398331	Iguatu	Brazil	Ceará
3398343	Igarapé Miri	Brazil	Pará
3398350	Igarapé Açu	Brazil	Pará
3398352	Igarassu	Brazil	Pernambuco
3398379	Icó	Brazil	Ceará
3398450	Horizonte	Brazil	Ceará
3398569	Guaraciaba do Norte	Brazil	Ceará
3398570	Guarabira	Brazil	Paraíba
3398614	Guaiúba	Brazil	Ceará
3398691	Gravatá	Brazil	Pernambuco
3398856	Grajaú	Brazil	Maranhão
3398904	Goiana	Brazil	Pernambuco
3398920	Glória do Goitá	Brazil	Pernambuco
3399058	Garanhuns	Brazil	Pernambuco
3399132	Gameleira	Brazil	Pernambuco
3399415	Fortaleza	Brazil	Ceará
3399506	Floriano	Brazil	Piauí
3399518	Floresta	Brazil	Pernambuco
3400558	Eusébio	Brazil	Ceará
3400567	Extremoz	Brazil	Rio Grande do Norte
3400617	Estreito	Brazil	Maranhão
3400740	Esperantina	Brazil	Piauí
3400752	Esperança	Brazil	Paraíba
3400804	Escada	Brazil	Pernambuco
3401106	Demerval Lobão	Brazil	Piauí
3401109	Delmiro Gouveia	Brazil	Alagoas
3401138	Custódia	Brazil	Pernambuco
3401148	Cururupu	Brazil	Maranhão
3401283	Currais Novos	Brazil	Rio Grande do Norte
3401340	Cupira	Brazil	Pernambuco
3401545	Crato	Brazil	Ceará
3401548	Crateús	Brazil	Ceará
3401703	Coroatá	Brazil	Maranhão
3401830	Condado	Brazil	Pernambuco
3401963	Colinas	Brazil	Maranhão
3401992	Coelho Neto	Brazil	Maranhão
3402000	Codó	Brazil	Maranhão
3402229	Chapadinha	Brazil	Maranhão
3402271	Chã Grande	Brazil	Pernambuco
3402360	Ceará Mirim	Brazil	Rio Grande do Norte
3402383	Caxias	Brazil	Maranhão
3402429	Caucaia	Brazil	Ceará
3402465	Catolé do Rocha	Brazil	Paraíba
3402528	Catende	Brazil	Pernambuco
3402591	Castanhal	Brazil	Pará
3402613	Cascavel	Brazil	Ceará
3402655	Caruaru	Brazil	Pernambuco
3402721	Carpina	Brazil	Pernambuco
3402724	Carolina	Brazil	Maranhão
3403127	Capitão Poço	Brazil	Pará
3403208	Capanema	Brazil	Pará
3403353	Canindé	Brazil	Ceará
3403534	Campos Sales	Brazil	Ceará
3403566	Campo Maior	Brazil	Piauí
3403611	Campo Alegre	Brazil	Alagoas
3403642	Campina Grande	Brazil	Paraíba
3403687	Camocim	Brazil	Ceará
3403697	Cametá	Brazil	Pará
3403941	Cajueiro	Brazil	Alagoas
3404020	Cajazeiras	Brazil	Paraíba
3404117	Caicó	Brazil	Rio Grande do Norte
3404513	Cabrobó	Brazil	Pernambuco
3404545	Cabo	Brazil	Pernambuco
3404558	Cabedelo	Brazil	Paraíba
3404722	Buriti Bravo	Brazil	Maranhão
3404766	Buíque	Brazil	Pernambuco
3404817	Breves	Brazil	Pará
3404833	Brejo Santo	Brazil	Ceará
3404862	Brejo da Madre de Deus	Brazil	Pernambuco
3405006	Bragança	Brazil	Pará
3405380	Bom Conselho	Brazil	Pernambuco
3405616	Boa Viagem	Brazil	Ceará
3405738	Bezerros	Brazil	Pernambuco
3405792	Benevides	Brazil	Pará
3405863	Belém	Brazil	Paraíba
3405870	Belém	Brazil	Pará
3405924	Beberibe	Brazil	Ceará
3405940	Bayeux	Brazil	Paraíba
3405954	Baturité	Brazil	Ceará
3406160	Barreiros	Brazil	Pernambuco
3406196	Barreirinhas	Brazil	Maranhão
3406263	Barras	Brazil	Piauí
3406318	Barra do Corda	Brazil	Maranhão
3406429	Barcarena	Brazil	Pará
3406442	Barbalha	Brazil	Ceará
3406545	Balsas	Brazil	Maranhão
3406910	Bacabal	Brazil	Maranhão
3406961	Augusto Corrêa	Brazil	Pará
3406996	Atalaia	Brazil	Alagoas
3407216	Arcoverde	Brazil	Pernambuco
3407243	Araripina	Brazil	Pernambuco
3407258	Arari	Brazil	Maranhão
3407327	Arapiraca	Brazil	Alagoas
3407357	Araguaína	Brazil	Tocantins
3407378	Aracati	Brazil	Ceará
3396048	Macaíba	Brazil	Rio Grande do Norte
3396266	Limoeiro do Norte	Brazil	Ceará
3407797	Altos	Brazil	Piauí
3407882	Altamira	Brazil	Pará
3407903	Almeirim	Brazil	Pará
3407980	Alenquer	Brazil	Pará
3408100	Alagoa Grande	Brazil	Paraíba
3408166	Águas Belas	Brazil	Pernambuco
3408175	Água Preta	Brazil	Pernambuco
3408274	Afogados da Ingazeira	Brazil	Pernambuco
3408337	Açu	Brazil	Rio Grande do Norte
3408343	Acopiara	Brazil	Ceará
3408368	Acaraú	Brazil	Ceará
3408404	Abreu e Lima	Brazil	Pernambuco
3408424	Abaetetuba	Brazil	Pará
3444823	Xique Xique	Brazil	Bahia
3444864	Votuporanga	Brazil	São Paulo
3444866	Votorantim	Brazil	São Paulo
3444876	Volta Redonda	Brazil	Rio de Janeiro
3444914	Vitória da Conquista	Brazil	Bahia
3444924	Vitória	Brazil	Espírito Santo
3444969	Visconde do Rio Branco	Brazil	Minas Gerais
3444997	Viradouro	Brazil	São Paulo
3445014	Vinhedo	Brazil	São Paulo
3445026	Vila Velha	Brazil	Espírito Santo
3445126	Videira	Brazil	Santa Catarina
3445133	Viçosa	Brazil	Minas Gerais
3445153	Viana	Brazil	Espírito Santo
3445156	Viamão	Brazil	Rio Grande do Sul
3445162	Vespasiano	Brazil	Minas Gerais
3445307	Vera Cruz	Brazil	Bahia
3445348	Wenceslau Braz	Brazil	Paraná
3445350	Venâncio Aires	Brazil	Rio Grande do Sul
3445418	Vazante	Brazil	Minas Gerais
3445433	Vassouras	Brazil	Rio de Janeiro
3445446	Várzea Paulista	Brazil	São Paulo
3445451	Várzea Grande	Brazil	Mato Grosso
3445459	Várzea da Palma	Brazil	Minas Gerais
3445487	Varginha	Brazil	Minas Gerais
3445500	Vargem Grande do Sul	Brazil	São Paulo
3445575	Valparaíso	Brazil	São Paulo
3445578	Valinhos	Brazil	São Paulo
3445596	Valença	Brazil	Rio de Janeiro
3445597	Valença	Brazil	Bahia
3445630	Vacaria	Brazil	Rio Grande do Sul
3445679	Uruguaiana	Brazil	Rio Grande do Sul
3445690	Uruçuca	Brazil	Bahia
3445713	Uruaçu	Brazil	Goiás
3445746	União da Vitória	Brazil	Paraná
3445764	Unaí	Brazil	Minas Gerais
3445781	Una	Brazil	Bahia
3445831	Uberlândia	Brazil	Minas Gerais
3445839	Uberaba	Brazil	Minas Gerais
3445847	Ubatuba	Brazil	São Paulo
3445849	Ubatã	Brazil	Bahia
3445853	Ubaitaba	Brazil	Bahia
3445859	Ubá	Brazil	Minas Gerais
3445939	Tupanciretã	Brazil	Rio Grande do Sul
3445941	Tupaciguara	Brazil	Minas Gerais
3445942	Tupã	Brazil	São Paulo
3445983	Tucano	Brazil	Bahia
3445993	Tubarão	Brazil	Santa Catarina
3446038	Trindade	Brazil	Goiás
3446077	Três Pontas	Brazil	Minas Gerais
3446087	Três Passos	Brazil	Rio Grande do Sul
3446098	Três Lagoas	Brazil	Mato Grosso do Sul
3446130	Três de Maio	Brazil	Rio Grande do Sul
3446137	Três Coroas	Brazil	Rio Grande do Sul
3446138	Três Corações	Brazil	Minas Gerais
3446194	Tremembé	Brazil	São Paulo
3446232	Tramandaí	Brazil	Rio Grande do Sul
3446295	Torres	Brazil	Rio Grande do Sul
3446370	Toledo	Brazil	Paraná
3446400	Tobias Barreto	Brazil	Sergipe
3446445	Timóteo	Brazil	Minas Gerais
3446465	Timbó	Brazil	Santa Catarina
3446500	Tijucas	Brazil	Santa Catarina
3446539	Tietê	Brazil	São Paulo
3446556	Teutônia	Brazil	Rio Grande do Sul
3446621	Teófilo Otoni	Brazil	Minas Gerais
3446625	Teodoro Sampaio	Brazil	São Paulo
3446652	Telêmaco Borba	Brazil	Paraná
3446682	Taubaté	Brazil	São Paulo
3446692	Tatuí	Brazil	São Paulo
3446752	Taquarituba	Brazil	São Paulo
3446753	Taquaritinga	Brazil	São Paulo
3446783	Taquari	Brazil	Rio Grande do Sul
3446847	Taquara	Brazil	Rio Grande do Sul
3446866	Tapiramutá	Brazil	Bahia
3446880	Tapes	Brazil	Rio Grande do Sul
3446974	Tanguá	Brazil	Rio de Janeiro
3446979	Tanabi	Brazil	São Paulo
3447005	Tambaú	Brazil	São Paulo
3447059	Taiobeiras	Brazil	Minas Gerais
3447186	Taboão da Serra	Brazil	São Paulo
3447212	Suzano	Brazil	São Paulo
3447259	Sumaré	Brazil	São Paulo
3447423	Soledade	Brazil	Rio Grande do Sul
3447437	Socorro	Brazil	São Paulo
3447473	Sobradinho	Brazil	Bahia
3447562	Simão Dias	Brazil	Sergipe
3447591	Silva Jardim	Brazil	Rio de Janeiro
3447597	Sidrolândia	Brazil	Mato Grosso do Sul
3447624	Sete Lagoas	Brazil	Minas Gerais
3447651	Sertãozinho	Brazil	São Paulo
3447690	Serrinha	Brazil	Bahia
3447718	Serra Negra	Brazil	São Paulo
3447720	Serrana	Brazil	São Paulo
3447779	Serra	Brazil	Espírito Santo
3447839	Senhor do Bonfim	Brazil	Bahia
3447854	Senador Canedo	Brazil	Goiás
3447928	Seabra	Brazil	Bahia
3447929	Schroeder	Brazil	Santa Catarina
3447961	Saubara	Brazil	Bahia
3447969	Sarzedo	Brazil	Minas Gerais
3447997	Sarandi	Brazil	Rio Grande do Sul
3407669	Ananindeua	Brazil	Pará
3407758	Amaraji	Brazil	Pernambuco
3448063	Sapiranga	Brazil	Rio Grande do Sul
3448136	São Vicente	Brazil	São Paulo
3448207	São Sepé	Brazil	Rio Grande do Sul
3448221	São Sebastião do Paraíso	Brazil	Minas Gerais
3448227	São Sebastião do Caí	Brazil	Rio Grande do Sul
3448257	São Sebastião	Brazil	São Paulo
3448300	São Roque	Brazil	São Paulo
3448351	São Pedro da Aldeia	Brazil	Rio de Janeiro
3448403	São Pedro	Brazil	São Paulo
3448439	São Paulo	Brazil	São Paulo
3448453	São Miguel do Iguaçu	Brazil	Paraná
3448455	São Miguel do Araguaia	Brazil	Goiás
3448502	São Mateus do Sul	Brazil	Paraná
3448519	São Mateus	Brazil	Espírito Santo
3448533	São Marcos	Brazil	Rio Grande do Sul
3448545	São Manuel	Brazil	São Paulo
3448552	São Luiz Gonzaga	Brazil	Rio Grande do Sul
3448558	São Luís de Montes Belos	Brazil	Goiás
3448596	São Lourenço do Sul	Brazil	Rio Grande do Sul
3448616	São Lourenço	Brazil	Minas Gerais
3448622	São Leopoldo	Brazil	Rio Grande do Sul
3448636	São José dos Campos	Brazil	São Paulo
3448639	São José do Rio Preto	Brazil	São Paulo
3448640	São José do Rio Pardo	Brazil	São Paulo
3448742	São José	Brazil	Santa Catarina
3448825	São Joaquim da Barra	Brazil	São Paulo
3448828	São Joaquim	Brazil	Santa Catarina
3448846	São João Nepomuceno	Brazil	Minas Gerais
3448877	São João de Meriti	Brazil	Rio de Janeiro
3448879	São João del Rei	Brazil	Minas Gerais
3448902	São João da Boa Vista	Brazil	São Paulo
3448903	São João da Barra	Brazil	Rio de Janeiro
3449045	São Jerônimo	Brazil	Rio Grande do Sul
3449053	São Gotardo	Brazil	Minas Gerais
3449056	São Gonçalo do Sapucaí	Brazil	Minas Gerais
3449099	São Gabriel	Brazil	Rio Grande do Sul
3449112	São Francisco do Sul	Brazil	Santa Catarina
3449116	São Francisco do Conde	Brazil	Bahia
3449176	São Francisco	Brazil	Minas Gerais
3449195	São Fidélis	Brazil	Rio de Janeiro
3449310	São Cristóvão	Brazil	Sergipe
3449324	São Caetano do Sul	Brazil	São Paulo
3449340	São Borja	Brazil	Rio Grande do Sul
3449344	São Bernardo do Campo	Brazil	São Paulo
3449350	São Bento do Sul	Brazil	Santa Catarina
3449427	Santos Dumont	Brazil	Minas Gerais
3449433	Santos	Brazil	São Paulo
3449467	Santo Estêvão	Brazil	Bahia
3449500	Santo Antônio do Monte	Brazil	Minas Gerais
3449516	Santo Antônio do Amparo	Brazil	Minas Gerais
3449518	Santo Antônio de Posse	Brazil	São Paulo
3449519	Santo Antônio de Pádua	Brazil	Rio de Janeiro
3449521	Santo Antônio de Jesus	Brazil	Bahia
3449529	Santo Antônio da Platina	Brazil	Paraná
3449696	Santo Ângelo	Brazil	Rio Grande do Sul
3449701	Santo André	Brazil	São Paulo
3449707	Santo Anastácio	Brazil	São Paulo
3449720	Santo Amaro	Brazil	Bahia
3449741	Santiago	Brazil	Rio Grande do Sul
3449747	Santa Vitória do Palmar	Brazil	Rio Grande do Sul
3449793	Santa Rosa de Viterbo	Brazil	São Paulo
3449822	Santa Rosa	Brazil	Rio Grande do Sul
3449847	Santa Rita do Sapucaí	Brazil	Minas Gerais
3449851	Santa Rita do Passa Quatro	Brazil	São Paulo
3449933	Santana do Paraíso	Brazil	Minas Gerais
3449936	Santana do Livramento	Brazil	Rio Grande do Sul
3449948	Santana de Parnaíba	Brazil	São Paulo
3450063	Santa Maria da Vitória	Brazil	Bahia
3450083	Santa Maria	Brazil	Rio Grande do Sul
3450144	Santa Luzia	Brazil	Minas Gerais
3450157	Santaluz	Brazil	Bahia
3450188	Santa Isabel	Brazil	São Paulo
3450206	Santa Helena de Goiás	Brazil	Goiás
3450225	Santa Gertrudes	Brazil	São Paulo
3450232	Santa Fé do Sul	Brazil	São Paulo
3450272	Santa Cruz do Rio Pardo	Brazil	São Paulo
3450283	Santa Cruz das Palmeiras	Brazil	São Paulo
3450288	Santa Cruz Cabrália	Brazil	Bahia
3450376	Santa Cecília	Brazil	Santa Catarina
3450404	Santa Bárbara d'Oeste	Brazil	São Paulo
3450554	Salvador	Brazil	Bahia
3450563	Salto de Pirapora	Brazil	São Paulo
3450594	Salto	Brazil	São Paulo
3450671	Salinas	Brazil	Minas Gerais
3450759	Sacramento	Brazil	Minas Gerais
3450832	Ruy Barbosa	Brazil	Bahia
3450843	Rubiataba	Brazil	Goiás
3450873	Rosário do Sul	Brazil	Rio Grande do Sul
3450909	Rondonópolis	Brazil	Mato Grosso
3450963	Rolante	Brazil	Rio Grande do Sul
3450964	Rolândia	Brazil	Paraná
3451071	Rio Real	Brazil	Bahia
3451102	Rio Pardo	Brazil	Rio Grande do Sul
3451121	Rio Negro	Brazil	Paraná
3451124	Rio Negrinho	Brazil	Santa Catarina
3451134	Rio Grande da Serra	Brazil	São Paulo
3451138	Rio Grande	Brazil	Rio Grande do Sul
3451152	Rio do Sul	Brazil	Santa Catarina
3451202	Rio das Pedras	Brazil	São Paulo
3451205	Rio das Ostras	Brazil	Rio de Janeiro
3451234	Rio Claro	Brazil	São Paulo
3451241	Rio Brilhante	Brazil	Mato Grosso do Sul
3451242	Rio Branco do Sul	Brazil	Paraná
3448011	Saquarema	Brazil	Rio de Janeiro
3448031	Sapucaia	Brazil	Rio Grande do Sul
3451357	Ribeirão da Ilha	Brazil	Santa Catarina
3451383	Ribeira do Pombal	Brazil	Bahia
3451474	Riachão do Jacuípe	Brazil	Bahia
3451650	Resplendor	Brazil	Minas Gerais
3451668	Resende	Brazil	Rio de Janeiro
3451704	Registro	Brazil	São Paulo
3451709	Regente Feijó	Brazil	São Paulo
3451856	Rancharia	Brazil	São Paulo
3451329	Ribeirão Pires	Brazil	São Paulo
3451931	Quirinópolis	Brazil	Goiás
3452073	Queimados	Brazil	Rio de Janeiro
3452141	Quatro Barras	Brazil	Paraná
3452179	Quaraí	Brazil	Rio Grande do Sul
3452216	Prudentópolis	Brazil	Paraná
3452233	Propriá	Brazil	Sergipe
3452237	Promissão	Brazil	São Paulo
3452320	Presidente Venceslau	Brazil	São Paulo
3452331	Presidente Epitácio	Brazil	São Paulo
3452440	Prata	Brazil	Minas Gerais
3452465	Praia Grande	Brazil	São Paulo
3452483	Prado	Brazil	Bahia
3452525	Pouso Alegre	Brazil	Minas Gerais
3452599	Posse	Brazil	Goiás
3452623	Porto União	Brazil	Santa Catarina
3452640	Porto Seguro	Brazil	Bahia
3452775	Porto Ferreira	Brazil	São Paulo
3452779	Porto Feliz	Brazil	São Paulo
3452925	Porto Alegre	Brazil	Rio Grande do Sul
3452982	Portão	Brazil	Rio Grande do Sul
3453014	Porangatu	Brazil	Goiás
3453060	Pontes e Lacerda	Brazil	Mato Grosso
3453078	Ponte Nova	Brazil	Minas Gerais
3453150	Ponta Porã	Brazil	Mato Grosso do Sul
3453171	Pontal	Brazil	São Paulo
3453186	Ponta Grossa	Brazil	Paraná
3453240	Pompéu	Brazil	Minas Gerais
3453242	Pompéia	Brazil	São Paulo
3453303	Poços de Caldas	Brazil	Minas Gerais
3453315	Poconé	Brazil	Mato Grosso
3453337	Poções	Brazil	Bahia
3453406	Poá	Brazil	São Paulo
3453420	Planaltina	Brazil	Goiás
3453435	Piúma	Brazil	Espírito Santo
3453439	Piuí	Brazil	Minas Gerais
3453457	Pitangui	Brazil	Minas Gerais
3453467	Pitangueiras	Brazil	São Paulo
3453478	Pitanga	Brazil	Paraná
3453494	Piritiba	Brazil	Bahia
3453503	Pires do Rio	Brazil	Goiás
3453535	Piraquara	Brazil	Paraná
3453542	Pirapozinho	Brazil	São Paulo
3453546	Pirapora	Brazil	Minas Gerais
3453605	Pirajuí	Brazil	São Paulo
3453610	Piraju	Brazil	São Paulo
3453635	Piraí	Brazil	Rio de Janeiro
3453639	Pirassununga	Brazil	São Paulo
3453643	Piracicaba	Brazil	São Paulo
3453659	Piracanjuba	Brazil	Goiás
3453661	Piracaia	Brazil	São Paulo
3453767	Pinheiral	Brazil	Rio de Janeiro
3453777	Pinhão	Brazil	Paraná
3453807	Espírito Santo do Pinhal	Brazil	São Paulo
3453827	Pindobaçu	Brazil	Bahia
3453837	Pindamonhangaba	Brazil	São Paulo
3453896	Pilar do Sul	Brazil	São Paulo
3453926	Piedade	Brazil	São Paulo
3454031	Petrópolis	Brazil	Rio de Janeiro
3454061	Peruíbe	Brazil	São Paulo
3454131	Pereira Barreto	Brazil	São Paulo
3454213	Penha	Brazil	Santa Catarina
3454231	Penedo	Brazil	Alagoas
3454235	Penápolis	Brazil	São Paulo
3454244	Pelotas	Brazil	Rio Grande do Sul
3454358	Pedro Leopoldo	Brazil	Minas Gerais
3454407	Pedreira	Brazil	São Paulo
3454578	Pedra Azul	Brazil	Minas Gerais
3454620	Pederneiras	Brazil	São Paulo
3454690	Paulínia	Brazil	São Paulo
3454763	Patrocínio	Brazil	Minas Gerais
3454783	Patos de Minas	Brazil	Minas Gerais
3454818	Pato Branco	Brazil	Paraná
3454827	Paty do Alferes	Brazil	Rio de Janeiro
3454847	Passos	Brazil	Minas Gerais
3454954	Parobé	Brazil	Rio Grande do Sul
3455036	Paraty	Brazil	Rio de Janeiro
3455051	Paranavaí	Brazil	Paraná
3455061	Paranapanema	Brazil	São Paulo
3455065	Paranaíba	Brazil	Mato Grosso do Sul
3455070	Paranaguá	Brazil	Paraná
3455141	Paraíba do Sul	Brazil	Rio de Janeiro
3455152	Paraguaçu Paulista	Brazil	São Paulo
3455155	Paraguaçu	Brazil	Minas Gerais
3455161	Pará de Minas	Brazil	Minas Gerais
3455168	Paracatu	Brazil	Minas Gerais
3455170	Paracambi	Brazil	Rio de Janeiro
3455281	Panambi	Brazil	Rio Grande do Sul
3455298	Palotina	Brazil	Paraná
3455342	Palmital	Brazil	São Paulo
3455425	Palmeira	Brazil	Paraná
3455459	Palmas	Brazil	Paraná
3455478	Palhoça	Brazil	Santa Catarina
3455553	Paiçandu	Brazil	Paraná
3455671	Ouro Preto	Brazil	Minas Gerais
3455689	Ouro Branco	Brazil	Minas Gerais
3455729	Ourinhos	Brazil	São Paulo
3455756	Osvaldo Cruz	Brazil	São Paulo
3455769	Osório	Brazil	Rio Grande do Sul
3455775	Osasco	Brazil	São Paulo
3455784	Orleans	Brazil	Santa Catarina
3455785	Orlândia	Brazil	São Paulo
3455908	Oliveira	Brazil	Minas Gerais
3455923	Olímpia	Brazil	São Paulo
3456060	Novo Horizonte	Brazil	São Paulo
3460107	Jaraguá	Brazil	Goiás
3451328	Ribeirão Preto	Brazil	São Paulo
3456110	Nova Venécia	Brazil	Espírito Santo
3456125	Nova Prata	Brazil	Rio Grande do Sul
3456127	Nova Petrópolis	Brazil	Rio Grande do Sul
3456137	Nova Olímpia	Brazil	Mato Grosso
3456138	Nova Odessa	Brazil	São Paulo
3456147	Nova Lima	Brazil	Minas Gerais
3456160	Nova Iguaçu	Brazil	Rio de Janeiro
3456164	Nova Granada	Brazil	São Paulo
3456166	Nova Friburgo	Brazil	Rio de Janeiro
3456176	Nova Era	Brazil	Minas Gerais
3456223	Nossa Senhora do Socorro	Brazil	Sergipe
3456283	Niterói	Brazil	Rio de Janeiro
3456285	Niquelândia	Brazil	Goiás
3456290	Nilópolis	Brazil	Rio de Janeiro
3456322	Nerópolis	Brazil	Goiás
3456324	Nepomuceno	Brazil	Minas Gerais
3456366	Nazaré	Brazil	Bahia
3456368	Naviraí	Brazil	Mato Grosso do Sul
3456370	Navegantes	Brazil	Santa Catarina
3456398	Nanuque	Brazil	Minas Gerais
3456412	Muzambinho	Brazil	Minas Gerais
3456483	Muritiba	Brazil	Bahia
3456500	Muriaé	Brazil	Minas Gerais
3456593	Mucuri	Brazil	Bahia
3456696	Morro do Chapéu	Brazil	Bahia
3456724	Morro Agudo	Brazil	São Paulo
3456735	Morrinhos	Brazil	Goiás
3456814	Montes Claros	Brazil	Minas Gerais
3456816	Monte Santo de Minas	Brazil	Minas Gerais
3456826	Montenegro	Brazil	Rio Grande do Sul
3456827	Monte Mor	Brazil	São Paulo
3456863	Monte Azul Paulista	Brazil	São Paulo
3456866	Monte Aprazível	Brazil	São Paulo
3456873	Monte Alto	Brazil	São Paulo
3456944	Mongaguá	Brazil	São Paulo
3456998	Mogi Mirim	Brazil	São Paulo
3457000	Mogi-Gaucu	Brazil	São Paulo
3457001	Mogi das Cruzes	Brazil	São Paulo
3457025	Mococa	Brazil	São Paulo
3457107	Mirandopólis	Brazil	São Paulo
3457133	Miracema	Brazil	Rio de Janeiro
3457147	Mineiros	Brazil	Goiás
3457191	Miguel Pereira	Brazil	Rio de Janeiro
3457192	Miguelópolis	Brazil	São Paulo
3457247	Mendes	Brazil	Rio de Janeiro
3457359	Medianeira	Brazil	Paraná
3457360	Medeiros Neto	Brazil	Bahia
3457381	Mauá	Brazil	São Paulo
3457484	Mateus Leme	Brazil	Minas Gerais
3457509	Matão	Brazil	São Paulo
3457528	Mata de São João	Brazil	Bahia
3457566	Mascote	Brazil	Bahia
3457595	Martinópolis	Brazil	São Paulo
3457671	Maringá	Brazil	Paraná
3457692	Marília	Brazil	São Paulo
3457708	Maricá	Brazil	Rio de Janeiro
3457736	Mariana	Brazil	Minas Gerais
3457741	Marialva	Brazil	Paraná
3457772	Marechal Cândido Rondon	Brazil	Paraná
3457817	Marau	Brazil	Rio Grande do Sul
3457819	Marataizes	Brazil	Espírito Santo
3457850	Maragogipe	Brazil	Bahia
3457854	Maracás	Brazil	Bahia
3457950	Manhumirim	Brazil	Minas Gerais
3457952	Manhuaçu	Brazil	Minas Gerais
3457991	Mangaratiba	Brazil	Rio de Janeiro
3458049	Mandaguari	Brazil	Paraná
3458131	Mairiporã	Brazil	São Paulo
3458132	Mairinque	Brazil	São Paulo
3458147	Mafra	Brazil	Santa Catarina
3458211	Machado	Brazil	Minas Gerais
3458245	Macatuba	Brazil	São Paulo
3458266	Macaé	Brazil	Rio de Janeiro
3458329	Luziânia	Brazil	Goiás
3458397	Lucas	Brazil	Mato Grosso
3458406	Louveira	Brazil	São Paulo
3458425	Lorena	Brazil	São Paulo
3458449	Londrina	Brazil	Paraná
3458479	Loanda	Brazil	Paraná
3458494	Lins	Brazil	São Paulo
3458498	Linhares	Brazil	Espírito Santo
3458575	Limeira	Brazil	São Paulo
3458632	Leopoldina	Brazil	Minas Gerais
3458645	Lençóis Paulista	Brazil	São Paulo
3458662	Leme	Brazil	São Paulo
3458696	Lavras	Brazil	Minas Gerais
3458746	Laranjeiras do Sul	Brazil	Paraná
3458778	Laranjeiras	Brazil	Sergipe
3458786	Laranjal Paulista	Brazil	São Paulo
3458826	Lapa	Brazil	Paraná
3458902	Lajinha	Brazil	Minas Gerais
3458930	Lages	Brazil	Santa Catarina
3459035	Lajeado	Brazil	Rio Grande do Sul
3459094	Laguna	Brazil	Santa Catarina
3459138	Lagoa Santa	Brazil	Minas Gerais
3459251	Lagoa da Prata	Brazil	Minas Gerais
3459342	Lagarto	Brazil	Sergipe
3459352	Ladário	Brazil	Mato Grosso do Sul
3459462	Jundiaí	Brazil	São Paulo
3459495	Júlio de Castilhos	Brazil	Rio Grande do Sul
3459505	Juiz de Fora	Brazil	Minas Gerais
3459550	Juatuba	Brazil	Minas Gerais
3459667	José Bonifácio	Brazil	São Paulo
3459712	Joinville	Brazil	Santa Catarina
3459785	João Pinheiro	Brazil	Minas Gerais
3459796	João Monlevade	Brazil	Minas Gerais
3459869	Joaçaba	Brazil	Santa Catarina
3459922	Jeremoabo	Brazil	Bahia
3459925	Jequitinhonha	Brazil	Minas Gerais
3459943	Jequié	Brazil	Bahia
3460005	Jaú	Brazil	São Paulo
3460064	Jataí	Brazil	Goiás
3460068	Jarinu	Brazil	São Paulo
3460087	Jardim	Brazil	Mato Grosso do Sul
3460102	Jaraguá do Sul	Brazil	Santa Catarina
3456102	Nova Viçosa	Brazil	Bahia
3460170	Jandira	Brazil	São Paulo
3460172	Jandaia do Sul	Brazil	Paraná
3460174	Janaúba	Brazil	Minas Gerais
3460186	Jales	Brazil	São Paulo
3460214	Jaguariaíva	Brazil	Paraná
3460225	Jaguarari	Brazil	Bahia
3460232	Jaguarão	Brazil	Rio Grande do Sul
3460242	Jaguaquara	Brazil	Bahia
3460267	Jacutinga	Brazil	Minas Gerais
3460344	Jacobina	Brazil	Bahia
3460355	Jaciara	Brazil	Mato Grosso
3460362	Jacarezinho	Brazil	Paraná
3460370	Jacareí	Brazil	São Paulo
3460441	Jaboticabal	Brazil	São Paulo
3460484	Ivoti	Brazil	Rio Grande do Sul
3460511	Ituverava	Brazil	São Paulo
3460513	Iturama	Brazil	Minas Gerais
3460516	Itupeva	Brazil	São Paulo
3460522	Itumbiara	Brazil	Goiás
3460523	Ituiutaba	Brazil	Minas Gerais
3460530	Ituberá	Brazil	Bahia
3460535	Itu	Brazil	São Paulo
3460584	Itaúna	Brazil	Minas Gerais
3460594	Itatinga	Brazil	São Paulo
3460598	Itatiba	Brazil	São Paulo
3460620	Itararé	Brazil	São Paulo
3460629	Itaqui	Brazil	Rio Grande do Sul
3460644	Itaquaquecetuba	Brazil	São Paulo
3460648	Itapuranga	Brazil	Goiás
3460671	Itápolis	Brazil	São Paulo
3460699	Itapira	Brazil	São Paulo
3460718	Itapevi	Brazil	São Paulo
3460723	Itapeva	Brazil	São Paulo
3460728	Itapetininga	Brazil	São Paulo
3460730	Itapetinga	Brazil	Bahia
3460734	Itaperuçu	Brazil	Paraná
3460738	Itapemirim	Brazil	Espírito Santo
3460740	Itapema	Brazil	Santa Catarina
3460748	Itapecerica da Serra	Brazil	São Paulo
3460752	Itapecerica	Brazil	Minas Gerais
3460764	Itaparica	Brazil	Bahia
3460773	Itapaci	Brazil	Goiás
3460774	Itaocara	Brazil	Rio de Janeiro
3460791	Itanhaém	Brazil	São Paulo
3460813	Itambé	Brazil	Bahia
3460825	Itamarandiba	Brazil	Minas Gerais
3460826	Itamaraju	Brazil	Bahia
3460831	Itajuípe	Brazil	Bahia
3460834	Itajubá	Brazil	Minas Gerais
3460845	Itajaí	Brazil	Santa Catarina
3460887	Itaí	Brazil	São Paulo
3460949	Itabuna	Brazil	Bahia
3460950	Itaboraí	Brazil	Rio de Janeiro
3460954	Itabirito	Brazil	Minas Gerais
3460960	Itabira	Brazil	Minas Gerais
3460963	Itaberaí	Brazil	Goiás
3460966	Itaberaba	Brazil	Bahia
3460971	Itabaianinha	Brazil	Sergipe
3460974	Itabaiana	Brazil	Sergipe
3461013	Irecê	Brazil	Bahia
3461017	Irati	Brazil	Paraná
3461055	Iracemápolis	Brazil	São Paulo
3461090	Iporá	Brazil	Goiás
3461124	Ipirá	Brazil	Bahia
3461129	Ipiaú	Brazil	Bahia
3461134	Iperó	Brazil	São Paulo
3461151	Ipameri	Brazil	Goiás
3461153	Ipaba	Brazil	Minas Gerais
3461194	Inhumas	Brazil	Goiás
3461311	Indaiatuba	Brazil	São Paulo
3461316	Indaial	Brazil	Santa Catarina
3461368	Imbituva	Brazil	Paraná
3461370	Imbituba	Brazil	Santa Catarina
3461408	Ilhéus	Brazil	Bahia
3461411	Ilha Solteira	Brazil	São Paulo
3461425	Ilhabela	Brazil	São Paulo
3461444	Ijuí	Brazil	Rio Grande do Sul
3461465	Iguape	Brazil	São Paulo
3461481	Igrejinha	Brazil	Rio Grande do Sul
3461498	Igarapé	Brazil	Minas Gerais
3461499	Igarapava	Brazil	São Paulo
3461519	Içara	Brazil	Santa Catarina
3461525	Ibotirama	Brazil	Bahia
3461528	Ibiúna	Brazil	São Paulo
3461550	Ibitinga	Brazil	São Paulo
3461563	Ibirité	Brazil	Minas Gerais
3461565	Ibirataia	Brazil	Bahia
3461576	Ibirama	Brazil	Santa Catarina
3461588	Ibiporã	Brazil	Paraná
3461606	Ibicaraí	Brazil	Bahia
3461620	Ibiá	Brazil	Minas Gerais
3461625	Ibaté	Brazil	São Paulo
3461628	Ibaiti	Brazil	Paraná
3461638	Iaçu	Brazil	Bahia
3461655	Hortolândia	Brazil	São Paulo
3461680	Herval	Brazil	Rio Grande do Sul
3461724	Gurupi	Brazil	Tocantins
3461763	Guaxupé	Brazil	Minas Gerais
3461786	Guarulhos	Brazil	São Paulo
3461789	Guarujá	Brazil	São Paulo
3461824	Guariba	Brazil	São Paulo
3461857	Guaratuba	Brazil	Paraná
3461871	Guararema	Brazil	São Paulo
3461874	Guararapes	Brazil	São Paulo
3461879	Guarapuava	Brazil	Paraná
3461888	Guarapari	Brazil	Espírito Santo
3461910	Guaranésia	Brazil	Minas Gerais
3461914	Guaramirim	Brazil	Santa Catarina
3461935	Guará	Brazil	São Paulo
3461941	Guaporé	Brazil	Rio Grande do Sul
3461949	Guapimirim	Brazil	Rio de Janeiro
3461958	Guanhães	Brazil	Minas Gerais
3461973	Guanambi	Brazil	Bahia
3461995	Guaíra	Brazil	São Paulo
3462022	Guaçuí	Brazil	Espírito Santo
3462089	Gravataí	Brazil	Rio Grande do Sul
3462371	Goiatuba	Brazil	Goiás
3462374	Goiás	Brazil	Goiás
3462376	Goianira	Brazil	Goiás
3460148	Januária	Brazil	Minas Gerais
3462535	Gaspar	Brazil	Santa Catarina
3462557	Garibaldi	Brazil	Rio Grande do Sul
3462580	Garça	Brazil	São Paulo
3462601	Gandu	Brazil	Bahia
3462916	Frutal	Brazil	Minas Gerais
3462956	Frederico Westphalen	Brazil	Rio Grande do Sul
3462964	Franco da Rocha	Brazil	São Paulo
3462980	Francisco Morato	Brazil	São Paulo
3462996	Francisco Beltrão	Brazil	Paraná
3463011	Franca	Brazil	São Paulo
3463030	Foz do Iguaçu	Brazil	Paraná
3463140	Formosa	Brazil	Goiás
3463174	Formiga	Brazil	Minas Gerais
3463237	Florianópolis	Brazil	Santa Catarina
3463271	Flores da Cunha	Brazil	Rio Grande do Sul
3463422	Ferraz de Vasconcelos	Brazil	São Paulo
3463432	Fernandópolis	Brazil	São Paulo
3463478	Feira de Santana	Brazil	Bahia
3463605	Farroupilha	Brazil	Rio Grande do Sul
3463698	Euclides da Cunha	Brazil	Bahia
3463762	Estrela	Brazil	Rio Grande do Sul
3463859	Esteio	Brazil	Rio Grande do Sul
3463865	Estância Velha	Brazil	Rio Grande do Sul
3463900	Estância	Brazil	Sergipe
3463920	Esplanada	Brazil	Bahia
3463939	Espinosa	Brazil	Minas Gerais
3464008	Esmeraldas	Brazil	Minas Gerais
3464100	Entre Rios	Brazil	Bahia
3464255	Encruzilhada do Sul	Brazil	Rio Grande do Sul
3464274	Encantado	Brazil	Rio Grande do Sul
3464304	Embu Guaçu	Brazil	São Paulo
3464305	Embu	Brazil	São Paulo
3464329	Elói Mendes	Brazil	Minas Gerais
3464374	Duque de Caxias	Brazil	Rio de Janeiro
3464460	Dourados	Brazil	Mato Grosso do Sul
3464547	Dom Pedrito	Brazil	Rio Grande do Sul
3464579	Dois Vizinhos	Brazil	Paraná
3464618	Dois Córregos	Brazil	São Paulo
3464688	Divinópolis	Brazil	Minas Gerais
3464724	Diamantino	Brazil	Mato Grosso
3464728	Diamantina	Brazil	Minas Gerais
3464739	Diadema	Brazil	São Paulo
3464809	Descalvado	Brazil	São Paulo
3464891	Curvelo	Brazil	Minas Gerais
3464975	Curitiba	Brazil	Paraná
3465038	Cuiabá	Brazil	Mato Grosso
3465059	Cubatão	Brazil	São Paulo
3465083	Cruzeiro do Oeste	Brazil	Paraná
3465090	Cruzeiro	Brazil	São Paulo
3465105	Cruz das Almas	Brazil	Bahia
3465108	Cruz Alta	Brazil	Rio Grande do Sul
3465164	Cristalina	Brazil	Goiás
3465196	Criciúma	Brazil	Santa Catarina
3465209	Cravinhos	Brazil	São Paulo
3465228	Coxim	Brazil	Mato Grosso do Sul
3465284	Cotia	Brazil	São Paulo
3465320	Cosmópolis	Brazil	São Paulo
3465329	Coruripe	Brazil	Alagoas
3465342	Corumbá	Brazil	Mato Grosso do Sul
3465476	Coronel Fabriciano	Brazil	Minas Gerais
3465487	Coromandel	Brazil	Minas Gerais
3465508	Cornélio Procópio	Brazil	Paraná
3465512	Corinto	Brazil	Minas Gerais
3465524	Cordeirópolis	Brazil	São Paulo
3465527	Cordeiro	Brazil	Rio de Janeiro
3465624	Contagem	Brazil	Minas Gerais
3465644	Conselheiro Lafaiete	Brazil	Minas Gerais
3465671	Congonhas	Brazil	Minas Gerais
3465713	Conde	Brazil	Bahia
3465721	Concórdia	Brazil	Santa Catarina
3465731	Conchal	Brazil	São Paulo
3465748	Conceição do Coité	Brazil	Bahia
3465758	Conceição do Jacuípe	Brazil	Bahia
3465767	Conceição da Feira	Brazil	Bahia
3465769	Conceição da Barra	Brazil	Espírito Santo
3465881	Colorado	Brazil	Paraná
3465927	Colombo	Brazil	Paraná
3465944	Colatina	Brazil	Espírito Santo
3466041	Coaraci	Brazil	Bahia
3466062	Cláudio	Brazil	Minas Gerais
3466171	Cícero Dantas	Brazil	Bahia
3466174	Cianorte	Brazil	Paraná
3466261	Charqueadas	Brazil	Rio Grande do Sul
3466296	Chapecó	Brazil	Santa Catarina
3466429	Cerquilho	Brazil	São Paulo
3466436	Ceres	Brazil	Goiás
3466481	Celso Ramos	Brazil	Santa Catarina
3466537	Caxias do Sul	Brazil	Rio Grande do Sul
3466547	Caxambu	Brazil	Minas Gerais
3466641	Catu	Brazil	Bahia
3466692	Catanduva	Brazil	São Paulo
3466696	Catalão	Brazil	Goiás
3466698	Cataguases	Brazil	Minas Gerais
3466704	Castro	Brazil	Paraná
3466750	Cassilândia	Brazil	Mato Grosso do Sul
3466763	Casimiro de Abreu	Brazil	Rio de Janeiro
3466779	Cascavel	Brazil	Paraná
3466824	Casa Branca	Brazil	São Paulo
3466902	Carmo do Paranaíba	Brazil	Minas Gerais
3466903	Carmo do Cajuru	Brazil	Minas Gerais
3466933	Carlos Barbosa	Brazil	Rio Grande do Sul
3466978	Carazinho	Brazil	Rio Grande do Sul
3466988	Caratinga	Brazil	Minas Gerais
3466998	Carapicuíba	Brazil	São Paulo
3467012	Carangola	Brazil	Minas Gerais
3467026	Carandaí	Brazil	Minas Gerais
3467081	Caraguatatuba	Brazil	São Paulo
3467197	Capivari	Brazil	São Paulo
3467261	Capinzal	Brazil	Santa Catarina
3467272	Capim Grosso	Brazil	Bahia
3467319	Capela	Brazil	Sergipe
3467362	Capão da Canoa	Brazil	Rio Grande do Sul
3467371	Capâo Bonito	Brazil	São Paulo
3462378	Goianésia	Brazil	Goiás
3467512	Canguçu	Brazil	Rio Grande do Sul
3467530	Canela	Brazil	Rio Grande do Sul
3467542	Cândido Mota	Brazil	São Paulo
3467550	Candelária	Brazil	Rio Grande do Sul
3467577	Canavieiras	Brazil	Bahia
3467677	Campos Novos	Brazil	Santa Catarina
3467680	Campos Gerais	Brazil	Minas Gerais
3467684	Campos do Jordão	Brazil	São Paulo
3467687	Campos Belos	Brazil	Goiás
3467693	Campos	Brazil	Rio de Janeiro
3467717	Campo Mourão	Brazil	Paraná
3467736	Campo Largo	Brazil	Paraná
3467747	Campo Grande	Brazil	Mato Grosso do Sul
3467760	Campo Formoso	Brazil	Bahia
3467796	Campo Belo	Brazil	Minas Gerais
3467865	Campinas	Brazil	São Paulo
3467877	Campina Grande do Sul	Brazil	Paraná
3467956	Cambuí	Brazil	Minas Gerais
3467978	Cambé	Brazil	Paraná
3467985	Cambará	Brazil	Paraná
3468014	Camaquã	Brazil	Rio Grande do Sul
3468023	Camanducaia	Brazil	Minas Gerais
3468031	Camaçari	Brazil	Bahia
3468100	Caldas Novas	Brazil	Goiás
3468121	Cajuru	Brazil	São Paulo
3468157	Cajati	Brazil	São Paulo
3468215	Caieiras	Brazil	São Paulo
3468317	Caetité	Brazil	Bahia
3468327	Caeté	Brazil	Minas Gerais
3468376	Cachoeiro de Itapemirim	Brazil	Espírito Santo
3468403	Cachoeirinha	Brazil	Rio Grande do Sul
3468425	Cachoeiras de Macacu	Brazil	Rio de Janeiro
3468436	Cachoeira do Sul	Brazil	Rio Grande do Sul
3468535	Cachoeira	Brazil	Bahia
3468560	Caçapava do Sul	Brazil	Rio Grande do Sul
3468562	Caçapava	Brazil	São Paulo
3468570	Caçador	Brazil	Santa Catarina
3468592	Cabreúva	Brazil	São Paulo
3468704	Butiá	Brazil	Rio Grande do Sul
3468720	Buritizeiro	Brazil	Minas Gerais
3468732	Buritis	Brazil	Minas Gerais
3468802	Buri	Brazil	São Paulo
3468858	Buerarema	Brazil	Bahia
3468879	Brusque	Brazil	Santa Catarina
3468893	Brumado	Brazil	Bahia
3468894	Brumadinho	Brazil	Minas Gerais
3468899	Brotas	Brazil	São Paulo
3468902	Brodósqui	Brazil	São Paulo
3469058	Brasília	Brazil	Federal District
3469092	Bragança Paulista	Brazil	São Paulo
3469115	Braço do Norte	Brazil	Santa Catarina
3469136	Botucatu	Brazil	São Paulo
3469437	Bom Jesus da Lapa	Brazil	Bahia
3469516	Bom Despacho	Brazil	Minas Gerais
3469540	Boituva	Brazil	São Paulo
3469601	Bocaiúva	Brazil	Minas Gerais
3469932	Boa Esperança	Brazil	Minas Gerais
3469968	Blumenau	Brazil	Santa Catarina
3469984	Biritiba Mirim	Brazil	São Paulo
3469989	Birigui	Brazil	São Paulo
3470003	Biguaçu	Brazil	Santa Catarina
3470044	Betim	Brazil	Minas Gerais
3470052	Bertioga	Brazil	São Paulo
3470073	Bento Gonçalves	Brazil	Rio Grande do Sul
3470117	Belo Oriente	Brazil	Minas Gerais
3470127	Belo Horizonte	Brazil	Minas Gerais
3470142	Belford Roxo	Brazil	Rio de Janeiro
3470177	Bela Vista	Brazil	Mato Grosso do Sul
3470264	Bebedouro	Brazil	São Paulo
3470279	Bauru	Brazil	São Paulo
3470324	Batatais	Brazil	São Paulo
3470341	Bastos	Brazil	São Paulo
3470353	Barueri	Brazil	São Paulo
3470369	Barroso	Brazil	Minas Gerais
3470428	Barrinha	Brazil	São Paulo
3470451	Barretos	Brazil	São Paulo
3470583	Barreiras	Brazil	Bahia
3470597	Barra Velha	Brazil	Santa Catarina
3470636	Barra Mansa	Brazil	Rio de Janeiro
3470674	Barra dos Coqueiros	Brazil	Sergipe
3470691	Barra do Piraí	Brazil	Rio de Janeiro
3470709	Barra do Garças	Brazil	Mato Grosso
3470718	Barra do Bugres	Brazil	Mato Grosso
3470730	Barra de São Francisco	Brazil	Espírito Santo
3470776	Barra Bonita	Brazil	São Paulo
3470821	Barra	Brazil	Bahia
3470825	Bariri	Brazil	São Paulo
3470858	Barbacena	Brazil	Minas Gerais
3470878	Barão de Cocais	Brazil	Minas Gerais
3470912	Bandeirantes	Brazil	Paraná
3471005	Bambuí	Brazil	Minas Gerais
3471061	Baixo Guandu	Brazil	Espírito Santo
3471196	Bagé	Brazil	Rio Grande do Sul
3471291	Avaré	Brazil	São Paulo
3471335	Atibaia	Brazil	São Paulo
3471368	Astorga	Brazil	Paraná
3471374	Assis	Brazil	São Paulo
3471393	Arujá	Brazil	São Paulo
3471395	Artur Nogueira	Brazil	São Paulo
3471422	Arroio Grande	Brazil	Rio Grande do Sul
3471428	Arroio do Meio	Brazil	Rio Grande do Sul
3471451	Arraial do Cabo	Brazil	Rio de Janeiro
3471487	Armação de Búzios	Brazil	Rio de Janeiro
3471683	Arcos	Brazil	Minas Gerais
3471691	Araxá	Brazil	Minas Gerais
3471697	Araucária	Brazil	Paraná
3471715	Araruama	Brazil	Rio de Janeiro
3471758	Araras	Brazil	São Paulo
3471766	Araraquara	Brazil	São Paulo
3471772	Araranguá	Brazil	Santa Catarina
3471798	Arapongas	Brazil	Paraná
3471840	Aragarças	Brazil	Goiás
3471846	Araçuaí	Brazil	Minas Gerais
3471848	Aracruz	Brazil	Espírito Santo
3467467	Canoas	Brazil	Rio Grande do Sul
3471872	Aracaju	Brazil	Sergipe
3471910	Apucarana	Brazil	Paraná
3471927	Apiaí	Brazil	São Paulo
3471940	Aparecida do Taboado	Brazil	Mato Grosso do Sul
3471949	Aparecida	Brazil	São Paulo
3472048	Antonina	Brazil	Paraná
3472138	Anicuns	Brazil	Goiás
3472177	Angra dos Reis	Brazil	Rio de Janeiro
3472248	Andradina	Brazil	São Paulo
3472254	Andradas	Brazil	Minas Gerais
3472284	Anastácio	Brazil	Mato Grosso do Sul
3472287	Anápolis	Brazil	Goiás
3472311	Amparo	Brazil	São Paulo
3472338	Américo Brasiliense	Brazil	São Paulo
3472343	Americana	Brazil	São Paulo
3472370	Amargosa	Brazil	Bahia
3472417	Álvares Machado	Brazil	São Paulo
3472518	Almirante Tamandaré	Brazil	Paraná
3472603	Alfenas	Brazil	Minas Gerais
3472609	Além Paraíba	Brazil	Minas Gerais
3472638	Alegrete	Brazil	Rio Grande do Sul
3472666	Alegre	Brazil	Espírito Santo
3472766	Alagoinhas	Brazil	Bahia
3472808	Aimorés	Brazil	Minas Gerais
3472825	Agudos	Brazil	São Paulo
3472848	Águas Vermelhas	Brazil	Minas Gerais
3472869	Águas de Lindóia	Brazil	São Paulo
3472969	Aguaí	Brazil	São Paulo
3473157	Adamantina	Brazil	São Paulo
3473267	Abaeté	Brazil	Minas Gerais
3473964	Guaíba	Brazil	Rio Grande do Sul
3474574	Palmas	Brazil	Tocantins
3661944	Tefé	Brazil	Amazonas
3661980	Tarauacá	Brazil	Acre
3662075	Tabatinga	Brazil	Amazonas
3662155	Sena Madureira	Brazil	Acre
3662574	Rio Branco	Brazil	Acre
3662762	Porto Velho	Brazil	Rondônia
3663517	Manaus	Brazil	Amazonas
3663529	Manacapuru	Brazil	Amazonas
3664078	Humaitá	Brazil	Amazonas
3664207	Fonte Boa	Brazil	Amazonas
3664321	Eirunepé	Brazil	Amazonas
3664464	Cruzeiro do Sul	Brazil	Acre
3664539	Coari	Brazil	Amazonas
3664659	Carauari	Brazil	Amazonas
3664980	Boa Vista	Brazil	Roraima
3665199	Ariquemes	Brazil	Rondônia
3665202	Aripuanã	Brazil	Mato Grosso
3924679	Vilhena	Brazil	Rondônia
3924908	Pimenta Bueno	Brazil	Rondônia
3924948	Ouro Preto do Oeste	Brazil	Rondônia
3925033	Ji Paraná	Brazil	Rondônia
3925040	Jaru	Brazil	Rondônia
3925075	Guajará Mirim	Brazil	Rondônia
3925212	Cacoal	Brazil	Rondônia
6316406	Aparecida de Goiânia	Brazil	Goiás
6316729	Campinas	Brazil	Santa Catarina
6317344	Jaboatão dos Guararapes	Brazil	Pernambuco
6317464	Lauro de Freitas	Brazil	Bahia
6317953	Pinhais	Brazil	Paraná
6318165	Rio Preto da Eva	Brazil	Amazonas
6318694	Simões Filho	Brazil	Bahia
6318696	Sinop	Brazil	Mato Grosso
6693804	Cambebba	Brazil	Ceará
7874479	Trindade	Brazil	Santa Catarina
7874492	Freguesia do Ribeirao da Ilha	Brazil	Santa Catarina
3571824	Nassau	Bahamas	New Providence
3571971	Lucaya	Bahamas	Freeport
3572375	Freeport	Bahamas	Freeport
1252416	Thimphu	Bhutan	Thimphu
1252479	Punākha	Bhutan	Punakha
1252608	Tsirang	Bhutan	Chirang
933000	Tonota	Botswana	Central
933018	Thamaga	Botswana	Kweneng
933088	Serowe	Botswana	Central
933099	Selebi-Phikwe	Botswana	Central
933141	Ramotswa	Botswana	South East
933182	Palapye	Botswana	Central
933271	Mosopa	Botswana	Southern
933305	Molepolole	Botswana	Kweneng
933331	Mogoditshane	Botswana	Kweneng
933340	Mochudi	Botswana	Kgatleng
933366	Maun	Botswana	North West
933471	Mahalapye	Botswana	Central
933521	Lobatse	Botswana	South East
933535	Letlhakane	Botswana	Central
933685	Kanye	Botswana	Southern
933719	Janeng	Botswana	South East
933778	Francistown	Botswana	North East
618800	Horad Zhodzina	Belarus	Minsk
618806	Zhlobin	Belarus	Gomel
620127	Vitebsk	Belarus	Vitebsk
620181	Vilyeyka	Belarus	Minsk
620391	Vawkavysk	Belarus	Grodnenskaya
621074	Svyetlahorsk	Belarus	Gomel
621266	Stowbtsy	Belarus	Minsk
621713	Smarhon’	Belarus	Grodnenskaya
621741	Slutsk	Belarus	Minsk
621754	Slonim	Belarus	Grodnenskaya
622113	Shchuchin	Belarus	Grodnenskaya
622428	Salihorsk	Belarus	Minsk
622739	Rahachow	Belarus	Gomel
622794	Rechytsa	Belarus	Gomel
622997	Pruzhany	Belarus	Brest
623317	Polatsk	Belarus	Vitebsk
623549	Pinsk	Belarus	Brest
624034	Asipovichy	Belarus	Mogilev
624079	Orsha	Belarus	Vitebsk
624400	Novoye Medvezhino	Belarus	Minsk City
624784	Navapolatsk	Belarus	Vitebsk
624785	Navahrudak	Belarus	Grodnenskaya
625144	Minsk	Belarus	Minsk City
625324	Mazyr	Belarus	Gomel
625367	Masty	Belarus	Grodnenskaya
625409	Mar’’ina Horka	Belarus	Minsk
625625	Maladzyechna	Belarus	Minsk
625665	Mahilyow	Belarus	Mogilev
3471854	Araci	Brazil	Bahia
626081	Lida	Belarus	Grodnenskaya
626450	Krychaw	Belarus	Mogilev
627083	Kalodzishchy	Belarus	Minsk
627145	Kobryn	Belarus	Brest
627751	Kalinkavichy	Belarus	Gomel
627800	Ivatsevichy	Belarus	Brest
627904	Hrodna	Belarus	Grodnenskaya
627905	Horki	Belarus	Mogilev
627907	Gomel	Belarus	Gomel
627908	Hlybokaye	Belarus	Vitebsk
629018	Dobrush	Belarus	Gomel
629447	Bykhaw	Belarus	Mogilev
629454	Byaroza	Belarus	Brest
629634	Brest	Belarus	Brest
630376	Horad Barysaw	Belarus	Minsk
630429	Baranovichi	Belarus	Brest
630468	Babruysk	Belarus	Mogilev
8020218	Malinovka	Belarus	Minsk City
3581194	San Ignacio	Belize	Cayo
3581514	Orange Walk	Belize	Orange Walk
3582672	Belmopan	Belize	Cayo
3582677	Belize City	Belize	Belize
5882799	Airdrie	Canada	Alberta
5882873	Ajax	Canada	Ontario
5884083	Alma	Canada	Quebec
5884588	Amos	Canada	Quebec
5885383	Anmore	Canada	British Columbia
5889745	Baie-Comeau	Canada	Quebec
5894171	Barrie	Canada	Ontario
5895650	Beaconsfield	Canada	Quebec
5897884	Belleville	Canada	Ontario
5898138	Beloeil	Canada	Quebec
5903510	Blainville	Canada	Quebec
5905132	Boisbriand	Canada	Quebec
5906267	Boucherville	Canada	Quebec
5907180	Bradford West Gwillimbury	Canada	Ontario
5907364	Brampton	Canada	Ontario
5907896	Brandon	Canada	Manitoba
5907983	Brant	Canada	Ontario
5907990	Brantford	Canada	Ontario
5909629	Brossard	Canada	Quebec
5911592	Burlington	Canada	Ontario
5911606	Burnaby	Canada	British Columbia
5913490	Calgary	Canada	Alberta
5913695	Cambridge	Canada	Ontario
5914132	Campbell River	Canada	British Columbia
5914653	Camrose	Canada	Alberta
5914826	Candiac	Canada	Quebec
5919566	Chambly	Canada	Quebec
5920288	Charlottetown	Canada	Prince Edward Island
5920433	Châteauguay	Canada	Quebec
5921356	Chilliwack	Canada	British Columbia
5924579	Cobourg	Canada	Ontario
5924618	Cochrane	Canada	Alberta
5925975	Collingwood	Canada	Ontario
5926511	Conception Bay South	Canada	Newfoundland and Labrador
5927689	Coquitlam	Canada	British Columbia
5927969	Corner Brook	Canada	Newfoundland and Labrador
5928065	Cornwall	Canada	Ontario
5928488	Côte-Saint-Luc	Canada	Quebec
5930890	Courtenay	Canada	British Columbia
5931800	Cranbrook	Canada	British Columbia
5935277	Dartmouth	Canada	Nova Scotia
5937615	Delta	Canada	British Columbia
5938513	Deux-Montagnes	Canada	Quebec
5939219	Dieppe	Canada	New Brunswick
5940956	Dollard-Des Ormeaux	Canada	Quebec
5941925	Dorval	Canada	Quebec
5942845	Drummondville	Canada	Quebec
5946768	Edmonton	Canada	Alberta
5950267	Etobicoke	Canada	Ontario
5955815	Fort Erie	Canada	Ontario
5955895	Fort McMurray	Canada	Alberta
5955960	Fort St. John	Canada	British Columbia
5957776	Fredericton	Canada	New Brunswick
5959974	Gatineau	Canada	Quebec
5961564	Glace Bay	Canada	Nova Scotia
5964215	Granby	Canada	Quebec
5964347	Grande Prairie	Canada	Alberta
5964700	Greater Sudbury	Canada	Ontario
5965812	Greater Napanee	Canada	Ontario
5967629	Guelph	Canada	Ontario
5969782	Hamilton	Canada	Ontario
5978765	Huntsville	Canada	Ontario
5987650	Joliette	Canada	Quebec
5990579	Kelowna	Canada	British Columbia
5991370	Keswick	Canada	Ontario
5992500	Kingston	Canada	Ontario
5992830	Kirkland	Canada	Quebec
5992996	Kitchener	Canada	Ontario
6049388	Langford	Canada	British Columbia
6049429	Langley	Canada	British Columbia
6049430	Langley	Canada	British Columbia
6049863	La Prairie	Canada	Quebec
6050263	L'Assomption	Canada	Quebec
6050610	Laval	Canada	Quebec
6051562	Leduc	Canada	Alberta
6053154	Lethbridge	Canada	Alberta
6058024	Lloydminster	Canada	Saskatchewan
6058560	London	Canada	Ontario
6059891	Longueuil	Canada	Quebec
6064180	Magog	Canada	Quebec
6066513	Markham	Canada	Ontario
6067494	Mascouche	Canada	Quebec
6071618	Medicine Hat	Canada	Alberta
6073363	Midland	Canada	Ontario
6074377	Milton	Canada	Ontario
6075061	Mirabel	Canada	Quebec
6075081	Miramichi	Canada	New Brunswick
6075357	Mississauga	Canada	Ontario
6076211	Moncton	Canada	New Brunswick
6077243	Montréal	Canada	Quebec
6077315	Mont-Royal	Canada	Quebec
6077340	Mont-Saint-Hilaire	Canada	Quebec
6078112	Moose Jaw	Canada	Saskatchewan
6085772	Nanaimo	Canada	British Columbia
6087579	New Glasgow	Canada	Nova Scotia
6087701	Newmarket	Canada	Ontario
6087844	New Westminster	Canada	British Columbia
625818	Luninyets	Belarus	Brest
6089426	North Bay	Canada	Ontario
6089661	North Cowichan	Canada	British Columbia
6090785	North Vancouver	Canada	British Columbia
6091104	North York	Canada	Ontario
6091919	Oak Bay	Canada	British Columbia
6092122	Oakville	Canada	Ontario
6094201	Orangeville	Canada	Ontario
6094325	Orillia	Canada	Ontario
6094578	Oshawa	Canada	Ontario
6094817	Ottawa	Canada	Ontario
6095645	Owen Sound	Canada	Ontario
6098642	Parksville	Canada	British Columbia
6100832	Pembroke	Canada	Ontario
6101141	Penticton	Canada	British Columbia
6101606	Petawawa	Canada	Ontario
6101645	Peterborough	Canada	Ontario
6104111	Pickering	Canada	Ontario
6105815	Pitt Meadows	Canada	British Columbia
6107325	Pointe-Claire	Canada	Quebec
6111704	Port Colborne	Canada	Ontario
6111962	Port Moody	Canada	British Columbia
6113335	Prince Albert	Canada	Saskatchewan
6113355	Prince Edward	Canada	Ontario
6113365	Prince George	Canada	British Columbia
6115355	Quinte West	Canada	Ontario
6117731	Rayside-Balfour	Canada	Ontario
6118158	Red Deer	Canada	Alberta
6119109	Regina	Canada	Saskatchewan
6119518	Repentigny	Canada	Quebec
6122085	Richmond	Canada	British Columbia
6122091	Richmond Hill	Canada	Ontario
6128577	Rouyn-Noranda	Canada	Quebec
6137270	Saguenay	Canada	Quebec
6137489	Saint-Basile-le-Grand	Canada	Quebec
6137540	Saint-Bruno-de-Montarville	Canada	Quebec
6137633	Saint-Constant	Canada	Quebec
6137781	Sainte-Catherine	Canada	Quebec
6137941	Sainte-Julie	Canada	Quebec
6138175	Saint-Eustache	Canada	Quebec
6138374	Saint-Hyacinthe	Canada	Quebec
6138495	Saint-Jean-sur-Richelieu	Canada	Quebec
6138501	Saint-Jérôme	Canada	Quebec
6138517	Saint John	Canada	New Brunswick
6138610	Saint-Laurent	Canada	Quebec
6138617	Saint-Lazare	Canada	Quebec
6138625	Saint-Léonard	Canada	Quebec
6139289	Salaberry-de-Valleyfield	Canada	Quebec
6139416	Salmon Arm	Canada	British Columbia
6141190	Sarnia	Canada	Ontario
6141256	Saskatoon	Canada	Saskatchewan
6141439	Sault Ste. Marie	Canada	Ontario
6144312	Sept-Îles	Canada	Quebec
6145489	Shawinigan	Canada	Quebec
6146143	Sherbrooke	Canada	Quebec
6151352	Sorel-Tracy	Canada	Quebec
6154383	Spruce Grove	Canada	Alberta
6155033	St. Albert	Canada	Alberta
6155721	St. Catharines	Canada	Ontario
6157977	Stratford	Canada	Ontario
6158357	St. Thomas	Canada	Ontario
6159905	Surrey	Canada	British Columbia
6162949	Terrace	Canada	British Columbia
6163012	Terrebonne	Canada	Quebec
6165719	Thorold	Canada	Ontario
6166142	Thunder Bay	Canada	Ontario
6166739	Timmins	Canada	Ontario
6167865	Toronto	Canada	Ontario
6169141	Trois-Rivières	Canada	Quebec
6169587	Truro	Canada	Nova Scotia
6173017	Val-d'Or	Canada	Quebec
6173508	Varennes	Canada	Quebec
6173570	Vaudreuil-Dorion	Canada	Quebec
6173577	Vaughan	Canada	Ontario
6173864	Vernon	Canada	British Columbia
6174041	Victoria	Canada	British Columbia
6174151	Victoriaville	Canada	Quebec
6176823	Waterloo	Canada	Ontario
6177869	Welland	Canada	Ontario
6178582	West End	Canada	British Columbia
6179226	Westmount	Canada	Quebec
6180550	Whitehorse	Canada	Yukon
6180961	White Rock	Canada	British Columbia
6182962	Windsor	Canada	Ontario
6183235	Winnipeg	Canada	Manitoba
6184365	Woodstock	Canada	Ontario
6185607	Yorkton	Canada	Saskatchewan
6324729	Halifax	Canada	Nova Scotia
6324733	St. John's	Canada	Newfoundland and Labrador
6325494	Québec	Canada	Quebec
6325521	Lévis	Canada	Quebec
6354895	Rimouski	Canada	Quebec
6354897	Rivière-du-Loup	Canada	Quebec
6354908	Sydney	Canada	Nova Scotia
6534203	L'Ancienne-Lorette	Canada	Quebec
6545023	Edmundston	Canada	New Brunswick
6943827	Thetford-Mines	Canada	Quebec
6948711	Scarborough	Canada	Ontario
7280414	Cole Harbour	Canada	Nova Scotia
7281931	Okanagan	Canada	British Columbia
7281936	West Kelowna	Canada	British Columbia
7303786	Jonquière	Canada	Quebec
7535681	Saint-Augustin-de-Desmaures	Canada	Quebec
7602078	Ladner	Canada	British Columbia
7669012	Walnut Grove	Canada	British Columbia
8285452	Ancaster	Canada	Ontario
8533869	West Vancouver	Canada	British Columbia
8558534	Willowdale	Canada	Ontario
10287505	Lower Sacvkille	Canada	Nova Scotia
7304591	West Island	Cocos Islands	N/A
203717	Yangambi	Democratic Republic of the Congo	Eastern Province
204283	Watsa	Democratic Republic of the Congo	Eastern Province
204318	Wamba	Democratic Republic of the Congo	Eastern Province
204405	Uvira	Democratic Republic of the Congo	South Kivu
204953	Tshikapa	Democratic Republic of the Congo	Kasaï-Occidental
6089125	Norfolk County	Canada	Ontario
209228	Mbuji-Mayi	Democratic Republic of the Congo	Kasaï-Oriental
210379	Lusambo	Democratic Republic of the Congo	Kasaï-Oriental
210939	Luebo	Democratic Republic of the Congo	Kasaï-Occidental
211098	Lubao	Democratic Republic of the Congo	Kasaï-Oriental
211647	Lodja	Democratic Republic of the Congo	Kasaï-Oriental
211734	Lisala	Democratic Republic of the Congo	Équateur
212360	Kongolo	Democratic Republic of the Congo	Katanga
212902	Kindu	Democratic Republic of the Congo	Maniema
213940	Kasongo	Democratic Republic of the Congo	Maniema
214481	Kananga	Democratic Republic of the Congo	Kasaï-Occidental
214575	Kampene	Democratic Republic of the Congo	Maniema
214614	Kamina	Democratic Republic of the Congo	Katanga
214974	Kalemie	Democratic Republic of the Congo	Katanga
215527	Kabinda	Democratic Republic of the Congo	Kasaï-Oriental
215605	Kabare	Democratic Republic of the Congo	South Kivu
215668	Kabalo	Democratic Republic of the Congo	Katanga
215771	Isiro	Democratic Republic of the Congo	Eastern Province
215976	Ilebo	Democratic Republic of the Congo	Kasaï-Occidental
216281	Goma	Democratic Republic of the Congo	Nord Kivu
216404	Gbadolite	Democratic Republic of the Congo	Équateur
216449	Gandajika	Democratic Republic of the Congo	Kasaï-Oriental
217389	Demba	Democratic Republic of the Congo	Kasaï-Occidental
217562	Butembo	Democratic Republic of the Congo	Nord Kivu
217570	Buta	Democratic Republic of the Congo	Eastern Province
217637	Businga	Democratic Republic of the Congo	Équateur
217695	Bunia	Democratic Republic of the Congo	Eastern Province
217745	Bumba	Democratic Republic of the Congo	Équateur
217831	Bukavu	Democratic Republic of the Congo	South Kivu
217834	Bukama	Democratic Republic of the Congo	Katanga
218680	Boende	Democratic Republic of the Congo	Équateur
219057	Beni	Democratic Republic of the Congo	Nord Kivu
219414	Basoko	Democratic Republic of the Congo	Eastern Province
220448	Aketi	Democratic Republic of the Congo	Eastern Province
922704	Lubumbashi	Democratic Republic of the Congo	Katanga
922741	Likasi	Democratic Republic of the Congo	Katanga
922773	Kolwezi	Democratic Republic of the Congo	Katanga
922806	Kipushi	Democratic Republic of the Congo	Katanga
923058	Kambove	Democratic Republic of the Congo	Katanga
2311127	Tshela	Democratic Republic of the Congo	Bas-Congo
2311968	Nioki	Democratic Republic of the Congo	Bandundu
2312249	Mushie	Democratic Republic of the Congo	Bandundu
2312888	Mbanza-Ngungu	Democratic Republic of the Congo	Bas-Congo
2312895	Mbandaka	Democratic Republic of the Congo	Équateur
2313002	Matadi	Democratic Republic of the Congo	Bas-Congo
2313084	Mangai	Democratic Republic of the Congo	Bandundu
2313762	Libenge	Democratic Republic of the Congo	Équateur
2314302	Kinshasa	Democratic Republic of the Congo	Kinshasa
2314705	Kikwit	Democratic Republic of the Congo	Bandundu
2315026	Kasongo-Lunda	Democratic Republic of the Congo	Bandundu
2315057	Kasangulu	Democratic Republic of the Congo	Bas-Congo
2279172	Zuénoula	Ivory Coast	Marahoué
2315417	Inongo	Democratic Republic of the Congo	Bandundu
2315728	Gemena	Democratic Republic of the Congo	Équateur
2316748	Bolobo	Democratic Republic of the Congo	Bandundu
2317397	Bandundu	Democratic Republic of the Congo	Bandundu
2593460	Masina	Democratic Republic of the Congo	Kinshasa
237478	Mobaye	Central African Republic	Basse-Kotto
238566	Ippy	Central African Republic	Ouaka
239899	Bria	Central African Republic	Haute-Kotto
240498	Bangassou	Central African Republic	Mbomou
240604	Bambari	Central African Republic	Ouaka
2383119	Sibut	Central African Republic	Kémo
2383523	Paoua	Central African Republic	Ouham-Pendé
2383827	Nola	Central African Republic	Sangha-Mbaéré
2384770	Mbaïki	Central African Republic	Lobaye
2386012	Kaga Bandoro	Central African Republic	Nana-Grébizi
2387435	Damara	Central African Republic	Ombella-Mpoko
2387495	Carnot	Central African Republic	Mambéré-Kadéï
2387546	Bozoum	Central African Republic	Ouham-Pendé
2387926	Bouar	Central African Republic	Nana-Mambéré
2388036	Bossangoa	Central African Republic	Ouham
2388614	Boda	Central African Republic	Lobaye
2388873	Bimbo	Central African Republic	Ombella-Mpoko
2389691	Batangafo	Central African Republic	Ouham
2389853	Bangui	Central African Republic	Bangui
2255285	Sibiti	Republic of the Congo	Lékoumou
2255414	Pointe-Noire	Republic of the Congo	Pointe-Noire
2255542	Owando	Republic of the Congo	Cuvette
2255564	Ouésso	Republic of the Congo	Sangha
2256895	Mossendjo	Republic of the Congo	Niari
2257990	Madingou	Republic of the Congo	Bouenza
2258261	Dolisie	Republic of the Congo	Niari
2258378	Loandjili	Republic of the Congo	Pointe-Noire
2259383	Kayes	Republic of the Congo	Bouenza
2259655	Impfondo	Republic of the Congo	Likouala
2259947	Gamboma	Republic of the Congo	Plateaux
2260535	Brazzaville	Republic of the Congo	Brazzaville
2657896	Zürich	Switzerland	Zurich
2657908	Zug	Switzerland	Zug
2657941	Yverdon-les-Bains	Switzerland	Vaud
2657970	Winterthur	Switzerland	Zurich
2657996	Wil	Switzerland	Saint Gallen
207570	Mwene-Ditu	Democratic Republic of the Congo	Kasaï-Oriental
2658154	Vernier	Switzerland	Geneva
2658216	Uster	Switzerland	Zurich
2658377	Thun	Switzerland	Bern
2658576	Sitten	Switzerland	Valais
2658606	Sierre	Switzerland	Valais
2658656	Zürich (Kreis 11) / Seebach	Switzerland	Zurich
2658761	Schaffhausen	Switzerland	Schaffhausen
2658822	Sankt Gallen	Switzerland	Saint Gallen
2659070	Renens	Switzerland	Vaud
2659099	Rapperswil	Switzerland	Saint Gallen
2659127	Pully	Switzerland	Vaud
2659296	Onex	Switzerland	Geneva
2659297	Olten	Switzerland	Solothurn
2659422	Nyon	Switzerland	Vaud
2659496	Neuchâtel	Switzerland	Neuchâtel
2659522	Muttenz	Switzerland	Basel-Landschaft
2659601	Montreux	Switzerland	Vaud
2659613	Monthey	Switzerland	Valais
2659667	Meyrin	Switzerland	Geneva
2659811	Luzern	Switzerland	Lucerne
2659836	Lugano	Switzerland	Ticino
2659873	Littau	Switzerland	Lucerne
2659977	Le Châtelard	Switzerland	Vaud
2659994	Lausanne	Switzerland	Vaud
2660076	La Chaux-de-Fonds	Switzerland	Neuchâtel
2660104	Kriens	Switzerland	Lucerne
2660108	Kreuzlingen	Switzerland	Thurgau
2660119	Köniz	Switzerland	Bern
2660127	Kloten	Switzerland	Zurich
2660221	Jona	Switzerland	Saint Gallen
2660305	Horgen	Switzerland	Zurich
2660306	Zürich (Kreis 10) / Höngg	Switzerland	Zurich
2660365	Herisau	Switzerland	Appenzell Ausserrhoden
2660512	Grenchen	Switzerland	Solothurn
2660549	Gossau	Switzerland	Saint Gallen
2660646	Genève	Switzerland	Geneva
2660718	Fribourg	Switzerland	Fribourg
2660911	Emmen	Switzerland	Lucerne
2660971	Dübendorf	Switzerland	Zurich
2661015	Dietikon	Switzerland	Zurich
2661169	Chur	Switzerland	Grisons
2661265	Carouge	Switzerland	Geneva
2661513	Biel/Bienne	Switzerland	Bern
2661552	Bern	Switzerland	Bern
2661567	Bellinzona	Switzerland	Ticino
2661604	Basel	Switzerland	Basel-City
2661646	Baden	Switzerland	Aargau
2661653	Baar	Switzerland	Zug
2661666	Zürich (Kreis 4)	Switzerland	Zurich
2661810	Allschwil	Switzerland	Basel-Landschaft
2661861	Adliswil	Switzerland	Zurich
2661881	Aarau	Switzerland	Aargau
3206590	Riehen	Switzerland	Basel-City
6295484	Zürich (Kreis 11) / Affoltern	Switzerland	Zurich
6295495	Zürich (Kreis 2) / Wollishofen	Switzerland	Zurich
6295498	Zürich (Kreis 3) / Sihlfeld	Switzerland	Zurich
6295504	Zürich (Kreis 6) / Unterstrass	Switzerland	Zurich
6295512	Zürich (Kreis 9) / Albisrieden	Switzerland	Zurich
6295513	Zürich (Kreis 9) / Altstetten	Switzerland	Zurich
6295520	Stadt Winterthur (Kreis 1)	Switzerland	Zurich
6295523	Zürich (Kreis 12)	Switzerland	Zurich
6295531	Seen (Kreis 3)	Switzerland	Zurich
6295532	Zürich (Kreis 3)	Switzerland	Zurich
6295533	Zürich (Kreis 11)	Switzerland	Zurich
6295534	Zürich (Kreis 9)	Switzerland	Zurich
6295536	Oberwinterthur (Kreis 2)	Switzerland	Zurich
6295539	Zürich (Kreis 10)	Switzerland	Zurich
6295540	Zürich (Kreis 2)	Switzerland	Zurich
6295542	Zürich (Kreis 8)	Switzerland	Zurich
6295548	Zürich (Kreis 7)	Switzerland	Zurich
6295550	Zürich (Kreis 6)	Switzerland	Zurich
6691640	Lancy	Switzerland	Geneva
2280045	Vavoua	Ivory Coast	Haut-Sassandra
2280316	Toumodi	Ivory Coast	Lacs
2280376	Touba	Ivory Coast	Bafing
2280589	Tengrela	Ivory Coast	Savanes
2280761	Tiassalé	Ivory Coast	Lagunes
2280995	Tanda	Ivory Coast	Zanzan
2281120	Tabou	Ivory Coast	Bas-Sassandra
2281606	Sinfra	Ivory Coast	Zanzan
2281951	Sassandra	Ivory Coast	Bas-Sassandra
2282006	San-Pédro	Ivory Coast	Bas-Sassandra
2282178	Sakassou	Ivory Coast	Vallée du Bandama
2282827	Oumé	Ivory Coast	Fromager
2283016	Odienné	Ivory Coast	Denguélé
2284589	Mankono	Ivory Coast	Worodougou
2284647	Man	Ivory Coast	Dix-Huit Montagnes
2285449	Lakota	Ivory Coast	Sud-Bandama
2286304	Korhogo	Ivory Coast	Savanes
2287790	Issia	Ivory Coast	Haut-Sassandra
2287958	Guiglo	Ivory Coast	Dix-Huit Montagnes
2288115	Grand-Bassam	Ivory Coast	Sud-Comoé
2288118	Affery	Ivory Coast	Lagunes
2288829	Gagnoa	Ivory Coast	Fromager
2289049	Ferkessédougou	Ivory Coast	Savanes
2289549	Duekoué	Ivory Coast	Dix-Huit Montagnes
2289887	Divo	Ivory Coast	Sud-Bandama
2289983	Dimbokro	Ivory Coast	Lacs
2290412	Daoukro	Ivory Coast	Nʼzi-Comoé
2290462	Danané	Ivory Coast	Dix-Huit Montagnes
2290486	Daloa	Ivory Coast	Haut-Sassandra
2290582	Dabou	Ivory Coast	Lagunes
2290836	Boundiali	Ivory Coast	Savanes
2290849	Bouna	Ivory Coast	Zanzan
2290964	Bouaflé	Ivory Coast	Marahoué
2291087	Bonoua	Ivory Coast	Sud-Comoé
2291113	Bongouanou	Ivory Coast	Lacs
2291136	Bondoukou	Ivory Coast	Zanzan
2291580	Bingerville	Ivory Coast	Lagunes
1786455	Yishui	China	Shandong Sheng
2658145	Vevey	Switzerland	Vaud
2292755	Arrah	Ivory Coast	Lacs
2292852	Anyama	Ivory Coast	Lagunes
2293107	Akoupé	Ivory Coast	Lagunes
2293260	Agnibilékrou	Ivory Coast	Moyen-Comoé
2293268	Agboville	Ivory Coast	Agnéby
2293342	Adzopé	Ivory Coast	Lagunes
2293428	Adiaké	Ivory Coast	Sud-Comoé
2293507	Aboisso	Ivory Coast	Sud-Comoé
2293521	Abobo	Ivory Coast	Lagunes
2293538	Abidjan	Ivory Coast	Lagunes
2293549	Abengourou	Ivory Coast	Moyen-Comoé
2596934	Séguéla	Ivory Coast	Worodougou
2598243	Soubré	Ivory Coast	Bas-Sassandra
4035715	Avarua	Cook Islands	N/A
3868121	Viña del Mar	Chile	Valparaíso
3868158	Villarrica	Chile	Araucanía
3868192	Villa Alemana	Chile	Valparaíso
3868326	Victoria	Chile	Araucanía
3868626	Valparaíso	Chile	Valparaíso
3868633	Vallenar	Chile	Atacama
3868707	Valdivia	Chile	Los Ríos
3869657	Tomé	Chile	Biobío
3870011	Temuco	Chile	Araucanía
3870282	Talcahuano	Chile	Biobío
3870294	Talca	Chile	Maule
3870306	Talagante	Chile	Santiago Metropolitan
3871276	San Vicente de Tagua Tagua	Chile	O'Higgins
3871286	San Vicente	Chile	O'Higgins
3871336	Santiago	Chile	Santiago Metropolitan
3871616	Santa Cruz	Chile	O'Higgins
3872154	San Javier	Chile	Maule
3872255	San Felipe	Chile	Valparaíso
3872326	San Carlos	Chile	Biobío
3872395	San Antonio	Chile	Valparaíso
3873145	Río Bueno	Chile	Los Ríos
3873441	Rengo	Chile	O'Higgins
3873775	Rancagua	Chile	O'Higgins
3874096	Quilpué	Chile	Valparaíso
3874119	Quillota	Chile	Valparaíso
3874787	Punta Arenas	Chile	Magallanes
3874930	Puerto Varas	Chile	Los Lagos
3874943	Puerto Quellón	Chile	Los Lagos
3874958	Puerto Natales	Chile	Magallanes
3874960	Puerto Montt	Chile	Los Lagos
3874997	Puerto Aisén	Chile	Aisén
3875024	Puente Alto	Chile	Santiago Metropolitan
3875070	Pucón	Chile	Araucanía
3876664	Penco	Chile	Biobío
3876685	Peñaflor	Chile	Santiago Metropolitan
3877146	Parral	Chile	Maule
3877348	Panguipulli	Chile	Araucanía
3877739	Paine	Chile	Santiago Metropolitan
3877918	Ovalle	Chile	Coquimbo
3877949	Osorno	Chile	Los Lagos
3879123	Nacimiento	Chile	Biobío
3879200	Mulchén	Chile	Biobío
3879627	Molina	Chile	Maule
3880107	Melipilla	Chile	Santiago Metropolitan
3881102	Machalí	Chile	O'Higgins
3881276	Lota	Chile	Biobío
3882428	Los Ángeles	Chile	Biobío
3882434	Los Andes	Chile	Valparaíso
3882582	Loncoche	Chile	Araucanía
3883035	Llaillay	Chile	Valparaíso
3883167	Linares	Chile	Maule
3883214	Limache	Chile	Valparaíso
3883457	Lebu	Chile	Biobío
3883615	Lautaro	Chile	Araucanía
3883629	La Unión	Chile	Los Ríos
3884373	La Serena	Chile	Coquimbo
3885456	La Ligua	Chile	Valparaíso
3885509	La Laja	Chile	Biobío
3887127	Iquique	Chile	Tarapacá
3887344	Illapel	Chile	Coquimbo
3888214	Hacienda La Calera	Chile	Valparaíso
3888749	Graneros	Chile	O'Higgins
3889263	Frutillar	Chile	Los Lagos
3890949	El Monte	Chile	Santiago Metropolitan
3892454	Diego de Almagro	Chile	Atacama
3892870	Curicó	Chile	Maule
3892892	Curanilahue	Chile	Biobío
3893532	Coronel	Chile	Biobío
3893629	Coquimbo	Chile	Coquimbo
3893656	Copiapó	Chile	Atacama
3893726	Constitución	Chile	Maule
3893894	Concepción	Chile	Biobío
3894426	Coihaique	Chile	Aisén
3895061	Chimbarongo	Chile	O'Higgins
3895088	Chillán	Chile	Biobío
3895138	Chiguayante	Chile	Biobío
3895165	Chicureo Abajo	Chile	Santiago Metropolitan
3896105	Cauquenes	Chile	Maule
3896218	Castro	Chile	Los Lagos
3896433	Cartagena	Chile	Valparaíso
3896924	Cañete	Chile	Biobío
3897347	Calama	Chile	Antofagasta
3897557	Cabrero	Chile	Biobío
3897774	Buin	Chile	Santiago Metropolitan
3899462	Arauco	Chile	Biobío
3899539	Antofagasta	Chile	Antofagasta
3899629	Angol	Chile	Araucanía
3899695	Ancud	Chile	Los Lagos
6458708	Las Animas	Chile	Los Lagos
7281017	La Pintana	Chile	Santiago Metropolitan
7281020	Lo Prado	Chile	Santiago Metropolitan
2220957	Yaoundé	Cameroon	Centre
2221030	Yagoua	Cameroon	Far North
2221053	Wum	Cameroon	North-West Province
2221394	Tonga	Cameroon	West
2221504	Tiko	Cameroon	South-West Province
2221530	Tibati	Cameroon	Adamaoua
2221607	Tcholliré	Cameroon	North Province
2222230	Sangmélima	Cameroon	South Province
2222623	Penja	Cameroon	Littoral
2223293	Obala	Cameroon	Centre
2223734	Nkoteng	Cameroon	Centre
2224827	Ngaoundéré	Cameroon	Adamaoua
2225457	Nanga Eboko	Cameroon	Centre
2225726	Muyuka	Cameroon	South-West Province
2291779	Béoumi	Ivory Coast	Vallée du Bandama
2226275	Mokolo	Cameroon	Far North
2227230	Melong	Cameroon	Littoral
2227402	Meïganga	Cameroon	Adamaoua
2227613	Mbouda	Cameroon	West
2228005	Mbanga	Cameroon	Littoral
2228028	Mbandjok	Cameroon	Centre
2228079	Mbalmayo	Cameroon	Centre
2228499	Manjo	Cameroon	Littoral
2228675	Mamfe	Cameroon	South-West Province
2229152	Loum	Cameroon	Littoral
2229267	Lolodorf	Cameroon	South Province
2229681	Lagdo	Cameroon	North Province
2229748	Kumbo	Cameroon	North-West Province
2229752	Kumba	Cameroon	South-West Province
2229761	Kribi	Cameroon	South Province
2229798	Kousséri	Cameroon	Far North
2230599	Kaélé	Cameroon	Far North
2230876	Guider	Cameroon	North Province
2231319	Garoua Boulaï	Cameroon	East
2231320	Garoua	Cameroon	North Province
2231504	Foumbot	Cameroon	West
2231506	Foumban	Cameroon	West
2231564	Fontem	Cameroon	South-West Province
2231881	Eséka	Cameroon	Centre
2232239	Edéa	Cameroon	Littoral
2232283	Ébolowa	Cameroon	South Province
2232444	Dschang	Cameroon	West
2232593	Douala	Cameroon	Littoral
2233410	Buea	Cameroon	South-West Province
2233805	Bogo	Cameroon	Far North
2234359	Bertoua	Cameroon	East
2234536	Bélabo	Cameroon	East
2234663	Batouri	Cameroon	East
2234794	Banyo	Cameroon	Adamaoua
2234865	Bangangté	Cameroon	West
2234941	Bamusso	Cameroon	South-West Province
2234974	Bamenda	Cameroon	North-West Province
2235029	Bali	Cameroon	North-West Province
2235189	Bafoussam	Cameroon	West
2235194	Bafia	Cameroon	Centre
2235196	Bafang	Cameroon	West
2235776	Akonolinga	Cameroon	Centre
1279715	Rikaze	China	Tibet Autonomous Region
1279945	Jiuquan	China	Gansu Sheng
1280037	Shache	China	Xinjiang Uygur Zizhiqu
1280281	Qamdo	China	Tibet Autonomous Region
1280517	Nagqu	China	Tibet Autonomous Region
1280737	Lhasa	China	Tibet Autonomous Region
1280757	Laojunmiao	China	Gansu Sheng
1280849	Kashgar	China	Xinjiang Uygur Zizhiqu
1280957	Jiayuguan	China	Gansu Sheng
1281019	Hotan	China	Xinjiang Uygur Zizhiqu
1281368	Dêqên	China	Tibet Autonomous Region
1529102	Ürümqi	China	Xinjiang Uygur Zizhiqu
1529195	Shihezi	China	Xinjiang Uygur Zizhiqu
1529363	Kuche	China	Xinjiang Uygur Zizhiqu
1529376	Sayibage	China	Xinjiang Uygur Zizhiqu
1529452	Hoxtolgay	China	Xinjiang Uygur Zizhiqu
1529484	Hami	China	Xinjiang Uygur Zizhiqu
1529569	Changji	China	Xinjiang Uygur Zizhiqu
1529626	Baijiantan	China	Xinjiang Uygur Zizhiqu
1529641	Aral	China	Xinjiang Uygur Zizhiqu
1529651	Altay	China	Xinjiang Uygur Zizhiqu
1529660	Yingbazha	China	Xinjiang Uygur Zizhiqu
1783621	Zunyi	China	Guizhou Sheng
1783633	Zoucheng	China	Shandong Sheng
1783683	Yanjiang	China	Sichuan
1783745	Zigong	China	Sichuan
1783763	Zhuzhou	China	Hunan
1783873	Zhumadian	China	Henan Sheng
1783920	Zhujiajiao	China	Shanghai Shi
1783934	Shangqiu	China	Henan Sheng
1783940	Zhuji	China	Zhejiang Sheng
1783988	Mizhou	China	Shandong Sheng
1784055	Zhuanghe	China	Liaoning
1784074	Zhouzhuang	China	Jiangsu
1784178	Zhoucun	China	Shandong Sheng
1784185	Yuxi	China	Yunnan
1784253	Zhongxing	China	Jiangsu
1784310	Zhongshu	China	Yunnan
1784553	Zhicheng	China	Zhejiang Sheng
1784554	Zhicheng	China	Hubei
1784580	Zhenzhou	China	Jiangsu
1784642	Zhenjiang	China	Jiangsu
1784647	Zhaobaoshan	China	Zhejiang Sheng
1784658	Zhengzhou	China	Henan Sheng
1784820	Xinghua	China	Jiangsu
1784841	Zhaotong	China	Yunnan
1784853	Zhaoqing	China	Guangdong
1784929	Zhaogezhuang	China	Hebei
1784990	Zhanjiang	China	Guangdong
1785018	Zhangzhou	China	Fujian
1785036	Zhangye	China	Gansu Sheng
1785286	Zibo	China	Shandong Sheng
1785294	Anyang	China	Henan Sheng
1785453	Zaozhuang	China	Shandong Sheng
1785462	Zaoyang	China	Hubei
1785545	Yuyao	China	Zhejiang Sheng
1785566	Yingchuan	China	Henan Sheng
1785572	Yuxia	China	Shaanxi
1785623	Kunshan	China	Jiangsu
1785655	Yunyang	China	Henan Sheng
1785698	Yunmeng Chengguanzhen	China	Hubei
1785710	Jinghong	China	Yunnan
1785716	Pizhou	China	Jiangsu
1785725	Yunfu	China	Guangdong
1785777	Yulin	China	Shaanxi
1785781	Yulin	China	Guangxi Zhuangzu Zizhiqu
1785964	Yudong	China	Chongqing Shi
1785974	Yuci	China	Shanxi Sheng
1785980	Yucheng	China	Shandong Sheng
1786060	Yuanping	China	Shanxi Sheng
1786067	Qianjiang	China	Hubei
1786112	Heyuan	China	Guangdong
1786357	Yongfeng	China	Hunan
1786378	Yongchuan	China	Chongqing Shi
2228373	Maroua	Cameroon	Far North
2225991	Mora	Cameroon	Far North
1786640	Chengzhong	China	Hubei
1786657	Yinchuan	China	Ningxia Huizu Zizhiqu
1786676	Yima	China	Henan Sheng
1786720	Yigou	China	Henan Sheng
1786731	Qingzhou	China	Shandong Sheng
1786746	Yichun	China	Jiangxi Sheng
1786759	Yicheng	China	Hubei
1786764	Yichang	China	Hubei
1786770	Yibin	China	Sichuan
1786855	Yatou	China	Shandong Sheng
1786867	Yashan	China	Guangxi Zhuangzu Zizhiqu
1787031	Yanzhou	China	Shandong Sheng
1787093	Yantai	China	Shandong Sheng
1787144	Yanliang	China	Shaanxi
1787227	Yangzhou	China	Jiangsu
1787323	Yangshuo	China	Guangxi Zhuangzu Zizhiqu
1787331	Zhangjiagang	China	Jiangsu
1787351	Yangquan	China	Shanxi Sheng
1787437	Yangliuqing	China	Tianjin Shi
1787601	Yanggu	China	Shandong Sheng
1787646	Yangcun	China	Tianjin Shi
1787824	Tongshan	China	Jiangsu
1787837	Xucheng	China	Guangdong
1787858	Shangrao	China	Jiangxi Sheng
1787901	Xunchang	China	Sichuan
1788046	Jiangguanchi	China	Henan Sheng
1788081	Xuanzhou	China	Anhui Sheng
1788206	Xixiang	China	Henan Sheng
1788245	Xiuying	China	Hainan
1788268	Xiulin	China	Hubei
1788402	Xiongzhou	China	Guangdong
1788406	Guixi	China	Jiangxi Sheng
1788450	Xinzhou	China	Shanxi Sheng
1788452	Xinzhou	China	Hubei
1788462	Xinzhi	China	Shanxi Sheng
1788522	Hancheng	China	Henan Sheng
1788534	Xinyang	China	Henan Sheng
1788572	Nangandao	China	Henan Sheng
1788618	Xintai	China	Shandong Sheng
1788638	Xinshi	China	Hubei
1788694	Xinpu	China	Jiangsu
1788816	Xinji	China	Hebei
1788852	Xining	China	Qinghai Sheng
1788869	Shangmei	China	Hunan
1788927	Xingtai	China	Hebei
1789065	Ankang	China	Shaanxi
1789118	Xindian	China	Shandong Sheng
1789137	Xindi	China	Hubei
1789273	Sanshui	China	Guangdong
1789289	Ximei	China	Fujian
1789427	Wacheng	China	Henan Sheng
1789462	Xihe	China	Hubei
1789647	Xichang	China	Sichuan
1789693	Xiazhuang	China	Shandong Sheng
1789703	Xiazhen	China	Shandong Sheng
1789799	Xiashi	China	Zhejiang Sheng
1789897	Zijinglu	China	Henan Sheng
1789945	Xiaoweizhai	China	Guizhou Sheng
1789998	Xiaoshan	China	Zhejiang Sheng
1790100	Xiaolingwei	China	Jiangsu
1790254	Xiaogan	China	Hubei
1790353	Xianyang	China	Shaanxi
1790371	Xiantao	China	Hubei
1790392	Xiannü	China	Jiangsu
1790396	Xianning	China	Hubei
1790413	Xianju	China	Zhejiang Sheng
1790437	Zhuhai	China	Guangdong
1790451	Wenxing	China	Hunan
1790471	Xiangxiang	China	Hunan
1790492	Xiangtan	China	Hunan
1790587	Xiangyang	China	Hubei
1790601	Xiangcheng Chengguanzhen	China	Henan Sheng
1790630	Xi’an	China	Shaanxi
1790645	Xiamen	China	Fujian
1790840	Wuzhou	China	Guangxi Zhuangzu Zizhiqu
1790885	Wuyang	China	Anhui Sheng
1790894	Wuxue	China	Hubei
1790923	Wuxi	China	Jiangsu
1791056	Dongyang	China	Zhejiang Sheng
1791121	Changde	China	Hunan
1791236	Wuhu	China	Anhui Sheng
1791247	Wuhan	China	Hubei
1791325	Wuda	China	Inner Mongolia
1791347	Wucheng	China	Anhui Sheng
1791388	Wenzhou	China	Zhejiang Sheng
1791428	Wenshang	China	Shandong Sheng
1791464	Wenling	China	Zhejiang Sheng
1791536	Tianfu	China	Shandong Sheng
1791636	Weinan	China	Shaanxi
1791673	Weihai	China	Shandong Sheng
1791681	Weifang	China	Shandong Sheng
1791748	Wanxian	China	Chongqing Shi
1791779	Wanning	China	Hainan
1792087	Yinzhu	China	Shandong Sheng
1792260	Wafangdian	China	Liaoning
1792516	Loushanguan	China	Guizhou Sheng
1792520	Tongzhou	China	Beijing
1792585	Fuding	China	Fujian
1792592	Tongren	China	Guizhou Sheng
1792621	Wusong	China	Anhui Sheng
1792692	Tongchuan	China	Sichuan
1792892	Tianshui	China	Gansu Sheng
1792916	Tianpeng	China	Sichuan
1792947	Tianjin	China	Tianjin Shi
1793036	Tengzhou	China	Shandong Sheng
1793089	Taozhuang	China	Shandong Sheng
1793230	Tantou	China	Fujian
1793286	Tangzhai	China	Anhui Sheng
1793346	Tangshan	China	Hebei
1793385	Tangjiazhuang	China	Hebei
1793419	Binhe	China	Henan Sheng
1793424	Tanggu	China	Tianjin Shi
1793505	Taizhou	China	Jiangsu
1793511	Taiyuan	China	Shanxi Sheng
1793533	Taixing	China	Jiangsu
1793700	Taishan	China	Guangdong
1793724	Tai’an	China	Shandong Sheng
1793743	Suzhou	China	Anhui Sheng
1793774	Suozhen	China	Shandong Sheng
1793879	Suizhou	China	Hubei
1793889	Suixi	China	Anhui Sheng
1793899	Suicheng	China	Jiangsu
1793900	Suining	China	Sichuan
1786587	Yingshang Chengguanzhen	China	Anhui Sheng
1794794	Shouguang	China	Shandong Sheng
1794806	Shizuishan	China	Ningxia Huizu Zizhiqu
1794825	Shizilu	China	Shandong Sheng
1794903	Shiyan	China	Hubei
1794904	Shiyan	China	Hubei
1794947	Shiwan	China	Guangdong
1795055	Shiqiao	China	Guangdong
1795060	Shiqi	China	Guangdong
1795166	Shima	China	Fujian
1795184	Shilong	China	Guangdong
1795196	Tongchuan	China	Shaanxi
1795270	Shijiazhuang	China	Hebei
1795579	Yanta	China	Shandong Sheng
1795632	Shenjiamen	China	Zhejiang Sheng
1795816	Shashi	China	Hubei
1795842	Shaping	China	Guangdong
1795855	Shaoxing	China	Zhejiang Sheng
1795857	Shaowu	China	Fujian
1795874	Shaoguan	China	Guangdong
1795919	Shancheng	China	Shandong Sheng
1795928	Shanwei	China	Guangdong
1795940	Shantou	China	Guangdong
1795941	Shanting	China	Shandong Sheng
1796236	Shanghai	China	Shanghai Shi
1796421	Shahecheng	China	Hebei
1796556	Sanya	China	Hainan
1797038	Runing	China	Henan Sheng
1797120	Fuqing	China	Fujian
1797121	Jieyang	China	Guangdong
1797132	Rizhao	China	Shandong Sheng
1797181	Renqiu	China	Hebei
1797264	Quzhou	China	Zhejiang Sheng
1797318	Qujing	China	Yunnan
1797333	Qufu	China	Shandong Sheng
1797353	Quanzhou	China	Fujian
1797417	Wuxi	China	Hunan
1797438	Zhuangyuan	China	Shandong Sheng
1797535	Qiongshan	China	Hainan
1797543	Qionghu	China	Hunan
1797575	Qinnan	China	Jiangsu
1797595	Qinhuangdao	China	Hebei
1797658	Jinjiang	China	Fujian
1797793	Qingquan	China	Hubei
1797873	Huai'an	China	Jiangsu
1797929	Qingdao	China	Shandong Sheng
1797945	Qingyuan	China	Guangdong
1798082	Hongqiao	China	Hunan
1798422	Puyang Chengguanzhen	China	Henan Sheng
1798425	Puyang	China	Zhejiang Sheng
1798449	Putian	China	Fujian
1798473	Puqi	China	Hubei
1798480	Pumiao	China	Guangxi Zhuangzu Zizhiqu
1798490	Pulandian	China	Liaoning
1798548	Poyang	China	Jiangxi Sheng
1798632	Pingyin	China	Shandong Sheng
1798634	Pingyi	China	Shandong Sheng
1798636	Gutao	China	Shanxi Sheng
1798713	Pingshan	China	Guangdong
1798733	Pingnan	China	Guangxi Zhuangzu Zizhiqu
1798760	Pingliang	China	Gansu Sheng
1798821	Pingdu	China	Shandong Sheng
1798827	Pingdingshan	China	Henan Sheng
1798946	Pengcheng	China	Hebei
1798998	Dadukou	China	Sichuan
1799348	Ningyang	China	Shandong Sheng
1799352	Yutan	China	Hunan
1799383	Ninghai	China	Shandong Sheng
1799384	Ninghai	China	Zhejiang Sheng
1799397	Ningbo	China	Zhejiang Sheng
1799491	Neijiang	China	Sichuan
1799552	Nanzhou	China	Hunan
1799629	Nanyang	China	Henan Sheng
1799722	Nantong	China	Jiangsu
1799832	Pucheng	China	Fujian
1799846	Nanping	China	Fujian
1799869	Nanning	China	Guangxi Zhuangzu Zizhiqu
1799897	Nanma	China	Shandong Sheng
1799908	Nanlong	China	Sichuan
1799962	Nanjing	China	Jiangsu
1800065	Nangong	China	Hebei
1800088	Nanfeng	China	Guangdong
1800101	Nandu	China	Guangxi Zhuangzu Zizhiqu
1800107	Nanding	China	Shandong Sheng
1800146	Nanchong	China	Sichuan
1800163	Nanchang	China	Jiangxi Sheng
1800430	Miyang	China	Yunnan
1800498	Mingshui	China	Shandong Sheng
1800519	Mingguang	China	Anhui Sheng
1800521	Minggang	China	Henan Sheng
1800657	Mentougou	China	Beijing
1800675	Mengyin	China	Shandong Sheng
1800764	Mengcheng Chengguanzhen	China	Anhui Sheng
1800779	Meizhou	China	Guangdong
1800829	Wuchuan	China	Guangdong
1801401	Majie	China	Yunnan
1801455	Zhijiang	China	Hubei
1801582	Macheng	China	Hubei
1801615	Maba	China	Guangdong
1801722	Lüshun	China	Liaoning
1801757	Luqiao	China	Zhejiang Sheng
1801792	Luoyang	China	Henan Sheng
1801797	Luoyang	China	Fujian
1801799	Luoyang	China	Guangdong
1801934	Luohe	China	Henan Sheng
1801983	Luocheng	China	Sichuan
1802068	Lucheng	China	Anhui Sheng
1802171	Kangding	China	Sichuan
1802177	Lubu	China	Guangdong
1802204	Luancheng	China	Hebei
1802238	Loudi	China	Hunan
1802476	Longquan	China	Yunnan
1802550	Longgang	China	Shandong Sheng
1802788	Licheng	China	Jiangsu
1802875	Guankou	China	Hunan
1802940	Puning	China	Guangdong
1803245	Lishui	China	Zhejiang Sheng
1803266	Lintong	China	Shaanxi
1803318	Linyi	China	Shandong Sheng
1803334	Linxi	China	Hebei
1803352	Linshui	China	Hebei
1803364	Linqu	China	Shandong Sheng
1803365	Linqiong	China	Sichuan
1794479	Laixi	China	Shandong Sheng
1795565	Shenzhen	China	Guangdong
1803422	Linhai	China	Zhejiang Sheng
1803551	Lingcheng	China	Guangxi Zhuangzu Zizhiqu
1803560	Lincheng	China	Hainan
1803567	Linfen	China	Shanxi Sheng
1803616	Xishan	China	Hunan
1803782	Lichuan	China	Hubei
1803791	Licheng	China	Guangdong
1803834	Liaocheng	China	Shandong Sheng
1803841	Lianzhou	China	Guangdong
1803886	Lianran	China	Yunnan
1803936	Wuwei	China	Gansu Sheng
1803948	Liangxiang	China	Beijing
1804120	Lianjiang	China	Guangdong
1804153	Leshan	China	Sichuan
1804162	Lengshuitan	China	Hunan
1804169	Lengshuijiang	China	Hunan
1804208	Leiyang	China	Hunan
1804252	Lecheng	China	Guangdong
1804386	Laohekou	China	Hubei
1804430	Lanzhou	China	Gansu Sheng
1804442	Lanxi	China	Zhejiang Sheng
1804451	Lianyuan	China	Hunan
1804540	Langfang	China	Hebei
1804578	Weichanglu	China	Shandong Sheng
1804586	Laiyang	China	Shandong Sheng
1804591	Laiwu	China	Shandong Sheng
1804645	Kunyang	China	Zhejiang Sheng
1804651	Kunming	China	Yunnan
1804850	Kaiyuan	China	Yunnan
1804874	Kaihua	China	Yunnan
1804879	Kaifeng	China	Henan Sheng
1804892	Juye	China	Shandong Sheng
1804979	Juegang	China	Jiangsu
1805179	Jiujiang	China	Jiangxi Sheng
1805267	Jishui	China	Henan Sheng
1805270	Qianzhou	China	Hunan
1805298	Jinzhou	China	Liaoning
1805334	Jinxiang	China	Zhejiang Sheng
1805379	Jinshi	China	Hunan
1805408	Jinsha	China	Jiangsu
1805505	Jinjiang	China	Hainan
1805515	Jinji	China	Guangxi Zhuangzu Zizhiqu
1805518	Jining	China	Shandong Sheng
1805528	Jinhua	China	Zhejiang Sheng
1805540	Jingzhou	China	Hubei
1805563	Tianchang	China	Hebei
1805611	Jingmen	China	Hubei
1805680	Jingdezhen	China	Jiangxi Sheng
1805733	Jinchang	China	Gansu Sheng
1805741	Jincheng	China	Shanxi Sheng
1805753	Jinan	China	Shandong Sheng
1805757	Jimo	China	Shandong Sheng
1805798	Jijiang	China	Chongqing Shi
1805833	Jiexiu	China	Shanxi Sheng
1805844	Jieshou	China	Anhui Sheng
1805857	Jieshi	China	Guangdong
1805884	Jiehu	China	Shandong Sheng
1805935	Jiazi	China	Guangdong
1805987	Jiaozuo	China	Henan Sheng
1806096	Jiaozhou	China	Shandong Sheng
1806097	Ningde	China	Fujian
1806167	Jian’ou	China	Fujian
1806218	Jiangyan	China	Jiangsu
1806248	Jianguang	China	Jiangxi Sheng
1806299	Jiangmen	China	Guangdong
1806327	Jiangkou	China	Fujian
1806408	Yangjiang	China	Guangdong
1806445	Ji’an	China	Jiangxi Sheng
1806466	Guangyuan	China	Sichuan
1806535	Huzhou	China	Zhejiang Sheng
1806591	Hutang	China	Jiangsu
1806651	Huoqiu Chengguanzhen	China	Anhui Sheng
1806696	Humen	China	Guangdong
1806776	Huizhou	China	Guangdong
1806840	Huilong	China	Jiangsu
1806881	Huicheng	China	Guangdong
1806960	Huazhou	China	Guangdong
1807112	Huangzhou	China	Hubei
1807143	Huangyan	China	Zhejiang Sheng
1807234	Huangshi	China	Hubei
1807301	Dasha	China	Guangdong
1807308	Huangpi	China	Hubei
1807339	Huangmei	China	Hubei
1807508	Huanggang	China	Guangdong
1807544	Daxing	China	Beijing
1807553	Dingcheng	China	Henan Sheng
1807681	Huainan	China	Anhui Sheng
1807687	Huaicheng	China	Guangdong
1807689	Huaihua	China	Hunan
1807695	Huaidian	China	Henan Sheng
1807700	Huaibei	China	Anhui Sheng
1808106	Hongjiang	China	Hunan
1808198	Heze	China	Shandong Sheng
1808212	Hechuan	China	Chongqing Shi
1808316	Yiyang	China	Hunan
1808336	Hepo	China	Guangdong
1808370	Hengyang	China	Hunan
1808392	Hengshui	China	Hebei
1808722	Hefei	China	Anhui Sheng
1808744	Hede	China	Jiangsu
1808747	Hecun	China	Hebei
1808770	Hebi	China	Henan Sheng
1808857	Hanzhong	China	Shaanxi
1808872	Chengyang	China	Fujian
1808879	Hanting	China	Shandong Sheng
1808926	Hangzhou	China	Zhejiang Sheng
1808931	Hangu	China	Tianjin Shi
1808963	Handan	China	Hebei
1808981	Hancheng	China	Shaanxi
1809003	Haizhou	China	Jiangsu
1809061	Jiaojiang	China	Zhejiang Sheng
1809062	Haimen	China	Guangdong
1809077	Haikou	China	Yunnan
1809078	Haikou	China	Hainan
1809159	Guye	China	Hebei
1809263	Guozhen	China	Shaanxi
1809412	Guli	China	Zhejiang Sheng
1809461	Guiyang	China	Guizhou Sheng
1809483	Guiren	China	Jiangsu
1809498	Guilin	China	Guangxi Zhuangzu Zizhiqu
1809532	Guigang	China	Guangxi Zhuangzu Zizhiqu
1809610	Gucheng Chengguanzhen	China	Hubei
1809858	Guangzhou	China	Guangdong
1803374	Linping	China	Zhejiang Sheng
1810295	Gaozhou	China	Guangdong
1810309	Gaoyou	China	Jiangsu
1810437	Gaoping	China	Sichuan
1810458	Gaomi	China	Shandong Sheng
1810553	Gaogou	China	Jiangsu
1810821	Fuzhou	China	Fujian
1810846	Fuyang	China	Zhejiang Sheng
1810920	Qingyang	China	Shandong Sheng
1810979	Fuling	China	Chongqing Shi
1811103	Foshan	China	Guangdong
1811114	Fenyi	China	Jiangxi Sheng
1811200	Fengxian	China	Jiangsu
1811260	Fengrun	China	Hebei
1811305	Fengkou	China	Hubei
1811440	Feicheng	China	Shandong Sheng
1811542	Fangshan	China	Beijing
1811619	Ezhou	China	Hubei
1811720	Enshi	China	Hubei
1811729	Encheng	China	Guangdong
1811829	Duobao	China	Hubei
1811929	Ducheng	China	Guangdong
1812057	Xinyi	China	Guangdong
1812101	Shengli	China	Shandong Sheng
1812228	Dongtai	China	Jiangsu
1812256	Dongsheng	China	Inner Mongolia
1812427	Dongkan	China	Jiangsu
1812521	Donghai	China	Guangdong
1812545	Dongguan	China	Guangdong
1812597	Dongdu	China	Shandong Sheng
1812621	Dongcun	China	Shandong Sheng
1812728	Dingzhou	China	Hebei
1812955	Dezhou	China	Shandong Sheng
1812961	Deyang	China	Sichuan
1812981	Deqing	China	Zhejiang Sheng
1812988	Dengzhou	China	Shandong Sheng
1812990	Huazhou	China	Henan Sheng
1813016	Songyang	China	Henan Sheng
1813088	Dazhong	China	Jiangsu
1813171	Zhangjiajie	China	Hunan
1813206	Daye	China	Hubei
1813253	Lijiang	China	Yunnan
1813325	Dazhou	China	Sichuan
1813344	Dawukou	China	Ningxia Huizu Zizhiqu
1813451	Datong	China	Anhui Sheng
1813658	Fenghua	China	Zhejiang Sheng
1813775	Daokou	China	Henan Sheng
1813812	Danshui	China	Guangdong
1813828	Danjiangkou	China	Hubei
1813851	Gushu	China	Anhui Sheng
1814082	Daliang	China	Guangdong
1814087	Dalian	China	Liaoning
1814093	Dali	China	Yunnan
1814757	Chuzhou	China	Anhui Sheng
1814786	Yangchun	China	Guangdong
1814870	Yiwu	China	Zhejiang Sheng
1814906	Chongqing	China	Chongqing Shi
1814919	Chonglong	China	Sichuan
1814934	Chizhou	China	Anhui Sheng
1815059	Chenzhou	China	Hunan
1815184	Chengyang	China	Shandong Sheng
1815251	Jiangyin	China	Jiangsu
1815286	Chengdu	China	Sichuan
1815302	Chenghua	China	Guangdong
1815427	Chaohu	China	Anhui Sheng
1815456	Changzhou	China	Jiangsu
1815463	Changzhi	China	Shanxi Sheng
1815577	Changsha	China	Hunan
1815585	Changqing	China	Shandong Sheng
1815656	Changli	China	Hebei
1815667	Changleng	China	Jiangxi Sheng
1816026	Caohe	China	Hubei
1816028	Weining	China	Guizhou Sheng
1816080	Cangzhou	China	Hebei
1816176	Caidian	China	Hubei
1816221	Buhe	China	Hubei
1816234	Bozhou	China	Anhui Sheng
1816256	Botou	China	Hebei
1816269	Baise City	China	Guangxi Zhuangzu Zizhiqu
1816336	Binzhou	China	Shandong Sheng
1816338	Luxu	China	Guangxi Zhuangzu Zizhiqu
1816373	Bijie	China	Guizhou Sheng
1816406	Bianzhuang	China	Shandong Sheng
1816440	Bengbu	China	Anhui Sheng
1816670	Beijing	China	Beijing
1816705	Beihai	China	Guangxi Zhuangzu Zizhiqu
1816751	Beidao	China	Gansu Sheng
1816753	Beidaihehaibin	China	Hebei
1816790	Beibei	China	Chongqing Shi
1816890	Baoying	China	Jiangsu
1816924	Langzhong	China	Sichuan
1816971	Baoding	China	Hebei
1817701	Baihe	China	Guangxi Zhuangzu Zizhiqu
1817720	Shangyu	China	Zhejiang Sheng
1817858	Babu	China	Guangxi Zhuangzu Zizhiqu
1817952	Anxiang	China	Hunan
1817968	Anshun	China	Guizhou Sheng
1817990	Anqiu	China	Shandong Sheng
1817993	Anqing	China	Anhui Sheng
1818004	Mabai	China	Yunnan
1818016	Anlu	China	Hubei
1818051	Anjiang	China	Hunan
1818116	Anbu	China	Guangdong
1885823	Jiangyou	China	Sichuan
1886760	Suzhou	China	Jiangsu
1898359	Mudu	China	Jiangsu
1898494	Songling	China	Jiangsu
1915223	Zhongshan	China	Guangdong
1919014	Lianghu	China	Zhejiang Sheng
1920772	Zhoucheng	China	Shandong Sheng
1921372	Dalianwan	China	Liaoning
1927639	Yueyang	China	Hunan
1929434	Bojia	China	Hunan
2033128	Zhenlai	China	Jilin Sheng
2033135	Zhengjiatun	China	Jilin Sheng
2033147	Zhaozhou	China	Heilongjiang Sheng
2033149	Zhaoyuan	China	Heilongjiang Sheng
2033168	Zhaodong	China	Heilongjiang Sheng
2033196	Zhangjiakou	China	Hebei
2033225	Zalantun	China	Inner Mongolia
2033242	Yushu	China	Jilin Sheng
2033370	Yingkou	China	Liaoning
2033403	Yilan	China	Heilongjiang Sheng
2033413	Yichun	China	Heilongjiang Sheng
1810240	Gejiu	China	Yunnan
2033467	Yanji	China	Jilin Sheng
2033574	Zhangjiakou Shi Xuanhua Qu	China	Hebei
2033602	Xiuyan	China	Liaoning
2033667	Xinqing	China	Heilongjiang Sheng
2033675	Xinmin	China	Liaoning
2033739	Xinglongshan	China	Jilin Sheng
2033766	Xingcheng	China	Liaoning
2033824	Xilin Hot	China	Inner Mongolia
2033866	Xifeng	China	Liaoning
2033934	Xiaoshi	China	Liaoning
2034141	Wuchang	China	Heilongjiang Sheng
2034221	Wangqing	China	Jilin Sheng
2034226	Hepingjie	China	Jilin Sheng
2034228	Wangkui	China	Heilongjiang Sheng
2034312	Ulanhot	China	Inner Mongolia
2034340	Tumen	China	Jilin Sheng
2034439	Tieling	China	Liaoning
2034440	Tieli	China	Heilongjiang Sheng
2034497	Guangming	China	Jilin Sheng
2034599	Tailai	China	Heilongjiang Sheng
2034600	Taikang	China	Heilongjiang Sheng
2034615	Tahe	China	Heilongjiang Sheng
2034638	Sujiatun	China	Liaoning
2034651	Suileng	China	Heilongjiang Sheng
2034655	Suihua	China	Heilongjiang Sheng
2034657	Suifenhe	China	Heilongjiang Sheng
2034691	Songjianghe	China	Jilin Sheng
2034714	Siping	China	Jilin Sheng
2034754	Shunyi	China	Beijing
2034761	Shulan	China	Jilin Sheng
2034791	Shuangyang	China	Jilin Sheng
2034834	Shuangcheng	China	Heilongjiang Sheng
2034918	Shiguai	China	Inner Mongolia
2034937	Shenyang	China	Liaoning
2034995	Shanhetun	China	Heilongjiang Sheng
2034996	Shanhaiguan	China	Hebei
2035002	Shangzhi	China	Heilongjiang Sheng
2035182	Sanchazi	China	Jilin Sheng
2035196	Salaqi	China	Inner Mongolia
2035225	Fendou	China	Heilongjiang Sheng
2035261	Taihe	China	Heilongjiang Sheng
2035265	Qiqihar	China	Heilongjiang Sheng
2035325	Qinggang	China	Heilongjiang Sheng
2035399	Qianguo	China	Jilin Sheng
2035453	Pingzhuang	China	Inner Mongolia
2035511	Panshi	China	Jilin Sheng
2035513	Panshan	China	Liaoning
2035593	Nianzishan	China	Heilongjiang Sheng
2035601	Nenjiang	China	Heilongjiang Sheng
2035610	Nehe	China	Heilongjiang Sheng
2035635	Nantai	China	Liaoning
2035644	Nanpiao	China	Liaoning
2035707	Mujiayingzi	China	Inner Mongolia
2035715	Mudanjiang	China	Heilongjiang Sheng
2035746	Mishan	China	Heilongjiang Sheng
2035754	Mingyue	China	Jilin Sheng
2035758	Mingshui	China	Heilongjiang Sheng
2035801	Meihekou	China	Jilin Sheng
2035836	Manzhouli	China	Inner Mongolia
2035966	Longjing	China	Jilin Sheng
2035970	Longjiang	China	Heilongjiang Sheng
2035980	Longfeng	China	Heilongjiang Sheng
2036033	Liuhe	China	Jilin Sheng
2036055	Lishu	China	Jilin Sheng
2036066	Linkou	China	Heilongjiang Sheng
2036069	Linjiang	China	Jilin Sheng
2036075	Lingyuan	China	Liaoning
2036106	Liaozhong	China	Liaoning
2036109	Liaoyuan	China	Jilin Sheng
2036113	Liaoyang	China	Liaoning
2036226	Lanxi	China	Heilongjiang Sheng
2036237	Langxiang	China	Heilongjiang Sheng
2036241	Langtou	China	Liaoning
2036283	Kuandian	China	Liaoning
2036337	Kaiyuan	China	Liaoning
2036338	Kaitong	China	Jilin Sheng
2036389	Jixi	China	Heilongjiang Sheng
2036401	Jiutai	China	Jilin Sheng
2036403	Jiupu	China	Liaoning
2036418	Jishu	China	Jilin Sheng
2036427	Jinzhou	China	Liaoning
2036434	Lianshan	China	Liaoning
2036458	Jining	China	Inner Mongolia
2036502	Jilin	China	Jilin Sheng
2036536	Minzhu	China	Jilin Sheng
2036581	Jiamusi	China	Heilongjiang Sheng
2036595	Jalai Nur	China	Inner Mongolia
2036597	Jagdaqi	China	Inner Mongolia
2036619	Hushitai	China	Liaoning
2036653	Hunchun	China	Jilin Sheng
2036670	Hulan Ergi	China	Heilongjiang Sheng
2036671	Hulan	China	Heilongjiang Sheng
2036685	Huinan	China	Jilin Sheng
2036713	Huanren	China	Liaoning
2036734	Huangnihe	China	Jilin Sheng
2036753	Huanan	China	Heilongjiang Sheng
2036776	Huadian	China	Jilin Sheng
2036876	Honggang	China	Heilongjiang Sheng
2036892	Hohhot	China	Inner Mongolia
2036933	Helong	China	Jilin Sheng
2036959	Heishan	China	Liaoning
2036973	Heihe	China	Heilongjiang Sheng
2036986	Hegang	China	Heilongjiang Sheng
2037013	Harbin	China	Heilongjiang Sheng
2037069	Hailun	China	Heilongjiang Sheng
2037075	Hailin	China	Heilongjiang Sheng
2037078	Hailar	China	Inner Mongolia
2037086	Haicheng	China	Liaoning
2037222	Gongzhuling	China	Jilin Sheng
2037240	Gongchangling	China	Liaoning
2037252	Genhe	China	Inner Mongolia
2037311	Gannan	China	Heilongjiang Sheng
2037330	Fuyuan	China	Heilongjiang Sheng
2037334	Fuyu	China	Heilongjiang Sheng
2037335	Fuyu	China	Jilin Sheng
2037345	Fuxin	China	Liaoning
2037355	Fushun	China	Liaoning
2033449	Yantongshan	China	Jilin Sheng
2037391	Beichengqu	China	Inner Mongolia
2037393	Fengxiang	China	Heilongjiang Sheng
2037411	Fengcheng	China	Liaoning
2037485	Erenhot	China	Inner Mongolia
2037494	Erdaojiang	China	Jilin Sheng
2037534	Dunhua	China	Jilin Sheng
2037611	Dongning	China	Heilongjiang Sheng
2037620	Dongling	China	Liaoning
2037658	Dongfeng	China	Jilin Sheng
2037685	Dongxing	China	Heilongjiang Sheng
2037712	Dehui	China	Jilin Sheng
2037799	Datong	China	Shanxi Sheng
2037820	Dashitou	China	Jilin Sheng
2037823	Dashiqiao	China	Liaoning
2037860	Daqing	China	Heilongjiang Sheng
2037886	Dandong	China	Liaoning
2037913	Linghai	China	Liaoning
2038067	Chifeng	China	Inner Mongolia
2038080	Chengzihe	China	Heilongjiang Sheng
2038087	Chengde	China	Hebei
2038118	Chaoyang	China	Jilin Sheng
2038120	Chaoyang	China	Liaoning
2038139	Changtu	China	Liaoning
2038154	Changping	China	Beijing
2038158	Changling	China	Jilin Sheng
2038180	Changchun	China	Jilin Sheng
2038198	Chaihe	China	Heilongjiang Sheng
2038274	Boli	China	Heilongjiang Sheng
2038283	Binzhou	China	Heilongjiang Sheng
2038300	Benxi	China	Liaoning
2038342	Beipiao	China	Liaoning
2038421	Bayan	China	Heilongjiang Sheng
2038432	Baotou	China	Inner Mongolia
2038438	Baoshan	China	Heilongjiang Sheng
2038446	Baoqing	China	Heilongjiang Sheng
2038482	Bamiantong	China	Heilongjiang Sheng
2038529	Baishishan	China	Jilin Sheng
2038541	Baiquan	China	Heilongjiang Sheng
2038569	Baicheng	China	Jilin Sheng
2038584	Baishan	China	Jilin Sheng
2038632	Anshan	China	Liaoning
2038650	Anda	China	Heilongjiang Sheng
2038665	Oroqen Zizhiqi	China	Inner Mongolia
2038679	Acheng	China	Heilongjiang Sheng
2047837	Songling	China	Hebei
6825277	Shilin	China	Yunnan
7283386	Changshu City	China	Jiangsu
7303248	Jiashan	China	Zhejiang Sheng
7304020	Fenghuang	China	Hunan
7602670	Zhu Cheng City	China	Shandong Sheng
7910932	Shangri-La	China	Yunnan
8347664	Ordos	China	Inner Mongolia
8505006	Wenshan City	China	Yunnan
8533133	Liupanshui	China	Guizhou Sheng
3665542	Zipaquirá	Colombia	Cundinamarca
3665559	Zarzal	Colombia	Valle del Cauca
3665566	Zaragoza	Colombia	Antioquia
3665657	Yumbo	Colombia	Valle del Cauca
3665688	Yopal	Colombia	Casanare
3665741	Yarumal	Colombia	Antioquia
3665851	Viterbo	Colombia	Caldas
3665900	Villavicencio	Colombia	Meta
3665913	Villa del Rosario	Colombia	Norte de Santander
3665934	Villanueva	Colombia	La Guajira
3665951	Villanueva	Colombia	Casanare
3665973	Villamaría	Colombia	Caldas
3666304	Valledupar	Colombia	Cesar
3666395	Urrao	Colombia	Antioquia
3666519	Ubaté	Colombia	Cundinamarca
3666570	Turbo	Colombia	Antioquia
3666577	Turbaco	Colombia	Bolívar
3666582	Túquerres	Colombia	Nariño
3666608	Tunja	Colombia	Boyacá
3666640	Tumaco	Colombia	Nariño
3666645	Tuluá	Colombia	Valle del Cauca
3666939	Tolú	Colombia	Sucre
3667158	Tierralta	Colombia	Córdoba
3667728	Sucre	Colombia	Sucre
3667820	Sonsón	Colombia	Antioquia
3667849	Soledad	Colombia	Atlántico
3667873	Sogamoso	Colombia	Boyacá
3667887	Socorro	Colombia	Santander
3667905	Soacha	Colombia	Cundinamarca
3667983	Sincelejo	Colombia	Sucre
3667991	Sincé	Colombia	Sucre
3668087	Sibaté	Colombia	Cundinamarca
3668132	Sevilla	Colombia	Valle del Cauca
3668175	Segovia	Colombia	Antioquia
3668323	Santuario	Colombia	Antioquia
3668454	Santa Rosa de Cabal	Colombia	Risaralda
3668572	Santander de Quilichao	Colombia	Cauca
3668605	Santa Marta	Colombia	Magdalena
3668655	Santa Lucía	Colombia	Atlántico
3669218	San Onofre	Colombia	Sucre
3669332	San Martín	Colombia	Meta
3669346	San Marcos	Colombia	Sucre
3669454	San Juan Nepomuceno	Colombia	Bolívar
3669469	San Juan del Cesar	Colombia	La Guajira
3669736	San Jacinto	Colombia	Bolívar
3669808	San Gil	Colombia	Santander
3669997	San Carlos	Colombia	Córdoba
3669998	San Carlos	Colombia	Antioquia
3670038	San Benito Abad	Colombia	Sucre
3670280	Sampués	Colombia	Sucre
3670370	Salamina	Colombia	Caldas
3670419	Sahagún	Colombia	Córdoba
3670475	Sabaneta	Colombia	Antioquia
3670502	Sabanalarga	Colombia	Atlántico
3670513	Sabanagrande	Colombia	Atlántico
3670644	Roldanillo	Colombia	Valle del Cauca
3670719	Riosucio	Colombia	Caldas
3670730	Rionegro	Colombia	Antioquia
3670745	Ríohacha	Colombia	La Guajira
3670874	Repelón	Colombia	Atlántico
3671098	Quimbaya	Colombia	Quindío
3671116	Quibdó	Colombia	Chocó
3671315	Puerto Tejada	Colombia	Cauca
2037375	Fujin	China	Heilongjiang Sheng
3671497	Puerto Colombia	Colombia	Atlántico
3671531	Puerto Boyacá	Colombia	Boyacá
3671540	Puerto Berrío	Colombia	Antioquia
3671549	Puerto Asís	Colombia	Putumayo
3671772	Pradera	Colombia	Valle del Cauca
3671916	Popayán	Colombia	Cauca
3672068	Planeta Rica	Colombia	Córdoba
3672093	Pivijay	Colombia	Magdalena
3672110	Pitalito	Colombia	Huila
3672328	Piedecuesta	Colombia	Santander
3672486	Pereira	Colombia	Risaralda
3672761	Patía	Colombia	Cauca
3672778	Pasto	Colombia	Nariño
3673164	Palmira	Colombia	Valle del Cauca
3673220	Palmar de Varela	Colombia	Atlántico
3673398	Belalcazar	Colombia	Cauca
3673424	Pacho	Colombia	Cundinamarca
3673662	Ocaña	Colombia	Norte de Santander
3673899	Neiva	Colombia	Huila
3674292	Mosquera	Colombia	Cundinamarca
3674412	Morales	Colombia	Bolívar
3674453	Montería	Colombia	Córdoba
3674463	Montenegro	Colombia	Quindío
3674470	Montelíbano	Colombia	Córdoba
3674597	Mompós	Colombia	Bolívar
3674654	Mocoa	Colombia	Putumayo
3674885	Melgar	Colombia	Tolima
3674962	Medellín	Colombia	Antioquia
3675252	Mariquita	Colombia	Tolima
3675263	Marinilla	Colombia	Antioquia
3675287	María la Baja	Colombia	Bolívar
3675409	Manzanares	Colombia	Caldas
3675443	Manizales	Colombia	Caldas
3675595	Malambo	Colombia	Atlántico
3675605	Málaga	Colombia	Santander
3675692	Magangué	Colombia	Bolívar
3675707	Madrid	Colombia	Cundinamarca
3675975	Los Patios	Colombia	Norte de Santander
3676397	Lorica	Colombia	Córdoba
3676604	Líbano	Colombia	Tolima
3676623	Leticia	Colombia	Amazonas
3676626	Lérida	Colombia	Tolima
3676720	La Virginia	Colombia	Risaralda
3676928	La Unión	Colombia	Valle del Cauca
3676934	La Unión	Colombia	Nariño
3677010	La Tebaida	Colombia	Quindío
3678097	La Plata	Colombia	Huila
3678674	La Jagua de Ibirico	Colombia	Cesar
3679065	La Estrella	Colombia	Antioquia
3679277	La Dorada	Colombia	Caldas
3679554	La Ceja	Colombia	Antioquia
3680387	Jamundí	Colombia	Valle del Cauca
3680450	Itagüí	Colombia	Antioquia
3680539	Ipiales	Colombia	Nariño
3680656	Ibagué	Colombia	Tolima
3680840	Honda	Colombia	Tolima
3681797	Guacarí	Colombia	Valle del Cauca
3681957	Granada	Colombia	Meta
3682018	Girón	Colombia	Santander
3682028	Girardot City	Colombia	Cundinamarca
3682108	Garzón	Colombia	Huila
3682238	Galapa	Colombia	Atlántico
3682274	Fusagasuga	Colombia	Cundinamarca
3682281	Funza	Colombia	Cundinamarca
3682330	Fresno	Colombia	Tolima
3682374	Fonseca	Colombia	La Guajira
3682385	Floridablanca	Colombia	Santander
3682393	Florida	Colombia	Valle del Cauca
3682426	Florencia	Colombia	Caquetá
3682458	Flandes	Colombia	Tolima
3682516	Facatativá	Colombia	Cundinamarca
3682573	Espinal	Colombia	Tolima
3682631	Envigado	Colombia	Antioquia
3683233	El Retén	Colombia	Magdalena
3684452	El Copey	Colombia	Cesar
3684579	El Charco	Colombia	Nariño
3684615	El Cerrito	Colombia	Valle del Cauca
3684917	El Banco	Colombia	Magdalena
3684945	El Bagre	Colombia	Antioquia
3685084	Duitama	Colombia	Boyacá
3685095	Dos Quebradas	Colombia	Risaralda
3685335	Curumaní	Colombia	Cesar
3685533	Cúcuta	Colombia	Norte de Santander
3685823	Corozal	Colombia	Sucre
3685871	Corinto	Colombia	Cauca
3685949	Municipio de Copacabana	Colombia	Antioquia
3686233	Circasia	Colombia	Quindío
3686272	Ciénaga de Oro	Colombia	Córdoba
3686279	Ciénaga	Colombia	Magdalena
3686479	Chiriguaná	Colombia	Cesar
3686513	Chiquinquirá	Colombia	Boyacá
3686540	Chinú	Colombia	Córdoba
3686561	Chinchiná	Colombia	Caldas
3686585	Chimichagua	Colombia	Cesar
3686636	Chigorodó	Colombia	Antioquia
3686675	Chía	Colombia	Cundinamarca
3686793	Chaparral	Colombia	Tolima
3686922	Cereté	Colombia	Córdoba
3687025	Caucasia	Colombia	Antioquia
3687238	Cartagena	Colombia	Bolívar
3687318	Carmen de Viboral	Colombia	Antioquia
3687644	Candelaria	Colombia	Valle del Cauca
3687758	Campo de la Cruz	Colombia	Atlántico
3687806	Campoalegre	Colombia	Huila
3687925	Cali	Colombia	Valle del Cauca
3687952	Caldas	Colombia	Antioquia
3687964	Calarcá	Colombia	Quindío
3688006	Cajicá	Colombia	Cundinamarca
3688071	Caicedonia	Colombia	Valle del Cauca
3688256	Buga	Colombia	Valle del Cauca
3688451	Buenaventura	Colombia	Valle del Cauca
3688465	Bucaramanga	Colombia	Santander
3688689	Bogotá	Colombia	Bogota D.C.
3688928	Bello	Colombia	Antioquia
3688989	Belén de Umbría	Colombia	Risaralda
3689147	Barranquilla	Colombia	Atlántico
3689162	Barrancas	Colombia	La Guajira
3671418	Puerto López	Colombia	Meta
3689206	Barbosa	Colombia	Santander
3689235	Baranoa	Colombia	Atlántico
3689381	Ayapel	Colombia	Córdoba
3689560	Armenia	Colombia	Quindío
3689570	Arjona	Colombia	Bolívar
3689589	Ariguaní	Colombia	Cesar
3689718	Arauca	Colombia	Arauca
3689759	Aracataca	Colombia	Magdalena
3689798	Apartadó	Colombia	Antioquia
3689833	Anserma	Colombia	Risaralda
3689899	Andes	Colombia	Antioquia
3689905	Andalucía	Colombia	Valle del Cauca
3690316	Aguazul	Colombia	Casanare
3690431	Aguadas	Colombia	Caldas
3690577	Acacías	Colombia	Meta
3770718	Morales	Colombia	Cauca
3792375	Carepa	Colombia	Antioquia
3792376	Ciudad Bolívar	Colombia	Antioquia
3792383	Agustín Codazzi	Colombia	Cesar
3792392	Plato	Colombia	Magdalena
3828545	San José del Guaviare	Colombia	Guaviare
3621184	Turrialba	Costa Rica	Cartago
3621335	Tejar	Costa Rica	San José
3621440	Siquirres	Costa Rica	Limón
3621505	San Vicente	Costa Rica	San José
3621659	San Rafael Abajo	Costa Rica	San José
3621687	San Rafael	Costa Rica	Alajuela
3621689	San Rafael	Costa Rica	San José
3621717	San Pedro	Costa Rica	San José
3621729	San Pablo	Costa Rica	Heredia
3621753	San Miguel	Costa Rica	San José
3621804	San Juan de Dios	Costa Rica	San José
3621819	San Juan	Costa Rica	San José
3621841	San José	Costa Rica	Alajuela
3621849	San José	Costa Rica	San José
3621889	San Isidro	Costa Rica	San José
3621911	San Francisco	Costa Rica	Heredia
3621922	San Felipe	Costa Rica	San José
3621926	San Diego	Costa Rica	Cartago
3622190	Quesada	Costa Rica	Alajuela
3622217	Purral	Costa Rica	San José
3622228	Puntarenas	Costa Rica	Puntarenas
3622247	Limón	Costa Rica	Limón
3622507	Patarrá	Costa Rica	San José
3622547	Paraíso	Costa Rica	Cartago
3622881	Mercedes	Costa Rica	Heredia
3623076	Liberia	Costa Rica	Guanacaste
3623394	Ipís	Costa Rica	San José
3623486	Heredia	Costa Rica	Heredia
3623580	Guápiles	Costa Rica	Limón
3623593	Guadalupe	Costa Rica	San José
3623781	Esparza	Costa Rica	Puntarenas
3623977	Curridabat	Costa Rica	San José
3624174	Colima	Costa Rica	San José
3624288	Chacarita	Costa Rica	Puntarenas
3624370	Cartago	Costa Rica	Cartago
3624468	Cañas	Costa Rica	Guanacaste
3624509	Calle Blancos	Costa Rica	San José
3624848	Aserrí	Costa Rica	San José
3624955	Alajuela	Costa Rica	Alajuela
3533753	Yara	Cuba	Granma
3533826	Yaguajay	Cuba	Sancti Spíritus
3534094	Viñales	Cuba	Pinar del Río
3534363	Vertientes	Cuba	Camagüey
3534432	Venezuela	Cuba	Ciego de Ávila
3534632	Varadero	Cuba	Matanzas
3534749	San Germán	Cuba	Holguín
3534761	Unión de Reyes	Cuba	Matanzas
3534915	Trinidad	Cuba	Sancti Spíritus
3536259	Sibanicú	Cuba	Camagüey
3536640	Santo Domingo	Cuba	Villa Clara
3536724	Santiago de las Vegas	Cuba	La Habana
3536729	Santiago de Cuba	Cuba	Santiago de Cuba
3537840	Santa Cruz del Sur	Cuba	Camagüey
3537845	Santa Cruz del Norte	Cuba	Mayabeque
3537906	Santa Clara	Cuba	Villa Clara
3539093	San Luis	Cuba	Santiago de Cuba
3539560	San José de las Lajas	Cuba	Mayabeque
3540667	Sancti Spíritus	Cuba	Sancti Spíritus
3540680	San Cristobal	Cuba	Artemisa
3540885	San Antonio de los Baños	Cuba	Artemisa
3541440	Sagua la Grande	Cuba	Villa Clara
3541446	Sagua de Tánamo	Cuba	Holguín
3541999	Rodas	Cuba	Cienfuegos
3542137	Río Guayabal de Yateras	Cuba	Guantánamo
3542167	Río Cauto	Cuba	Granma
3542455	Remedios	Cuba	Villa Clara
3542502	Regla	Cuba	La Habana
3542744	Ranchuelo	Cuba	Villa Clara
3543299	Puerto Padre	Cuba	Las Tunas
3543498	Primero de Enero	Cuba	Ciego de Ávila
3543961	Placetas	Cuba	Villa Clara
3544091	Pinar del Río	Cuba	Pinar del Río
3544393	Perico	Cuba	Matanzas
3544607	Pedro Betancourt	Cuba	Matanzas
3545040	Palmira	Cuba	Cienfuegos
3545841	Nuevitas	Cuba	Camagüey
3545867	Nueva Gerona	Cuba	Isla de la Juventud
3545981	Niquero	Cuba	Granma
3546434	Morón	Cuba	Ciego de Ávila
3546791	Moa	Cuba	Holguín
3546882	Minas de Matahambre	Cuba	Pinar del Río
3546894	Minas	Cuba	Camagüey
3547260	Media Luna	Cuba	Granma
3547398	Matanzas	Cuba	Matanzas
3547600	Mariel	Cuba	Artemisa
3547867	Manzanillo	Cuba	Granma
3547976	Manicaragua	Cuba	Villa Clara
3548441	Maisí	Cuba	Guantánamo
3548529	Madruga	Cuba	Mayabeque
3548993	Los Palacios	Cuba	Pinar del Río
3550598	Las Tunas	Cuba	Las Tunas
3551608	La Salud	Cuba	Mayabeque
3553478	Havana	Cuba	La Habana
3555907	Jovellanos	Cuba	Matanzas
3556077	Jobabo	Cuba	Holguín
3689205	Barbosa	Colombia	Antioquia
3556268	Jesús Menéndez	Cuba	Las Tunas
3556334	Jatibonico	Cuba	Sancti Spíritus
3556351	Jaruco	Cuba	Mayabeque
3556969	Holguín	Cuba	Holguín
3557332	Guisa	Cuba	Granma
3557347	Güira de Melena	Cuba	Artemisa
3557378	Güines	Cuba	Mayabeque
3557689	Guantánamo	Cuba	Guantánamo
3557758	Guane	Cuba	Pinar del Río
3557801	Guanajay	Cuba	Artemisa
3557846	Guanabacoa	Cuba	La Habana
3557923	Guáimaro	Cuba	Camagüey
3558315	Gibara	Cuba	Holguín
3558744	Fomento	Cuba	Sancti Spíritus
3558771	Florida	Cuba	Camagüey
3558792	Florencia	Cuba	Ciego de Ávila
3559318	Esmeralda	Cuba	Camagüey
3559416	Encrucijada	Cuba	Villa Clara
3562827	Cumanayagua	Cuba	Cienfuegos
3562895	Cueto	Cuba	Holguín
3563317	Corralillo	Cuba	Villa Clara
3563504	Contramaestre	Cuba	Santiago de Cuba
3563559	Consolación del Sur	Cuba	Pinar del Río
3563609	Condado	Cuba	Sancti Spíritus
3563843	Colón	Cuba	Matanzas
3563856	Colombia	Cuba	Las Tunas
3564084	Ciro Redondo	Cuba	Ciego de Ávila
3564114	Cifuentes	Cuba	Villa Clara
3564124	Cienfuegos	Cuba	Cienfuegos
3564178	Ciego de Ávila	Cuba	Ciego de Ávila
3564394	Chambas	Cuba	Ciego de Ávila
3564436	Cerro	Cuba	La Habana
3564885	Cauto Cristo	Cuba	Granma
3565432	Cárdenas	Cuba	Matanzas
3566054	Camajuaní	Cuba	Villa Clara
3566067	Camagüey	Cuba	Camagüey
3566134	Calimete	Cuba	Matanzas
3566356	Caibarién	Cuba	Villa Clara
3566429	Cacocum	Cuba	Holguín
3566603	Cabaiguán	Cuba	Sancti Spíritus
3567546	Bejucal	Cuba	Mayabeque
3567597	Bayamo	Cuba	Granma
3567612	Bauta	Cuba	Artemisa
3567669	Bartolomé Masó	Cuba	Granma
3567823	Baraguá	Cuba	Ciego de Ávila
3567834	Baracoa	Cuba	Guantánamo
3567869	Banes	Cuba	Holguín
3567995	Bahía Honda	Cuba	Artemisa
3568342	Arroyo Naranjo	Cuba	La Habana
3569024	Amancio	Cuba	Las Tunas
3569136	Alquízar	Cuba	Artemisa
3569370	Alamar	Cuba	La Habana
3569546	Aguada de Pasajeros	Cuba	Cienfuegos
3569741	Abreus	Cuba	Cienfuegos
3746181	Habana del Este	Cuba	La Habana
3746183	Centro Habana	Cuba	La Habana
3746184	La Habana Vieja	Cuba	La Habana
3746938	Báguanos	Cuba	Holguín
3754915	Jimaguayú	Cuba	Camagüey
6956646	Arroyo Naranjo	Cuba	La Habana
6956647	Boyeros	Cuba	La Habana
3374218	Santa Maria	Cape Verde	Sal
3374333	Praia	Cape Verde	Praia
3374462	Mindelo	Cape Verde	São Vicente
3513090	Willemstad	Curacao	N/A
2078127	Flying Fish Cove	Christmas Island	N/A
18918	Protaras	Cyprus	Ammochostos
146214	Paphos	Cyprus	Pafos
146268	Nicosia	Cyprus	Lefkosia
146384	Limassol	Cyprus	Limassol
146400	Larnaca	Cyprus	Larnaka
146412	Kyrenia	Cyprus	Keryneia
146617	Famagusta	Cyprus	Ammochostos
3556168	Jiguaní	Cuba	Granma
3061284	Dvůr Králové nad Labem	Czech Republic	Královéhradecký
3061344	Znojmo	Czech Republic	South Moravian
3061370	Zlín	Czech Republic	Zlín
3061692	Žďár nad Sázavou Druhy	Czech Republic	Vysočina
3061695	Žďár nad Sázavou	Czech Republic	Vysočina
3061822	Žatec	Czech Republic	Ústecký
3062283	Vyškov	Czech Republic	South Moravian
3062339	Vsetín	Czech Republic	Zlín
3063375	Varnsdorf	Czech Republic	Ústecký
3063447	Valašské Meziříčí	Czech Republic	Zlín
3063546	Ústí nad Orlicí	Czech Republic	Pardubický
3063548	Ústí nad Labem	Czech Republic	Ústecký
3063736	Uherský Brod	Czech Republic	Zlín
3063739	Uherské Hradiště	Czech Republic	Zlín
3063907	Trutnov	Czech Republic	Královéhradecký
3064000	Třinec	Czech Republic	Moravskoslezský
3064104	Třebíč	Czech Republic	Vysočina
3064288	Teplice	Czech Republic	Ústecký
3064379	Tábor	Czech Republic	Jihočeský
3064454	Svitavy	Czech Republic	Pardubický
3064673	Šumperk	Czech Republic	Olomoucký
3065281	Starý Bohumín	Czech Republic	Moravskoslezský
3065617	Sokolov	Czech Republic	Karlovarský
3065903	Slaný	Czech Republic	Central Bohemia
3066651	Rožnov pod Radhoštěm	Czech Republic	Zlín
3067051	Rakovník	Czech Republic	Central Bohemia
3067421	Prostějov	Czech Republic	Olomoucký
3067433	Prosek	Czech Republic	Praha
3067542	Příbram	Czech Republic	Central Bohemia
3067580	Přerov	Czech Republic	Olomoucký
3067696	Prague	Czech Republic	Praha
3068160	Pilsen	Czech Republic	Plzeňský
3068293	Písek	Czech Republic	Jihočeský
3068445	Pelhřimov	Czech Republic	Vysočina
3068582	Pardubice	Czech Republic	Pardubický
3068689	Otrokovice	Czech Republic	Zlín
3068690	Otrokovice	Czech Republic	Zlín
3068766	Ostrov	Czech Republic	Karlovarský
3068799	Ostrava	Czech Republic	Moravskoslezský
3068927	Opava	Czech Republic	Moravskoslezský
3069844	Neratovice	Czech Republic	Central Bohemia
3070122	Náchod	Czech Republic	Královéhradecký
3070291	Most	Czech Republic	Ústecký
3070420	Modřany	Czech Republic	Praha
3070544	Mladá Boleslav	Czech Republic	Central Bohemia
3070862	Mělník	Czech Republic	Central Bohemia
3071507	Louny	Czech Republic	Ústecký
3071665	Litvínov	Czech Republic	Ústecký
3071677	Litoměřice	Czech Republic	Ústecký
3071961	Liberec	Czech Republic	Liberecký
3071966	Libeň	Czech Republic	Praha
3072137	Letňany	Czech Republic	Praha
3072463	Kutná Hora	Czech Republic	Central Bohemia
3072649	Kroměříž	Czech Republic	Zlín
3072656	Krnov	Czech Republic	Moravskoslezský
3072929	Kralupy nad Vltavou	Czech Republic	Central Bohemia
3073254	Kopřivnice	Czech Republic	Moravskoslezský
3073371	Kolín	Czech Republic	Central Bohemia
3073660	Klatovy	Czech Republic	Plzeňský
3073699	Kladno	Czech Republic	Central Bohemia
3073789	Karviná	Czech Republic	Moravskoslezský
3073803	Karlovy Vary	Czech Republic	Karlovarský
3074020	Kadaň	Czech Republic	Ústecký
3074039	Kadaň	Czech Republic	Ústecký
3074110	Jirkov	Czech Republic	Ústecký
3074149	Jindřichův Hradec	Czech Republic	Jihočeský
3074199	Jihlava	Czech Republic	Vysočina
3074204	Jičín	Czech Republic	Královéhradecký
3074603	Jablonec nad Nisou	Czech Republic	Liberecký
3074893	Hranice	Czech Republic	Olomoucký
3074967	Hradec Králové	Czech Republic	Královéhradecký
3075654	Hodonín	Czech Republic	South Moravian
3075919	Havlíčkův Brod	Czech Republic	Vysočina
3075921	Havířov	Czech Republic	Moravskoslezský
3076127	Frýdek-Místek	Czech Republic	Moravskoslezský
3077244	Děčín	Czech Republic	Ústecký
3077539	Chrudim	Czech Republic	Pardubický
3077685	Chomutov	Czech Republic	Ústecký
3077835	Cheb	Czech Republic	Karlovarský
3077916	České Budějovice	Czech Republic	Jihočeský
3077920	Česká Třebová	Czech Republic	Pardubický
3077929	Česká Lípa	Czech Republic	Liberecký
3078545	Bruntál	Czech Republic	Moravskoslezský
3078610	Brno	Czech Republic	South Moravian
3078773	Břeclav	Czech Republic	South Moravian
3078833	Braník	Czech Republic	Praha
3078837	Brandýs nad Labem-Stará Boleslav	Czech Republic	Central Bohemia
3079129	Bohumín	Czech Republic	Moravskoslezský
3079273	Blansko	Czech Republic	South Moravian
3079346	Bílina Kyselka	Czech Republic	Ústecký
3079348	Bílina	Czech Republic	Ústecký
3079467	Beroun	Czech Republic	Central Bohemia
3079508	Benešov	Czech Republic	Central Bohemia
6269470	Černý Most	Czech Republic	Praha
2803560	Zwickau	Germany	Saxony
2803620	Zweibrücken	Germany	Rheinland-Pfalz
2803723	Zulpich	Germany	North Rhine-Westphalia
2803870	Zossen	Germany	Brandenburg
2804008	Zittau	Germany	Saxony
2804034	Zirndorf	Germany	Bavaria
2804922	Zeitz	Germany	Saxony-Anhalt
2805059	Zehlendorf	Germany	Berlin
2805385	Xanten	Germany	North Rhine-Westphalia
2805597	Wurzen	Germany	Saxony
2805615	Würzburg	Germany	Bavaria
2805644	Würselen	Germany	North Rhine-Westphalia
2805753	Wuppertal	Germany	North Rhine-Westphalia
2805761	Wunstorf	Germany	Lower Saxony
2805910	Wülfrath	Germany	North Rhine-Westphalia
2806081	Wörth am Rhein	Germany	Rheinland-Pfalz
2806142	Worms	Germany	Rheinland-Pfalz
2806654	Wolfsburg	Germany	Lower Saxony
2806768	Wolfratshausen	Germany	Bavaria
2806914	Wolfenbüttel	Germany	Lower Saxony
2806919	Wolfen	Germany	Saxony-Anhalt
2807184	Witzenhausen	Germany	Hesse
2807218	Wittmund	Germany	Lower Saxony
2807240	Wittlich	Germany	Rheinland-Pfalz
2807344	Wittenberge	Germany	Brandenburg
2807360	Wittenau	Germany	Berlin
2807363	Witten	Germany	North Rhine-Westphalia
2807465	Wismar	Germany	Mecklenburg-Vorpommern
2807594	Wipperfürth	Germany	North Rhine-Westphalia
2807748	Winterhude	Germany	Hamburg
2807845	Winsen	Germany	Lower Saxony
2807872	Winnenden	Germany	Baden-Württemberg
2808461	Wilnsdorf	Germany	North Rhine-Westphalia
2808473	Wilmersdorf	Germany	Berlin
2808559	Willich	Germany	North Rhine-Westphalia
2808662	Wilhelmstadt	Germany	Berlin
2808720	Wilhelmshaven	Germany	Lower Saxony
2808893	Wildeshausen	Germany	Lower Saxony
2809346	Wiesbaden	Germany	Hesse
2809517	Wiehl	Germany	North Rhine-Westphalia
2809889	Wetzlar	Germany	Hesse
2809984	Wetter (Ruhr)	Germany	North Rhine-Westphalia
2810188	Westerstede	Germany	Lower Saxony
2810538	Westend	Germany	Berlin
2810612	Wesseling	Germany	North Rhine-Westphalia
2810678	Wesel	Germany	North Rhine-Westphalia
2810716	Wertheim	Germany	Baden-Württemberg
2810808	Wernigerode	Germany	Saxony-Anhalt
2810833	Werne	Germany	North Rhine-Westphalia
2810855	Wermelskirchen	Germany	North Rhine-Westphalia
2810878	Werl	Germany	North Rhine-Westphalia
2810919	Werdohl	Germany	North Rhine-Westphalia
2810945	Werder	Germany	Brandenburg
2811278	Wenden	Germany	North Rhine-Westphalia
2811292	Wendelstein	Germany	Bavaria
2811644	Weiterstadt	Germany	Hesse
2811698	Weißwasser	Germany	Saxony
2811899	Weißenfels	Germany	Saxony-Anhalt
2811909	Weißenburg in Bayern	Germany	Bavaria
2812145	Weinstadt-Endersbach	Germany	Baden-Württemberg
2812174	Weinheim	Germany	Baden-Württemberg
2812204	Weingarten	Germany	Baden-Württemberg
2812482	Weimar	Germany	Thuringia
2812515	Weilheim	Germany	Bavaria
2812522	Weilerswist	Germany	North Rhine-Westphalia
2812625	Weil der Stadt	Germany	Baden-Württemberg
2812636	Weil am Rhein	Germany	Baden-Württemberg
2813040	Weiden	Germany	Bavaria
2813187	Weißensee	Germany	Berlin
2813390	Wegberg	Germany	North Rhine-Westphalia
2813433	Weener	Germany	Lower Saxony
2813464	Wedel	Germany	Schleswig-Holstein
2813472	Wedding	Germany	Berlin
2814005	Warstein	Germany	North Rhine-Westphalia
2814127	Warendorf	Germany	North Rhine-Westphalia
2814131	Waren	Germany	Mecklenburg-Vorpommern
2814146	Wardenburg	Germany	Lower Saxony
2814153	Warburg	Germany	North Rhine-Westphalia
2814270	Wangen im Allgäu	Germany	Baden-Württemberg
2814305	Wandlitz	Germany	Brandenburg
2814362	Waltrop	Germany	North Rhine-Westphalia
2814462	Walsrode	Germany	Lower Saxony
2814632	Wallenhorst	Germany	Lower Saxony
2814791	Waldshut-Tiengen	Germany	Baden-Württemberg
2814874	Waldkraiburg	Germany	Bavaria
2814883	Waldkirch	Germany	Baden-Württemberg
2815137	Waldbröl	Germany	North Rhine-Westphalia
2815330	Waiblingen	Germany	Baden-Württemberg
2815487	Waghäusel	Germany	Baden-Württemberg
2815559	Wadgassen	Germany	Saarland
2815565	Wadern	Germany	Saarland
2815824	Vreden	Germany	North Rhine-Westphalia
2816630	Völklingen	Germany	Saarland
2817065	Voerde	Germany	North Rhine-Westphalia
2817105	Vlotho	Germany	North Rhine-Westphalia
2817202	Vilshofen	Germany	Bavaria
2817220	Villingen-Schwenningen	Germany	Baden-Württemberg
2817311	Viersen	Germany	North Rhine-Westphalia
2817324	Viernheim	Germany	Hesse
2817537	Versmold	Germany	North Rhine-Westphalia
2817576	Verl	Germany	North Rhine-Westphalia
2817599	Verden	Germany	Lower Saxony
2817724	Velbert	Germany	North Rhine-Westphalia
2817812	Vechta	Germany	Lower Saxony
2817813	Vechelde	Germany	Lower Saxony
2817818	Vaterstetten	Germany	Bavaria
2817873	Varel	Germany	Lower Saxony
2818067	Uetersen	Germany	Schleswig-Holstein
2818094	Uslar	Germany	Lower Saxony
2818766	Unterschleißheim	Germany	Bavaria
2819465	Unterhaching	Germany	Bavaria
2819974	Unterkrozingen	Germany	Baden-Württemberg
2820087	Unna	Germany	North Rhine-Westphalia
2820256	Ulm	Germany	Baden-Württemberg
2820456	Uelzen	Germany	Lower Saxony
2820577	Überlingen	Germany	Baden-Württemberg
2820621	Übach-Palenberg	Germany	North Rhine-Westphalia
2820693	Tuttlingen	Germany	Baden-Württemberg
2820860	Tübingen	Germany	Baden-Württemberg
2820973	Trossingen	Germany	Baden-Württemberg
2821029	Troisdorf	Germany	North Rhine-Westphalia
2821164	Trier	Germany	Rheinland-Pfalz
2821515	Traunstein	Germany	Bavaria
2821517	Traunreut	Germany	Bavaria
2821807	Torgau	Germany	Saxony
2821899	Tönisvorst	Germany	North Rhine-Westphalia
2823368	Tettnang	Germany	Baden-Württemberg
2823533	Templin	Germany	Brandenburg
2823538	Tempelhof	Germany	Berlin
2823567	Teltow	Germany	Brandenburg
2823708	Tegel	Germany	Berlin
2823799	Taunusstein	Germany	Hesse
2823812	Taufkirchen	Germany	Bavaria
2824461	Syke	Germany	Lower Saxony
2824655	Sundern	Germany	North Rhine-Westphalia
2824801	Sulzbach-Rosenberg	Germany	Bavaria
2824841	Sulzbach	Germany	Saarland
2824948	Suhl	Germany	Thuringia
2825297	Stuttgart	Germany	Baden-Württemberg
2825422	Stuhr	Germany	Lower Saxony
2826082	Strausberg	Germany	Brandenburg
2826099	Straubing	Germany	Bavaria
2826287	Stralsund	Germany	Mecklenburg-Vorpommern
2826304	Straelen	Germany	North Rhine-Westphalia
2826595	Stolberg	Germany	North Rhine-Westphalia
2826861	Stockelsdorf	Germany	Schleswig-Holstein
2826909	Stockach	Germany	Baden-Württemberg
2827479	Stendal	Germany	Saxony-Anhalt
2827552	Stellingen	Germany	Hamburg
2828105	Steinfurt	Germany	North Rhine-Westphalia
2828994	Steilshoop	Germany	Hamburg
2829109	Steglitz	Germany	Berlin
2829422	Staßfurt	Germany	Saxony-Anhalt
2829457	Starnberg	Germany	Bavaria
2829758	Stadtlohn	Germany	North Rhine-Westphalia
2829777	Stadthagen	Germany	Lower Saxony
2829804	Stadtallendorf	Germany	Hesse
2829901	Stade	Germany	Lower Saxony
2829962	Staaken	Germany	Berlin
2829998	Sprockhövel	Germany	North Rhine-Westphalia
2830035	Springe	Germany	Lower Saxony
2830582	Speyer	Germany	Rheinland-Pfalz
2830637	Spenge	Germany	North Rhine-Westphalia
2831088	Sonthofen	Germany	Bavaria
2831276	Sondershausen	Germany	Thuringia
2831403	Sömmerda	Germany	Thuringia
2831486	Soltau	Germany	Lower Saxony
2831708	Soest	Germany	North Rhine-Westphalia
2831852	Sinzig	Germany	Rheinland-Pfalz
2831872	Sinsheim	Germany	Baden-Württemberg
2831924	Singen	Germany	Baden-Württemberg
2831948	Sindelfingen	Germany	Baden-Württemberg
2832023	Simmerath	Germany	North Rhine-Westphalia
2832232	Sigmaringen	Germany	Baden-Württemberg
2832495	Siegen	Germany	North Rhine-Westphalia
2832521	Siegburg	Germany	North Rhine-Westphalia
2833073	Senftenberg	Germany	Brandenburg
2833079	Senden	Germany	North Rhine-Westphalia
2833080	Senden	Germany	Bavaria
2833170	Selm	Germany	North Rhine-Westphalia
2833242	Seligenstadt	Germany	Hesse
2833296	Selb	Germany	Bavaria
2833475	Sehnde	Germany	Lower Saxony
2833564	Seevetal	Germany	Lower Saxony
2833592	Seesen	Germany	Lower Saxony
2833641	Seelze	Germany	Lower Saxony
2834265	Schwerte	Germany	North Rhine-Westphalia
2834282	Schwerin	Germany	Mecklenburg-Vorpommern
2834372	Schwelm	Germany	North Rhine-Westphalia
2834498	Schweinfurt	Germany	Bavaria
2834629	Schwedt (Oder)	Germany	Brandenburg
2834978	Schwarzenberg	Germany	Saxony
2835260	Schwanewede	Germany	Lower Saxony
2835297	Schwandorf in Bayern	Germany	Bavaria
2835342	Schwalmtal	Germany	North Rhine-Westphalia
2835345	Schwalmstadt	Germany	Hesse
2835382	Schwalbach	Germany	Saarland
2835481	Schwäbisch Hall	Germany	Baden-Württemberg
2835482	Schwäbisch Gmünd	Germany	Baden-Württemberg
2835537	Schwabach	Germany	Bavaria
2836084	Schrobenhausen	Germany	Bavaria
2836203	Schramberg	Germany	Baden-Württemberg
2836282	Schortens	Germany	Lower Saxony
2836413	Schopfheim	Germany	Baden-Württemberg
2836788	Schöneberg	Germany	Berlin
2836809	Schönebeck	Germany	Saxony-Anhalt
2837291	Schneverdingen	Germany	Lower Saxony
2837470	Schneeberg	Germany	Saxony
2837954	Schmelz	Germany	Saarland
2838009	Schmargendorf	Germany	Berlin
2838053	Schmallenberg	Germany	North Rhine-Westphalia
2838059	Schmalkalden	Germany	Thuringia
2838201	Schlüchtern	Germany	Hesse
2838634	Schleswig	Germany	Schleswig-Holstein
2839050	Schkeuditz	Germany	Saxony
2839316	Schiffweiler	Germany	Saarland
2839335	Schifferstadt	Germany	Rheinland-Pfalz
2841125	Saulgau	Germany	Baden-Württemberg
2841374	Sasel	Germany	Hamburg
2841386	Sarstedt	Germany	Lower Saxony
2841463	Sankt Wendel	Germany	Saarland
2841590	Sankt Ingbert	Germany	Saarland
2841693	Sangerhausen	Germany	Saxony-Anhalt
2842112	Salzwedel	Germany	Saxony-Anhalt
2842131	Salzkotten	Germany	North Rhine-Westphalia
2842632	Saarlouis	Germany	Saarland
2842647	Saarbrücken	Germany	Saarland
2842688	Saalfeld	Germany	Thuringia
2842884	Rüsselsheim	Germany	Hesse
2843106	Rummelsburg	Germany	Berlin
2843350	Rudow	Germany	Berlin
2843355	Rudolstadt	Germany	Thuringia
2843636	Rottweil	Germany	Baden-Württemberg
2843729	Rottenburg	Germany	Baden-Württemberg
2844265	Roth	Germany	Bavaria
2844437	Rotenburg	Germany	Lower Saxony
2844588	Rostock	Germany	Mecklenburg-Vorpommern
2844862	Rösrath	Germany	North Rhine-Westphalia
2844988	Rosenheim	Germany	Bavaria
2845222	Ronnenberg	Germany	Lower Saxony
2846523	Rinteln	Germany	Lower Saxony
2846939	Riesa	Germany	Saxony
2847033	Riegelsberg	Germany	Saarland
2847524	Ribnitz-Damgarten	Germany	Mecklenburg-Vorpommern
2847639	Rheinfelden (Baden)	Germany	Baden-Württemberg
2847645	Rheine	Germany	North Rhine-Westphalia
2847662	Rheinberg	Germany	North Rhine-Westphalia
2847666	Rheinbach	Germany	North Rhine-Westphalia
2847689	Rhede	Germany	North Rhine-Westphalia
2847690	Rheda-Wiedenbrück	Germany	North Rhine-Westphalia
2847736	Reutlingen	Germany	Baden-Württemberg
2848175	Renningen	Germany	Baden-Württemberg
2848245	Rendsburg	Germany	Schleswig-Holstein
2848273	Remscheid	Germany	North Rhine-Westphalia
2848335	Remagen	Germany	Rheinland-Pfalz
2848756	Reinickendorf	Germany	Berlin
2848762	Reinheim	Germany	Hesse
2848845	Reinbek	Germany	Schleswig-Holstein
2849156	Reichenbach/Vogtland	Germany	Saxony
2849483	Regensburg	Germany	Bavaria
2849548	Rees	Germany	North Rhine-Westphalia
2849802	Ravensburg	Germany	Baden-Württemberg
2850174	Ratingen	Germany	North Rhine-Westphalia
2850213	Rathenow	Germany	Brandenburg
2850235	Ratekau	Germany	Schleswig-Holstein
2850253	Rastede	Germany	Lower Saxony
2850257	Rastatt	Germany	Baden-Württemberg
2850887	Rahden	Germany	North Rhine-Westphalia
2850954	Radolfzell am Bodensee	Germany	Baden-Württemberg
2850995	Radevormwald	Germany	North Rhine-Westphalia
2851077	Radebeul	Germany	Saxony
2851079	Radeberg	Germany	Saxony
2851343	Quickborn	Germany	Schleswig-Holstein
2851465	Quedlinburg	Germany	Saxony-Anhalt
2851746	Pulheim	Germany	North Rhine-Westphalia
2851782	Puchheim	Germany	Bavaria
2852217	Prenzlauer Berg	Germany	Berlin
2852218	Prenzlau	Germany	Brandenburg
2852280	Preetz	Germany	Schleswig-Holstein
2852458	Potsdam	Germany	Brandenburg
2852577	Porta Westfalica	Germany	North Rhine-Westphalia
2852673	Poppenbüttel	Germany	Hamburg
2853209	Plettenberg	Germany	North Rhine-Westphalia
2853292	Plauen	Germany	Saxony
2853572	Pirna	Germany	Saxony
2853574	Pirmasens	Germany	Rheinland-Pfalz
2853658	Pinneberg	Germany	Schleswig-Holstein
2853924	Pfungstadt	Germany	Hesse
2853969	Pforzheim	Germany	Baden-Württemberg
2854386	Pfaffenhofen an der Ilm	Germany	Bavaria
2854655	Petershagen	Germany	North Rhine-Westphalia
2854923	Penzberg	Germany	Bavaria
2855047	Peine	Germany	Lower Saxony
2855328	Passau	Germany	Bavaria
2855334	Pasing	Germany	Bavaria
2855441	Parchim	Germany	Mecklenburg-Vorpommern
2855525	Papenburg	Germany	Lower Saxony
2855598	Pankow	Germany	Berlin
2855745	Paderborn	Germany	North Rhine-Westphalia
2855794	Oyten	Germany	Lower Saxony
2855859	Overath	Germany	North Rhine-Westphalia
2855917	Ottweiler	Germany	Saarland
2855935	Ottobrunn	Germany	Bavaria
2856500	Osterholz-Scharmbeck	Germany	Lower Saxony
2856883	Osnabrück	Germany	Lower Saxony
2856930	Oschersleben	Germany	Saxony-Anhalt
2856944	Oschatz	Germany	Saxony
2857129	Oranienburg	Germany	Brandenburg
2857291	Olsberg	Germany	North Rhine-Westphalia
2857306	Olpe	Germany	North Rhine-Westphalia
2857458	Oldenburg	Germany	Lower Saxony
2857472	Olching	Germany	Bavaria
2857565	Öhringen	Germany	Baden-Württemberg
2857798	Offenburg	Germany	Baden-Württemberg
2857807	Offenbach	Germany	Hesse
2857900	Oerlinghausen	Germany	North Rhine-Westphalia
2857904	Oer-Erkenschwick	Germany	North Rhine-Westphalia
2857943	Oelde	Germany	North Rhine-Westphalia
2858103	Odenthal	Germany	North Rhine-Westphalia
2858245	Ochtrup	Germany	North Rhine-Westphalia
2858738	Oberursel	Germany	Hesse
2858763	Obertshausen	Germany	Hesse
2859103	Oberschöneweide	Germany	Berlin
2859380	Ober-Ramstadt	Germany	Hesse
2860410	Oberhausen	Germany	North Rhine-Westphalia
2861402	Oberasbach	Germany	Bavaria
2861632	Nürtingen	Germany	Baden-Württemberg
2861650	Nürnberg	Germany	Bavaria
2861677	Nümbrecht	Germany	North Rhine-Westphalia
2861733	Nottuln	Germany	North Rhine-Westphalia
2861814	Northeim	Germany	Lower Saxony
2861914	Nördlingen	Germany	Bavaria
2861934	Nordhorn	Germany	Lower Saxony
2861982	Nordhausen	Germany	Thuringia
2862026	Norderstedt	Germany	Schleswig-Holstein
2862104	Nordenham	Germany	Lower Saxony
2862118	Norden	Germany	Lower Saxony
2862375	Nippes	Germany	North Rhine-Westphalia
2862423	Nikolassee	Germany	Berlin
2862620	Nienburg	Germany	Lower Saxony
2862888	Niederschönhausen	Germany	Berlin
2863223	Niederkassel	Germany	North Rhine-Westphalia
2863240	Nieder-Ingelheim	Germany	Rheinland-Pfalz
2863712	Nidderau	Germany	Hesse
2863716	Nidda	Germany	Hesse
2863795	Neu Wulmstorf	Germany	Lower Saxony
2863840	Neuwied	Germany	Rheinland-Pfalz
2863941	Neu-Ulm	Germany	Bavaria
2864005	Neustrelitz	Germany	Mecklenburg-Vorpommern
2864034	Neustadt in Holstein	Germany	Schleswig-Holstein
2864053	Neustadt bei Coburg	Germany	Bavaria
2864054	Neustadt	Germany	Rheinland-Pfalz
2864058	Neustadt am Rübenberge	Germany	Lower Saxony
2864072	Neue Neustadt	Germany	Saxony-Anhalt
2864118	Neuss	Germany	North Rhine-Westphalia
2864276	Neuruppin	Germany	Brandenburg
2864435	Neunkirchen	Germany	Saarland
2864475	Neumünster	Germany	Schleswig-Holstein
2864549	Neumarkt in der Oberpfalz	Germany	Bavaria
2864820	Neu Isenburg	Germany	Hesse
2865376	Neufahrn bei Freising	Germany	Bavaria
2865716	Neuenhagen	Germany	Brandenburg
2866110	Neubrück	Germany	North Rhine-Westphalia
2866135	Neubrandenburg	Germany	Mecklenburg-Vorpommern
2866280	Neu-Anspach	Germany	Hesse
2866333	Nettetal	Germany	North Rhine-Westphalia
2866375	Netphen	Germany	North Rhine-Westphalia
2866758	Neckarsulm	Germany	Baden-Württemberg
2866906	Naumburg	Germany	Saxony-Anhalt
2866930	Nauen	Germany	Brandenburg
2867164	Nagold	Germany	Baden-Württemberg
2867542	Munster	Germany	Lower Saxony
2867613	Hannoversch Münden	Germany	Lower Saxony
2867714	Munich	Germany	Bavaria
2867770	Müllheim	Germany	Baden-Württemberg
2867838	Mülheim (Ruhr)	Germany	North Rhine-Westphalia
2867985	Mühlheim am Main	Germany	Hesse
2867996	Mühlhausen	Germany	Thuringia
2868506	Mühldorf	Germany	Bavaria
2868788	Mühlacker	Germany	Baden-Württemberg
2868936	Much	Germany	North Rhine-Westphalia
2869019	Mössingen	Germany	Baden-Württemberg
2869449	Moosburg	Germany	Bavaria
2869791	Monheim am Rhein	Germany	North Rhine-Westphalia
2869894	Mönchengladbach	Germany	North Rhine-Westphalia
2869994	Mölln	Germany	Schleswig-Holstein
2870221	Moers	Germany	North Rhine-Westphalia
2870310	Moabit	Germany	Berlin
2870318	Mittweida	Germany	Saxony
2871039	Minden	Germany	North Rhine-Westphalia
2871284	Michelstadt	Germany	Hesse
2871486	Metzingen	Germany	Baden-Württemberg
2871535	Mettmann	Germany	North Rhine-Westphalia
2871668	Meschede	Germany	North Rhine-Westphalia
2871675	Merzig	Germany	Saarland
2871736	Merseburg	Germany	Saxony-Anhalt
2871845	Meppen	Germany	Lower Saxony
2871992	Memmingen	Germany	Bavaria
2872079	Melle	Germany	Lower Saxony
2872155	Meissen	Germany	Saxony
2872225	Meiningen	Germany	Thuringia
2872237	Meinerzhagen	Germany	North Rhine-Westphalia
2872347	Meiderich	Germany	North Rhine-Westphalia
2872504	Meerbusch	Germany	North Rhine-Westphalia
2872519	Meerane	Germany	Saxony
2872582	Meckenheim	Germany	North Rhine-Westphalia
2872611	Mechernich	Germany	North Rhine-Westphalia
2872649	Mayen	Germany	Rheinland-Pfalz
2873074	Marzahn	Germany	Berlin
2873211	Marsberg	Germany	North Rhine-Westphalia
2873263	Marl	Germany	North Rhine-Westphalia
2873289	Marktredwitz	Germany	Bavaria
2873291	Marktoberdorf	Germany	Bavaria
2873352	Markkleeberg	Germany	Saxony
2873356	Märkisches Viertel	Germany	Berlin
2873589	Marienfelde	Germany	Berlin
2873606	Mariendorf	Germany	Berlin
2873776	Marbach am Neckar	Germany	Baden-Württemberg
2873891	Mannheim	Germany	Baden-Württemberg
2874225	Mainz	Germany	Rheinland-Pfalz
2874230	Maintal	Germany	Hesse
2874455	Mahlsdorf	Germany	Berlin
2874545	Magdeburg	Germany	Saxony-Anhalt
2875107	Lünen	Germany	North Rhine-Westphalia
2875115	Lüneburg	Germany	Lower Saxony
2875376	Ludwigshafen am Rhein	Germany	Rheinland-Pfalz
2875379	Ludwigsfelde	Germany	Brandenburg
2875392	Ludwigsburg	Germany	Baden-Württemberg
2875457	Lüdenscheid	Germany	North Rhine-Westphalia
2875484	Luckenwalde	Germany	Brandenburg
2875601	Lübeck	Germany	Schleswig-Holstein
2875623	Lübbenau	Germany	Brandenburg
2875626	Lübbecke	Germany	North Rhine-Westphalia
2875645	Loxstedt	Germany	Lower Saxony
2875831	Losheim	Germany	Saarland
2875881	Lörrach	Germany	Baden-Württemberg
2876147	Lohr am Main	Germany	Bavaria
2876185	Lohne	Germany	Lower Saxony
2876187	Löhne	Germany	North Rhine-Westphalia
2876218	Lohmar	Germany	North Rhine-Westphalia
2876755	Löbau	Germany	Saxony
2876865	Lippstadt	Germany	North Rhine-Westphalia
2877088	Lingen	Germany	Lower Saxony
2877142	Lindlar	Germany	North Rhine-Westphalia
2877550	Lindau	Germany	Bavaria
2877648	Limburg an der Lahn	Germany	Hesse
2877673	Limbach-Oberfrohna	Germany	Saxony
2877709	Lilienthal	Germany	Lower Saxony
2878018	Lichterfelde	Germany	Berlin
2878044	Lichtenrade	Germany	Berlin
2878074	Lichtenfels	Germany	Bavaria
2878102	Lichtenberg	Germany	Berlin
2878270	Leutkirch im Allgäu	Germany	Baden-Württemberg
2878673	Leopoldshöhe	Germany	North Rhine-Westphalia
2878695	Leonberg	Germany	Baden-Württemberg
2878784	Lennestadt	Germany	North Rhine-Westphalia
2878840	Lengerich	Germany	North Rhine-Westphalia
2878943	Lemgo	Germany	North Rhine-Westphalia
2879139	Leipzig	Germany	Saxony
2879185	Leinfelden-Echterdingen	Germany	Baden-Württemberg
2879241	Leimen	Germany	Baden-Württemberg
2879315	Leichlingen	Germany	North Rhine-Westphalia
2879367	Lehrte	Germany	Lower Saxony
2879697	Leer	Germany	Lower Saxony
2879832	Lebach	Germany	Saarland
2880077	Laupheim	Germany	Baden-Württemberg
2880144	Lauf an der Pegnitz	Germany	Bavaria
2880221	Lauchhammer	Germany	Brandenburg
2880498	Lankwitz	Germany	Berlin
2881018	Langenhorn	Germany	Hamburg
2881085	Langenfeld	Germany	North Rhine-Westphalia
2881276	Langen	Germany	Lower Saxony
2881279	Langen	Germany	Hesse
2881485	Landshut	Germany	Bavaria
2881509	Landsberg am Lech	Germany	Bavaria
2881646	Landau in der Pfalz	Germany	Rheinland-Pfalz
2881695	Lampertheim	Germany	Hesse
2881885	Lahr	Germany	Baden-Württemberg
2881889	Lahnstein	Germany	Rheinland-Pfalz
2881956	Lage	Germany	North Rhine-Westphalia
2882087	Laatzen	Germany	Lower Saxony
2882091	Bad Laasphe	Germany	North Rhine-Westphalia
2882318	Kürten	Germany	North Rhine-Westphalia
2882439	Künzelsau	Germany	Baden-Württemberg
2882440	Künzell	Germany	Hesse
2882588	Kulmbach	Germany	Bavaria
2883754	Kronberg	Germany	Hesse
2883784	Kronach	Germany	Bavaria
2884161	Kreuzberg	Germany	Berlin
2884245	Kreuzau	Germany	North Rhine-Westphalia
2884509	Krefeld	Germany	North Rhine-Westphalia
2885237	Köthen	Germany	Saxony-Anhalt
2885397	Korschenbroich	Germany	North Rhine-Westphalia
2885412	Korntal	Germany	Baden-Württemberg
2885536	Korbach	Germany	Hesse
2885656	Köpenick	Germany	Berlin
2885657	Berlin Köpenick	Germany	Berlin
2885672	Konz	Germany	Rheinland-Pfalz
2885679	Konstanz	Germany	Baden-Württemberg
2885734	Königswinter	Germany	North Rhine-Westphalia
2885760	Königstein im Taunus	Germany	Hesse
2885800	Königslutter am Elm	Germany	Lower Saxony
2885908	Königsbrunn	Germany	Bavaria
2886242	Köln	Germany	North Rhine-Westphalia
2886446	Kolbermoor	Germany	Bavaria
2886946	Koblenz	Germany	Rheinland-Pfalz
2887835	Kleve	Germany	North Rhine-Westphalia
2888523	Kleinmachnow	Germany	Brandenburg
2890158	Kitzingen	Germany	Bavaria
2890425	Kirchlengern	Germany	North Rhine-Westphalia
2890473	Kirchheim unter Teck	Germany	Baden-Württemberg
2890504	Kirchhain	Germany	Hesse
2891014	Kierspe	Germany	North Rhine-Westphalia
2891122	Kiel	Germany	Schleswig-Holstein
2891258	Kevelaer	Germany	North Rhine-Westphalia
2891524	Kerpen	Germany	North Rhine-Westphalia
2891621	Kempten (Allgäu)	Germany	Bavaria
2891832	Kelkheim (Taunus)	Germany	Hesse
2891834	Kelheim	Germany	Bavaria
2891951	Kehl	Germany	Baden-Württemberg
2892051	Kaulsdorf	Germany	Berlin
2892080	Kaufbeuren	Germany	Bavaria
2892518	Kassel	Germany	Hesse
2892705	Karow	Germany	Berlin
2892786	Karlstadt	Germany	Bavaria
2892794	Karlsruhe	Germany	Baden-Württemberg
2892811	Karlshorst	Germany	Berlin
2892874	Karlsfeld	Germany	Bavaria
2892980	Karben	Germany	Hesse
2893264	Kamp-Lintfort	Germany	North Rhine-Westphalia
2893437	Kamenz	Germany	Saxony
2893438	Kamen	Germany	North Rhine-Westphalia
2893544	Kaltenkirchen	Germany	Schleswig-Holstein
2894003	Kaiserslautern	Germany	Rheinland-Pfalz
2894553	Jülich	Germany	North Rhine-Westphalia
2894637	Jüchen	Germany	North Rhine-Westphalia
2894755	Johannisthal	Germany	Berlin
2895044	Jena	Germany	Thuringia
2895569	Itzehoe	Germany	Schleswig-Holstein
2895664	Isernhagen Farster Bauerschaft	Germany	Lower Saxony
2895669	Iserlohn	Germany	North Rhine-Westphalia
2895992	Ingolstadt	Germany	Bavaria
2896514	Ilmenau	Germany	Thuringia
2896538	Illingen	Germany	Saarland
2896546	Illertissen	Germany	Bavaria
2896736	Idstein	Germany	Hesse
2896753	Idar-Oberstein	Germany	Rheinland-Pfalz
2896817	Ibbenbüren	Germany	North Rhine-Westphalia
2897132	Husum	Germany	Schleswig-Holstein
2897216	Hürth	Germany	North Rhine-Westphalia
2897436	Hünfeld	Germany	Hesse
2897674	Hummelsbüttel	Germany	Hamburg
2898079	Hude	Germany	Lower Saxony
2898098	Hückeswagen	Germany	North Rhine-Westphalia
2898111	Hückelhoven	Germany	North Rhine-Westphalia
2898304	Hoyerswerda	Germany	Saxony
2898321	Höxter	Germany	North Rhine-Westphalia
2898364	Hövelhof	Germany	North Rhine-Westphalia
2898603	Hörstel	Germany	North Rhine-Westphalia
2899101	Horb am Neckar	Germany	Baden-Württemberg
2899449	Homburg	Germany	Saarland
2899538	Holzwickede	Germany	North Rhine-Westphalia
2899601	Holzminden	Germany	Lower Saxony
2899676	Holzkirchen	Germany	Bavaria
2901420	Hohenstein-Ernstthal	Germany	Saxony
2901588	Hohen Neuendorf	Germany	Brandenburg
2902533	Hofheim am Taunus	Germany	Hesse
2902559	Hofgeismar	Germany	Hesse
2902768	Hof	Germany	Bavaria
2902852	Hockenheim	Germany	Baden-Württemberg
2903175	Hochheim am Main	Germany	Hesse
2903237	Hochfeld	Germany	North Rhine-Westphalia
2904789	Hildesheim	Germany	Lower Saxony
2904795	Hilden	Germany	North Rhine-Westphalia
2904808	Hilchenbach	Germany	North Rhine-Westphalia
2904886	Hiddenhausen	Germany	North Rhine-Westphalia
2904985	Heusweiler	Germany	Saarland
2904992	Heusenstamm	Germany	Hesse
2905206	Hettstedt	Germany	Saxony-Anhalt
2905290	Hessisch Oldendorf	Germany	Lower Saxony
2905455	Herzogenrath	Germany	North Rhine-Westphalia
2905457	Herzogenaurach	Germany	Bavaria
2905560	Herten	Germany	North Rhine-Westphalia
2905826	Herrenberg	Germany	Baden-Württemberg
2905891	Herne	Germany	North Rhine-Westphalia
2905904	Hermsdorf	Germany	Berlin
2906121	Herford	Germany	North Rhine-Westphalia
2906152	Herdecke	Germany	North Rhine-Westphalia
2906199	Herborn	Germany	Hesse
2906268	Heppenheim an der Bergstrasse	Germany	Hesse
2906331	Hennigsdorf	Germany	Brandenburg
2906530	Hemmingen	Germany	Lower Saxony
2906595	Hemer	Germany	North Rhine-Westphalia
2906676	Helmstedt	Germany	Lower Saxony
2906809	Hellersdorf	Germany	Berlin
2907201	Heinsberg	Germany	North Rhine-Westphalia
2907545	Heilbad Heiligenstadt	Germany	Thuringia
2907551	Heiligensee	Germany	Berlin
2907585	Heiligenhaus	Germany	North Rhine-Westphalia
2907669	Heilbronn	Germany	Baden-Württemberg
2907851	Heidenheim an der Brenz	Germany	Baden-Württemberg
2907887	Heidenau	Germany	Saxony
2907911	Heidelberg	Germany	Baden-Württemberg
2908495	Hechingen	Germany	Baden-Württemberg
2909230	Hattingen	Germany	North Rhine-Westphalia
2909240	Hattersheim	Germany	Hesse
2909313	Haßloch	Germany	Rheinland-Pfalz
2910278	Harsewinkel	Germany	North Rhine-Westphalia
2910514	Haren	Germany	Lower Saxony
2910685	Harburg	Germany	Hamburg
2910831	Hannover	Germany	Lower Saxony
2911007	Hanau am Main	Germany	Hesse
2911240	Hamm	Germany	North Rhine-Westphalia
2911271	Hameln	Germany	Lower Saxony
2911285	Wandsbek	Germany	Hamburg
2911287	Marienthal	Germany	Hamburg
2911288	Hamburg-Mitte	Germany	Hamburg
2911293	Eimsbüttel	Germany	Hamburg
2911296	Altona	Germany	Hamburg
2911298	Hamburg	Germany	Hamburg
2911384	Halver	Germany	North Rhine-Westphalia
2911395	Haltern	Germany	North Rhine-Westphalia
2911408	Halstenbek	Germany	Schleswig-Holstein
2911520	Halle	Germany	North Rhine-Westphalia
2911522	Halle (Saale)	Germany	Saxony-Anhalt
2911584	Haldensleben I	Germany	Saxony-Anhalt
2911665	Halberstadt	Germany	Saxony-Anhalt
2911710	Hakenfelde	Germany	Berlin
2911964	Haiger	Germany	Hesse
2913192	Haar	Germany	Bavaria
2913195	Haan	Germany	North Rhine-Westphalia
2913366	Gütersloh	Germany	North Rhine-Westphalia
2913433	Güstrow	Germany	Mecklenburg-Vorpommern
2913537	Gunzenhausen	Germany	Bavaria
2913555	Günzburg	Germany	Bavaria
2913761	Gummersbach	Germany	North Rhine-Westphalia
2913922	Guben	Germany	Brandenburg
2925533	Frankfurt am Main	Germany	Hesse
2915196	Großostheim	Germany	Bavaria
2916630	Großenhain	Germany	Saxony
2917138	Gronau	Germany	North Rhine-Westphalia
2917221	Gröbenzell	Germany	Bavaria
2917325	Grimma	Germany	Saxony
2917412	Griesheim	Germany	Hesse
2917540	Grevenbroich	Germany	North Rhine-Westphalia
2917544	Greven	Germany	North Rhine-Westphalia
2917737	Greiz	Germany	Thuringia
2917816	Grefrath	Germany	North Rhine-Westphalia
2918632	Göttingen	Germany	Lower Saxony
2918752	Gotha	Germany	Thuringia
2918840	Goslar	Germany	Lower Saxony
2918987	Görlitz	Germany	Saxony
2919054	Göppingen	Germany	Baden-Württemberg
2919625	Goch	Germany	North Rhine-Westphalia
2919880	Glinde	Germany	Schleswig-Holstein
2920020	Glauchau	Germany	Saxony
2920236	Gladbeck	Germany	North Rhine-Westphalia
2920329	Ginsheim-Gustavsburg	Germany	Hesse
2920433	Gilching	Germany	Bavaria
2920478	Gifhorn	Germany	Lower Saxony
2920512	Gießen	Germany	Hesse
2920620	Giengen an der Brenz	Germany	Baden-Württemberg
2920757	Gevelsberg	Germany	North Rhine-Westphalia
2920789	Gesundbrunnen	Germany	Berlin
2920842	Gescher	Germany	North Rhine-Westphalia
2920891	Gersthofen	Germany	Bavaria
2921034	Germersheim	Germany	Rheinland-Pfalz
2921039	Germering	Germany	Bavaria
2921061	Gerlingen	Germany	Baden-Württemberg
2921139	Geretsried	Germany	Bavaria
2921232	Gera	Germany	Thuringia
2921242	Georgsmarienhütte	Germany	Lower Saxony
2921466	Gelsenkirchen	Germany	North Rhine-Westphalia
2921473	Gelnhausen	Germany	Hesse
2921528	Geldern	Germany	North Rhine-Westphalia
2921653	Geislingen an der Steige	Germany	Baden-Württemberg
2921837	Geilenkirchen	Germany	North Rhine-Westphalia
2922102	Geesthacht	Germany	Schleswig-Holstein
2922230	Gauting	Germany	Bavaria
2922530	Garmisch-Partenkirchen	Germany	Bavaria
2922582	Garching bei München	Germany	Bavaria
2922586	Garbsen	Germany	Lower Saxony
2922731	Ganderkesee	Germany	Lower Saxony
2923362	Gaggenau	Germany	Baden-Württemberg
2923544	Fürth	Germany	Bavaria
2923625	Fürstenfeldbruck	Germany	Bavaria
2923822	Fulda	Germany	Hesse
2924206	Fröndenberg	Germany	North Rhine-Westphalia
2924302	Frohnau	Germany	Berlin
2924360	Friesoythe	Germany	Lower Saxony
2924573	Friedrichshain	Germany	Berlin
2924577	Friedrichshagen	Germany	Berlin
2924585	Friedrichshafen	Germany	Baden-Württemberg
2924599	Friedrichsfelde	Germany	Berlin
2924625	Friedrichsdorf	Germany	Hesse
2924770	Friedenau	Germany	Berlin
2924802	Friedberg	Germany	Hesse
2924803	Friedberg	Germany	Bavaria
2924915	Freudenberg	Germany	North Rhine-Westphalia
2925017	Freital	Germany	Saxony
2925034	Freising	Germany	Bavaria
2925080	Freilassing	Germany	Bavaria
2925177	Freiburg	Germany	Baden-Württemberg
2925189	Freiberg am Neckar	Germany	Baden-Württemberg
2925192	Freiberg	Germany	Saxony
2925259	Frechen	Germany	North Rhine-Westphalia
2915613	Groß-Gerau	Germany	Hesse
2925535	Frankfurt (Oder)	Germany	Brandenburg
2925550	Frankenthal	Germany	Rheinland-Pfalz
2925629	Frankenberg	Germany	Hesse
2925630	Frankenberg	Germany	Saxony
2925832	Forst	Germany	Brandenburg
2925910	Forchheim	Germany	Bavaria
2926120	Flörsheim	Germany	Hesse
2926271	Flensburg	Germany	Schleswig-Holstein
2926716	Finnentrop	Germany	North Rhine-Westphalia
2927268	Fellbach	Germany	Baden-Württemberg
2927930	Falkensee	Germany	Brandenburg
2928381	Eutin	Germany	Schleswig-Holstein
2928396	Euskirchen	Germany	North Rhine-Westphalia
2928615	Ettlingen	Germany	Baden-Württemberg
2928751	Esslingen	Germany	Baden-Württemberg
2928810	Essen	Germany	North Rhine-Westphalia
2928874	Espelkamp	Germany	North Rhine-Westphalia
2928963	Eschweiler	Germany	North Rhine-Westphalia
2928967	Eschwege	Germany	Hesse
2929134	Eschborn	Germany	Hesse
2929247	Erwitte	Germany	North Rhine-Westphalia
2929567	Erlangen	Germany	Bavaria
2929600	Erkrath	Germany	North Rhine-Westphalia
2929622	Erkelenz	Germany	North Rhine-Westphalia
2929670	Erfurt	Germany	Thuringia
2929671	Erftstadt	Germany	North Rhine-Westphalia
2929715	Erding	Germany	Bavaria
2929831	Eppingen	Germany	Baden-Württemberg
2929865	Eppelborn	Germany	Saarland
2930030	Ennigerloh	Germany	North Rhine-Westphalia
2930043	Ennepetal	Germany	North Rhine-Westphalia
2930216	Engelskirchen	Germany	North Rhine-Westphalia
2930449	Emsdetten	Germany	North Rhine-Westphalia
2930509	Emmerich	Germany	North Rhine-Westphalia
2930523	Emmendingen	Germany	Baden-Württemberg
2930596	Emden	Germany	Lower Saxony
2930646	Eltville	Germany	Hesse
2930778	Elsdorf	Germany	North Rhine-Westphalia
2930821	Elmshorn	Germany	Schleswig-Holstein
2930889	Ellwangen	Germany	Baden-Württemberg
2931361	Eitorf	Germany	North Rhine-Westphalia
2931414	Eislingen	Germany	Baden-Württemberg
2931481	Eisenhüttenstadt	Germany	Brandenburg
2931574	Eisenach	Germany	Thuringia
2931804	Einbeck	Germany	Lower Saxony
2931871	Eilenburg	Germany	Saxony
2932924	Ehingen	Germany	Baden-Württemberg
2933364	Edewecht	Germany	Lower Saxony
2933627	Eckernförde	Germany	Schleswig-Holstein
2933882	Eberswalde	Germany	Brandenburg
2933959	Ebersbach an der Fils	Germany	Baden-Württemberg
2934020	Eberbach	Germany	Baden-Württemberg
2934246	Düsseldorf	Germany	North Rhine-Westphalia
2934486	Düren	Germany	North Rhine-Westphalia
2934662	Dülmen	Germany	North Rhine-Westphalia
2934691	Duisburg	Germany	North Rhine-Westphalia
2934728	Duderstadt	Germany	Lower Saxony
2935022	Dresden	Germany	Saxony
2935042	Drensteinfurt	Germany	North Rhine-Westphalia
2935220	Dreieich	Germany	Hesse
2935517	Dortmund	Germany	North Rhine-Westphalia
2935530	Dorsten	Germany	North Rhine-Westphalia
2935825	Dormagen	Germany	North Rhine-Westphalia
2936253	Donauwörth	Germany	Bavaria
2936267	Donaueschingen	Germany	Baden-Württemberg
2936658	Döbeln	Germany	Saxony
2936705	Ditzingen	Germany	Baden-Württemberg
2936871	Dinslaken	Germany	North Rhine-Westphalia
2936909	Dingolfing	Germany	Bavaria
2936977	Dillingen	Germany	Saarland
2936985	Dillenburg	Germany	Hesse
2937040	Dietzenbach	Germany	Hesse
2937317	Diepholz	Germany	Lower Saxony
2937591	Dieburg	Germany	Hesse
2937790	Deutz	Germany	North Rhine-Westphalia
2937936	Detmold	Germany	North Rhine-Westphalia
2937959	Dessau	Germany	Saxony-Anhalt
2938323	Delmenhorst	Germany	Lower Saxony
2938376	Delitzsch	Germany	Saxony
2938389	Delbrück	Germany	North Rhine-Westphalia
2938540	Deggendorf	Germany	Bavaria
2938784	Datteln	Germany	North Rhine-Westphalia
2938913	Darmstadt	Germany	Hesse
2939167	Damme	Germany	Lower Saxony
2939440	Dahlem	Germany	Berlin
2939623	Dachau	Germany	Bavaria
2939658	Cuxhaven	Germany	Lower Saxony
2939747	Crimmitschau	Germany	Saxony
2939811	Cottbus	Germany	Brandenburg
2939820	Coswig	Germany	Saxony
2939945	Coesfeld	Germany	North Rhine-Westphalia
2939951	Coburg	Germany	Bavaria
2939969	Cloppenburg	Germany	Lower Saxony
2939995	Clausthal-Zellerfeld	Germany	Lower Saxony
2940132	Chemnitz	Germany	Saxony
2940187	Charlottenburg	Germany	Berlin
2940204	Cham	Germany	Bavaria
2940213	Celle	Germany	Lower Saxony
2940231	Castrop-Rauxel	Germany	North Rhine-Westphalia
2940383	Calw	Germany	Baden-Württemberg
2940451	Buxtehude	Germany	Lower Saxony
2940512	Butzbach	Germany	Hesse
2940938	Bürstadt	Germany	Hesse
2940942	Burscheid	Germany	North Rhine-Westphalia
2941279	Burghausen	Germany	Bavaria
2941405	Burgdorf	Germany	Lower Saxony
2941570	Büren	Germany	North Rhine-Westphalia
2941694	Bünde	Germany	North Rhine-Westphalia
2941976	Bühl	Germany	Baden-Württemberg
2942073	Büdingen	Germany	Hesse
2942122	Buckow	Germany	Berlin
2942159	Bückeburg	Germany	Lower Saxony
2942323	Buchholz in der Nordheide	Germany	Lower Saxony
2942341	Französisch Buchholz	Germany	Berlin
2942634	Buchen	Germany	Baden-Württemberg
2943320	Brühl	Germany	North Rhine-Westphalia
2943336	Brüggen	Germany	North Rhine-Westphalia
2943408	Bruckmühl	Germany	Bavaria
2943573	Bruchköbel	Germany	Hesse
2944027	Britz	Germany	Berlin
2944079	Brilon	Germany	North Rhine-Westphalia
2944200	Bretten	Germany	Baden-Württemberg
2944354	Bremervörde	Germany	Lower Saxony
2944368	Bremerhaven	Germany	Bremen
2944388	Bremen	Germany	Bremen
2945024	Braunschweig	Germany	Lower Saxony
2945474	Bramsche	Germany	Lower Saxony
2945542	Brakel	Germany	North Rhine-Westphalia
2945545	Brake (Unterweser)	Germany	Lower Saxony
2945591	Brackenheim	Germany	Baden-Württemberg
2945756	Bottrop	Germany	North Rhine-Westphalia
2946111	Bornheim	Germany	North Rhine-Westphalia
2946172	Borna	Germany	Saxony
2946228	Borken	Germany	North Rhine-Westphalia
2946366	Boppard	Germany	Rheinland-Pfalz
2946447	Bonn	Germany	North Rhine-Westphalia
2946478	Bönen	Germany	North Rhine-Westphalia
2947022	Bogenhausen	Germany	Bavaria
2947416	Bochum	Germany	North Rhine-Westphalia
2947421	Bocholt	Germany	North Rhine-Westphalia
2947444	Böblingen	Germany	Baden-Württemberg
2947449	Bobingen	Germany	Bavaria
2947641	Blomberg	Germany	North Rhine-Westphalia
2947739	Blieskastel	Germany	Saarland
2948071	Blankenburg	Germany	Saxony-Anhalt
2948164	Bitterfeld-Wolfen	Germany	Saxony
2948825	Bingen am Rhein	Germany	Rheinland-Pfalz
2949073	Biesdorf	Germany	Berlin
2949186	Bielefeld	Germany	North Rhine-Westphalia
2949423	Biberach an der Riß	Germany	Baden-Württemberg
2949470	Bexbach	Germany	Saarland
2949475	Beverungen	Germany	North Rhine-Westphalia
2950073	Bernburg	Germany	Saxony-Anhalt
2950096	Bernau bei Berlin	Germany	Brandenburg
2950294	Bergneustadt	Germany	North Rhine-Westphalia
2950344	Bergkamen	Germany	North Rhine-Westphalia
2950349	Bergisch Gladbach	Germany	North Rhine-Westphalia
2950438	Bergheim	Germany	North Rhine-Westphalia
2950978	Bensheim	Germany	Hesse
2951111	Bendorf	Germany	Rheinland-Pfalz
2951648	Bedburg	Germany	North Rhine-Westphalia
2951654	Beckum	Germany	North Rhine-Westphalia
2951679	Beckingen	Germany	Saarland
2951825	Bayreuth	Germany	Bavaria
2951881	Bautzen	Germany	Saxony
2951923	Baunatal	Germany	Hesse
2951935	Baumschulenweg	Germany	Berlin
2952252	Bassum	Germany	Lower Saxony
2952984	Bamberg	Germany	Bavaria
2953197	Baiersbronn	Germany	Baden-Württemberg
2953302	Baesweiler	Germany	North Rhine-Westphalia
2953310	Bad Zwischenahn	Germany	Lower Saxony
2953317	Bad Wildungen	Germany	Hesse
2953320	Bad Waldsee	Germany	Baden-Württemberg
2953321	Bad Vilbel	Germany	Hesse
2953324	Bad Tölz	Germany	Bavaria
2953339	Bad Soden am Taunus	Germany	Hesse
2953341	Bad Segeberg	Germany	Schleswig-Holstein
2953347	Bad Schwartau	Germany	Schleswig-Holstein
2953357	Bad Salzungen	Germany	Thuringia
2953358	Bad Salzuflen	Germany	North Rhine-Westphalia
2953363	Bad Säckingen	Germany	Baden-Württemberg
2953371	Bad Reichenhall	Germany	Bavaria
2953379	Bad Pyrmont	Germany	Lower Saxony
2953385	Bad Oldesloe	Germany	Schleswig-Holstein
2953386	Bad Oeynhausen	Germany	North Rhine-Westphalia
2953389	Bad Neustadt an der Saale	Germany	Bavaria
2953391	Bad Neuenahr-Ahrweiler	Germany	Rheinland-Pfalz
2953395	Bad Nauheim	Germany	Hesse
2953398	Bad Münstereifel	Germany	North Rhine-Westphalia
2953400	Bad Münder am Deister	Germany	Lower Saxony
2953402	Bad Mergentheim	Germany	Baden-Württemberg
2953405	Bad Lippspringe	Germany	North Rhine-Westphalia
2953413	Bad Langensalza	Germany	Thuringia
2953416	Bad Kreuznach	Germany	Rheinland-Pfalz
2953424	Bad Kissingen	Germany	Bavaria
2953435	Bad Honnef	Germany	North Rhine-Westphalia
2953436	Bad Homburg vor der Höhe	Germany	Hesse
2953439	Bad Hersfeld	Germany	Hesse
2953449	Bad Harzburg	Germany	Lower Saxony
2953464	Bad Essen	Germany	Lower Saxony
2953522	Bad Dürkheim	Germany	Rheinland-Pfalz
2953525	Bad Driburg	Germany	North Rhine-Westphalia
2953545	Bad Berleburg	Germany	North Rhine-Westphalia
2953552	Bad Bentheim	Germany	Lower Saxony
2953558	Bad Aibling	Germany	Bavaria
2953568	Backnang	Germany	Baden-Württemberg
2953770	Babenhausen	Germany	Hesse
2954006	Aurich	Germany	Lower Saxony
2954172	Augsburg	Germany	Bavaria
2954602	Auerbach	Germany	Saxony
2954695	Aue	Germany	Saxony
2954932	Attendorn	Germany	North Rhine-Westphalia
2955168	Aschersleben	Germany	Saxony-Anhalt
2955224	Ascheberg	Germany	North Rhine-Westphalia
2955272	Aschaffenburg	Germany	Bavaria
2955421	Bad Arolsen	Germany	Hesse
2955439	Arnstadt	Germany	Thuringia
2955471	Arnsberg	Germany	North Rhine-Westphalia
2955770	Apolda	Germany	Thuringia
2955936	Ansbach	Germany	Bavaria
2956093	Angermünde	Germany	Brandenburg
2956206	Andernach	Germany	Rheinland-Pfalz
2956656	Amberg	Germany	Bavaria
2956710	Alzey	Germany	Rheinland-Pfalz
2956715	Alzenau in Unterfranken	Germany	Bavaria
2958516	Alfter	Germany	North Rhine-Westphalia
2957886	Altena	Germany	North Rhine-Westphalia
2958024	Altdorf	Germany	Bavaria
2958128	Alsfeld	Germany	Hesse
2958141	Alsdorf	Germany	North Rhine-Westphalia
3247449	Aachen	Germany	North Rhine-Westphalia
2958533	Alfeld	Germany	Lower Saxony
2958595	Albstadt	Germany	Baden-Württemberg
2958975	Aichach	Germany	Bavaria
2959223	Ahlen	Germany	North Rhine-Westphalia
2959279	Ahaus	Germany	North Rhine-Westphalia
2959441	Adlershof	Germany	Berlin
2957773	Altenburg	Germany	Thuringia
2959686	Achern	Germany	Baden-Württemberg
2959927	Aalen	Germany	Baden-Württemberg
3207197	Vellmar	Germany	Hesse
3209083	Henstedt-Ulzburg	Germany	Schleswig-Holstein
3272460	Mörfelden-Walldorf	Germany	Hesse
3272941	Riedstadt	Germany	Hesse
3274966	Lauda-Königshofen	Germany	Baden-Württemberg
3336891	Filderstadt	Germany	Baden-Württemberg
3336892	Ostfildern	Germany	Baden-Württemberg
3336893	Rodgau	Germany	Hesse
3337408	Gropiusstadt	Germany	Berlin
3337504	Seeheim-Jugenheim	Germany	Hesse
6545288	Charlottenburg-Nord	Germany	Berlin
6545310	Mitte	Germany	Berlin
6550659	Spremberg	Germany	Brandenburg
6691072	Altstadt Sud	Germany	North Rhine-Westphalia
6691073	Altstadt Nord	Germany	North Rhine-Westphalia
6691076	Neuehrenfeld	Germany	North Rhine-Westphalia
6691078	Bilderstoeckchen	Germany	North Rhine-Westphalia
6930414	Stuttgart-Ost	Germany	Baden-Württemberg
6941055	Bochum-Hordel	Germany	North Rhine-Westphalia
6944296	St. Pauli	Germany	Hamburg
7274677	Eidelstedt	Germany	Hamburg
7289614	Halle Neustadt	Germany	Saxony-Anhalt
7290243	Bergedorf	Germany	Hamburg
7290252	Spandau	Germany	Berlin
7290254	Berlin Schöneberg	Germany	Berlin
7290255	Berlin Treptow	Germany	Berlin
7290401	Niederrad	Germany	Hesse
7302786	Haselbachtal	Germany	Saxony
7932342	Barmbek-Nord	Germany	Hamburg
7932386	Farmsen-Berne	Germany	Hamburg
8334621	Falkenhagener Feld	Germany	Berlin
8334624	Alt-Hohenschönhausen	Germany	Berlin
8334625	Fennpfuhl	Germany	Berlin
8354626	Hamburg-Nord	Germany	Hamburg
8378906	Burg Unter-Falkenstein	Germany	Bavaria
8593855	Neustadt/Nord	Germany	North Rhine-Westphalia
8593856	Neustadt/Süd	Germany	North Rhine-Westphalia
8593861	Kalk	Germany	North Rhine-Westphalia
8593865	Mülheim	Germany	North Rhine-Westphalia
8642860	Gartenstadt	Germany	Rheinland-Pfalz
220782	Tadjoura	Djibouti	Tadjourah
221527	Obock	Djibouti	Obock
223817	Djibouti	Djibouti	Djibouti
224152	Ḏânan	Djibouti	Ali Sabieh
225284	'Ali Sabieh	Djibouti	Ali Sabieh
2610319	Viborg	Denmark	Central Jutland
2610613	Vejle	Denmark	South Denmark
2610734	Vanløse	Denmark	Capital Region
2611828	Taastrup	Denmark	Capital Region
2612629	Stenløse	Denmark	Capital Region
2613102	Sønderborg	Denmark	South Denmark
2613460	Slagelse	Denmark	Zealand
2613731	Skive	Denmark	Central Jutland
2614030	Silkeborg	Denmark	Central Jutland
2614481	Roskilde	Denmark	Zealand
2614600	Rødovre	Denmark	Capital Region
2614764	Ringsted	Denmark	Zealand
2615006	Randers	Denmark	Central Jutland
2615876	Odense	Denmark	South Denmark
2615961	Nykøbing Falster	Denmark	Zealand
2616015	Nyborg	Denmark	South Denmark
2616038	Næstved	Denmark	Zealand
2616235	Nørresundby	Denmark	North Denmark
2617658	Lillerød	Denmark	Capital Region
2618361	Korsør	Denmark	Zealand
2618415	Køge	Denmark	Zealand
2618528	Kolding	Denmark	South Denmark
2619154	Kalundborg	Denmark	Zealand
2619377	Ishøj	Denmark	Capital Region
2619528	Hvidovre	Denmark	Capital Region
2619771	Horsens	Denmark	Central Jutland
2619856	Hørsholm	Denmark	Capital Region
2620046	Holstebro	Denmark	Central Jutland
2620147	Holbæk	Denmark	Zealand
2620214	Hjørring	Denmark	North Denmark
2620320	Hillerød	Denmark	Capital Region
2620425	Herning	Denmark	Central Jutland
2620473	Helsingør	Denmark	Capital Region
2620964	Haderslev	Denmark	South Denmark
2621215	Greve	Denmark	Zealand
2621356	Glostrup	Denmark	Capital Region
2621942	Frederiksberg	Denmark	Capital Region
2621951	Fredericia	Denmark	South Denmark
2622306	Farum	Denmark	Capital Region
2622447	Esbjerg	Denmark	South Denmark
2623188	Charlottenlund	Denmark	Capital Region
2624112	Birkerød	Denmark	Capital Region
2624341	Ballerup	Denmark	Capital Region
2624652	Århus	Denmark	Central Jutland
2624886	Aalborg	Denmark	North Denmark
2624906	Albertslund	Denmark	Capital Region
2625070	Aabenraa	Denmark	South Denmark
3575635	Roseau	Dominica	Saint George
3491941	Villa Francisca	Dominican Republic	Nacional
3491946	Villa Consuelo	Dominican Republic	Nacional
3492517	Tamboril	Dominican Republic	Santiago
3492908	Santo Domingo	Dominican Republic	Nacional
3492914	Santiago de los Caballeros	Dominican Republic	Santiago
3492984	Santa Cruz de El Seibo	Dominican Republic	El Seíbo
3492985	Santa Cruz de Barahona	Dominican Republic	Barahona
3493081	San Juan de la Maguana	Dominican Republic	San Juan
3493100	San José de Ocoa	Dominican Republic	San José de Ocoa
3493146	San Francisco de Macorís	Dominican Republic	Duarte
3493174	San Fernando de Monte Cristi	Dominican Republic	Monte Cristi
3493175	Puerto Plata	Dominican Republic	Puerto Plata
3493240	Salvaleón de Higüey	Dominican Republic	La Altagracia
3493283	Salcedo	Dominican Republic	Hermanas Mirabal
3493383	Sabaneta	Dominican Republic	Santiago Rodríguez
3493482	Sabana Grande de Boyá	Dominican Republic	Monte Plata
3493769	Río Grande	Dominican Republic	Puerto Plata
3494121	Quisqueya	Dominican Republic	San Pedro de Macorís
3494242	Punta Cana	Dominican Republic	La Altagracia
3495857	Neiba	Dominican Republic	Baoruco
3496021	Nagua	Dominican Republic	María Trinidad Sánchez
3496134	Monte Plata	Dominican Republic	Monte Plata
3496331	Moca	Dominican Republic	Espaillat
3496831	Mao	Dominican Republic	Valverde
3500370	Las Matas de Farfán	Dominican Republic	San Juan
3500957	La Romana	Dominican Republic	La Romana
3504158	Jarabacoa	Dominican Republic	La Vega
3504765	Hato Mayor del Rey	Dominican Republic	Hato Mayor
3505855	Esperanza	Dominican Republic	Valverde
3508952	Dajabón	Dominican Republic	Dajabón
3509207	Cotuí	Dominican Republic	Sánchez Ramírez
3509363	Constanza	Dominican Republic	La Vega
3509578	Ciudad Nueva	Dominican Republic	Nacional
3511233	Bonao	Dominican Republic	Monseñor Nouel
3511336	Boca Chica	Dominican Republic	Santo Domingo
3511540	San Cristóbal	Dominican Republic	San Cristóbal
3511550	Bella Vista	Dominican Republic	Nacional
3511626	Bayaguana	Dominican Republic	Monte Plata
3512067	Baní	Dominican Republic	Peravia
3512128	Bajos de Haina	Dominican Republic	San Cristóbal
3512208	Azua	Dominican Republic	Azua
7874116	Santo Domingo Oeste	Dominican Republic	Santo Domingo
2474141	Boumerdas	Algeria	Boumerdes
2474506	Zeribet el Oued	Algeria	Biskra
2474583	Zeralda	Algeria	Tipaza
2474638	Zemoura	Algeria	Relizane
2475475	Touggourt	Algeria	Ouargla
2475612	Tolga	Algeria	Biskra
2475687	Tlemcen	Algeria	Tlemcen
2475740	Tizi Rached	Algeria	Tizi Ouzou
2475744	Tizi Ouzou	Algeria	Tizi Ouzou
2475752	Tizi-n-Tleta	Algeria	Tizi Ouzou
2475764	Tizi Gheniff	Algeria	Boumerdes
2475860	Tissemsilt	Algeria	Tissemsilt
2475921	Tirmitine	Algeria	Tizi Ouzou
2476028	Tipasa	Algeria	Tipaza
2476301	Tindouf	Algeria	Tindouf
2476396	Timizart	Algeria	Tizi Ouzou
2476412	el hed	Algeria	Bejaïa
2476897	Tiaret	Algeria	Tiaret
2476915	Theniet el Had	Algeria	Aïn Defla
2476917	Thenia	Algeria	Boumerdes
2477255	Telerghma	Algeria	Mila
2477461	Tébessa	Algeria	Tébessa
2477462	Tebesbest	Algeria	Ouargla
2477528	Tazoult-Lambese	Algeria	Batna
2478216	Tamanrasset	Algeria	Tamanghasset
2478226	Tamalous	Algeria	Skikda
2478831	Tadmaït	Algeria	Boumerdes
2479161	Sour el Ghozlane	Algeria	Bouira
2479183	Souma	Algeria	Blida
2479203	Lardjem	Algeria	Tissemsilt
2479247	Sougueur	Algeria	Tiaret
2479536	Skikda	Algeria	Skikda
2479609	Sig	Algeria	Mascara
2479916	Sidi Okba	Algeria	Biskra
2479966	Sidi Moussa	Algeria	Blida
2480198	Sidi Mérouane	Algeria	Mila
2480368	Sidi Khaled	Algeria	Biskra
2480618	Sidi ech Chahmi	Algeria	Oran
2481007	Sidi Bel Abbès	Algeria	Sidi Bel Abbès
2481058	Sidi Amrane	Algeria	Ouargla
2481207	Sidi Akkacha	Algeria	Chlef
2481246	Sidi Aïssa	Algeria	Mʼsila
2481389	Sidi Abdelli	Algeria	Tlemcen
2481639	Sfizef	Algeria	Sidi Bel Abbès
2481700	Sétif	Algeria	Sétif
2482090	Sedrata	Algeria	Souk Ahras
2482211	Sebdou	Algeria	Tlemcen
2482390	Saoula	Algeria	Tipaza
2482447	Salah Bey	Algeria	Sétif
2482572	Saïda	Algeria	Saïda
2482886	Rouissat	Algeria	Ouargla
2482908	Rouiba	Algeria	Alger
2482939	Rouached	Algeria	Mila
2483000	Robbah	Algeria	El Oued
2483649	Remchi	Algeria	Tlemcen
2483668	Relizane	Algeria	Relizane
2483746	Reguiba	Algeria	El Oued
2483757	Reghaïa	Algeria	Boumerdes
2483761	Reggane	Algeria	Adrar
2483968	Râs el Aïoun	Algeria	Batna
2484620	Oum el Bouaghi	Algeria	Oum el Bouaghi
2484846	Ouled Mimoun	Algeria	Tlemcen
2485572	Oued Sly	Algeria	Chlef
2485582	Oued Rhiou	Algeria	Relizane
2485618	Oued Fodda	Algeria	Chlef
2485633	Oued el Alleug	Algeria	Tipaza
2485636	Oued el Abtal	Algeria	Mascara
2485801	Ouargla	Algeria	Ouargla
2485926	Oran	Algeria	Oran
2486284	Nedroma	Algeria	Tlemcen
2486505	Naciria	Algeria	Boumerdes
2486825	Mouzaïa	Algeria	Tipaza
2487134	Mostaganem	Algeria	Mostaganem
2487452	Mila	Algeria	Mila
2487620	Metlili Chaamba	Algeria	Ghardaïa
2487772	Messaad	Algeria	Djelfa
2487805	Meskiana	Algeria	Oum el Bouaghi
2487852	Mers el Kebir	Algeria	Oran
2487882	Merouana	Algeria	Batna
2488500	Mekla	Algeria	Tizi Ouzou
2488616	Mehdia	Algeria	Tiaret
2488716	Megarine	Algeria	Ouargla
2488722	Meftah	Algeria	Blida
2488835	Médéa	Algeria	Médéa
2489987	Mazouna	Algeria	Relizane
2490098	Mascara	Algeria	Mascara
2490180	Mansourah	Algeria	Bordj Bou Arréridj
2490183	Mansoûra	Algeria	Tlemcen
2490297	Makouda	Algeria	Boumerdes
2491042	L’Arbaa Naït Irathen	Algeria	Tizi Ouzou
2491050	Larbaâ	Algeria	Batna
2491134	Lakhdaria	Algeria	Bouira
2491191	Laghouat	Algeria	Laghouat
2491335	Ksar Chellala	Algeria	Tiaret
2491578	Kolea	Algeria	Tipaza
2491889	Khenchela	Algeria	Khenchela
2491911	Khemis Miliana	Algeria	Aïn Defla
2491913	Khemis el Khechna	Algeria	Boumerdes
2492345	Kerkera	Algeria	Skikda
2492913	Jijel	Algeria	Jijel
2492920	Djidiouia	Algeria	Relizane
2492991	Isser	Algeria	Boumerdes
2493222	I-n-Salah	Algeria	Tamanghasset
2493605	Ighram	Algeria	Tizi Ouzou
2493918	Hennaya	Algeria	Tlemcen
2493956	Héliopolis	Algeria	Guelma
2494029	Hassi Messaoud	Algeria	Ouargla
2494548	Hammamet	Algeria	Tébessa
2494610	Hamma Bouziane	Algeria	Constantine
2494962	Hadjout	Algeria	Tipaza
2495662	Guelma	Algeria	Guelma
2496049	Ghardaïa	Algeria	Ghardaïa
2496232	Frenda	Algeria	Tiaret
2496241	Freha	Algeria	Tizi Ouzou
2496573	Feraoun	Algeria	Bejaïa
2497060	Es Senia	Algeria	Oran
2497323	El Tarf	Algeria	El Tarf
2497411	El Oued	Algeria	El Oued
2497714	El Malah	Algeria	Aïn Temouchent
2497796	El Kseur	Algeria	Bejaïa
2497849	El Khroub	Algeria	Constantine
2497988	El Kala	Algeria	El Tarf
2498000	El Idrissia	Algeria	Djelfa
2498172	El Hadjira	Algeria	Ouargla
2498183	El Hadjar	Algeria	Annaba
2498392	El Eulma	Algeria	Sétif
2498543	El Bayadh	Algeria	El Bayadh
2498590	El Attaf	Algeria	Aïn Defla
2498611	Chlef	Algeria	Chlef
2498704	El Amria	Algeria	Aïn Temouchent
2498752	El Affroun	Algeria	Tipaza
2498766	El Achir	Algeria	Bordj Bou Arréridj
2498775	El Abiodh Sidi Cheikh	Algeria	El Bayadh
2498782	El Abadia	Algeria	Aïn Defla
2498954	Ech Chettia	Algeria	Chlef
2499055	Drean	Algeria	Annaba
2499104	Draa el Mizan	Algeria	Bouira
2499116	Draa Ben Khedda	Algeria	Boumerdes
2499193	Douera	Algeria	Tipaza
2500017	Djelfa	Algeria	Djelfa
2500282	Djamaa	Algeria	Ouargla
2500401	Didouche Mourad	Algeria	Constantine
2500583	Dellys	Algeria	Boumerdes
2500737	Debila	Algeria	El Oued
2500889	Dar el Beïda	Algeria	Alger
2501152	Constantine	Algeria	Constantine
2501289	Chorfa	Algeria	Bouira
2501323	Chiffa	Algeria	Blida
2501362	Chetouane	Algeria	Tlemcen
2501404	Cheria	Algeria	Tébessa
2501465	Cheraga	Algeria	Tipaza
2501508	Chemini	Algeria	Tizi Ouzou
2501541	Chelghoum el Aïd	Algeria	Mila
2501680	Chebli	Algeria	Blida
2501767	Charef	Algeria	Djelfa
2501873	Chabet el Ameur	Algeria	Boumerdes
2502034	Brezina	Algeria	El Bayadh
2502239	Bou Tlelis	Algeria	Oran
2502924	Boukadir	Algeria	Chlef
2502939	Bou Ismaïl	Algeria	Tipaza
2502958	Bouïra	Algeria	Bouira
2502962	Bouinan	Algeria	Blida
2503033	Bou Hanifia el Hamamat	Algeria	Mascara
2503147	Bougara	Algeria	Blida
2503156	Bougaa	Algeria	Sétif
2503181	Boufarik	Algeria	Blida
2503229	Boudouaou	Algeria	Boumerdes
2503237	Boudjima	Algeria	Tizi Ouzou
2503468	Boû Arfa	Algeria	Blida
2503620	Bordj Zemoura	Algeria	Bordj Bou Arréridj
2503654	Bordj Ghdir	Algeria	Bordj Bou Arréridj
2503661	Bordj el Kiffan	Algeria	Alger
2503755	Boghni	Algeria	Tizi Ouzou
2503769	Blida	Algeria	Blida
2503826	Biskra	Algeria	Biskra
2503847	Birkhadem	Algeria	Alger
2503852	Birine	Algeria	Djelfa
2503874	Bir el Djir	Algeria	Oran
2503878	Bir el Ater	Algeria	Tébessa
2504072	Besbes	Algeria	El Tarf
2504099	Berrouaghia	Algeria	Médéa
2504110	Berriane	Algeria	Ghardaïa
2504136	Berrahal	Algeria	Annaba
2504385	Bensekrane	Algeria	Tlemcen
2504486	Ben Mehidi	Algeria	El Tarf
2504581	Beni Saf	Algeria	Aïn Temouchent
2504616	Beni Mester	Algeria	Tlemcen
2504622	Beni Mered	Algeria	Blida
2504703	Beni Douala	Algeria	Tizi Ouzou
2504739	Beni Amrane	Algeria	Boumerdes
2505329	Bejaïa	Algeria	Bejaïa
2505530	Béchar	Algeria	Béchar
2505572	Batna	Algeria	Batna
2505651	Barbacha	Algeria	Bejaïa
2505653	Baraki	Algeria	Tipaza
2505854	Bab Ezzouar	Algeria	Alger
2505915	Azzaba	Algeria	Skikda
2506043	Azazga	Algeria	Tizi Ouzou
2506404	Arris	Algeria	Batna
2506519	Arhribs	Algeria	Tizi Ouzou
2506623	Arbatache	Algeria	Boumerdes
2506795	Aoulef	Algeria	Adrar
2506999	Annaba	Algeria	Annaba
2507155	Ammi Moussa	Algeria	Relizane
2507169	Amizour	Algeria	Bejaïa
2507480	Algiers	Algeria	Alger
2507877	Aïn Touta	Algeria	Batna
2507901	Aïn Temouchent	Algeria	Aïn Temouchent
2507912	Aïn Taya	Algeria	Alger
2507926	Aïn Smara	Algeria	Constantine
2507943	Aïn Sefra	Algeria	Naama النعامة
2507972	Aïn Oussera	Algeria	Djelfa
2508010	’Aïn Merane	Algeria	Relizane
2508059	Aïn Kercha	Algeria	Oum el Bouaghi
2508102	Aïn Fakroun	Algeria	Oum el Bouaghi
2508119	’Aïn el Turk	Algeria	Oran
2508130	’Aïn el Melh	Algeria	Mʼsila
2508157	‘Aïn el Hadjel	Algeria	Mʼsila
2508174	Aïn el Bya	Algeria	Oran
2508180	’Aïn el Berd	Algeria	Sidi Bel Abbès
2508184	’Aïn el Bell	Algeria	Djelfa
2508225	’Aïn Deheb	Algeria	Tiaret
2508228	Aïn Defla	Algeria	Aïn Defla
2508268	Aïn Bessem	Algeria	Bouira
2508275	’Aïn Benian	Algeria	Tipaza
2508287	Aïn Beïda	Algeria	Oum el Bouaghi
2508297	Aïn Arnat	Algeria	Sétif
2508309	’Aïn Abid	Algeria	Constantine
2508737	Aflou	Algeria	Laghouat
2508813	Adrar	Algeria	Adrar
2509031	Abou el Hassan	Algeria	Chlef
6698360	BABOR - VILLE	Algeria	Sétif
3649959	Zamora	Ecuador	Zamora-Chinchipe
3650121	Yaguachi Nuevo	Ecuador	Guayas
3650186	Vinces	Ecuador	Los Ríos
3650267	Ventanas	Ecuador	Los Ríos
3650472	Tulcán	Ecuador	Carchi
3650721	Tena	Ecuador	Napo
3650960	Sucre	Ecuador	Manabí
3651297	Santo Domingo de los Colorados	Ecuador	Santo Domingo de los Tsáchilas
3651356	Santa Rosa	Ecuador	El Oro
3651438	Santa Elena	Ecuador	Santa Elena
3651694	San Lorenzo de Esmeraldas	Ecuador	Esmeraldas
3651868	San Gabriel	Ecuador	Carchi
3652065	Samborondón	Ecuador	Guayas
3652100	Salinas	Ecuador	Santa Elena
3652257	Rosa Zarate	Ecuador	Esmeraldas
3652350	Riobamba	Ecuador	Chimborazo
3652462	Quito	Ecuador	Pichincha
3652567	Quevedo	Ecuador	Los Ríos
3652584	Puyo	Ecuador	Pastaza
3652684	Pujilí	Ecuador	Cotopaxi
3652941	Portoviejo	Ecuador	Manabí
3653015	Playas	Ecuador	Guayas
3653130	Piñas	Ecuador	El Oro
3653287	Pelileo	Ecuador	Tungurahua
3653295	Pedro Carbo	Ecuador	Guayas
3653403	Pasaje	Ecuador	El Oro
3653693	Otavalo	Ecuador	Imbabura
3653873	Naranjito	Ecuador	Guayas
3653882	Naranjal	Ecuador	Guayas
3654055	Montecristi	Ecuador	Manabí
3654064	Montalvo	Ecuador	Los Ríos
3654410	Manta	Ecuador	Manabí
3654533	Machala	Ecuador	El Oro
3654536	Machachi	Ecuador	Pichincha
3654541	Macas	Ecuador	Morona-Santiago
3654667	Loja	Ecuador	Loja
3654853	La Troncal	Ecuador	Cañar
3654870	Latacunga	Ecuador	Cotopaxi
3655117	La Maná	Ecuador	Cotopaxi
3655131	La Libertad	Ecuador	Guayas
3655446	Jipijapa	Ecuador	Manabí
3655673	Ibarra	Ecuador	Imbabura
3655720	Huaquillas	Ecuador	El Oro
3657509	Guayaquil	Ecuador	Guayas
3657571	Guaranda	Ecuador	Bolívar
3657670	Gualaceo	Ecuador	Azuay
3657990	Esmeraldas	Ecuador	Esmeraldas
3658053	El Triunfo	Ecuador	Guayas
3658192	Eloy Alfaro	Ecuador	Guayas
3658666	Cuenca	Ecuador	Azuay
3659139	Chone	Ecuador	Manabí
3659578	Cayambe	Ecuador	Pichincha
3659599	Catamayo	Ecuador	Loja
3659711	Cariamanga	Ecuador	Loja
3659926	Calceta	Ecuador	Manabí
3660152	Boca Suno	Ecuador	Orellana
3660361	Balzar	Ecuador	Guayas
3660418	Babahoyo	Ecuador	Los Ríos
3660434	Azogues	Ecuador	Cañar
3660478	Atuntaqui	Ecuador	Imbabura
3660689	Ambato	Ecuador	Tungurahua
10277901	Tutamandahostel	Ecuador	Pichincha
587577	Viljandi	Estonia	Viljandimaa
588335	Tartu	Estonia	Tartu
588409	Tallinn	Estonia	Harjumaa
588686	Sillamäe	Estonia	Ida-Virumaa
589165	Rakvere	Estonia	Lääne-Virumaa
589580	Pärnu	Estonia	Pärnumaa
590031	Narva	Estonia	Ida-Virumaa
590447	Maardu	Estonia	Harjumaa
591260	Kohtla-Järve	Estonia	Ida-Virumaa
347236	Toukh	Egypt	Muḩāfaz̧at al Qalyūbīyah
347497	Tanda	Egypt	Muḩāfaz̧at al Gharbīyah
347542	Ţāmiyah	Egypt	Muḩāfaz̧at al Fayyūm
347591	Ţalkhā	Egypt	Muḩāfaz̧at ad Daqahlīyah
347612	Talā	Egypt	Muḩāfaz̧at al Minūfīyah
347634	Ţahţā	Egypt	Sūhāj
347749	Sumusţā as Sulţānī	Egypt	Muḩāfaz̧at Banī Suwayf
347796	Sohag	Egypt	Sūhāj
348112	Sīdī Sālim	Egypt	Kafr ash Shaykh
349156	Shibīn al Qanāţir	Egypt	Muḩāfaz̧at al Qalyūbīyah
349158	Shibīn al Kawm	Egypt	Muḩāfaz̧at al Minūfīyah
349715	Samannūd	Egypt	Muḩāfaz̧at al Gharbīyah
349717	Samālūţ	Egypt	Al Minyā
350203	Rosetta	Egypt	Al Buḩayrah
350207	Ras Gharib	Egypt	Red Sea
350370	Quwaysinā	Egypt	Muḩāfaz̧at al Minūfīyah
350376	Quţūr	Egypt	Muḩāfaz̧at al Gharbīyah
350422	Kousa	Egypt	Qinā
350550	Qinā	Egypt	Qinā
351434	Naj‘ Ḩammādī	Egypt	Qinā
352344	Minyat an Naşr	Egypt	Muḩāfaz̧at ad Daqahlīyah
352354	Minūf	Egypt	Muḩāfaz̧at al Minūfīyah
352628	Maţāy	Egypt	Al Minyā
352679	Mashtūl as Sūq	Egypt	Eastern Province
352733	Mersa Matruh	Egypt	Muḩāfaz̧at Maţrūḩ
352913	Manfalūţ	Egypt	Asyūţ
352951	Mallawī	Egypt	Al Minyā
353219	Madīnat Sittah Uktūbar	Egypt	Al Jīzah
353802	Kawm Umbū	Egypt	Aswān
353828	Kawm Ḩamādah	Egypt	Al Buḩayrah
354105	Kafr Şaqr	Egypt	Eastern Province
354365	Kafr az Zayyāt	Egypt	Muḩāfaz̧at al Gharbīyah
354502	Kafr ash Shaykh	Egypt	Kafr ash Shaykh
354775	Kafr ad Dawwār	Egypt	Al Buḩayrah
354981	Juhaynah	Egypt	Sūhāj
355026	Jirjā	Egypt	Sūhāj
355392	‘Izbat al Burj	Egypt	Muḩāfaz̧at ad Daqahlīyah
355420	Iţsā	Egypt	Muḩāfaz̧at al Fayyūm
355449	Isnā	Egypt	Qinā
355628	Idkū	Egypt	Al Buḩayrah
355635	Idfū	Egypt	Aswān
355795	Ḩalwān	Egypt	Cairo Governorate
355939	Hihyā	Egypt	Eastern Province
356000	Ḩawsh ‘Īsá	Egypt	Al Buḩayrah
356806	Fuwwah	Egypt	Kafr ash Shaykh
356933	Farshūţ	Egypt	Qinā
356945	Fāraskūr	Egypt	Dumyāţ
356989	Fāqūs	Egypt	Eastern Province
358048	Damietta	Egypt	Dumyāţ
358095	Diyarb Najm	Egypt	Eastern Province
358108	Disūq	Egypt	Kafr ash Shaykh
358115	Dishnā	Egypt	Qinā
358172	Dikirnis	Egypt	Muḩāfaz̧at ad Daqahlīyah
358269	Dayrūţ	Egypt	Asyūţ
358274	Dayr Mawās	Egypt	Al Minyā
358448	Damanhūr	Egypt	Al Buḩayrah
358600	Būsh	Egypt	Muḩāfaz̧at Banī Suwayf
358620	Būr Safājah	Egypt	Red Sea
358821	Bilqās	Egypt	Muḩāfaz̧at ad Daqahlīyah
358840	Bilbays	Egypt	Eastern Province
358970	Basyūn	Egypt	Muḩāfaz̧at al Gharbīyah
359173	Banī Suwayf	Egypt	Muḩāfaz̧at Banī Suwayf
359212	Banī Mazār	Egypt	Al Minyā
359280	Banhā	Egypt	Muḩāfaz̧at al Qalyūbīyah
359493	Zagazig	Egypt	Eastern Province
359576	Awsīm	Egypt	Al Jīzah
359710	At Tall al Kabīr	Egypt	Al Ismā‘īlīyah
359783	Asyūţ	Egypt	Asyūţ
359792	Aswan	Egypt	Aswān
359796	Suez	Egypt	As Suways
359900	Aş Şaff	Egypt	Al Jīzah
359953	Ash Shuhadā’	Egypt	Muḩāfaz̧at al Minūfīyah
360048	Ashmūn	Egypt	Muḩāfaz̧at al Minūfīyah
360464	Al Wāsiţah	Egypt	Muḩāfaz̧at al Fayyūm
360502	Luxor	Egypt	Luxor
360526	Al Qūşīyah	Egypt	Asyūţ
360531	Al Quşayr	Egypt	Red Sea
360542	Al Qurayn	Egypt	Eastern Province
360612	Al Qanāyāt	Egypt	Eastern Province
360630	Cairo	Egypt	Cairo Governorate
360686	Al Minyā	Egypt	Al Minyā
360716	Al Maţarīyah	Egypt	Muḩāfaz̧at ad Daqahlīyah
360754	Al Manzilah	Egypt	Muḩāfaz̧at ad Daqahlīyah
360761	Al Manşūrah	Egypt	Muḩāfaz̧at ad Daqahlīyah
360773	Al Manshāh	Egypt	Sūhāj
360829	Al Maḩallah al Kubrá	Egypt	Muḩāfaz̧at al Gharbīyah
360923	Al Khārijah	Egypt	Muḩāfaz̧at al Wādī al Jadīd
360928	Al Khānkah	Egypt	Muḩāfaz̧at al Qalyūbīyah
360995	Al Jīzah	Egypt	Al Jīzah
361029	Al Jamālīyah	Egypt	Muḩāfaz̧at ad Daqahlīyah
361055	Ismailia	Egypt	Al Ismā‘īlīyah
361058	Alexandria	Egypt	Alexandria
361103	Al Ibrāhīmīyah	Egypt	Eastern Province
361179	Al Ḩawāmidīyah	Egypt	Al Jīzah
361213	Al Ḩāmūl	Egypt	Kafr ash Shaykh
361291	Hurghada	Egypt	Red Sea
361320	Al Fayyūm	Egypt	Muḩāfaz̧at al Fayyūm
361329	Al Fashn	Egypt	Muḩāfaz̧at Banī Suwayf
361394	Al Bawīţī	Egypt	Al Jīzah
361435	Al Balyanā	Egypt	Sūhāj
361457	Al Bājūr	Egypt	Muḩāfaz̧at al Minūfīyah
361478	Al Badārī	Egypt	Asyūţ
361495	Al ‘Ayyāţ	Egypt	Al Jīzah
361546	Arish	Egypt	Shamāl Sīnāʼ
361661	Akhmīm	Egypt	Sūhāj
361827	Ad Dilinjāt	Egypt	Al Buḩayrah
362004	Abū Tīj	Egypt	Asyūţ
362277	Abū Qurqāş	Egypt	Al Minyā
362485	Abū Kabīr	Egypt	Eastern Province
362882	Abū al Maţāmīr	Egypt	Al Buḩayrah
362973	Abnūb	Egypt	Asyūţ
419435	Az Zarqā	Egypt	Dumyāţ
7521348	Ain Sukhna	Egypt	As Suways
2461874	Smara	Western Sahara	Oued Ed-Dahab-Lagouira
2462881	Laâyoune / El Aaiún	Western Sahara	Oued Ed-Dahab-Lagouira
2463447	Dakhla	Western Sahara	Oued Ed-Dahab-Lagouira
330546	Massawa	Eritrea	Northern Red Sea Region
333287	Keren	Eritrea	Ānseba
342711	Barentu	Eritrea	Gash Barka
344901	Mendefera	Eritrea	Debub
2509305	Zubia	Spain	Andalusia
2509377	Zafra	Spain	Extremadura
2509402	Yecla	Spain	Murcia
2509463	Villena	Spain	Valencia
2509491	Villarrobledo	Spain	Castille-La Mancha
2509509	Vila-real	Spain	Valencia
2509553	Villanueva de la Serena	Spain	Extremadura
2509588	Villajoyosa	Spain	Valencia
2509650	Vícar	Spain	Andalusia
2509769	Vélez-Málaga	Spain	Andalusia
2509954	Valencia	Spain	Valencia
2509982	Valdepeñas	Spain	Castille-La Mancha
2510073	Utrera	Spain	Andalusia
2510112	Ubrique	Spain	Andalusia
2510116	Úbeda	Spain	Andalusia
2510224	Totana	Spain	Murcia
2510245	Torrox	Spain	Andalusia
2510253	Torrevieja	Spain	Valencia
2510271	Torre-Pacheco	Spain	Murcia
2510281	Torremolinos	Spain	Andalusia
2510392	Tomelloso	Spain	Castille-La Mancha
2510394	Tomares	Spain	Andalusia
2510409	Toledo	Spain	Castille-La Mancha
2510485	Tías	Spain	Canary Islands
2510542	Telde	Spain	Canary Islands
2510573	Teguise	Spain	Canary Islands
2510599	Tarifa	Spain	Andalusia
2510725	Tacoronte	Spain	Canary Islands
2510743	Tavernes de la Valldigna	Spain	Valencia
2510764	Sueca	Spain	Valencia
2510880	Silla	Spain	Valencia
2510911	Sevilla	Spain	Andalusia
2511032	San Vicent del Raspeig	Spain	Valencia
2511050	Santomera	Spain	Murcia
2511102	Santa Pola	Spain	Valencia
2511150	Santa Lucía	Spain	Canary Islands
2511160	Santafé	Spain	Andalusia
2511162	Santa Eulària des Riu	Spain	Balearic Islands
2511174	Santa Cruz de Tenerife	Spain	Canary Islands
2511180	Santa Cruz de la Palma	Spain	Canary Islands
2511202	Santa Brígida	Spain	Canary Islands
2511239	San Roque	Spain	Andalusia
2511247	San Pedro del Pinatar	Spain	Murcia
2511250	San Pedro de Alcántara	Spain	Andalusia
2511287	San Miguel De Abona	Spain	Canary Islands
2511306	Sanlúcar de Barrameda	Spain	Andalusia
2511329	San Juan de Aznalfarache	Spain	Andalusia
2511330	San Juan de Alicante	Spain	Valencia
2511366	San Javier	Spain	Murcia
2511371	San Isidro	Spain	Canary Islands
2511388	San Fernando	Spain	Andalusia
2511440	San Bartolomé de Tirajana	Spain	Canary Islands
2511447	San Bartolomé	Spain	Canary Islands
2511448	Sant Antoni de Portmany	Spain	Balearic Islands
2511619	Sagunto	Spain	Valencia
2511700	Rota	Spain	Andalusia
2511716	Roquetas de Mar	Spain	Andalusia
2511730	Ronda	Spain	Andalusia
2511752	Rojales	Spain	Valencia
2511852	Rincón de la Victoria	Spain	Andalusia
2511880	Ribarroja	Spain	Valencia
2511930	Requena	Spain	Valencia
2511994	Realejo Alto	Spain	Canary Islands
2512127	Puçol	Spain	Valencia
2512169	Puerto Real	Spain	Andalusia
2512186	Puerto del Rosario	Spain	Canary Islands
2512196	Puerto de la Cruz	Spain	Canary Islands
2512232	Puente-Genil	Spain	Andalusia
2512251	La Pobla de Vallbona	Spain	Valencia
2512282	Priego de Córdoba	Spain	Andalusia
2512340	Pozoblanco	Spain	Andalusia
2512432	Pollença	Spain	Balearic Islands
2512581	Pilar de la Horadada	Spain	Valencia
2512620	Picassent	Spain	Valencia
2512862	Paterna	Spain	Valencia
2512989	Palma	Spain	Balearic Islands
2512990	Palma del Río	Spain	Andalusia
2513026	Pájara	Spain	Canary Islands
2513029	Paiporta	Spain	Valencia
2513052	Osuna	Spain	Andalusia
2513076	Orihuela	Spain	Valencia
2513106	Ontinyent	Spain	Valencia
2513115	Onda	Spain	Valencia
2513145	Oliva	Spain	Valencia
2513195	Novelda	Spain	Valencia
2513222	Níjar	Spain	Andalusia
2513240	Nerja	Spain	Andalusia
2513416	Murcia	Spain	Murcia
2513436	Mula	Spain	Murcia
2513465	Muchamiel	Spain	Valencia
2513477	Motril	Spain	Andalusia
2513509	Morón de la Frontera	Spain	Andalusia
2513601	Montilla	Spain	Andalusia
2513604	Montijo	Spain	Extremadura
2513703	Moncada	Spain	Valencia
2513759	Molina de Segura	Spain	Murcia
2513791	Moguer	Spain	Andalusia
2513798	Mogán	Spain	Canary Islands
2513811	Mislata	Spain	Valencia
2513882	Mijas	Spain	Andalusia
2513917	Mérida	Spain	Extremadura
2513947	Melilla	Spain	Melilla
2513983	Mazarrón	Spain	Murcia
2514066	Massamagrell	Spain	Valencia
2514073	Martos	Spain	Andalusia
2514097	Marratxí	Spain	Balearic Islands
2514158	Marchena	Spain	Andalusia
2514169	Marbella	Spain	Andalusia
2514176	Maracena	Spain	Andalusia
2514190	Manzanares	Spain	Castille-La Mancha
2514197	Manises	Spain	Valencia
2514216	Manacor	Spain	Balearic Islands
2514256	Málaga	Spain	Andalusia
2514287	Mairena del Aljarafe	Spain	Andalusia
2514288	Mairena del Alcor	Spain	Andalusia
2514301	Maó	Spain	Balearic Islands
2514392	Lucena	Spain	Andalusia
2514651	Los Llanos de Aridane	Spain	Canary Islands
2514824	Los Barrios	Spain	Andalusia
2514868	Los Alcázares	Spain	Murcia
2514891	Lorca	Spain	Murcia
2514893	Lora del Río	Spain	Andalusia
2514946	Loja	Spain	Andalusia
2514984	Llucmajor	Spain	Balearic Islands
2515036	Llíria	Spain	Valencia
2515045	Linares	Spain	Andalusia
2515072	Lepe	Spain	Andalusia
2515151	La Unión	Spain	Murcia
2515219	Las Torres de Cotillas	Spain	Murcia
2515270	Las Palmas de Gran Canaria	Spain	Canary Islands
2515284	La Solana	Spain	Castille-La Mancha
2515493	Las Cabezas de San Juan	Spain	Andalusia
2515555	La Roda	Spain	Castille-La Mancha
2515562	La Rinconada	Spain	Andalusia
2515692	La Orotava	Spain	Canary Islands
2515698	La Oliva	Spain	Canary Islands
2515701	la Nucia	Spain	Valencia
2516004	L'Eliana	Spain	Valencia
2516088	La Carolina	Spain	Andalusia
2516255	Jumilla	Spain	Murcia
2516326	Jerez de la Frontera	Spain	Andalusia
2516336	Javea	Spain	Valencia
2516345	Xàtiva	Spain	Valencia
2516395	Jaén	Spain	Andalusia
2516431	Isla Cristina	Spain	Andalusia
2516443	Ingenio	Spain	Canary Islands
2516452	Inca	Spain	Balearic Islands
2516474	Icod de los Vinos	Spain	Canary Islands
2516479	Ibiza	Spain	Balearic Islands
2516480	Ibi	Spain	Valencia
2516542	Huércal-Overa	Spain	Andalusia
2516548	Huelva	Spain	Andalusia
2516797	Hellín	Spain	Castille-La Mancha
2516852	Güimar	Spain	Canary Islands
2516860	Guía de Isora	Spain	Canary Islands
2516902	Guardamar del Segura	Spain	Valencia
2516925	Guadix	Spain	Andalusia
2517117	Granada	Spain	Andalusia
2517367	Gandia	Spain	Valencia
2517436	Gáldar	Spain	Canary Islands
2517595	Fuengirola	Spain	Andalusia
2517750	Felanitx	Spain	Balearic Islands
2517816	Estepona	Spain	Andalusia
2518040	El Viso del Alcor	Spain	Andalusia
2518207	El Puerto de Santa María	Spain	Andalusia
2518494	El Ejido	Spain	Andalusia
2518505	Elda	Spain	Valencia
2518559	Elche	Spain	Valencia
2518729	El Arahal	Spain	Andalusia
2518770	Écija	Spain	Andalusia
2518794	Dos Hermanas	Spain	Andalusia
2518820	Don Benito	Spain	Extremadura
2518878	Denia	Spain	Valencia
2518924	Daimiel	Spain	Castille-La Mancha
2518949	Cullera	Spain	Valencia
2519110	Crevillente	Spain	Valencia
2519233	Coria del Río	Spain	Andalusia
2519240	Córdoba	Spain	Andalusia
2519289	Conil de la Frontera	Spain	Andalusia
2519367	Coín	Spain	Andalusia
2519402	Ciudad Real	Spain	Castille-La Mancha
2519425	Cieza	Spain	Murcia
2519466	Xirivella	Spain	Valencia
2519477	Chipiona	Spain	Andalusia
2519513	Chiclana de la Frontera	Spain	Andalusia
2519651	Cehegín	Spain	Murcia
2519690	Catarroja	Spain	Valencia
2519738	Castilleja de la Cuesta	Spain	Andalusia
2519752	Castelló de la Plana	Spain	Valencia
2520052	Cartaya	Spain	Andalusia
2520055	Cártama	Spain	Andalusia
2520058	Cartagena	Spain	Murcia
2520118	Carmona	Spain	Andalusia
2520150	Carcaixent	Spain	Valencia
2520171	Caravaca	Spain	Murcia
2520283	Candelaria	Spain	Canary Islands
2520413	Campo de Criptana	Spain	Castille-La Mancha
2520425	Campiña	Spain	Andalusia
2520447	el Campello	Spain	Valencia
2520477	Camas	Spain	Andalusia
2520493	Calvià	Spain	Balearic Islands
2520496	Calp	Spain	Valencia
2520502	Callosa de Segura	Spain	Valencia
2520600	Cadiz	Spain	Andalusia
2520611	Cáceres	Spain	Extremadura
2520645	Cabra	Spain	Andalusia
2520709	Burriana	Spain	Valencia
2520833	Bormujos	Spain	Andalusia
2520968	Bétera	Spain	Valencia
2521016	Berja	Spain	Andalusia
2521088	Benidorm	Spain	Valencia
2521105	Benetússer	Spain	Valencia
2521139	Benalmádena	Spain	Andalusia
2521215	Baza	Spain	Andalusia
2521335	Barbate de Franco	Spain	Andalusia
2521410	Bailén	Spain	Andalusia
2521413	Baeza	Spain	Andalusia
2521415	Baena	Spain	Andalusia
2521420	Badajoz	Spain	Extremadura
2521456	Ayamonte	Spain	Andalusia
2521485	Atarfe	Spain	Andalusia
2521510	Aspe	Spain	Valencia
2521519	Arucas	Spain	Canary Islands
2521570	Arrecife	Spain	Canary Islands
2521582	Arona	Spain	Canary Islands
2521590	Armilla	Spain	Andalusia
2521665	Arcos de la Frontera	Spain	Andalusia
2521676	Archena	Spain	Murcia
2521710	Antequera	Spain	Andalusia
2521738	Andújar	Spain	Andalusia
2521804	Altea	Spain	Valencia
2521847	Almuñécar	Spain	Andalusia
2521855	Almoradí	Spain	Valencia
2521857	Almonte	Spain	Andalusia
2521886	Almería	Spain	Andalusia
2521909	Almassora	Spain	Valencia
2521964	Aljaraque	Spain	Andalusia
2521978	Alicante	Spain	Valencia
2521985	Alhaurín el Grande	Spain	Andalusia
2521986	Alhaurín de la Torre	Spain	Andalusia
2521992	Alhama de Murcia	Spain	Murcia
2522012	Algemesí	Spain	Valencia
2522013	Algeciras	Spain	Andalusia
2522057	Alfafar	Spain	Valencia
2522077	Aldaia	Spain	Valencia
2522098	Alcoy	Spain	Valencia
2522129	Alzira	Spain	Valencia
2522131	Alcázar de San Juan	Spain	Castille-La Mancha
2522152	Alcantarilla	Spain	Murcia
2522160	Alcalá la Real	Spain	Andalusia
2522165	Alcalá de Guadaira	Spain	Andalusia
2522203	Alboraya	Spain	Valencia
2522208	Albolote	Spain	Andalusia
2522250	Albal	Spain	Valencia
2522258	Albacete	Spain	Castille-La Mancha
2522297	Alaquàs	Spain	Valencia
2522325	Agüimes	Spain	Canary Islands
2522333	Águilas	Spain	Murcia
2522430	Adra	Spain	Andalusia
2522437	Adeje	Spain	Canary Islands
3104316	Zarautz	Spain	Basque Country
3104324	Zaragoza	Spain	Aragon
3104342	Zamora	Spain	Castille and León
3104475	Viveiro	Spain	Galicia
3104499	Gasteiz / Vitoria	Spain	Basque Country
3104584	Vinaròs	Spain	Valencia
3104703	Villaviciosa de Odón	Spain	Madrid
3104748	Villaverde	Spain	Madrid
3105148	Villaquilambre	Spain	Castille and León
3105184	Vilanova i la Geltrú	Spain	Catalonia
3105214	Villanueva del Pardillo	Spain	Madrid
3105247	Villanueva de la Cañada	Spain	Madrid
3105522	Vilalba	Spain	Galicia
3105575	Vilagarcía de Arousa	Spain	Galicia
3105803	Vila-seca	Spain	Catalonia
3105805	Vilaseca	Spain	Catalonia
3105935	Viladecans	Spain	Catalonia
3105976	Vigo	Spain	Galicia
3106050	Vic	Spain	Catalonia
3106054	Vicálvaro	Spain	Madrid
3106180	El Vendrell	Spain	Catalonia
3106492	Valls	Spain	Catalonia
3106672	Valladolid	Spain	Castille and León
3106868	Valdemoro	Spain	Madrid
3107112	Rivas-Vaciamadrid	Spain	Madrid
3107139	Utebo	Spain	Aragon
3107364	Tui	Spain	Galicia
3107418	Tudela	Spain	Navarre
3107677	Tortosa	Spain	Catalonia
3107765	Torrelodones	Spain	Madrid
3107775	Torrelavega	Spain	Cantabria
3107784	Torrejón de Ardoz	Spain	Madrid
3107807	Torredembarra	Spain	Catalonia
3107955	Tordera	Spain	Catalonia
3108008	Tolosa	Spain	Basque Country
3108126	Teruel	Spain	Aragon
3108165	Teo	Spain	Galicia
3108285	Tàrrega	Spain	Catalonia
3108286	Terrassa	Spain	Catalonia
3108288	Tarragona	Spain	Catalonia
3108317	Tarancón	Spain	Castille-La Mancha
3108681	Soria	Spain	Castille and León
3108877	Sitges	Spain	Catalonia
3109041	Sestao	Spain	Basque Country
3109050	Seseña	Spain	Castille-La Mancha
3109256	Segovia	Spain	Castille and León
3109402	Cerdanyola del Vallès	Spain	Catalonia
3109442	Sant Vicenç dels Horts	Spain	Catalonia
3109453	Barakaldo	Spain	Basque Country
3109481	Santurtzi	Spain	Basque Country
3109546	Sant Just Desvern	Spain	Catalonia
3109689	Santa Perpètua de Mogoda	Spain	Catalonia
3109718	Santander	Spain	Cantabria
3109804	Barberà del Vallès	Spain	Catalonia
3109981	Santa Coloma de Gramenet	Spain	Catalonia
3110040	San Sebastián de los Reyes	Spain	Madrid
3110044	Donostia / San Sebastián	Spain	Basque Country
3110101	Sant Quirze del Vallès	Spain	Catalonia
3110143	Sant Pere de Ribes	Spain	Catalonia
3110360	San Martín de la Vega	Spain	Madrid
3110458	San Lorenzo de El Escorial	Spain	Madrid
3110516	Vilassar de Mar	Spain	Catalonia
3110519	Sant Joan Despí	Spain	Catalonia
3110610	Sanxenxo	Spain	Galicia
3110627	San Fernando de Henares	Spain	Madrid
3110642	Sant Feliu de Llobregat	Spain	Catalonia
3110643	Sant Feliu de Guíxols	Spain	Catalonia
3110718	Sant Cugat del Vallès	Spain	Catalonia
3110813	Sant Celoni	Spain	Catalonia
3110834	Sant Boi de Llobregat	Spain	Catalonia
3110876	Sant Andreu de Palomar	Spain	Catalonia
3110880	San Andrés del Rabanedo	Spain	Castille and León
3110885	Sant Andreu de la Barca	Spain	Catalonia
3110921	Sant Adrià de Besòs	Spain	Catalonia
3110962	Sama	Spain	Asturias
3110983	Salt	Spain	Catalonia
3110986	Salou	Spain	Catalonia
3111108	Salamanca	Spain	Castille and León
3111199	Sabadell	Spain	Catalonia
3111294	Rubí	Spain	Catalonia
3111348	Roses	Spain	Catalonia
3111605	Ripollet	Spain	Catalonia
3111807	Ribeira	Spain	Galicia
3111933	Reus	Spain	Catalonia
3112011	Errenteria	Spain	Basque Country
3112154	Redondela	Spain	Galicia
3112737	Puente de Vallecas	Spain	Madrid
3112761	Ponteareas	Spain	Galicia
3112989	Pozuelo de Alarcón	Spain	Madrid
3113035	Poio	Spain	Galicia
3113082	Portugalete	Spain	Basque Country
3113157	Porriño	Spain	Galicia
3113209	Pontevedra	Spain	Galicia
3113331	Plasencia	Spain	Extremadura
3113415	Pinto	Spain	Madrid
3113526	Pineda de Mar	Spain	Catalonia
3114256	Parla	Spain	Madrid
3114267	Parets del Vallès	Spain	Catalonia
3114472	Pamplona	Spain	Navarre
3114531	Palencia	Spain	Castille and León
3114566	Palamós	Spain	Catalonia
3114567	Palafrugell	Spain	Catalonia
3114711	Oviedo	Spain	Asturias
3114957	Oria	Spain	Basque Country
3114965	Ourense	Spain	Galicia
3115093	Olot	Spain	Catalonia
3115171	Olesa de Montserrat	Spain	Catalonia
3115177	Oleiros	Spain	Galicia
3115463	Nigrán	Spain	Galicia
3115659	Navalcarnero	Spain	Madrid
3115907	Mungia	Spain	Basque Country
3116025	Móstoles	Spain	Madrid
3116156	Moratalaz	Spain	Madrid
3116224	Monzón	Spain	Aragon
3116262	Montornès del Vallès	Spain	Catalonia
3116478	Monforte de Lemos	Spain	Galicia
3116503	Arrasate / Mondragón	Spain	Basque Country
3116527	Montcada i Reixac	Spain	Catalonia
3116553	Mollet del Vallès	Spain	Catalonia
3116562	Molins de Rei	Spain	Catalonia
3116653	Moaña	Spain	Galicia
3116789	Mieres	Spain	Asturias
3116963	Mejorada del Campo	Spain	Madrid
3117010	Medina del Campo	Spain	Castille and León
3117164	Mataró	Spain	Catalonia
3117232	El Masnou	Spain	Catalonia
3117331	Martorell	Spain	Catalonia
3117409	Marín	Spain	Galicia
3117533	Manresa	Spain	Catalonia
3117539	Manlleu	Spain	Catalonia
3117636	Malgrat de Mar	Spain	Catalonia
3117667	Majadahonda	Spain	Madrid
3117735	Madrid	Spain	Madrid
3117814	Lugo	Spain	Galicia
3118150	Logroño	Spain	La Rioja
3118212	Lloret de Mar	Spain	Catalonia
3118228	Laudio / Llodio	Spain	Basque Country
3118514	Lleida	Spain	Catalonia
3118532	León	Spain	Castille and León
3118554	Leioa	Spain	Basque Country
3118594	Leganés	Spain	Madrid
3119027	Lasarte	Spain	Basque Country
3119231	La Pineda	Spain	Catalonia
3119536	Lalín	Spain	Galicia
3119631	Laguna de Duero	Spain	Castille and León
3119746	A Estrada	Spain	Galicia
3119841	A Coruña	Spain	Galicia
3120304	Irun	Spain	Basque Country
3120410	Illescas	Spain	Castille-La Mancha
3120431	Igualada	Spain	Catalonia
3120501	Humanes de Madrid	Spain	Madrid
3120514	Huesca	Spain	Aragon
3120619	L'Hospitalet de Llobregat	Spain	Catalonia
3120635	Hortaleza	Spain	Madrid
3120811	Hernani	Spain	Basque Country
3120989	Gernika-Lumo	Spain	Basque Country
3121007	Getxo	Spain	Basque Country
3121145	Granollers	Spain	Catalonia
3121245	Gràcia	Spain	Catalonia
3121424	Gijón	Spain	Asturias
3121437	Getafe	Spain	Madrid
3121456	Girona	Spain	Catalonia
3121519	Gavà	Spain	Catalonia
3121751	Galdakao	Spain	Basque Country
3121766	Galapagar	Spain	Madrid
3121881	Hondarribia	Spain	Basque Country
3121960	Fuenlabrada	Spain	Madrid
3122452	Figueras	Spain	Asturias
3122453	Figueres	Spain	Catalonia
3122826	Esplugues de Llobregat	Spain	Catalonia
3122912	Esparreguera	Spain	Catalonia
3123063	Ermua	Spain	Basque Country
3123104	Erandio	Spain	Basque Country
3123493	Ferrol	Spain	Galicia
3123667	El Astillero	Spain	Cantabria
3123688	Ejea de los Caballeros	Spain	Aragon
3123709	Eibar	Spain	Basque Country
3123773	Durango	Spain	Basque Country
3124041	Culleredo	Spain	Galicia
3124132	Cuenca	Spain	Castille-La Mancha
3124408	Coslada	Spain	Madrid
3124569	Cornellà de Llobregat	Spain	Catalonia
3124765	Colmenar Viejo	Spain	Madrid
3124794	Collado-Villalba	Spain	Madrid
3124964	Ciudad Lineal	Spain	Madrid
3124967	Ciutadella	Spain	Balearic Islands
3125082	Ciempozuelos	Spain	Madrid
3125239	Chamartín	Spain	Madrid
3125621	Castro-Urdiales	Spain	Cantabria
3125897	Castelldefels	Spain	Catalonia
3126317	Cardedeu	Spain	Catalonia
3126369	Carballo	Spain	Galicia
3126534	Canovelles	Spain	Catalonia
3126577	Cangas do Morrazo	Spain	Galicia
3126888	Cambrils	Spain	Catalonia
3126890	Cambre	Spain	Galicia
3126917	Camargo	Spain	Cantabria
3127007	Calella	Spain	Catalonia
3127035	Caldes de Montbui	Spain	Catalonia
3127047	Calatayud	Spain	Aragon
3127065	Calahorra	Spain	La Rioja
3127066	Calafell	Spain	Catalonia
3127451	Burlata	Spain	Navarre
3127461	Burgos	Spain	Castille and León
3127889	Boiro	Spain	Galicia
3127958	Boadilla del Monte	Spain	Madrid
3127978	Blanes	Spain	Catalonia
3128026	Bilbao	Spain	Basque Country
3128174	Bermeo	Spain	Basque Country
3128201	Berga	Spain	Catalonia
3128272	Benicàssim	Spain	Valencia
3128273	Benicarló	Spain	Valencia
3128760	Barcelona	Spain	Catalonia
3128795	Barbastro	Spain	Aragon
3128824	Barañáin	Spain	Navarre
3128832	Barajas de Madrid	Spain	Madrid
3128885	Banyoles	Spain	Catalonia
3128978	Balaguer	Spain	Catalonia
3129028	Badalona	Spain	Catalonia
3129135	Avilés	Spain	Asturias
3129136	Ávila	Spain	Castille and León
3129329	Arteixo	Spain	Galicia
3129636	Arganda	Spain	Madrid
3129857	Aranjuez	Spain	Madrid
3129877	Aranda de Duero	Spain	Castille and León
3130131	Amposta	Spain	Catalonia
3130137	Amorebieta	Spain	Basque Country
3130155	Amés	Spain	Galicia
3130380	Algorta	Spain	Basque Country
3130383	Algete	Spain	Madrid
3130564	Alcorcón	Spain	Madrid
3130583	Alcobendas	Spain	Madrid
3130606	Alcañiz	Spain	Aragon
3130616	Alcalá de Henares	Spain	Madrid
6252065	Nou Barris	Spain	Catalonia
6324376	Pinar de Chamartín	Spain	Madrid
6354969	Playa del Ingles	Spain	Canary Islands
6355013	Puerto del Carmen	Spain	Canary Islands
6362987	Ceuta	Spain	Ceuta
6544099	Moncloa-Aravaca	Spain	Madrid
6544100	Eixample	Spain	Catalonia
6544101	les Corts	Spain	Catalonia
6544103	Horta-Guinardó	Spain	Catalonia
6544104	Sants-Montjuïc	Spain	Catalonia
6544105	Sant Martí	Spain	Catalonia
6544106	Ciutat Vella	Spain	Catalonia
6544487	Arganzuela	Spain	Madrid
6544488	San Blas	Spain	Madrid
6544489	Latina	Spain	Madrid
6544490	Usera	Spain	Madrid
6544491	Salamanca	Spain	Madrid
6544492	Chamberí	Spain	Madrid
6544493	Carabanchel	Spain	Madrid
6544494	City Center	Spain	Madrid
6544495	Retiro	Spain	Madrid
6559503	l'Alfàs del Pi	Spain	Valencia
6559641	Las Gabias	Spain	Andalusia
6615440	Delicias	Spain	Aragon
6615442	Almozara	Spain	Aragon
6615443	Montecanal	Spain	Aragon
6618856	Santutxu	Spain	Basque Country
6692471	Los Realejos	Spain	Canary Islands
6693088	Pasaia	Spain	Basque Country
6697039	Basauri	Spain	Basque Country
6943537	Llefià	Spain	Catalonia
7115111	Corvera de Asturias	Spain	Asturias
7577022	Tres Cantos	Spain	Madrid
8050879	Iturrama	Spain	Navarre
8050880	Ermitagaña	Spain	Navarre
8050888	Primer Ensanche	Spain	Navarre
8050889	Segundo Ensanche	Spain	Navarre
8285534	Fuencarral-El Pardo	Spain	Madrid
8285535	Villa de Vallecas	Spain	Madrid
8629192	Natahoyo	Spain	Asturias
325579	Ziway	Ethiopia	Oromiya
326036	Yabēlo	Ethiopia	Oromiya
326206	Werota	Ethiopia	Amhara
326308	Wenjī	Ethiopia	Oromiya
327694	Tippi	Ethiopia	Southern Nations, Nationalities, and People's Region
328689	Shashemenē	Ethiopia	Oromiya
328709	Shambu	Ethiopia	Oromiya
328716	Shakīso	Ethiopia	Oromiya
329114	Sebeta	Ethiopia	Oromiya
329586	Robīt	Ethiopia	Amhara
330120	Nejo	Ethiopia	Oromiya
330186	Nazrēt	Ethiopia	Oromiya
330491	Mojo	Ethiopia	Oromiya
330764	Metu	Ethiopia	Oromiya
330811	Metahāra	Ethiopia	Oromiya
331038	Mendī	Ethiopia	Oromiya
331180	Mekele	Ethiopia	Tigray
331416	Maych’ew	Ethiopia	Tigray
332746	Korem	Ethiopia	Tigray
333103	Kibre Mengist	Ethiopia	Oromiya
333356	Kemisē	Ethiopia	Amhara
333373	Kombolcha	Ethiopia	Amhara
333750	Jinka	Ethiopia	Southern Nations, Nationalities, and People's Region
333772	Jīma	Ethiopia	Oromiya
333795	Jijiga	Ethiopia	Somali
334227	Inda Silasē	Ethiopia	Tigray
335035	Harar	Ethiopia	Harari
335288	Hāgere Hiywet	Ethiopia	Oromiya
336014	Gondar	Ethiopia	Amhara
336350	Goba	Ethiopia	Oromiya
336372	Waliso	Ethiopia	Oromiya
336454	Ginir	Ethiopia	Oromiya
336496	Gimbi	Ethiopia	Oromiya
336931	Genet	Ethiopia	Oromiya
337010	Gelemso	Ethiopia	Oromiya
337152	Gebre Guracha	Ethiopia	Oromiya
337405	Gambēla	Ethiopia	Gambela
337712	Finote Selam	Ethiopia	Amhara
337771	Fichē	Ethiopia	Oromiya
337853	Felege Neway	Ethiopia	Southern Nations, Nationalities, and People's Region
338554	Dubti	Ethiopia	Āfar
338726	Dodola	Ethiopia	Oromiya
338832	Dire Dawa	Ethiopia	Dire Dawa
338998	Dīla	Ethiopia	Southern Nations, Nationalities, and People's Region
339219	Desē	Ethiopia	Amhara
339448	Dembī Dolo	Ethiopia	Oromiya
339666	Bishoftu	Ethiopia	Oromiya
339686	Debre Tabor	Ethiopia	Amhara
339708	Debre Mark’os	Ethiopia	Amhara
339734	Debre Birhan	Ethiopia	Amhara
339823	Debark’	Ethiopia	Amhara
341397	Burē	Ethiopia	Amhara
341742	Bonga	Ethiopia	Southern Nations, Nationalities, and People's Region
341877	Bodītī	Ethiopia	Southern Nations, Nationalities, and People's Region
342190	Bichena	Ethiopia	Amhara
342567	Bedelē	Ethiopia	Oromiya
342856	Bako	Ethiopia	Southern Nations, Nationalities, and People's Region
342884	Bahir Dar	Ethiopia	Amhara
343292	Āsosa	Ethiopia	Bīnshangul Gumuz
343402	Āsbe Teferī	Ethiopia	Oromiya
343409	Asaita	Ethiopia	Āfar
343413	Āsasa	Ethiopia	Oromiya
343593	Āreka	Ethiopia	Southern Nations, Nationalities, and People's Region
343663	Ārba Minch’	Ethiopia	Southern Nations, Nationalities, and People's Region
344420	Axum	Ethiopia	Tigray
344620	Hagere Maryam	Ethiopia	Oromiya
344661	Āgaro	Ethiopia	Oromiya
344923	Ādīs Zemen	Ethiopia	Amhara
344979	Addis Ababa	Ethiopia	Ādīs Ābeba
345149	Ādīgrat	Ethiopia	Tigray
345353	Addiet Canna	Ethiopia	Amhara
345704	Abomsa	Ethiopia	Amhara
630752	Ylöjärvi	Finland	Pirkanmaa
631707	Vihti	Finland	Uusimaa
632370	Varkaus	Finland	Northern Savo
632453	Vantaa	Finland	Uusimaa
632672	Valkeakoski	Finland	Pirkanmaa
632978	Vaasa	Finland	Ostrobothnia
633221	Uusikaupunki	Finland	Southwest Finland
633591	Tuusula	Finland	Uusimaa
633679	Turku	Finland	Southwest Finland
634093	Tornio	Finland	Lapland
634963	Tampere	Finland	Pirkanmaa
636947	Siilinjärvi	Finland	Northern Savo
637067	Sibbo	Finland	Uusimaa
637219	Seinäjoki	Finland	Southern Ostrobothnia
637292	Savonlinna	Finland	Southern Savonia
637948	Salo	Finland	Southwest Finland
638936	Rovaniemi	Finland	Lapland
639406	Riihimäki	Finland	Häme
639734	Rauma	Finland	Satakunta
640124	Raisio	Finland	Southwest Finland
640276	Raahe	Finland	Northern Ostrobothnia
640999	Pori	Finland	Satakunta
641489	Pirkkala	Finland	Pirkanmaa
644171	Nurmijärvi	Finland	Uusimaa
644450	Nokia	Finland	Pirkanmaa
646005	Mikkeli	Finland	Southern Savonia
646723	Mäntsälä	Finland	Uusimaa
647571	Lovisa	Finland	Uusimaa
647751	Lohja	Finland	Uusimaa
648056	Lieto	Finland	Southwest Finland
648366	Lempäälä	Finland	Pirkanmaa
648738	Laukaa	Finland	Central Finland
648900	Lappeenranta	Finland	South Karelia
649360	Lahti	Finland	Päijänne Tavastia
649630	Kirkkonummi	Finland	Uusimaa
649924	Kuusamo	Finland	Northern Ostrobothnia
650224	Kuopio	Finland	Northern Savo
650859	Kouvola	Finland	Kymenlaakso
650946	Kotka	Finland	Kymenlaakso
651943	Kokkola	Finland	Central Ostrobothnia
653185	Kerava	Finland	Uusimaa
653281	Kemi	Finland	Lapland
654137	Karhula	Finland	Kymenlaakso
654440	Kangasala	Finland	Pirkanmaa
654899	Kajaani	Finland	Kainuu
655130	Kaarina	Finland	Southwest Finland
655194	Jyväskylä	Finland	Central Finland
655808	Joensuu	Finland	North Karelia
655958	Järvenpää	Finland	Uusimaa
656073	Janakkala	Finland	Häme
656083	Jämsä	Finland	Central Finland
656130	Jakobstad	Finland	Ostrobothnia
656688	Imatra	Finland	South Karelia
656820	Iisalmi	Finland	Northern Savo
656913	Hyvinge	Finland	Uusimaa
658225	Helsinki	Finland	Uusimaa
658288	Heinola	Finland	Päijänne Tavastia
658629	Haukipudas	Finland	Northern Ostrobothnia
659169	Hamina	Finland	Kymenlaakso
659180	Hämeenlinna	Finland	Häme
659935	Forssa	Finland	Häme
660158	Espoo	Finland	Uusimaa
660561	Porvoo	Finland	Uusimaa
661164	Anjala	Finland	Kymenlaakso
7911309	Länsi-Turunmaa	Finland	Southwest Finland
2198148	Suva	Fiji	Central
2202064	Nadi	Fiji	Western
2204506	Lautoka	Fiji	Western
2204582	Labasa	Fiji	Northern
3426691	Stanley	Falkland Islands	N/A
2611396	Tórshavn	Faroe Islands	Streymoy
2967245	Yerres	France	Île-de-France
2967318	Wittenheim	France	Alsace-Champagne-Ardenne-Lorraine
2967421	Wattrelos	France	Nord-Pas-de-Calais-Picardie
2967438	Wasquehal	France	Nord-Pas-de-Calais-Picardie
2967758	Voiron	France	Auvergne-Rhône-Alpes
2967849	Vitry-sur-Seine	France	Île-de-France
2967856	Vitry-le-François	France	Alsace-Champagne-Ardenne-Lorraine
2967870	Vitrolles	France	Provence-Alpes-Côte d'Azur
2967879	Vitré	France	Brittany
2967917	Viry-Châtillon	France	Île-de-France
2967934	Viroflay	France	Île-de-France
2968054	Vincennes	France	Île-de-France
2968142	Villiers-sur-Marne	France	Île-de-France
2968176	Villiers-le-Bel	France	Île-de-France
2968254	Villeurbanne	France	Auvergne-Rhône-Alpes
2968482	Villepinte	France	Île-de-France
2968496	Villeparisis	France	Île-de-France
2968515	Villeneuve-sur-Lot	France	Aquitaine-Limousin-Poitou-Charentes
2968529	Villeneuve-Saint-Georges	France	Île-de-France
2968546	Villeneuve-le-Roi	France	Île-de-France
2968555	Villeneuve-la-Garenne	France	Île-de-France
2968620	Villenave-d’Ornon	France	Aquitaine-Limousin-Poitou-Charentes
2968653	Villemomble	France	Île-de-France
2968748	Villefranche-sur-Saône	France	Auvergne-Rhône-Alpes
2968771	Villefontaine	France	Auvergne-Rhône-Alpes
2969109	Vigneux-sur-Seine	France	Île-de-France
2969257	Vierzon	France	Centre
2969284	Vienne	France	Auvergne-Rhône-Alpes
2969392	Vichy	France	Auvergne-Rhône-Alpes
2969612	Vertou	France	Pays de la Loire
2969679	Versailles	France	Île-de-France
2969692	Verrières-le-Buisson	France	Île-de-France
2969766	Vernon	France	Normandy
2969796	Verneuil-sur-Seine	France	Île-de-France
2969958	Verdun	France	Alsace-Champagne-Ardenne-Lorraine
2970072	Vénissieux	France	Auvergne-Rhône-Alpes
2970110	Vendôme	France	Centre
2970148	Vence	France	Provence-Alpes-Côte d'Azur
2970203	Vélizy-Villacoublay	France	Île-de-France
2970432	Vauréal	France	Île-de-France
2970456	Vaulx-en-Velin	France	Auvergne-Rhône-Alpes
2970761	Vanves	France	Île-de-France
2970777	Vannes	France	Brittany
2970962	Vallauris	France	Provence-Alpes-Côte d'Azur
2971041	Valenciennes	France	Nord-Pas-de-Calais-Picardie
2971053	Valence	France	Auvergne-Rhône-Alpes
2971482	Tulle	France	Aquitaine-Limousin-Poitou-Charentes
2971549	Troyes	France	Alsace-Champagne-Ardenne-Lorraine
2971874	Tremblay-en-France	France	Île-de-France
2972049	Trappes	France	Île-de-France
2972191	Tours	France	Centre
2972237	Tournefeuille	France	Languedoc-Roussillon-Midi-Pyrénées
2972270	Tourlaville	France	Normandy
2972284	Tourcoing	France	Nord-Pas-de-Calais-Picardie
2972315	Toulouse	France	Languedoc-Roussillon-Midi-Pyrénées
2972328	Toulon	France	Provence-Alpes-Côte d'Azur
2972350	Toul	France	Alsace-Champagne-Ardenne-Lorraine
2972444	Torcy	France	Île-de-France
2972742	Thonon-les-Bains	France	Auvergne-Rhône-Alpes
2972811	Thionville	France	Alsace-Champagne-Ardenne-Lorraine
2972893	Thiais	France	Île-de-France
2973146	Tergnier	France	Nord-Pas-de-Calais-Picardie
2973258	Taverny	France	Île-de-France
2973317	Tassin-la-Demi-Lune	France	Auvergne-Rhône-Alpes
2973385	Tarbes	France	Languedoc-Roussillon-Midi-Pyrénées
2973495	Talence	France	Aquitaine-Limousin-Poitou-Charentes
2973675	Suresnes	France	Île-de-France
2973745	Sucy-en-Brie	France	Île-de-France
2973783	Strasbourg	France	Alsace-Champagne-Ardenne-Lorraine
2973841	Stains	France	Île-de-France
2974153	Sotteville-lès-Rouen	France	Normandy
2974385	Soisy-sous-Montmorency	France	Île-de-France
2974389	Soissons	France	Nord-Pas-de-Calais-Picardie
2974427	Six-Fours-les-Plages	France	Provence-Alpes-Côte d'Azur
2974494	Sin-le-Noble	France	Nord-Pas-de-Calais-Picardie
2974655	Seynod	France	Auvergne-Rhône-Alpes
2974678	Sèvres	France	Île-de-France
2974681	Sevran	France	Île-de-France
2974733	Sète	France	Languedoc-Roussillon-Midi-Pyrénées
2975050	Sens	France	Bourgogne-Franche-Comté
2975088	Senlis	France	Nord-Pas-de-Calais-Picardie
2975233	Sélestat	France	Alsace-Champagne-Ardenne-Lorraine
2975349	Sedan	France	Alsace-Champagne-Ardenne-Lorraine
2975446	Schiltigheim	France	Alsace-Champagne-Ardenne-Lorraine
2975469	Sceaux	France	Île-de-France
2975525	Savigny-sur-Orge	France	Île-de-France
2975536	Savigny-le-Temple	France	Île-de-France
2975758	Saumur	France	Pays de la Loire
2975921	Sartrouville	France	Île-de-France
2976043	Sarcelles	France	Île-de-France
2976050	Saran	France	Centre
2976179	Sannois	France	Île-de-France
2976258	Sanary-sur-Mer	France	Provence-Alpes-Côte d'Azur
2976341	Salon-de-Provence	France	Provence-Alpes-Côte d'Azur
2976406	Sallanches	France	Auvergne-Rhône-Alpes
2976984	Saint-Sébastien-sur-Loire	France	Pays de la Loire
2977246	Saint-Raphaël	France	Provence-Alpes-Côte d'Azur
2977295	Saint-Quentin	France	Nord-Pas-de-Calais-Picardie
2977356	Saint-Priest	France	Auvergne-Rhône-Alpes
2977388	Saint-Pol-sur-Mer	France	Nord-Pas-de-Calais-Picardie
2977491	Saint-Pierre-des-Corps	France	Centre
2977800	Saint-Ouen-l’Aumône	France	Île-de-France
2977824	Saint-Ouen	France	Île-de-France
2977845	Saint-Omer	France	Nord-Pas-de-Calais-Picardie
2977921	Saint-Nazaire	France	Pays de la Loire
2977952	Saint-Michel-sur-Orge	France	Île-de-France
2978100	Saint-Maximin-la-Sainte-Baume	France	Provence-Alpes-Côte d'Azur
2978179	Saint-Maur-des-Fossés	France	Île-de-France
2978317	Saint-Martin-d’Hères	France	Auvergne-Rhône-Alpes
2978621	Saint-Mandé	France	Île-de-France
2978640	Saint-Malo	France	Brittany
2978742	Saint-Louis	France	Alsace-Champagne-Ardenne-Lorraine
2978758	Saint-Lô	France	Normandy
2978768	Saint-Leu-la-Forêt	France	Île-de-France
2978771	Saint-Leu	France	Bourgogne-Franche-Comté
2978891	Saint-Laurent-du-Var	France	Provence-Alpes-Côte d'Azur
2979316	Saint-Jean-de-la-Ruelle	France	Centre
2979341	Saint-Jean-de-Braye	France	Centre
2979590	Saint-Herblain	France	Pays de la Loire
2979627	Saint-Gratien	France	Île-de-France
2979783	Saint-Germain-en-Laye	France	Île-de-France
2979985	Saint-Genis-Laval	France	Auvergne-Rhône-Alpes
2980097	Saint-Fons	France	Auvergne-Rhône-Alpes
2980291	Saint-Étienne	France	Auvergne-Rhône-Alpes
2980340	Saintes	France	Aquitaine-Limousin-Poitou-Charentes
2980558	Sainte-Geneviève-des-Bois	France	Île-de-France
2980586	Sainte-Foy-lès-Lyon	France	Auvergne-Rhône-Alpes
2980636	Saint-Égrève	France	Auvergne-Rhône-Alpes
2980816	Saint-Dizier	France	Alsace-Champagne-Ardenne-Lorraine
2980916	Saint-Denis	France	Île-de-France
2980935	Saint-Cyr-sur-Loire	France	Centre
2980942	Saint-Cyr-l’École	France	Île-de-France
2981041	Saint-Cloud	France	Île-de-France
2981206	Saint-Chamond	France	Auvergne-Rhône-Alpes
2981280	Saint-Brieuc	France	Brittany
2981492	Saint-Avold	France	Alsace-Champagne-Ardenne-Lorraine
2981512	Saint-Avertin	France	Centre
2981839	Saint-Amand-les-Eaux	France	Nord-Pas-de-Calais-Picardie
2982235	Rueil-Malmaison	France	Île-de-France
2982343	Royan	France	Aquitaine-Limousin-Poitou-Charentes
2982652	Rouen	France	Normandy
2982681	Roubaix	France	Nord-Pas-de-Calais-Picardie
2982757	Rosny-sous-Bois	France	Île-de-France
2982944	Ronchin	France	Nord-Pas-de-Calais-Picardie
2982967	Romorantin-Lanthenay	France	Centre
2983011	Romans-sur-Isère	France	Auvergne-Rhône-Alpes
2983026	Romainville	France	Île-de-France
2983074	Roissy-en-Brie	France	Île-de-France
2983154	Rodez	France	Languedoc-Roussillon-Midi-Pyrénées
2983276	Rochefort	France	Aquitaine-Limousin-Poitou-Charentes
2983362	Roanne	France	Auvergne-Rhône-Alpes
2983440	Ris-Orangis	France	Île-de-France
2983489	Riom	France	Auvergne-Rhône-Alpes
2983536	Rillieux-la-Pape	France	Auvergne-Rhône-Alpes
2983770	Rezé	France	Pays de la Loire
2983990	Rennes	France	Brittany
2984114	Reims	France	Alsace-Champagne-Ardenne-Lorraine
2984513	Rambouillet	France	Île-de-France
2984701	Quimper	France	Brittany
2985034	Puteaux	France	Île-de-France
2986140	Pontoise	France	Île-de-France
2986160	Pontivy	France	Brittany
2986302	Pontarlier	France	Bourgogne-Franche-Comté
2986306	Pont-à-Mousson	France	Alsace-Champagne-Ardenne-Lorraine
2986495	Poitiers	France	Aquitaine-Limousin-Poitou-Charentes
2986501	Poissy	France	Île-de-France
2986732	Ploemeur	France	Brittany
2986930	Plaisir	France	Île-de-France
2986933	Plaisance-du-Touch	France	Languedoc-Roussillon-Midi-Pyrénées
2987271	Pierrefitte-sur-Seine	France	Île-de-France
2987805	Pessac	France	Aquitaine-Limousin-Poitou-Charentes
2987825	Pertuis	France	Provence-Alpes-Côte d'Azur
2987914	Perpignan	France	Languedoc-Roussillon-Midi-Pyrénées
2987967	Périgueux	France	Aquitaine-Limousin-Poitou-Charentes
2988358	Pau	France	Aquitaine-Limousin-Poitou-Charentes
2988507	Paris	France	Île-de-France
2988621	Pantin	France	Île-de-France
2988758	Palaiseau	France	Île-de-France
2988867	Ozoir-la-Ferrière	France	Île-de-France
2988888	Oyonnax	France	Auvergne-Rhône-Alpes
2988936	Outreau	France	Nord-Pas-de-Calais-Picardie
2988998	Oullins	France	Auvergne-Rhône-Alpes
2989130	Osny	France	Île-de-France
2989170	Orvault	France	Pays de la Loire
2989204	Orsay	France	Île-de-France
2989297	Orly	France	Île-de-France
2989317	Orléans	France	Centre
2989460	Orange	France	Provence-Alpes-Côte d'Azur
2989611	Olivet	France	Centre
2989755	Octeville	France	Normandy
2989877	Noyon	France	Nord-Pas-de-Calais-Picardie
2990187	Noisy-le-Sec	France	Île-de-France
2990189	Noisy-le-Grand	France	Île-de-France
2990192	Noisiel	France	Île-de-France
2990264	Nogent-sur-Oise	France	Nord-Pas-de-Calais-Picardie
2990265	Nogent-sur-Marne	France	Île-de-France
2990355	Niort	France	Aquitaine-Limousin-Poitou-Charentes
2990440	Nice	France	Provence-Alpes-Côte d'Azur
2990474	Nevers	France	Bourgogne-Franche-Comté
2990611	Neuilly-sur-Seine	France	Île-de-France
2990612	Neuilly-sur-Marne	France	Île-de-France
2990616	Neuilly-Plaisance	France	Île-de-France
2990919	Narbonne	France	Languedoc-Roussillon-Midi-Pyrénées
2990969	Nantes	France	Pays de la Loire
2990970	Nanterre	France	Île-de-France
2990999	Nancy	France	Alsace-Champagne-Ardenne-Lorraine
2991153	Muret	France	Languedoc-Roussillon-Midi-Pyrénées
2991214	Mulhouse	France	Alsace-Champagne-Ardenne-Lorraine
2991481	Moulins	France	Auvergne-Rhône-Alpes
2991551	Mougins	France	Provence-Alpes-Côte d'Azur
2991719	Morsang-sur-Orge	France	Île-de-France
2991772	Morlaix	France	Brittany
2992003	Mont-Saint-Aignan	France	Normandy
2992017	Montrouge	France	Île-de-France
2992090	Montreuil	France	Île-de-France
2992229	Montmorency	France	Île-de-France
2992292	Montluçon	France	Auvergne-Rhône-Alpes
2992367	Montivilliers	France	Normandy
2992402	Montigny-lès-Metz	France	Alsace-Champagne-Ardenne-Lorraine
2992404	Montigny-lès-Cormeilles	France	Île-de-France
2992415	Montigny-le-Bretonneux	France	Île-de-France
2992536	Montgeron	France	Île-de-France
2992616	Montfermeil	France	Île-de-France
2992650	Montesson	France	Île-de-France
2992671	Montereau-Fault-Yonne	France	Île-de-France
2992771	Mont-de-Marsan	France	Aquitaine-Limousin-Poitou-Charentes
2992863	Montceau-les-Mines	France	Bourgogne-Franche-Comté
2992890	Montbrison	France	Auvergne-Rhône-Alpes
3025053	Cholet	France	Pays de la Loire
2993002	Montauban	France	Languedoc-Roussillon-Midi-Pyrénées
2993024	Montargis	France	Centre
2993207	Mons-en-Barœul	France	Nord-Pas-de-Calais-Picardie
2993572	Moissy-Cramayel	France	Île-de-France
2993679	Mitry-Mory	France	Île-de-France
2993760	Miramas	France	Provence-Alpes-Côte d'Azur
2993875	Millau	France	Languedoc-Roussillon-Midi-Pyrénées
2994048	Meyzieu	France	Auvergne-Rhône-Alpes
2994087	Meylan	France	Auvergne-Rhône-Alpes
2994144	Meudon	France	Île-de-France
2994160	Metz	France	Alsace-Champagne-Ardenne-Lorraine
2994393	Mérignac	France	Aquitaine-Limousin-Poitou-Charentes
2994497	Menton	France	Provence-Alpes-Côte d'Azur
2994651	Melun	France	Île-de-France
2994798	Meaux	France	Île-de-France
2994935	Mayenne	France	Pays de la Loire
2995041	Maurepas	France	Île-de-France
2995121	Mauguio	France	Languedoc-Roussillon-Midi-Pyrénées
2995150	Maubeuge	France	Nord-Pas-de-Calais-Picardie
2995206	Massy	France	Île-de-France
2995469	Marseille	France	Provence-Alpes-Côte d'Azur
2995642	Marmande	France	Aquitaine-Limousin-Poitou-Charentes
2995652	Marly-le-Roi	France	Île-de-France
2995750	Marignane	France	Provence-Alpes-Côte d'Azur
2995908	Marcq-en-Barœul	France	Nord-Pas-de-Calais-Picardie
2996146	Mantes-la-Ville	France	Île-de-France
2996148	Mantes-la-Jolie	France	Île-de-France
2996180	Manosque	France	Provence-Alpes-Côte d'Azur
2996255	Mandelieu-la-Napoule	France	Provence-Alpes-Côte d'Azur
2996514	Malakoff	France	Île-de-France
2996564	Maisons-Laffitte	France	Île-de-France
2996568	Maisons-Alfort	France	Île-de-France
2996882	Mâcon	France	Bourgogne-Franche-Comté
2996944	Lyon	France	Auvergne-Rhône-Alpes
2997110	Lunéville	France	Alsace-Champagne-Ardenne-Lorraine
2997116	Lunel	France	Languedoc-Roussillon-Midi-Pyrénées
2997246	Lucé	France	Centre
2997336	Louviers	France	Normandy
2997395	Lourdes	France	Languedoc-Roussillon-Midi-Pyrénées
2997556	Lormont	France	Aquitaine-Limousin-Poitou-Charentes
2997577	Lorient	France	Brittany
2997620	Loos	France	Nord-Pas-de-Calais-Picardie
2997712	Longjumeau	France	Île-de-France
2997803	Lomme	France	Nord-Pas-de-Calais-Picardie
2997904	Lognes	France	Île-de-France
2998056	Livry-Gargan	France	Île-de-France
2998127	L’Isle-sur-la-Sorgue	France	Provence-Alpes-Côte d'Azur
2998150	Lisieux	France	Normandy
2998224	Lingolsheim	France	Alsace-Champagne-Ardenne-Lorraine
2998286	Limoges	France	Aquitaine-Limousin-Poitou-Charentes
2998305	Limeil-Brévannes	France	Île-de-France
2998311	Limay	France	Île-de-France
2998324	Lille	France	Nord-Pas-de-Calais-Picardie
2998431	Liévin	France	Nord-Pas-de-Calais-Picardie
2998517	Libourne	France	Aquitaine-Limousin-Poitou-Charentes
2998632	L'Haÿ-les-Roses	France	Île-de-France
2998854	Le Vésinet	France	Île-de-France
2998975	Levallois-Perret	France	Île-de-France
2999683	Les Sables-d'Olonne	France	Pays de la Loire
3000060	Les Pavillons-sous-Bois	France	Île-de-France
3000192	Les Mureaux	France	Île-de-France
3000491	Les Lilas	France	Île-de-France
3000648	Les Herbiers	France	Pays de la Loire
3001402	Les Clayes-sous-Bois	France	Île-de-France
3002465	Le Puy-en-Velay	France	Auvergne-Rhône-Alpes
3002499	Le Pré-Saint-Gervais	France	Île-de-France
3002570	Le Pontet	France	Provence-Alpes-Côte d'Azur
3002647	Le Plessis-Trévise	France	Île-de-France
3002650	Le Plessis-Robinson	France	Île-de-France
3002880	Le Petit-Quevilly	France	Normandy
3002965	Le Perreux-sur-Marne	France	Île-de-France
3002984	Le Pecq	France	Île-de-France
3003093	Lens	France	Nord-Pas-de-Calais-Picardie
3003481	Le Mée-sur-Seine	France	Île-de-France
3003603	Le Mans	France	Pays de la Loire
3003737	Le Kremlin-Bicêtre	France	Île-de-France
3003796	Le Havre	France	Normandy
3003952	Le Grand-Quevilly	France	Normandy
3004427	Le Creusot	France	Bourgogne-Franche-Comté
3004630	Le Chesnay	France	Île-de-France
3004871	Le Cannet	France	Provence-Alpes-Côte d'Azur
3005269	Le Blanc-Mesnil	France	Île-de-France
3005417	Laxou	France	Alsace-Champagne-Ardenne-Lorraine
3005825	La Valette-du-Var	France	Provence-Alpes-Côte d'Azur
3005866	Laval	France	Pays de la Loire
3006121	Lattes	France	Languedoc-Roussillon-Midi-Pyrénées
3006283	La Teste-de-Buch	France	Aquitaine-Limousin-Poitou-Charentes
3006414	La Seyne-sur-Mer	France	Provence-Alpes-Côte d'Azur
3006767	La Roche-sur-Yon	France	Pays de la Loire
3006787	La Rochelle	France	Aquitaine-Limousin-Poitou-Charentes
3007477	Laon	France	Nord-Pas-de-Calais-Picardie
3007609	Lannion	France	Brittany
3007794	Lanester	France	Brittany
3007874	Landerneau	France	Brittany
3008218	Lambersart	France	Nord-Pas-de-Calais-Picardie
3008379	La Madeleine	France	Nord-Pas-de-Calais-Picardie
3009071	Lagny-sur-Marne	France	Île-de-France
3009169	La Garenne-Colombes	France	Île-de-France
3009443	La Flèche	France	Pays de la Loire
3009791	La Crau	France	Provence-Alpes-Côte d'Azur
3009824	La Courneuve	France	Île-de-France
3010237	La Chapelle-sur-Erdre	France	Pays de la Loire
3010529	La Celle-Saint-Cloud	France	Île-de-France
3012162	Jouy-le-Moutier	France	Île-de-France
3012219	Joué-lés-Tours	France	Centre
3012313	Joinville-le-Pont	France	Île-de-France
3012621	Ivry-sur-Seine	France	Île-de-France
3012647	Istres	France	Provence-Alpes-Côte d'Azur
3012649	Issy-les-Moulineaux	France	Île-de-France
3012664	Issoire	France	Auvergne-Rhône-Alpes
3012829	Illzach	France	Alsace-Champagne-Ardenne-Lorraine
3012834	Illkirch-Graffenstaden	France	Alsace-Champagne-Ardenne-Lorraine
3012937	Hyères	France	Provence-Alpes-Côte d'Azur
3013097	Houilles	France	Île-de-France
3013403	Hérouville-Saint-Clair	France	Normandy
3013477	Herblay	France	Île-de-France
3013525	Hénin-Beaumont	France	Nord-Pas-de-Calais-Picardie
3013549	Hem	France	Nord-Pas-de-Calais-Picardie
3013619	Hazebrouck	France	Nord-Pas-de-Calais-Picardie
3013627	Hayange	France	Alsace-Champagne-Ardenne-Lorraine
3013681	Hautmont	France	Nord-Pas-de-Calais-Picardie
3013862	Haubourdin	France	Nord-Pas-de-Calais-Picardie
3014034	Halluin	France	Nord-Pas-de-Calais-Picardie
3014078	Haguenau	France	Alsace-Champagne-Ardenne-Lorraine
3014143	Guyancourt	France	Île-de-France
3014175	Gujan-Mestras	France	Aquitaine-Limousin-Poitou-Charentes
3014383	Guéret	France	Aquitaine-Limousin-Poitou-Charentes
3014392	Guérande	France	Pays de la Loire
3014646	Grigny	France	Île-de-France
3014728	Grenoble	France	Auvergne-Rhône-Alpes
3014856	Grasse	France	Provence-Alpes-Côte d'Azur
3015160	Grande-Synthe	France	Nord-Pas-de-Calais-Picardie
3015419	Gradignan	France	Aquitaine-Limousin-Poitou-Charentes
3015490	Goussainville	France	Île-de-France
3015689	Gonesse	France	Île-de-France
3015902	Givors	France	Auvergne-Rhône-Alpes
3016078	Gif-sur-Yvette	France	Île-de-France
3016097	Gien	France	Centre
3016292	Gentilly	France	Île-de-France
3016321	Gennevilliers	France	Île-de-France
3016621	Garges-lès-Gonesse	France	Île-de-France
3016667	Gardanne	France	Provence-Alpes-Côte d'Azur
3016675	Garches	France	Île-de-France
3016830	Gagny	France	Île-de-France
3016956	Frontignan	France	Languedoc-Roussillon-Midi-Pyrénées
3017178	Fresnes	France	Île-de-France
3017253	Fréjus	France	Provence-Alpes-Côte d'Azur
3017341	Franconville	France	Île-de-France
3017609	Fougères	France	Brittany
3017651	Fos-sur-Mer	France	Provence-Alpes-Côte d'Azur
3017805	Forbach	France	Alsace-Champagne-Ardenne-Lorraine
3017910	Fontenay-sous-Bois	France	Île-de-France
3017921	Fontenay-le-Comte	France	Pays de la Loire
3017924	Fontenay-aux-Roses	France	Île-de-France
3018074	Fontainebleau	France	Île-de-France
3018095	Fontaine	France	Auvergne-Rhône-Alpes
3018246	Floirac	France	Aquitaine-Limousin-Poitou-Charentes
3018280	Fleury-les-Aubrais	France	Centre
3018339	Flers	France	Normandy
3018455	Firminy	France	Auvergne-Rhône-Alpes
3018794	Fécamp	France	Normandy
3019193	Eysines	France	Aquitaine-Limousin-Poitou-Charentes
3019256	Évry	France	Île-de-France
3019265	Évreux	France	Normandy
3019459	Étampes	France	Île-de-France
3019766	La Baule-Escoublac	France	Pays de la Loire
3019897	Ermont	France	Île-de-France
3019952	Éragny	France	Île-de-France
3019960	Équeurdreville-Hainneville	France	Normandy
3020020	Épinay-sur-Seine	France	Île-de-France
3020035	Épinal	France	Alsace-Champagne-Ardenne-Lorraine
3020062	Épernay	France	Alsace-Champagne-Ardenne-Lorraine
3020307	Elbeuf	France	Normandy
3020310	Élancourt	France	Île-de-France
3020392	Écully	France	Auvergne-Rhône-Alpes
3020495	Échirolles	France	Auvergne-Rhône-Alpes
3020601	Eaubonne	France	Île-de-France
3020686	Dunkerque	France	Nord-Pas-de-Calais-Picardie
3020810	Dreux	France	Centre
3020832	Draveil	France	Île-de-France
3020839	Drancy	France	Île-de-France
3020996	Douarnenez	France	Brittany
3021000	Douai	France	Nord-Pas-de-Calais-Picardie
3021150	Domont	France	Île-de-France
3021263	Dole	France	Bourgogne-Franche-Comté
3021372	Dijon	France	Bourgogne-Franche-Comté
3021382	Digne-les-Bains	France	Provence-Alpes-Côte d'Azur
3021411	Dieppe	France	Normandy
3021516	Deuil-la-Barre	France	Île-de-France
3021605	Denain	France	Nord-Pas-de-Calais-Picardie
3021662	Décines-Charpieu	France	Auvergne-Rhône-Alpes
3021670	Dax	France	Aquitaine-Limousin-Poitou-Charentes
3021852	Dammarie-les-Lys	France	Île-de-France
3022151	Cugnaux	France	Languedoc-Roussillon-Midi-Pyrénées
3022376	Croix	France	Nord-Pas-de-Calais-Picardie
3022530	Créteil	France	Île-de-France
3022569	Crépy-en-Valois	France	Nord-Pas-de-Calais-Picardie
3022610	Creil	France	Nord-Pas-de-Calais-Picardie
3022700	Cran-Gevrier	France	Auvergne-Rhône-Alpes
3023141	Courbevoie	France	Île-de-France
3023324	Couëron	France	Pays de la Loire
3023356	Coudekerque-Branche	France	Nord-Pas-de-Calais-Picardie
3023645	Cormeilles-en-Parisis	France	Île-de-France
3023763	Corbeil-Essonnes	France	Île-de-France
3024035	Concarneau	France	Brittany
3024066	Compiègne	France	Nord-Pas-de-Calais-Picardie
3024107	Combs-la-Ville	France	Île-de-France
3024195	Pontault-Combault	France	Île-de-France
3024223	Colomiers	France	Languedoc-Roussillon-Midi-Pyrénées
3024266	Colombes	France	Île-de-France
3024297	Colmar	France	Alsace-Champagne-Ardenne-Lorraine
3024440	Cognac	France	Aquitaine-Limousin-Poitou-Charentes
3024532	Cluses	France	Auvergne-Rhône-Alpes
3024596	Clichy-sous-Bois	France	Île-de-France
3024597	Clichy	France	Île-de-France
3024635	Clermont-Ferrand	France	Auvergne-Rhône-Alpes
3024783	Clamart	France	Île-de-France
3025055	Choisy-le-Roi	France	Île-de-France
3025144	Chilly-Mazarin	France	Île-de-France
3025314	Chevilly-Larue	France	Île-de-France
3025466	Cherbourg-Octeville	France	Normandy
3025496	Chenôve	France	Bourgogne-Franche-Comté
3025509	Chennevières-sur-Marne	France	Île-de-France
3025622	Chelles	France	Île-de-France
3025715	Chaville	France	Île-de-France
3026033	Chatou	France	Île-de-France
3026083	Châtillon	France	Île-de-France
3026108	Châtenay-Malabry	France	Île-de-France
3026141	Châtellerault	France	Aquitaine-Limousin-Poitou-Charentes
3026194	Château-Thierry	France	Nord-Pas-de-Calais-Picardie
3026204	Châteauroux	France	Centre
3026285	Châteaudun	France	Centre
3026467	Chartres	France	Centre
3026613	Charleville-Mézières	France	Alsace-Champagne-Ardenne-Lorraine
3026637	Charenton-le-Pont	France	Île-de-France
3027014	Champs-sur-Marne	France	Île-de-France
3027105	Champigny-sur-Marne	France	Île-de-France
3027422	Chambéry	France	Auvergne-Rhône-Alpes
3027453	Chamalières	France	Auvergne-Rhône-Alpes
3027484	Chalon-sur-Saône	France	Bourgogne-Franche-Comté
3027513	Challans	France	Pays de la Loire
3027763	Cestas	France	Aquitaine-Limousin-Poitou-Charentes
3027767	Cesson-Sévigné	France	Brittany
3027883	Cergy	France	Île-de-France
3027950	Cenon	France	Aquitaine-Limousin-Poitou-Charentes
3028134	Cavaillon	France	Provence-Alpes-Côte d'Azur
3028263	Castres	France	Languedoc-Roussillon-Midi-Pyrénées
3028337	Castelnau-le-Lez	France	Languedoc-Roussillon-Midi-Pyrénées
3028486	Carvin	France	Nord-Pas-de-Calais-Picardie
3028521	Carrières-sous-Poissy	France	Île-de-France
3028535	Carquefou	France	Pays de la Loire
3028542	Carpentras	France	Provence-Alpes-Côte d'Azur
3028641	Carcassonne	France	Languedoc-Roussillon-Midi-Pyrénées
3028779	Canteleu	France	Normandy
3028808	Cannes	France	Provence-Alpes-Côte d'Azur
3029030	Cambrai	France	Nord-Pas-de-Calais-Picardie
3029096	Caluire-et-Cuire	France	Auvergne-Rhône-Alpes
3029162	Calais	France	Nord-Pas-de-Calais-Picardie
3029213	Cahors	France	Languedoc-Roussillon-Midi-Pyrénées
3029227	Cagnes-sur-Mer	France	Provence-Alpes-Côte d'Azur
3029241	Caen	France	Normandy
3029276	Cachan	France	Île-de-France
3029706	Bry-sur-Marne	France	Île-de-France
3029748	Brunoy	France	Île-de-France
3029825	Bruay-la-Buissière	France	Nord-Pas-de-Calais-Picardie
3029931	Bron	France	Auvergne-Rhône-Alpes
3030057	Brignoles	France	Provence-Alpes-Côte d'Azur
3030101	Brie-Comte-Robert	France	Île-de-France
3030257	Brétigny-sur-Orge	France	Île-de-France
3030300	Brest	France	Brittany
3030303	Bressuire	France	Aquitaine-Limousin-Poitou-Charentes
3030960	Bourgoin	France	Auvergne-Rhône-Alpes
3030985	Bourg-lès-Valence	France	Auvergne-Rhône-Alpes
3030990	Bourg-la-Reine	France	Île-de-France
3031005	Bourges	France	Centre
3031009	Bourg-en-Bresse	France	Auvergne-Rhône-Alpes
3031133	Boulogne-sur-Mer	France	Nord-Pas-de-Calais-Picardie
3031137	Boulogne-Billancourt	France	Île-de-France
3031268	Bouguenais	France	Pays de la Loire
3031582	Bordeaux	France	Aquitaine-Limousin-Poitou-Charentes
3031709	Bonneuil-sur-Marne	France	Île-de-France
3031815	Bondy	France	Île-de-France
3031898	Boissy-Saint-Léger	France	Île-de-France
3032070	Bois-Colombes	France	Île-de-France
3032179	Bobigny	France	Île-de-France
3032213	Blois	France	Centre
3032340	Blanquefort	France	Aquitaine-Limousin-Poitou-Charentes
3032469	Blagnac	France	Languedoc-Roussillon-Midi-Pyrénées
3032551	Bischheim	France	Alsace-Champagne-Ardenne-Lorraine
3032797	Biarritz	France	Aquitaine-Limousin-Poitou-Charentes
3032824	Bezons	France	Île-de-France
3033002	Béthune	France	Nord-Pas-de-Calais-Picardie
3033123	Besançon	France	Bourgogne-Franche-Comté
3033391	Bergerac	France	Aquitaine-Limousin-Poitou-Charentes
3033415	Berck	France	Nord-Pas-de-Calais-Picardie
3033416	Berck-Plage	France	Nord-Pas-de-Calais-Picardie
3033791	Belfort	France	Bourgogne-Franche-Comté
3033881	Bègles	France	Aquitaine-Limousin-Poitou-Charentes
3034006	Beauvais	France	Nord-Pas-de-Calais-Picardie
3034475	Bayonne	France	Aquitaine-Limousin-Poitou-Charentes
3034483	Bayeux	France	Normandy
3034640	Bastia	France	Corsica
3034911	Bar-le-Duc	France	Alsace-Champagne-Ardenne-Lorraine
3035204	Balma	France	Languedoc-Roussillon-Midi-Pyrénées
3035403	Bagnolet	France	Île-de-France
3035409	Bagneux	France	Île-de-France
3035654	Avon	France	Île-de-France
3035667	Avion	France	Nord-Pas-de-Calais-Picardie
3035681	Avignon	France	Provence-Alpes-Côte d'Azur
3035843	Auxerre	France	Bourgogne-Franche-Comté
3035883	Autun	France	Bourgogne-Franche-Comté
3036016	Aurillac	France	Auvergne-Rhône-Alpes
3036145	Aulnay-sous-Bois	France	Île-de-France
3036240	Audincourt	France	Bourgogne-Franche-Comté
3036281	Auch	France	Languedoc-Roussillon-Midi-Pyrénées
3036386	Aubervilliers	France	Île-de-France
3036433	Aubagne	France	Provence-Alpes-Côte d'Azur
3036460	Athis-Mons	France	Île-de-France
3036572	Asnières-sur-Seine	France	Île-de-France
3036784	Arras	France	Nord-Pas-de-Calais-Picardie
3036903	Armentières	France	Nord-Pas-de-Calais-Picardie
3036938	Arles	France	Provence-Alpes-Côte d'Azur
3037044	Argenteuil	France	Île-de-France
3037051	Argentan	France	Normandy
3037157	Arcueil	France	Île-de-France
3037423	Antony	France	Île-de-France
3037456	Antibes	France	Provence-Alpes-Côte d'Azur
3037514	Annonay	France	Auvergne-Rhône-Alpes
3037538	Annemasse	France	Auvergne-Rhône-Alpes
3037543	Annecy	France	Auvergne-Rhône-Alpes
3037598	Angoulême	France	Aquitaine-Limousin-Poitou-Charentes
3037612	Anglet	France	Aquitaine-Limousin-Poitou-Charentes
3037656	Angers	France	Pays de la Loire
3037854	Amiens	France	Nord-Pas-de-Calais-Picardie
3038159	Allauch	France	Provence-Alpes-Côte d'Azur
3038213	Alfortville	France	Île-de-France
3038224	Alès	France	Languedoc-Roussillon-Midi-Pyrénées
3038230	Alençon	France	Normandy
3038261	Albi	France	Languedoc-Roussillon-Midi-Pyrénées
3038266	Albertville	France	Auvergne-Rhône-Alpes
3038334	Ajaccio	France	Corsica
3038350	Aix-les-Bains	France	Auvergne-Rhône-Alpes
3038354	Aix-en-Provence	France	Provence-Alpes-Côte d'Azur
3038634	Agen	France	Aquitaine-Limousin-Poitou-Charentes
3038638	Agde	France	Languedoc-Roussillon-Midi-Pyrénées
3038712	Achères	France	Île-de-France
3038789	Abbeville	France	Nord-Pas-de-Calais-Picardie
6615536	Les Ulis	France	Île-de-France
6615539	Bourgoin-Jallieu	France	Auvergne-Rhône-Alpes
7284882	Marseille 01	France	Provence-Alpes-Côte d'Azur
7284883	Marseille 02	France	Provence-Alpes-Côte d'Azur
7284884	Marseille 03	France	Provence-Alpes-Côte d'Azur
7284885	Marseille 04	France	Provence-Alpes-Côte d'Azur
7284886	Marseille 05	France	Provence-Alpes-Côte d'Azur
7284887	Marseille 06	France	Provence-Alpes-Côte d'Azur
7284888	Marseille 07	France	Provence-Alpes-Côte d'Azur
7284889	Marseille 08	France	Provence-Alpes-Côte d'Azur
7284890	Marseille 10	France	Provence-Alpes-Côte d'Azur
7284891	Marseille 09	France	Provence-Alpes-Côte d'Azur
7284892	Marseille 11	France	Provence-Alpes-Côte d'Azur
7284893	Marseille 12	France	Provence-Alpes-Côte d'Azur
7284894	Marseille 13	France	Provence-Alpes-Côte d'Azur
7284895	Marseille 14	France	Provence-Alpes-Côte d'Azur
7284896	Marseille 15	France	Provence-Alpes-Côte d'Azur
7284897	Marseille 16	France	Provence-Alpes-Côte d'Azur
8504417	La Defense	France	Île-de-France
8533870	Saint-Quentin-en-Yvelines	France	Île-de-France
8555643	Cergy-Pontoise	France	Île-de-France
2396253	Tchibanga	Gabon	Nyanga
2396518	Port-Gentil	Gabon	Ogooué-Maritime
2396646	Oyem	Gabon	Woleu-Ntem
2398073	Mouila	Gabon	Ngounié
2398269	Moanda	Gabon	Haut-Ogooué
2399697	Libreville	Gabon	Estuaire
2399888	Lambaréné	Gabon	Moyen-Ogooué
2400555	Franceville	Gabon	Haut-Ogooué
2633352	York	United Kingdom	England
2633373	Yeovil	United Kingdom	England
2633397	Yeadon	United Kingdom	England
2633406	Yate	United Kingdom	England
2633485	Wrexham	United Kingdom	Wales
2633521	Worthing	United Kingdom	England
2633551	Worksop	United Kingdom	England
2633553	Workington	United Kingdom	England
2633563	Worcester	United Kingdom	England
2633655	Woodford Green	United Kingdom	England
2633681	Wombwell	United Kingdom	England
2633691	Wolverhampton	United Kingdom	England
2633708	Wokingham	United Kingdom	England
2633709	Woking	United Kingdom	England
2633729	Witney	United Kingdom	England
2633765	Wishaw	United Kingdom	Scotland
2633771	Wisbech	United Kingdom	England
2633810	Winsford	United Kingdom	England
2633842	Windsor	United Kingdom	England
2633858	Winchester	United Kingdom	England
2633883	Wilmslow	United Kingdom	England
2633912	Willenhall	United Kingdom	England
2633936	Wigston Magna	United Kingdom	England
2633948	Wigan	United Kingdom	England
2633954	Widnes	United Kingdom	England
2633976	Wickford	United Kingdom	England
2634021	Whitstable	United Kingdom	England
2634096	Whitehaven	United Kingdom	England
2634103	Whitefield	United Kingdom	England
2634202	Weymouth	United Kingdom	England
2634204	Weybridge	United Kingdom	England
2634308	Weston-super-Mare	United Kingdom	England
2634340	West Molesey	United Kingdom	England
2634387	Westhoughton	United Kingdom	England
2634491	West Bromwich	United Kingdom	England
2634493	West Bridgford	United Kingdom	England
2634552	Welwyn Garden City	United Kingdom	England
2634573	Wellington	United Kingdom	England
2634578	Wellingborough	United Kingdom	England
2634579	Welling	United Kingdom	England
2634616	Wednesfield	United Kingdom	England
2634617	Wednesbury	United Kingdom	England
2634672	Wath upon Dearne	United Kingdom	England
2634677	Watford	United Kingdom	England
2634715	Washington	United Kingdom	England
2634725	Warwick	United Kingdom	England
2634739	Warrington	United Kingdom	England
2634755	Warminster	United Kingdom	England
2634777	Ware	United Kingdom	England
2634825	Walton-on-Thames	United Kingdom	England
2634843	Waltham Abbey	United Kingdom	England
2634853	Walsall	United Kingdom	England
2634864	Wallsend	United Kingdom	England
2634873	Wallasey	United Kingdom	England
2634887	Walkden	United Kingdom	England
2634910	Wakefield	United Kingdom	England
2635062	Urmston	United Kingdom	England
2635243	Uckfield	United Kingdom	England
2636749	Stowmarket	United Kingdom	England
2636767	Stourport-on-Severn	United Kingdom	England
2636769	Stourbridge	United Kingdom	England
2636876	Stockton-on-Tees	United Kingdom	England
2636882	Stockport	United Kingdom	England
2636910	Stirling	United Kingdom	Scotland
2636940	Stevenage	United Kingdom	England
2636995	Staveley	United Kingdom	England
2637104	Stamford	United Kingdom	England
2637106	Stalybridge	United Kingdom	England
2637126	Staines	United Kingdom	England
2637142	Stafford	United Kingdom	England
2637235	Spennymoor	United Kingdom	England
2637265	Spalding	United Kingdom	England
2637329	South Shields	United Kingdom	England
2637330	Southsea	United Kingdom	England
2637343	Southport	United Kingdom	England
2637355	South Ockendon	United Kingdom	England
2637433	Southend-on-Sea	United Kingdom	England
2637435	South Elmsall	United Kingdom	England
2637476	South Benfleet	United Kingdom	England
2637487	Southampton	United Kingdom	England
2637490	Southall	United Kingdom	England
2637627	Slough	United Kingdom	England
2637659	Sleaford	United Kingdom	England
2637752	Skelmersdale	United Kingdom	England
2637762	Skegness	United Kingdom	England
2637802	Sittingbourne	United Kingdom	England
2637891	Shrewsbury	United Kingdom	England
2637916	Shoreham-by-Sea	United Kingdom	England
2637917	Shoreham	United Kingdom	England
2637958	Shipley	United Kingdom	England
2638077	Sheffield	United Kingdom	England
2638187	Sevenoaks	United Kingdom	England
2638235	Selby	United Kingdom	England
2638302	Seaham	United Kingdom	England
2638311	Seaford	United Kingdom	England
2638324	Scunthorpe	United Kingdom	England
2638419	Scarborough	United Kingdom	England
2638600	Sandbach	United Kingdom	England
2638664	Salisbury	United Kingdom	England
2638671	Salford	United Kingdom	England
2638678	Sale	United Kingdom	England
2638717	Saint Neots	United Kingdom	England
2638785	St Helens	United Kingdom	England
2638853	St Austell	United Kingdom	England
2638864	Saint Andrews	United Kingdom	Scotland
2638867	St Albans	United Kingdom	England
2638894	Ryton	United Kingdom	England
2638911	Ryde	United Kingdom	England
2638926	Rutherglen	United Kingdom	Scotland
2638946	Rushden	United Kingdom	England
2638960	Runcorn	United Kingdom	England
2638976	Ruislip	United Kingdom	England
2638977	Rugeley	United Kingdom	England
2639015	Royton	United Kingdom	England
2639022	Royal Tunbridge Wells	United Kingdom	England
2639069	Rottingdean	United Kingdom	England
2639093	Rotherham	United Kingdom	England
2639189	Romsey	United Kingdom	England
2639265	Rochford	United Kingdom	England
2639268	Rochester	United Kingdom	England
2639272	Rochdale	United Kingdom	England
2639317	Risca	United Kingdom	Wales
2639323	Ripon	United Kingdom	England
2639325	Ripley	United Kingdom	England
2639409	Rhyl	United Kingdom	Wales
2639447	Rhondda	United Kingdom	Wales
2639495	Renfrew	United Kingdom	Scotland
2639506	Reigate	United Kingdom	England
2639545	Redhill	United Kingdom	England
2639563	Redcar	United Kingdom	England
2639577	Reading	United Kingdom	England
2639583	Rayleigh	United Kingdom	England
2639586	Rawtenstall	United Kingdom	England
2639588	Rawmarsh	United Kingdom	England
2639660	Ramsgate	United Kingdom	England
2639668	Ramsbottom	United Kingdom	England
2639842	Purley	United Kingdom	England
2639896	Prestwick	United Kingdom	Scotland
2639897	Prestwich	United Kingdom	England
2639912	Preston	United Kingdom	England
2639926	Prestatyn	United Kingdom	Wales
2639928	Prescot	United Kingdom	England
2639958	Poulton le Fylde	United Kingdom	England
2639970	Potters Bar	United Kingdom	England
2639996	Portsmouth	United Kingdom	England
2639998	Portslade	United Kingdom	England
2640037	Portishead	United Kingdom	England
2640054	Porthcawl	United Kingdom	Wales
2640060	Port Glasgow	United Kingdom	Scotland
2640085	Portadown	United Kingdom	Northern Ireland
2640101	Poole	United Kingdom	England
2640104	Pontypridd	United Kingdom	Wales
2640106	Pontypool	United Kingdom	Wales
2640155	Polmont	United Kingdom	Scotland
2640190	Plymstock	United Kingdom	England
2640194	Plymouth	United Kingdom	England
2640246	Pitsea	United Kingdom	England
2640275	Pinner	United Kingdom	England
2640349	Peterlee	United Kingdom	England
2640351	Peterhead	United Kingdom	Scotland
2640354	Peterborough	United Kingdom	England
2640358	Perth	United Kingdom	Scotland
2640377	Penzance	United Kingdom	England
2640465	Penicuik	United Kingdom	Scotland
2640496	Penarth	United Kingdom	Wales
2640677	Paisley	United Kingdom	Scotland
2640681	Paignton	United Kingdom	England
2640729	Oxford	United Kingdom	England
2640861	Oswestry	United Kingdom	England
2640894	Orpington	United Kingdom	England
2640908	Ormskirk	United Kingdom	England
2640967	Omagh	United Kingdom	Northern Ireland
2641022	Oldham	United Kingdom	England
2641134	Oadby	United Kingdom	England
2641157	Nuneaton	United Kingdom	England
2641170	Nottingham	United Kingdom	England
2641181	Norwich	United Kingdom	England
2641224	Northwich	United Kingdom	England
2641267	North Shields	United Kingdom	England
2641290	Northolt	United Kingdom	England
2641319	Lancing	United Kingdom	England
2641430	Northampton	United Kingdom	England
2641435	Northallerton	United Kingdom	England
2641520	Newtownabbey	United Kingdom	Northern Ireland
2641544	Newton Mearns	United Kingdom	Scotland
2641546	Newton-le-Willows	United Kingdom	England
2641555	Newton Aycliffe	United Kingdom	England
2641557	Newton Abbot	United Kingdom	England
2641581	Newry	United Kingdom	Northern Ireland
2641589	Newquay	United Kingdom	England
2641591	Newport Pagnell	United Kingdom	England
2641598	Newport	United Kingdom	Wales
2641599	Newport	United Kingdom	England
2641609	New Milton	United Kingdom	England
2641616	Newmarket	United Kingdom	England
2641617	New Malden	United Kingdom	England
2641673	Newcastle upon Tyne	United Kingdom	England
2641674	Newcastle under Lyme	United Kingdom	England
2641689	Newbury	United Kingdom	England
2641690	Newburn	United Kingdom	England
2641731	Newark on Trent	United Kingdom	England
2641810	Nelson	United Kingdom	England
2641843	Neath	United Kingdom	Wales
2641942	Musselburgh	United Kingdom	Scotland
2642135	Motherwell	United Kingdom	Scotland
2642189	Morley	United Kingdom	England
2642204	Moreton	United Kingdom	England
2642214	Morecambe	United Kingdom	England
2642414	Mitcham	United Kingdom	England
2642423	Mirfield	United Kingdom	England
2642465	Milton Keynes	United Kingdom	England
2642593	Middleton	United Kingdom	England
2642607	Middlesbrough	United Kingdom	England
2642683	Mexborough	United Kingdom	England
2642705	Merthyr Tydfil	United Kingdom	Wales
2642763	Melton Mowbray	United Kingdom	England
2642999	Marple	United Kingdom	England
2643003	Marlow	United Kingdom	England
2643044	Margate	United Kingdom	England
2643071	March	United Kingdom	England
2643096	Mansfield Woodhouse	United Kingdom	England
2643097	Mansfield	United Kingdom	England
2643116	Mangotsfield	United Kingdom	England
2643123	Manchester	United Kingdom	England
2643144	Maltby	United Kingdom	England
2643160	Maldon	United Kingdom	England
2643179	Maidstone	United Kingdom	England
2643186	Maidenhead	United Kingdom	England
2643198	Maghull	United Kingdom	England
2643218	Maesteg	United Kingdom	Wales
2643266	Macclesfield	United Kingdom	England
2643339	Luton	United Kingdom	England
2643490	Lowestoft	United Kingdom	England
2643553	Louth	United Kingdom	England
2643567	Loughborough	United Kingdom	England
2643696	Longfield	United Kingdom	England
2643697	Long Eaton	United Kingdom	England
2643736	Derry	United Kingdom	Northern Ireland
2643741	City of London	United Kingdom	England
2643776	Lofthouse	United Kingdom	England
2644100	Llanelli	United Kingdom	Wales
2644120	Llandudno	United Kingdom	Wales
2644204	Livingston	United Kingdom	Scotland
2644210	Liverpool	United Kingdom	England
2644319	Littlehampton	United Kingdom	England
2644411	Lisburn	United Kingdom	Northern Ireland
2644487	Lincoln	United Kingdom	England
2644531	Lichfield	United Kingdom	England
2644547	Leyland	United Kingdom	England
2644559	Lewes	United Kingdom	England
2644597	Letchworth	United Kingdom	England
2644660	Leigh	United Kingdom	England
2644668	Leicester	United Kingdom	England
2644684	Leek	United Kingdom	England
2644688	Leeds	United Kingdom	England
2644726	Leatherhead	United Kingdom	England
2644737	Royal Leamington Spa	United Kingdom	England
2644849	Larne	United Kingdom	Northern Ireland
2644853	Larkhall	United Kingdom	Scotland
2644972	Lancaster	United Kingdom	England
2645261	Kirkintilloch	United Kingdom	Scotland
2645298	Kirkcaldy	United Kingdom	Scotland
2645309	Kirkby in Ashfield	United Kingdom	England
2645313	Kirkby	United Kingdom	England
2645418	Kingswood	United Kingdom	England
2645420	Kingswinford	United Kingdom	England
2645425	Hull	United Kingdom	England
2645456	King's Lynn	United Kingdom	England
2645541	Kilwinning	United Kingdom	Scotland
2645605	Kilmarnock	United Kingdom	Scotland
2645721	Kidsgrove	United Kingdom	England
2645724	Kidderminster	United Kingdom	England
2645733	Keynsham	United Kingdom	England
2645753	Kettering	United Kingdom	England
2645822	Kenilworth	United Kingdom	England
2645826	Kendal	United Kingdom	England
2645831	Kempston	United Kingdom	England
2645889	Keighley	United Kingdom	England
2645951	Johnstone	United Kingdom	Scotland
2645972	Jarrow	United Kingdom	England
2646003	Islington	United Kingdom	England
2646004	Isleworth	United Kingdom	England
2646032	Irvine	United Kingdom	England
2652622	Coity	United Kingdom	Wales
2652689	Cobham	United Kingdom	England
2652696	Coatbridge	United Kingdom	Scotland
2652698	Coalville	United Kingdom	England
2652734	Clydach	United Kingdom	Wales
2652819	Clitheroe	United Kingdom	England
2652861	Clevedon	United Kingdom	England
2652885	Cleethorpes	United Kingdom	England
2652890	Cleckheaton	United Kingdom	England
2652974	Clacton-on-Sea	United Kingdom	England
2652995	Cirencester	United Kingdom	England
2653075	Christchurch	United Kingdom	England
2653086	Chorley	United Kingdom	England
2653123	Chislehurst	United Kingdom	England
2653137	Chipping Sodbury	United Kingdom	England
2653144	Chippenham	United Kingdom	England
2653192	Chichester	United Kingdom	England
2653224	Chester-le-Street	United Kingdom	England
2653225	Chesterfield	United Kingdom	England
2653228	Chester	United Kingdom	England
2653232	Cheshunt	United Kingdom	England
2653235	Chesham	United Kingdom	England
2653261	Cheltenham	United Kingdom	England
2653265	Chelsea	United Kingdom	England
2653266	Chelmsford	United Kingdom	England
2653290	Cheadle Hulme	United Kingdom	England
2653305	Chatham	United Kingdom	England
2653353	Chapletown	United Kingdom	England
2653393	Chalfont Saint Peter	United Kingdom	England
2653520	Caterham	United Kingdom	England
2653558	Castlereagh	United Kingdom	Northern Ireland
2653584	Castleford	United Kingdom	England
2653646	Carshalton	United Kingdom	England
2653755	Carmarthen	United Kingdom	Wales
2653775	Carlisle	United Kingdom	England
2653822	Cardiff	United Kingdom	Wales
2653877	Canterbury	United Kingdom	England
2653883	Cannock	United Kingdom	England
2653941	Cambridge	United Kingdom	England
2653945	Camborne	United Kingdom	England
2653947	Camberley	United Kingdom	England
2654089	Caerphilly	United Kingdom	Wales
2654141	Buxton	United Kingdom	England
2654179	Bushey	United Kingdom	England
2654186	Bury St Edmunds	United Kingdom	England
2654187	Bury	United Kingdom	England
2654200	Burton upon Trent	United Kingdom	England
2654252	Burntwood	United Kingdom	England
2654264	Burnley	United Kingdom	England
2654269	Burnham-on-Sea	United Kingdom	England
2654308	Burgess Hill	United Kingdom	England
2654394	Buckley	United Kingdom	Wales
2654415	Buckhaven	United Kingdom	Scotland
2654450	Brymbo	United Kingdom	Wales
2654490	Brownhills	United Kingdom	England
2654579	Bromsgrove	United Kingdom	England
2654663	Brixham	United Kingdom	England
2654668	Briton Ferry	United Kingdom	Wales
2654675	Bristol	United Kingdom	England
2654710	Brighton	United Kingdom	England
2654715	Brighouse	United Kingdom	England
2654724	Brierley Hill	United Kingdom	England
2654728	Bridlington	United Kingdom	England
2654730	Bridgwater	United Kingdom	England
2654755	Bridgend	United Kingdom	Wales
2654782	Brentwood	United Kingdom	England
2654814	Bredbury	United Kingdom	England
2654927	Bramhall	United Kingdom	England
2654938	Braintree	United Kingdom	England
2654993	Bradford	United Kingdom	England
2655009	Bracknell	United Kingdom	England
2655095	Bournemouth	United Kingdom	England
2655198	Bootle	United Kingdom	England
2655237	Bolton	United Kingdom	England
2655262	Bognor Regis	United Kingdom	England
2655315	Blyth	United Kingdom	England
2655329	Bloxwich	United Kingdom	England
2655351	Bletchley	United Kingdom	England
2655524	Blackburn	United Kingdom	England
2655557	Bishopstoke	United Kingdom	England
2655562	Bishops Stortford	United Kingdom	England
2655582	Bishopbriggs	United Kingdom	Scotland
2655583	Bishop Auckland	United Kingdom	England
2655603	Birmingham	United Kingdom	England
2655613	Birkenhead	United Kingdom	England
2655642	Bingley	United Kingdom	England
2655664	Billingham	United Kingdom	England
2655672	Billericay	United Kingdom	England
2655689	Biggleswade	United Kingdom	England
2655707	Bideford	United Kingdom	England
2655708	Biddulph	United Kingdom	England
2655729	Bicester	United Kingdom	England
2655775	Bexley	United Kingdom	England
2655785	Beverley	United Kingdom	England
2655819	Berwick-Upon-Tweed	United Kingdom	England
2655858	Berkhamsted	United Kingdom	England
2655882	Bentley	United Kingdom	England
2655942	Belper	United Kingdom	England
2655952	Bellshill	United Kingdom	Scotland
2655984	Belfast	United Kingdom	Northern Ireland
2656031	Bedworth	United Kingdom	England
2656039	Bedlington	United Kingdom	England
2656046	Bedford	United Kingdom	England
2656065	Beckenham	United Kingdom	England
2656070	Bebington	United Kingdom	England
2656086	Bearsden	United Kingdom	Scotland
2656168	Batley	United Kingdom	England
2656169	Bathgate	United Kingdom	Scotland
2656173	Bath	United Kingdom	England
2656192	Basingstoke	United Kingdom	England
2656194	Basildon	United Kingdom	England
2656235	Barry	United Kingdom	Wales
2656258	Barrhead	United Kingdom	Scotland
2656281	Barnstaple	United Kingdom	England
2656284	Barnsley	United Kingdom	England
2656295	Barnet	United Kingdom	England
2656333	Barking	United Kingdom	England
2656379	Banstead	United Kingdom	England
2656396	Bangor	United Kingdom	Northern Ireland
2656397	Bangor	United Kingdom	Wales
2656406	Banbury	United Kingdom	England
2656407	Banbridge	United Kingdom	Northern Ireland
2656490	Ballymena	United Kingdom	Northern Ireland
2656627	Baildon	United Kingdom	England
2656708	Ayr	United Kingdom	Scotland
2656719	Aylesbury	United Kingdom	England
2656847	Atherton	United Kingdom	England
2656915	Ashton-under-Lyne	United Kingdom	England
2656955	Ashford	United Kingdom	England
2656992	Ascot	United Kingdom	England
2657030	Arnold	United Kingdom	England
2657215	Arbroath	United Kingdom	Scotland
2657255	Antrim	United Kingdom	Northern Ireland
2657324	Andover	United Kingdom	England
2657356	Amersham	United Kingdom	England
2657402	Altrincham	United Kingdom	England
2657408	Alton	United Kingdom	England
2657471	Alloa	United Kingdom	Scotland
2657508	Alfreton	United Kingdom	England
2657540	Aldershot	United Kingdom	England
2657613	Airdrie	United Kingdom	Scotland
2657697	Acton	United Kingdom	England
2657703	Acocks Green	United Kingdom	England
2657770	Accrington	United Kingdom	England
2657780	Abingdon	United Kingdom	England
2657782	Aberystwyth	United Kingdom	Wales
2657812	Abergele	United Kingdom	Wales
2657835	Aberdare	United Kingdom	Wales
3209584	Crosby	United Kingdom	England
3345317	Blackwood	United Kingdom	Wales
3345432	Neston	United Kingdom	England
3345437	Camden Town	United Kingdom	England
3345439	Telford	United Kingdom	England
3345440	Craigavon	United Kingdom	Northern Ireland
6545243	Bayswater	United Kingdom	England
6620293	Yateley	United Kingdom	England
6620355	Bowthorpe	United Kingdom	England
6620360	Hedge End	United Kingdom	England
6639623	Erskine	United Kingdom	Scotland
6640028	Hale	United Kingdom	England
6690592	Amersham on the Hill	United Kingdom	England
6690602	Battersea	United Kingdom	England
6690863	Hornchurch	United Kingdom	England
6690866	Surbiton	United Kingdom	England
6690867	Ewell	United Kingdom	England
6690870	Becontree	United Kingdom	England
6690877	Brixton	United Kingdom	England
6690989	Bethnal Green	United Kingdom	England
6691219	Failsworth	United Kingdom	England
6691227	Radcliffe	United Kingdom	England
6691235	Heywood	United Kingdom	England
6691766	Longsight	United Kingdom	England
6691884	Heavitree	United Kingdom	England
6691927	Ferndown	United Kingdom	England
6692280	Canary Wharf	United Kingdom	England
6693470	Lytham St Annes	United Kingdom	England
6693771	Hadley Wood	United Kingdom	England
6695247	Chapel Allerton	United Kingdom	England
6947041	Blackheath	United Kingdom	England
6947756	Mendip	United Kingdom	England
7290015	Lower Earley	United Kingdom	England
2657528	Aldridge	United Kingdom	England
8063096	Earlsfield	United Kingdom	England
8224216	Letchworth Garden City	United Kingdom	England
8224782	Shirley	United Kingdom	England
8224783	Stanley	United Kingdom	England
8299614	Rossendale	United Kingdom	England
8299616	Deeside	United Kingdom	Wales
8299617	High Peak	United Kingdom	England
8299619	Hayling Island	United Kingdom	England
8299620	Isle of Lewis	United Kingdom	Scotland
8299621	Shetland	United Kingdom	Scotland
8299623	Orkney	United Kingdom	Scotland
8315400	Holloway	United Kingdom	England
8581595	Harringay	United Kingdom	England
3579925	Saint George's	Grenada	Saint George
610824	Zugdidi	Georgia	Samegrelo and Zemo Svaneti
610864	Zestap’oni	Georgia	Imereti
611403	Ts’khinvali	Georgia	Shida Kartli
611583	Tqvarch'eli	Georgia	Abkhazia
611694	Telavi	Georgia	Kakheti
611717	Tbilisi	Georgia	T'bilisi
611847	Sokhumi	Georgia	Abkhazia
612126	Samtredia	Georgia	Imereti
612287	Rust’avi	Georgia	Kvemo Kartli
612366	P’ot’i	Georgia	Samegrelo and Zemo Svaneti
612536	Ozurgeti	Georgia	Guria
612652	Och’amch’ire	Georgia	Abkhazia
613074	Marneuli	Georgia	Kvemo Kartli
613607	Kutaisi	Georgia	Imereti
613762	Kobuleti	Georgia	Ajaria
613988	Khashuri	Georgia	Shida Kartli
614455	Gori	Georgia	Shida Kartli
615532	Batumi	Georgia	Ajaria
615860	Akhaltsikhe	Georgia	Samtskhe-Javakheti
615912	Stantsiya Novyy Afon	Georgia	Abkhazia
824288	Tsqaltubo	Georgia	Imereti
3380387	Saint-Laurent-du-Maroni	French Guiana	Guyane
3380892	Rémire-Montjoly	French Guiana	Guyane
3380965	Matoury	French Guiana	Guyane
3381303	Kourou	French Guiana	Guyane
3382160	Cayenne	French Guiana	Guyane
3042287	Saint Peter Port	Guernsey	St Peter Port
2293801	Yendi	Ghana	Northern
2294034	Winneba	Ghana	Central
2294086	Wenchi	Ghana	Brong-Ahafo
2294206	Wa	Ghana	Upper West
2294700	Tema	Ghana	Greater Accra
2294727	Techiman	Ghana	Brong-Ahafo
2294768	Tarkwa	Ghana	Western
2294877	Tamale	Ghana	Northern
2294915	Takoradi	Ghana	Western
2294938	Tafo	Ghana	Ashanti
2294962	Swedru	Ghana	Central
2295021	Sunyani	Ghana	Brong-Ahafo
2295065	Suhum	Ghana	Eastern
2295385	Shama Junction	Ghana	Western
2295458	Sekondi-Takoradi	Ghana	Western
2295517	Savelugu	Ghana	Northern
2295672	Saltpond	Ghana	Central
2295684	Salaga	Ghana	Northern
2295840	Prestea	Ghana	Western
2296458	Kasoa	Ghana	Central
2296564	Akim Oda	Ghana	Eastern
2296606	Obuasi	Ghana	Ashanti
2297141	Nsawam	Ghana	Eastern
2297313	Nkawkaw	Ghana	Eastern
2297505	Navrongo	Ghana	Upper East
2298264	Mampong	Ghana	Ashanti
2298330	Medina Estates	Ghana	Greater Accra
2298890	Kumasi	Ghana	Ashanti
2299233	Kpandu	Ghana	Volta
2299349	Konongo	Ghana	Ashanti
2299522	Koforidua	Ghana	Eastern
2299625	Kintampo	Ghana	Brong-Ahafo
2299645	Keta	Ghana	Volta
2300372	Hohoe	Ghana	Volta
2300379	Ho	Ghana	Volta
2300721	Gbawe	Ghana	Greater Accra
2300883	Foso	Ghana	Central
2301217	Ejura	Ghana	Ashanti
2301400	Dunkwa	Ghana	Central
2301639	Dome	Ghana	Greater Accra
2302357	Cape Coast	Ghana	Central
2302821	Bolgatanga	Ghana	Upper East
2303060	Bibiani	Ghana	Western
2303125	Berekum	Ghana	Brong-Ahafo
2303236	Begoro	Ghana	Eastern
2303287	Bawku	Ghana	Upper East
2303611	Axim	Ghana	Western
2304220	Asamankese	Ghana	Eastern
2304389	Apam	Ghana	Central
2304548	Anloga	Ghana	Volta
2305537	Agogo	Ghana	Ashanti
2306079	Achiaman	Ghana	Greater Accra
2306104	Accra	Ghana	Greater Accra
2306119	Aburi	Ghana	Eastern
2411585	Gibraltar	Gibraltar	N/A
3421319	Nuuk	Greenland	Sermersooq
2411880	Sukuta	Gambia	Western
2412749	Lamin	Gambia	North Bank
2413515	Farafenni	Gambia	North Bank
2413753	Brikama	Gambia	Western
2413876	Banjul	Gambia	Banjul
2413920	Bakau	Gambia	Banjul
2414545	Tougué	Guinea	Labe
2414926	Télimélé	Guinea	Kindia
2416443	Pita	Guinea	Mamou
2416969	Nzérékoré	Guinea	Nzerekore
2417833	Mamou	Guinea	Mamou
2417988	Macenta	Guinea	Nzerekore
2418362	Labé	Guinea	Labe
2419472	Kissidougou	Guinea	Faranah
2419533	Kindia	Guinea	Kindia
2419992	Kankan	Guinea	Kankan
2420056	Kamsar	Guinea	Boke
2420562	Gueckedou	Guinea	Nzerekore
2420884	Fria	Guinea	Boke
2422457	Coyah	Guinea	Kindia
2422465	Conakry	Guinea	Conakry
2422488	Camayenne	Guinea	Conakry
2422924	Boké	Guinea	Boke
3578466	Sainte-Anne	Guadeloupe	Guadeloupe
3578599	Pointe-à-Pitre	Guadeloupe	Guadeloupe
3578959	Les Abymes	Guadeloupe	Guadeloupe
3578967	Le Moule	Guadeloupe	Guadeloupe
3578978	Le Gosier	Guadeloupe	Guadeloupe
3579585	Capesterre-Belle-Eau	Guadeloupe	Guadeloupe
3579732	Basse-Terre	Guadeloupe	Guadeloupe
3579767	Baie-Mahault	Guadeloupe	Guadeloupe
2309332	Ebebiyin	Equatorial Guinea	Kié-Ntem
2309527	Malabo	Equatorial Guinea	Bioko Norte
2310046	Bata	Equatorial Guinea	Litoral
251780	Voúla	Greece	Attica
251833	Vólos	Greece	Thessaly
251948	Výronas	Greece	Attica
252270	Vári	Greece	Attica
252601	Trípoli	Greece	Peloponnese
252910	Thívai	Greece	Central Greece
253394	Spárti	Greece	Peloponnese
254144	Salamína	Greece	Attica
254352	Rethymno	Greece	Crete
254698	Préveza	Greece	Epirus
255229	Pýrgos	Greece	West Greece
255274	Piraeus	Greece	Attica
255377	Petroúpolis	Greece	Attica
255524	Peristéri	Greece	Attica
255588	Pérama	Greece	Attica
255683	Pátra	Greece	West Greece
256075	Palaió Fáliro	Greece	Attica
256429	Níkaia	Greece	Attica
256575	Néa Smýrni	Greece	Attica
256601	Ílion	Greece	Attica
256614	Néa Ionía	Greece	Attica
256621	Néa Filadélfeia	Greece	Attica
256622	Néa Erythraía	Greece	Attica
256750	Moskháton	Greece	Attica
256866	Mytilíni	Greece	North Aegean
257302	Melíssia	Greece	Attica
257365	Mégara	Greece	Attica
258038	Artémida	Greece	Attica
258463	Livadeiá	Greece	Central Greece
258576	Lárisa	Greece	Thessaly
258620	Lamía	Greece	Central Greece
259128	Metamórfosi	Greece	Attica
259245	Kos	Greece	South Aegean
259289	Kórinthos	Greece	Peloponnese
259824	Kifisiá	Greece	Attica
259949	Cholargós	Greece	Attica
259973	Chios	Greece	North Aegean
260114	Chaniá	Greece	Crete
260133	Chalkída	Greece	Central Greece
260172	Khalándrion	Greece	Attica
260183	Chaïdári	Greece	Attica
260204	Keratsíni	Greece	Attica
260989	Kardítsa	Greece	Thessaly
261249	Kamaterón	Greece	Attica
261414	Kallithéa	Greece	Attica
261614	Álimos	Greece	Attica
261678	Kaisarianí	Greece	Attica
261743	Irákleio	Greece	Attica
261745	Irákleion	Greece	Crete
261779	Ioánnina	Greece	Epirus
262036	Glyfáda	Greece	Attica
262135	Galátsi	Greece	Attica
262719	Ellinikó	Greece	Attica
262752	Elefsína	Greece	Attica
263312	Dhafní	Greece	Attica
263986	Agios Dimitrios	Greece	Attica
264111	Agía Varvára	Greece	Attica
264194	Agía Paraskeví	Greece	Attica
264371	Athens	Greece	Attica
264445	Asprópyrgos	Greece	Attica
264516	Argyroúpoli	Greece	Attica
264559	Árta	Greece	Epirus
264670	Árgos	Greece	Peloponnese
265243	Maroúsi	Greece	Attica
265252	Amaliáda	Greece	West Greece
265488	Acharnés	Greece	Attica
265500	Aígio	Greece	West Greece
265533	Aigáleo	Greece	Attica
265560	Agrínio	Greece	West Greece
400666	Ródos	Greece	South Aegean
733776	Giannitsá	Greece	Central Macedonia
733840	Xánthi	Greece	East Macedonia and Thrace
733905	Véroia	Greece	Central Macedonia
734301	Sykiés	Greece	Central Macedonia
734330	Sérres	Greece	Central Macedonia
734426	Ptolemaḯda	Greece	West Macedonia
734538	Políchni	Greece	Central Macedonia
734643	Pylaía	Greece	Central Macedonia
734712	Peraía	Greece	Central Macedonia
734771	Panórama	Greece	Central Macedonia
734880	Orestiáda	Greece	East Macedonia and Thrace
734883	Oraiókastro	Greece	Central Macedonia
735030	Náousa	Greece	Central Macedonia
735215	Meneméni	Greece	Central Macedonia
735563	Kozáni	Greece	West Macedonia
735640	Komotiní	Greece	East Macedonia and Thrace
735736	Kilkís	Greece	Central Macedonia
735861	Kavála	Greece	East Macedonia and Thrace
735914	Kateríni	Greece	Central Macedonia
736083	Kalamariá	Greece	Central Macedonia
736229	Flórina	Greece	West Macedonia
736357	Édessa	Greece	Central Macedonia
736928	Alexandroúpoli	Greece	East Macedonia and Thrace
2463679	Corfu	Greece	Ionian Islands
6324534	Vrilissia	Greece	Attica
8201845	Gérakas	Greece	Attica
8310138	Ilioúpoli	Greece	Attica
8310183	Korydallós	Greece	Attica
8358544	Zográfos	Greece	Attica
8358562	Péfki	Greece	Attica
8358563	Ágioi Anárgyroi	Greece	Attica
8478257	Agios Ioannis Rentis	Greece	Attica
9034728	Néa Ionía	Greece	Thessaly
3426466	Grytviken	South Georgia and the South Sandwich Islands	N/A
3587587	Zacapa	Guatemala	Zacapa
3587902	Villa Nueva	Guatemala	Guatemala
3587923	Villa Canales	Guatemala	Guatemala
3588258	Totonicapán	Guatemala	Totonicapán
3588476	Tecpán Guatemala	Guatemala	Chimaltenango
3588698	Sololá	Guatemala	Sololá
3589101	Santiago Sacatepéquez	Guatemala	Sacatepéquez
3589105	Santiago Atitlán	Guatemala	Sololá
3589253	Santa María de Jesús	Guatemala	Sacatepéquez
3589289	Santa Lucía Cotzumalguapa	Guatemala	Escuintla
3589404	Santa Cruz del Quiché	Guatemala	Quiché
3589452	Santa Catarina Pinula	Guatemala	Guatemala
3589626	San Pedro Sacatepéquez	Guatemala	San Marcos
3589646	San Pedro Ayampuc	Guatemala	Guatemala
3589671	San Pablo Jocopilas	Guatemala	Suchitepeque
3589805	San Marcos	Guatemala	San Marcos
3589885	San Juan Sacatepéquez	Guatemala	Guatemala
3589977	San José Pinula	Guatemala	Guatemala
3590219	San Francisco El Alto	Guatemala	Totonicapán
3590316	San Cristóbal Verapaz	Guatemala	Alta Verapaz
3590389	San Benito	Guatemala	Petén
3590406	Sanarate	Guatemala	El Progreso
3590529	San Andrés Itzapa	Guatemala	Chimaltenango
3590616	Salamá	Guatemala	Baja Verapaz
3590858	Retalhuleu	Guatemala	Retalhuleu
3590979	Quetzaltenango	Guatemala	Quetzaltenango
3591060	Puerto San José	Guatemala	Escuintla
3591062	Puerto Barrios	Guatemala	Izabal
3591093	Tiquisate	Guatemala	Escuintla
3591181	Poptún	Guatemala	Petén
3591415	Petapa	Guatemala	Guatemala
3591512	Patzún	Guatemala	Chimaltenango
3591523	Patzicía	Guatemala	Chimaltenango
3591676	Panzós	Guatemala	Alta Verapaz
3591833	Palín	Guatemala	Escuintla
3591851	Palencia	Guatemala	Guatemala
3591997	Ostuncalco	Guatemala	Quetzaltenango
3592237	Nebaj	Guatemala	Quiché
3592286	Nahualá	Guatemala	Sololá
3592362	Morales	Guatemala	Izabal
3592483	Momostenango	Guatemala	Totonicapán
3592519	Mixco	Guatemala	Guatemala
3592609	Mazatenango	Guatemala	Suchitepeque
3594575	La Gomera	Guatemala	Escuintla
3594703	La Esperanza	Guatemala	Quetzaltenango
3595069	Jutiapa	Guatemala	Jutiapa
3595171	Jocotenango	Guatemala	Sacatepéquez
3595237	Jalapa	Guatemala	Jalapa
3595248	Jacaltenango	Guatemala	Huehuetenango
3595416	Huehuetenango	Guatemala	Huehuetenango
3595560	Gualán	Guatemala	Zacapa
3595714	Fraijanes	Guatemala	Guatemala
3595725	Flores	Guatemala	Petén
3595783	Esquipulas	Guatemala	Chiquimula
3595803	Escuintla	Guatemala	Escuintla
3596041	El Tejar	Guatemala	Chimaltenango
3597078	El Estor	Guatemala	Izabal
3597804	Cuilapa	Guatemala	Santa Rosa
3598025	Comitancillo	Guatemala	San Marcos
3598034	Comalapa	Guatemala	Chimaltenango
3598073	Colomba	Guatemala	Quetzaltenango
3598119	Cobán	Guatemala	Alta Verapaz
3598122	Coatepeque	Guatemala	Quetzaltenango
3598128	Ciudad Vieja	Guatemala	Sacatepéquez
3598132	Guatemala City	Guatemala	Guatemala
3598415	Chisec	Guatemala	Alta Verapaz
3598465	Chiquimula	Guatemala	Chiquimula
3598529	Chinautla	Guatemala	Guatemala
3598572	Chimaltenango	Guatemala	Chimaltenango
3598655	Chichicastenango	Guatemala	Quiché
3598678	Chicacao	Guatemala	Suchitepeque
3599069	Cantel	Guatemala	Quetzaltenango
3599639	Asunción Mita	Guatemala	Jutiapa
3599699	Antigua Guatemala	Guatemala	Sacatepéquez
3599735	Amatitlán	Guatemala	Guatemala
3599788	Alotenango	Guatemala	Sacatepéquez
4038659	Tamuning-Tumon-Harmon Village	Guam	Tamuning
4038794	Yigo Village	Guam	Yigo
4043547	Guam Government House	Guam	Hagatna
4043909	Dededo Village	Guam	Dededo
4044012	Hagåtña	Guam	Hagatna
7268049	Mangilao Village	Guam	Mangilao
2374775	Bissau	Guinea-Bissau	Bissau
2375254	Bafatá	Guinea-Bissau	Bafatá
3376762	New Amsterdam	Guyana	East Berbice-Corentyne
3377408	Linden	Guyana	Upper Demerara-Berbice
3378644	Georgetown	Guyana	Demerara-Mahaica
1818209	Tsuen Wan	Hong Kong	Tsuen Wan
1818446	Tuen Mun	Hong Kong	Tuen Mun
1818673	Tai Po	Hong Kong	Tai Po
1818920	Sha Tin	Hong Kong	Sha Tin
1819609	Kowloon	Hong Kong	Kowloon City
1819729	Hong Kong	Hong Kong	Central and Western
3600026	Puerto Cortez	Honduras	Cortés
3600195	Yoro	Honduras	Yoro
3600327	Villanueva	Honduras	Cortés
3600704	Tocoa	Honduras	Colón
3600931	Tela	Honduras	Atlántida
3600949	Tegucigalpa	Honduras	Francisco Morazán
3601311	Siguatepeque	Honduras	Comayagua
3601494	Santa Rosa de Copán	Honduras	Copán
3601691	Santa Bárbara	Honduras	Santa Bárbara
3601782	San Pedro Sula	Honduras	Cortés
3601977	San Lorenzo	Honduras	Valle
3603330	Potrerillos	Honduras	Cortés
3604251	Olanchito	Honduras	Yoro
3607254	La Paz	Honduras	La Paz
3607511	La Lima	Honduras	Cortés
3608503	Juticalpa	Honduras	Olancho
3610613	El Progreso	Honduras	Yoro
3610965	El Paraíso	Honduras	El Paraíso
3612907	Danlí	Honduras	El Paraíso
3613321	Comayagua	Honduras	Comayagua
3613394	Cofradía	Honduras	Cortés
3613528	Ciudad Choluteca	Honduras	Choluteca
3613533	Choloma	Honduras	Cortés
3186781	Zaprešić	Croatia	Zagrebačka
3186952	Zadar	Croatia	Zadarska
3187694	Virovitica	Croatia	Virovitičk-Podravska
3187719	Vinkovci	Croatia	Vukovarsko-Srijemska
3188244	Velika Gorica	Croatia	Zagrebačka
3188383	Varaždin	Croatia	Varaždinska
3190261	Split	Croatia	Splitsko-Dalmatinska
3190359	Solin	Croatia	Splitsko-Dalmatinska
3190586	Slavonski Brod	Croatia	Brodsko-Posavska
3190589	Požega	Croatia	Požeško-Slavonska
3190813	Sisak	Croatia	Sisačko-Moslavačka
3190941	Šibenik	Croatia	Šibensko-Kniniska
3190966	Sesvete	Croatia	Grad Zagreb
3191316	Samobor	Croatia	Zagrebačka
3191648	Rijeka	Croatia	Primorsko-Goranska
3192224	Pula	Croatia	Istarska
3193935	Osijek	Croatia	Osječko-Baranjska
3198259	Karlovac	Croatia	Karlovačka
3201047	Dubrovnik	Croatia	Dubrovačko-Neretvanska
3202888	Čakovec	Croatia	Međimurska
3203982	Bjelovar	Croatia	Bjelovarsko-Bilogorska
3209380	Zagreb- Stenjevec	Croatia	Grad Zagreb
6618983	Zagreb - Centar	Croatia	Grad Zagreb
3716044	Verrettes	Haiti	Artibonite
3716667	Thomazeau	Haiti	Ouest
3717546	Saint-Raphaël	Haiti	Nord
3717588	Saint-Marc	Haiti	Artibonite
3718420	Port-de-Paix	Haiti	Nord-Ouest
3718426	Port-au-Prince	Haiti	Ouest
3718962	Tigwav	Haiti	Ouest
3719028	Pétionville	Haiti	Ouest
3720824	Miragoâne	Haiti	Nippes
3722124	Lenbe	Haiti	Nord
3722286	Léogâne	Haiti	Ouest
3723440	Kenscoff	Haiti	Ouest
3723593	Jérémie	Haiti	GrandʼAnse
3723779	Jacmel	Haiti	Sud-Est
3723841	Hinche	Haiti	Centre
3724233	Gressier	Haiti	Ouest
3724337	Grangwav	Haiti	Ouest
3724696	Gonayiv	Haiti	Artibonite
3726674	Désarmes	Haiti	Artibonite
3726786	Delmas 73	Haiti	Ouest
3727135	Croix des Bouquets	Haiti	Ouest
3728097	Les Cayes	Haiti	Sud
3728338	Carrefour	Haiti	Ouest
3728474	Okap	Haiti	Nord
3740016	Ti Port-de-Paix	Haiti	Nord-Ouest
714581	Törökszentmiklós	Hungary	Jász-Nagykun-Szolnok
715126	Szolnok	Hungary	Jász-Nagykun-Szolnok
715338	Szentes	Hungary	Csongrád
715429	Szeged	Hungary	Csongrád
715466	Szarvas	Hungary	Bekes
715839	Sátoraljaújhely	Hungary	Borsod-Abaúj-Zemplén
716301	Püspökladány	Hungary	Hajdú-Bihar
716671	Ózd	Hungary	Borsod-Abaúj-Zemplén
716736	Orosháza	Hungary	Bekes
716935	Nyíregyháza	Hungary	Szabolcs-Szatmár-Bereg
717582	Miskolc	Hungary	Borsod-Abaúj-Zemplén
717635	Mezőtúr	Hungary	Jász-Nagykun-Szolnok
717652	Mezőkövesd	Hungary	Borsod-Abaúj-Zemplén
717771	Mátészalka	Hungary	Szabolcs-Szatmár-Bereg
717902	Makó	Hungary	Csongrád
718739	Kisvárda	Hungary	Szabolcs-Szatmár-Bereg
719311	Kazincbarcika	Hungary	Borsod-Abaúj-Zemplén
719404	Karcag	Hungary	Jász-Nagykun-Szolnok
719965	Hódmezővásárhely	Hungary	Csongrád
720276	Hajdúszoboszló	Hungary	Hajdú-Bihar
720284	Hajdúnánás	Hungary	Hajdú-Bihar
720292	Hajdúböszörmény	Hungary	Hajdú-Bihar
720334	Gyula	Hungary	Bekes
720364	Gyomaendrőd	Hungary	Bekes
721239	Eger	Hungary	Heves
721592	Csongrád	Hungary	Csongrád
722324	Berettyóújfalu	Hungary	Hajdú-Bihar
722437	Békéscsaba	Hungary	Bekes
722439	Békés	Hungary	Bekes
722636	Balmazújváros	Hungary	Hajdú-Bihar
723030	Abony	Hungary	Pest
3042638	Zalaegerszeg	Hungary	Zala
3042929	Veszprém	Hungary	Veszprém
3043019	Vecsés	Hungary	Pest
3043095	Várpalota	Hungary	Veszprém
3043293	Vác	Hungary	Pest
3044082	Tatabánya	Hungary	Komárom-Esztergom
3044083	Tata	Hungary	Komárom-Esztergom
3044141	Tapolca	Hungary	Veszprém
3044310	Szombathely	Hungary	Vas
3044475	Szigetszentmiklós	Hungary	Pest
3044681	Szentendre	Hungary	Pest
3044760	Szekszárd	Hungary	Tolna
3044821	Százhalombatta	Hungary	Pest
3045190	Sopron	Hungary	Győr-Moson-Sopron
3045332	Siófok	Hungary	Somogy
3045487	Sárvár	Hungary	Vas
3045643	Salgótarján	Hungary	Nógrád
3046526	Pécs	Hungary	Baranya
3046619	Parádsasvár	Hungary	Heves
3046686	Pápa	Hungary	Veszprém
3046768	Paks	Hungary	Tolna
3046888	Oroszlány	Hungary	Komárom-Esztergom
3047651	Nagykőrös	Hungary	Pest
3047679	Nagykanizsa	Hungary	Zala
3047942	Monor	Hungary	Pest
3047967	Mohács	Hungary	Baranya
3049512	Komló	Hungary	Baranya
3049519	Komárom	Hungary	Komárom-Esztergom
3049880	Kiskunhalas	Hungary	Bács-Kiskun
3049885	Kiskunfélegyháza	Hungary	Bács-Kiskun
3049896	Kiskőrös	Hungary	Bács-Kiskun
3050212	Keszthely	Hungary	Zala
3050434	Kecskemét	Hungary	Bács-Kiskun
3050616	Kaposvár	Hungary	Somogy
3050719	Kalocsa	Hungary	Bács-Kiskun
3050907	Jászberény	Hungary	Jász-Nagykun-Szolnok
3051621	Hatvan	Hungary	Heves
3052009	Győr	Hungary	Győr-Moson-Sopron
3052040	Gyöngyös	Hungary	Heves
3052101	Gyál	Hungary	Pest
3052241	Göd	Hungary	Pest
3052542	Fót	Hungary	Pest
3053163	Esztergom	Hungary	Komárom-Esztergom
3053281	Érd	Hungary	Pest
3053438	Dunaújváros	Hungary	Fejér
3053476	Dunakeszi	Hungary	Pest
3053485	Dunaharaszti	Hungary	Pest
3053590	Dombóvár	Hungary	Tolna
3053836	Dabas	Hungary	Pest
3054543	Cegléd	Hungary	Pest
3054643	Budapest	Hungary	Budapest
3054646	Budaörs	Hungary	Pest
3055685	Baja	Hungary	Bács-Kiskun
3056357	Ajka	Hungary	Veszprém
7284823	Budapest XII. kerület	Hungary	Budapest
7284824	Budapest XI. kerület	Hungary	Budapest
7284825	Budapest IX. kerület	Hungary	Budapest
7284826	Budapest VIII. kerület	Hungary	Budapest
7284827	Budapest VII. kerület	Hungary	Budapest
7284828	Budapest VI. kerület	Hungary	Budapest
7284829	Budapest XIV. kerület	Hungary	Budapest
7284830	Budapest XIII. kerület	Hungary	Budapest
7284831	Budapest IV. kerület	Hungary	Budapest
7284832	Budapest XV. kerület	Hungary	Budapest
7284833	Budapest XVI. kerület	Hungary	Budapest
7284835	Budapest XIX. kerület	Hungary	Budapest
7284836	Budapest XVIII. kerület	Hungary	Budapest
7284837	Budapest XXIII. kerület	Hungary	Budapest
7284838	Budapest XXII. kerület	Hungary	Budapest
7284839	Budapest XXI. kerület	Hungary	Budapest
7284840	Budapest XX. kerület	Hungary	Budapest
7284841	Budapest XVII. kerület	Hungary	Budapest
7284842	Budapest III. kerület	Hungary	Budapest
7284843	Budapest II. kerület	Hungary	Budapest
7284844	Budapest I. kerület	Hungary	Budapest
1213442	Tongging	Indonesia	North Sumatra
1213493	Teluk Nibung	Indonesia	North Sumatra
1213500	Tebingtinggi	Indonesia	North Sumatra
1213530	Tanjungtiram	Indonesia	North Sumatra
1213547	Tanjungbalai	Indonesia	North Sumatra
1213614	Sunggal	Indonesia	North Sumatra
1213655	Stabat	Indonesia	North Sumatra
1213713	Singkil	Indonesia	Aceh
1213821	Sigli	Indonesia	Aceh
1213855	Sibolga	Indonesia	North Sumatra
1214026	Sabang	Indonesia	Aceh
1214055	Reuleuet	Indonesia	Aceh
1214189	Percut	Indonesia	North Sumatra
1214191	Perbaungan	Indonesia	North Sumatra
1214204	Pematangsiantar	Indonesia	North Sumatra
1214302	Pangkalan Brandan	Indonesia	North Sumatra
1214369	Padangsidempuan	Indonesia	North Sumatra
1214488	Meulaboh	Indonesia	Aceh
1214520	Medan	Indonesia	North Sumatra
1214658	Lhokseumawe	Indonesia	Aceh
1214724	Langsa	Indonesia	Aceh
1214800	Labuhan Deli	Indonesia	North Sumatra
1214882	Kisaran	Indonesia	North Sumatra
1214965	Kabanjahe	Indonesia	North Sumatra
1215199	Deli Tua	Indonesia	North Sumatra
1215350	Bireun	Indonesia	Aceh
1215355	Binjai	Indonesia	North Sumatra
1215395	Berastagi	Indonesia	North Sumatra
1215498	Bandar	Indonesia	North Sumatra
1215502	Banda Aceh	Indonesia	Aceh
1621177	Yogyakarta	Indonesia	Daerah Istimewa Yogyakarta
1621395	Wonosobo	Indonesia	Central Java
1621416	Wonopringgo	Indonesia	Central Java
1621439	Wongsorejo	Indonesia	East Java
1621520	Wiradesa	Indonesia	Central Java
1621613	Weru	Indonesia	West Java
1621655	Weleri	Indonesia	Central Java
1621659	Welahan	Indonesia	Central Java
1621678	Wedi	Indonesia	Central Java
1621884	Watampone	Indonesia	South Sulawesi
1622090	Wangon	Indonesia	Central Java
1622138	Wanaraja	Indonesia	West Java
1622636	Ungaran	Indonesia	Central Java
1622786	Makassar	Indonesia	South Sulawesi
1622846	Ubud	Indonesia	Bali
1623080	Tulungagung	Indonesia	East Java
1623096	Tulangan Utara	Indonesia	East Java
1623180	Tuban	Indonesia	East Java
1623197	Tual	Indonesia	Maluku
1623223	Trucuk	Indonesia	Central Java
1623251	Trenggalek	Indonesia	East Java
1623424	Tondano	Indonesia	North Sulawesi
1623446	Tomohon	Indonesia	North Sulawesi
1624041	Ternate	Indonesia	Maluku Utara
1624058	Terbanggi Besar	Indonesia	Lampung
1624494	Tegal	Indonesia	Central Java
1624545	Tayu	Indonesia	Central Java
1624647	Tasikmalaya	Indonesia	West Java
1624668	Tarub	Indonesia	Central Java
1624725	Tarakan	Indonesia	North Kalimantan
1624877	Tanjung Pandan	Indonesia	Bangka–Belitung Islands
1624917	Bandar Lampung	Indonesia	Lampung
1624987	Tanjungagung	Indonesia	South Sumatra
1625067	Tanggulangin	Indonesia	East Java
1625084	Tangerang	Indonesia	Banten
1625708	Tabanan	Indonesia	Bali
1625812	Surakarta	Indonesia	Central Java
1625822	Surabaya	Indonesia	East Java
1625908	Sungai Raya	Indonesia	West Kalimantan
1625929	Sungai Penuh	Indonesia	Jambi
1625958	Sungailiat	Indonesia	Bangka–Belitung Islands
1626099	Sumenep	Indonesia	East Java
1626100	Sumedang Utara	Indonesia	N/A
1626134	Sumberpucung	Indonesia	East Java
1626183	Sumber	Indonesia	West Java
1626312	Sokaraja	Indonesia	Central Java
1626381	Sukabumi	Indonesia	West Java
1626486	Srono	Indonesia	East Java
1626498	Sragen	Indonesia	Central Java
1626542	Sorong	Indonesia	West Papua
1626560	Soreang	Indonesia	West Java
1626649	Solok	Indonesia	West Sumatra
1626673	Soko	Indonesia	East Java
1626698	Sofifi	Indonesia	Maluku Utara
1626703	Soe	Indonesia	East Nusa Tenggara
1626754	Sleman	Indonesia	Daerah Istimewa Yogyakarta
1626758	Slawi	Indonesia	Central Java
1626801	Situbondo	Indonesia	East Java
1626895	Sinjai	Indonesia	South Sulawesi
1626899	Singosari	Indonesia	East Java
1626903	Singojuruh	Indonesia	East Java
1626916	Singkawang	Indonesia	West Kalimantan
1626921	Sengkang	Indonesia	South Sulawesi
1626932	Singaraja	Indonesia	Bali
1626936	Singaparna	Indonesia	West Java
1627035	Simpang	Indonesia	Jambi
1627185	Sijunjung	Indonesia	West Sumatra
1627253	Sidoarjo	Indonesia	East Java
1627267	Sidareja	Indonesia	Central Java
1627459	Serpong	Indonesia	West Java
1627549	Serang	Indonesia	Banten
1627610	Sepatan	Indonesia	West Java
1627896	Semarang	Indonesia	Central Java
1627969	Selogiri	Indonesia	Central Java
1628453	Sawangan	Indonesia	West Java
1628884	Sampit	Indonesia	Central Kalimantan
1628899	Sampang	Indonesia	East Java
1629001	Samarinda	Indonesia	East Kalimantan
1629131	Salatiga	Indonesia	Central Java
1629380	Ruteng	Indonesia	East Nusa Tenggara
1629710	Rengasdengklok	Indonesia	West Java
1629749	Rembangan	Indonesia	Central Java
1629974	Rantepao	Indonesia	South Sulawesi
1630058	Rangkasbitung	Indonesia	Banten
1630088	Randudongkal	Indonesia	Central Java
1630200	Rajapolah	Indonesia	West Java
1630328	Purwokerto	Indonesia	Central Java
1630333	Purwodadi	Indonesia	Central Java
1630366	Purbalingga	Indonesia	Central Java
1630416	Pundong	Indonesia	Daerah Istimewa Yogyakarta
1630634	Probolinggo	Indonesia	East Java
1630649	Prigen	Indonesia	East Java
1630662	Praya	Indonesia	West Nusa Tenggara
1630681	Candi Prambanan	Indonesia	Central Java
1630723	Poso	Indonesia	Central Sulawesi
1630789	Pontianak	Indonesia	West Kalimantan
1630798	Ponorogo	Indonesia	East Java
1630935	Polewali	Indonesia	Sulawesi Barat
1630997	Plumbon	Indonesia	West Java
1631271	Petarukan	Indonesia	Central Java
1631393	Prabumulih	Indonesia	South Sumatra
1631637	Pemangkat	Indonesia	West Kalimantan
1631648	Pemalang	Indonesia	Central Java
1631733	Pelabuhanratu	Indonesia	West Java
1631761	Pekanbaru	Indonesia	Riau
1631851	Pecangaan	Indonesia	Central Java
1631905	Payakumbuh	Indonesia	West Sumatra
1631992	Pati	Indonesia	Central Java
1632033	Pasuruan	Indonesia	East Java
1632197	Paseh	Indonesia	West Java
1632228	Pasarkemis	Indonesia	West Java
1632276	Parung	Indonesia	West Java
1632334	Pariaman	Indonesia	West Sumatra
1632353	Parepare	Indonesia	South Sulawesi
1632358	Pare	Indonesia	East Java
1632566	Panji	Indonesia	East Java
1632694	Pangkalanbuun	Indonesia	Central Kalimantan
1632823	Pandeglang	Indonesia	Banten
1632859	Pandaan	Indonesia	East Java
1632861	Pandak	Indonesia	Daerah Istimewa Yogyakarta
1632903	Panarukan	Indonesia	East Java
1632937	Pamulang	Indonesia	West Java
1632974	Pameungpeuk	Indonesia	West Java
1632978	Pamekasan	Indonesia	East Java
1632998	Pamanukan	Indonesia	West Java
1633034	Palu	Indonesia	Central Sulawesi
1633037	Palopo	Indonesia	South Sulawesi
1633056	Palimanan	Indonesia	West Java
1633070	Palembang	Indonesia	South Sumatra
1633118	Palangkaraya	Indonesia	Central Kalimantan
1633182	Pakisaji	Indonesia	East Java
1633308	Pageralam	Indonesia	South Sumatra
1633419	Padang	Indonesia	West Sumatra
1633442	Paciran	Indonesia	East Java
1633986	Ngunut	Indonesia	East Java
1634010	Ngoro	Indonesia	East Java
1634098	Ngawi	Indonesia	West Java
1634131	Nganjuk	Indonesia	East Java
1634266	Negara	Indonesia	Bali
1634614	Nabire	Indonesia	Papua
1634680	Muntilan	Indonesia	Central Java
1634718	Muncar	Indonesia	East Java
1634954	Mranggen	Indonesia	Central Java
1635111	Mojokerto	Indonesia	East Java
1635116	Mojoagung	Indonesia	East Java
1635164	Mlonggo	Indonesia	Central Java
1635283	Metro	Indonesia	Lampung
1635342	Mertoyudan	Indonesia	Central Java
1635660	Melati	Indonesia	Daerah Istimewa Yogyakarta
1635815	Maumere	Indonesia	East Nusa Tenggara
1635882	Mataram	Indonesia	West Nusa Tenggara
1636022	Martapura	Indonesia	South Kalimantan
1636121	Margasari	Indonesia	Central Java
1636125	Margahayukencana	Indonesia	West Java
1636308	Manokwari	Indonesia	West Papua
1636322	Manismata	Indonesia	West Kalimantan
1636507	Mendaha	Indonesia	Jambi
1636544	Manado	Indonesia	North Sulawesi
1636806	Majene	Indonesia	Sulawesi Barat
1636808	Majenang	Indonesia	Central Java
1636884	Magelang	Indonesia	Central Java
1636930	Madiun	Indonesia	East Java
1637001	Luwuk	Indonesia	Central Sulawesi
1637090	Lumajang	Indonesia	East Java
1637158	Lubuklinggau	Indonesia	South Sumatra
1637510	Loa Janan	Indonesia	East Kalimantan
1638063	Lembang	Indonesia	West Java
1638217	Lebaksiu	Indonesia	Central Java
1638284	Lawang	Indonesia	East Java
1638352	Lasem	Indonesia	Central Java
1638562	Lamongan	Indonesia	East Java
1638775	Lahat	Indonesia	South Sumatra
1638868	Labuan Bajo	Indonesia	East Nusa Tenggara
1638870	Labuan	Indonesia	Banten
1638981	Kutoarjo	Indonesia	Central Java
1639002	Kuta	Indonesia	Bali
1639215	Kudus	Indonesia	Central Java
1639286	Kuala Tungkal	Indonesia	Jambi
1639304	Kualakapuas	Indonesia	Central Kalimantan
1639337	Kroya	Indonesia	Central Java
1639356	Krian	Indonesia	East Java
1639362	Kresek	Indonesia	West Java
1639431	Kraksaan	Indonesia	East Java
1639524	Kotabumi	Indonesia	Lampung
1639850	Klungkung	Indonesia	Bali
1639900	Klaten	Indonesia	Central Java
1639925	Klangenan	Indonesia	West Java
1640044	Kijang	Indonesia	Riau Islands
1640138	Ketanggungan	Indonesia	Central Java
1640185	Kertosono	Indonesia	East Java
1640296	Kepanjen	Indonesia	East Java
1640344	Kendari	Indonesia	Sulawesi Tenggara
1640354	Kencong	Indonesia	East Java
1640581	Kedungwuni	Indonesia	Central Java
1640585	Kedungwaru	Indonesia	East Java
1640660	Kediri	Indonesia	East Java
1640755	Kebonarun	Indonesia	Central Java
1640765	Kebomas	Indonesia	East Java
1640902	Kawalu	Indonesia	West Java
1640972	Katabu	Indonesia	Sulawesi Tenggara
1641184	Karangsembung	Indonesia	West Java
1641301	Karangasem	Indonesia	Bali
1641333	Karanganom	Indonesia	Central Java
1641342	Karangampel	Indonesia	West Java
1641792	Kamal	Indonesia	East Java
1641977	Kalianget	Indonesia	East Java
1642317	Juwana	Indonesia	Central Java
1642414	Jombang	Indonesia	East Java
1642437	Jogonalan	Indonesia	Central Java
1642588	Jember	Indonesia	East Java
1642684	Jatiwangi	Indonesia	West Java
1642692	Jatiroto	Indonesia	Central Java
1642726	Jatibarang	Indonesia	West Java
1642754	Jaten	Indonesia	Central Java
1642858	Jambi City	Indonesia	Jambi
1642911	Jakarta	Indonesia	Jakarta Raya
1643078	Indramayu	Indonesia	West Java
1643761	Grogol	Indonesia	Central Java
1643776	Gresik	Indonesia	East Java
1643837	Gorontalo	Indonesia	Gorontalo
1643898	Gongdanglegi Kulon	Indonesia	East Java
1643920	Gombong	Indonesia	Central Java
1643981	Godean	Indonesia	Daerah Istimewa Yogyakarta
1644178	Genteng	Indonesia	East Java
1644349	Gedangan	Indonesia	East Java
1644360	Gebog	Indonesia	Central Java
1644557	Gambiran Satu	Indonesia	East Java
1644605	Galesong	Indonesia	South Sulawesi
1644932	Ende	Indonesia	East Nusa Tenggara
1645133	Dumai	Indonesia	Riau
1645154	Dukuhturi	Indonesia	Central Java
1645220	Driyorejo	Indonesia	East Java
1645343	Dompu	Indonesia	West Nusa Tenggara
1645428	Diwek	Indonesia	East Java
1645518	Depok	Indonesia	Daerah Istimewa Yogyakarta
1645524	Depok	Indonesia	West Java
1645528	Denpasar	Indonesia	Bali
1645559	Demak	Indonesia	Central Java
1645565	Delanggu	Indonesia	Central Java
1645749	Dampit	Indonesia	East Java
1645875	Curup	Indonesia	Bengkulu
1645895	Curug	Indonesia	Banten
1645978	Colomadu	Indonesia	Central Java
1646034	Citeureup	Indonesia	West Java
1646170	Cirebon	Indonesia	West Java
1646194	Ciputat	Indonesia	West Java
1646448	Cimahi	Indonesia	West Java
1646492	Cileunyi	Indonesia	West Java
1646494	Cileungsir	Indonesia	West Java
1646678	Cikarang	Indonesia	West Java
1646698	Cikampek	Indonesia	West Java
1646893	Cicurug	Indonesia	West Java
1647003	Cibinong	Indonesia	West Java
1647149	Ciamis	Indonesia	West Java
1647179	Cepu	Indonesia	Central Java
1647187	Ceper	Indonesia	Central Java
1647298	Caringin	Indonesia	West Java
1647383	Ciampea	Indonesia	West Java
1647866	Bukittinggi	Indonesia	West Sumatra
1647936	Buduran	Indonesia	East Java
1647991	Buaran	Indonesia	Central Java
1648082	Boyolangu	Indonesia	East Java
1648084	Boyolali	Indonesia	Central Java
1648186	Bontang	Indonesia	East Kalimantan
1648266	Bondowoso	Indonesia	East Java
1648451	Bojonegoro	Indonesia	East Java
1648473	Bogor	Indonesia	West Java
1648568	Blora	Indonesia	Central Java
1648580	Blitar	Indonesia	East Java
1648636	Bitung	Indonesia	North Sulawesi
1648759	Bima	Indonesia	West Nusa Tenggara
1648918	Besuki	Indonesia	East Java
1649150	Bengkulu	Indonesia	Bengkulu
1649378	Bekasi	Indonesia	West Java
1649595	Baturaden	Indonesia	Central Java
1649824	Batu	Indonesia	East Java
1650064	Barabai	Indonesia	South Kalimantan
1650077	Banyuwangi	Indonesia	East Java
1650095	Banyumas	Indonesia	Central Java
1650119	Bantul	Indonesia	Daerah Istimewa Yogyakarta
1650213	Banjarmasin	Indonesia	South Kalimantan
1650227	Banjaran	Indonesia	West Java
1650232	Banjar	Indonesia	Bali
1650234	Banjar	Indonesia	West Java
1650298	Bangkalan	Indonesia	East Java
1650319	Bangil	Indonesia	East Java
1650357	Bandung	Indonesia	West Java
1650434	Bambanglipuro	Indonesia	Daerah Istimewa Yogyakarta
1650460	Balung	Indonesia	East Java
1650527	Balikpapan	Indonesia	East Kalimantan
1650572	Balapulang	Indonesia	Central Java
1650600	Balaipungut	Indonesia	Riau
1650670	Baki	Indonesia	Central Java
1650888	Babat	Indonesia	East Java
1651103	Atambua	Indonesia	East Nusa Tenggara
1651112	Astanajapura	Indonesia	West Java
1651226	Arjawinangun	Indonesia	West Java
1651461	Amuntai	Indonesia	South Kalimantan
1651531	Ambon	Indonesia	Maluku
1651555	Ambarawa	Indonesia	Central Java
1651591	Amahai	Indonesia	Maluku
1651887	Adiwerna	Indonesia	Central Java
1963770	Padalarang	Indonesia	West Java
1964032	Ciranjang-hilir	Indonesia	West Java
1985663	Cikupa	Indonesia	West Java
1990589	Teluknaga	Indonesia	West Java
2005057	Gamping Lor	Indonesia	Daerah Istimewa Yogyakarta
2005237	Kasihan	Indonesia	Daerah Istimewa Yogyakarta
2010971	Ngemplak	Indonesia	Central Java
2010985	Kartasura	Indonesia	Central Java
2011457	Gatak	Indonesia	Central Java
2057087	Kupang	Indonesia	East Nusa Tenggara
2082600	Jayapura	Indonesia	Papua
2082727	Abepura	Indonesia	Papua
7084521	Seririt	Indonesia	Bali
8224624	City of Balikpapan	Indonesia	East Kalimantan
8449493	Pekan Bahapal	Indonesia	North Sumatra
8581443	South Tangerang	Indonesia	Banten
2960964	Loch Garman	Ireland	Leinster
2960992	Waterford	Ireland	Munster
2961123	Tralee	Ireland	Munster
2961284	Tallaght	Ireland	Leinster
2961297	Swords	Ireland	Leinster
2961423	Sligo	Ireland	Connaught
2962290	Droichead Nua	Ireland	Leinster
2962308	Navan	Ireland	Leinster
2962334	Naas	Ireland	Leinster
2962361	An Muileann gCearr	Ireland	Leinster
2962725	Malahide	Ireland	Leinster
2962785	Lucan	Ireland	Leinster
2962961	Letterkenny	Ireland	Ulster
2962974	Leixlip	Ireland	Leinster
2963398	Kilkenny	Ireland	Leinster
2964180	Gaillimh	Ireland	Connaught
2964303	Finglas	Ireland	Leinster
2964405	Ennis	Ireland	Munster
2964506	Dún Laoghaire	Ireland	Leinster
2964540	Dundalk	Ireland	Leinster
2964661	Drogheda	Ireland	Leinster
2965140	Cork	Ireland	Munster
2965353	Cluain Meala	Ireland	Munster
2965529	Celbridge	Ireland	Leinster
2965768	Carlow	Ireland	Leinster
2966794	Balbriggan	Ireland	Leinster
2966839	Athlone	Ireland	Leinster
3315278	Sandyford	Ireland	Leinster
6691033	Donaghmede	Ireland	Leinster
281184	Jerusalem	Israel	Jerusalem
293100	Safed	Israel	Northern District
293207	Yehud	Israel	Central District
293222	Yavné	Israel	Central District
293253	Yafo	Israel	Tel Aviv
293286	Umm el Faḥm	Israel	Haifa
293308	Tirat Karmel	Israel	Haifa
293322	Tiberias	Israel	Northern District
293397	Tel Aviv	Israel	Tel Aviv
293426	Tamra	Israel	Northern District
293619	Sederot	Israel	Southern District
293655	Sakhnīn	Israel	Northern District
293690	Rosh Ha‘Ayin	Israel	Central District
293703	Rishon LeẔiyyon	Israel	Central District
293768	Ramla	Israel	Central District
293783	Ramat HaSharon	Israel	Tel Aviv
293788	Ramat Gan	Israel	Tel Aviv
293807	Ra'anana	Israel	Central District
293822	Qiryat Yam	Israel	Haifa
293825	Qiryat Shemona	Israel	Northern District
293831	Qiryat Moẕqin	Israel	Haifa
293842	Qiryat Gat	Israel	Southern District
293844	Qiryat Bialik	Israel	Haifa
293845	Qiryat Ata	Israel	Haifa
293896	Qalansuwa	Israel	Central District
293918	Petaẖ Tiqwa	Israel	Central District
293962	Or Yehuda	Israel	Tel Aviv
293992	Ofaqim	Israel	Southern District
294071	Netanya	Israel	Central District
294074	Ness Ziona	Israel	Central District
294078	Nesher	Israel	Haifa
294098	Nazareth	Israel	Northern District
294117	Nahariya	Israel	Northern District
294210	Migdal Ha‘Emeq	Israel	Northern District
294244	Mevo Betar	Israel	Jerusalem
294387	Maghār	Israel	Northern District
294421	Lod	Israel	Central District
294514	Kfar Saba	Israel	Central District
294577	Karmi’el	Israel	Northern District
294604	Kafr Qāsim	Israel	Central District
294608	Kafr Mandā	Israel	Northern District
1253754	Unhel	India	Madhya Pradesh
2964574	Dublin	Ireland	Leinster
294622	Judeida Makr	Israel	Northern District
294751	H̱olon	Israel	Tel Aviv
294760	Hod HaSharon	Israel	Central District
294778	Herzliyya	Israel	Tel Aviv
294801	Haifa	Israel	Haifa
294946	H̱adera	Israel	Haifa
294999	Giv‘atayim	Israel	Tel Aviv
295127	Tirah	Israel	Central District
295130	Eṭ Ṭaiyiba	Israel	Central District
295174	Er Reina	Israel	Northern District
295277	Eilat	Israel	Southern District
295328	Dimona	Israel	Southern District
295365	Dāliyat el Karmil	Israel	Haifa
295432	Bet Shemesh	Israel	Jerusalem
295435	Bet She’an	Israel	Northern District
295514	Bené Beraq	Israel	Tel Aviv
295530	Beersheba	Israel	Southern District
295548	Bat Yam	Israel	Tel Aviv
295620	Ashqelon	Israel	Southern District
295629	Ashdod	Israel	Southern District
295657	‘Arad	Israel	Southern District
295721	‘Akko	Israel	Northern District
295739	‘Afula ‘Illit	Israel	Northern District
6693679	Modiin	Israel	Central District
7498240	West Jerusalem	Israel	Jerusalem
8199378	Modiin Ilit	Israel	Jerusalem
8199394	Ariel	Israel	Jerusalem
3042237	Douglas	Isle of Man	Douglas
1252646	Keelakarai	India	Tamil Nadu
1252653	Zunheboto	India	Nagaland
1252692	Zamānia	India	Uttar Pradesh
1252698	Zaidpur	India	Uttar Pradesh
1252699	Zahirābād	India	Telangana
1252738	Yeola	India	Maharashtra
1252744	Yellāpur	India	Karnataka
1252745	Yellandu	India	Telangana
1252758	Yelahanka	India	Karnataka
1252770	Yavatmāl	India	Maharashtra
1252773	Yāval	India	Maharashtra
1252795	Yanam	India	Andhra Pradesh
1252797	Yamunānagar	India	Haryana
1252822	Yādgīr	India	Karnataka
1252885	Wer	India	Rajasthan
1252887	Wellington	India	Tamil Nadu
1252892	Wazīrganj	India	Uttar Pradesh
1252908	Wāshīm	India	Maharashtra
1252919	Warud	India	Maharashtra
1252925	Warora	India	Maharashtra
1252930	Wāris Alīganj	India	Bihar
1252942	Wardha	India	Maharashtra
1252946	Wārāseonī	India	Madhya Pradesh
1252948	Warangal	India	Telangana
1252956	Wanparti	India	Telangana
1252958	Wānkāner	India	Gujarat
1252960	Wani	India	Maharashtra
1252997	Walajapet	India	Tamil Nadu
1253041	Wādi	India	Karnataka
1253074	Vyāra	India	Gujarat
1253077	Vuyyūru	India	Andhra Pradesh
1253079	Vrindāvan	India	Uttar Pradesh
1253080	Vriddhāchalam	India	Tamil Nadu
1253084	Vizianagaram	India	Andhra Pradesh
1253091	Vite	India	Maharashtra
1253095	Visnagar	India	Gujarat
1253102	Visakhapatnam	India	Andhra Pradesh
1253105	Vīsāvadar	India	Gujarat
1253113	Virudunagar	India	Tamil Nadu
1253127	Viravanallūr	India	Tamil Nadu
1253133	Virār	India	Maharashtra
1253150	Vinukonda	India	Andhra Pradesh
1253166	Villupuram	India	Tamil Nadu
1253182	Vikārābād	India	Telangana
1253184	Vijayawada	India	Andhra Pradesh
1253193	Vijāpur	India	Gujarat
1253200	Vidisha	India	Madhya Pradesh
1253216	Vettūr	India	Kerala
1253219	Vettaikkaranpudur	India	Tamil Nadu
1253220	Vetapālem	India	Andhra Pradesh
1253237	Verāval	India	Gujarat
1253242	Vepagunta	India	Andhra Pradesh
1253251	Venkatagiri	India	Andhra Pradesh
1253275	Vemalwāda	India	Telangana
1253278	Velur	India	Tamil Nadu
1253286	Vellore	India	Tamil Nadu
1253315	Vejalpur	India	Gujarat
1253340	Vayalār	India	Kerala
1253352	Vattalkundu	India	Tamil Nadu
1253357	Vāsudevanallūr	India	Tamil Nadu
1253363	Vasind	India	Maharashtra
1253367	Vāsco Da Gāma	India	Goa
1253374	Vasa	India	Gujarat
1253392	Varkala	India	Kerala
1253403	Varangaon	India	Maharashtra
1253405	Varanasi	India	Uttar Pradesh
1253437	Vaniyambadi	India	Tamil Nadu
1253452	Vandavāsi	India	Tamil Nadu
1253468	Valsād	India	Gujarat
1253472	Valparai	India	Tamil Nadu
1253482	Vallabh Vidyanagar	India	Gujarat
1253512	Valabhīpur	India	Gujarat
1253544	Vaikam	India	Kerala
1253545	Vaijāpur	India	Maharashtra
1253577	Vadnagar	India	Gujarat
1253578	Vadlapūdi	India	Andhra Pradesh
1253579	Vādippatti	India	Tamil Nadu
1253595	Vadamadurai	India	Tamil Nadu
1253605	Vadakku Valliyūr	India	Tamil Nadu
1253610	Vāda	India	Maharashtra
1253623	Uttiramerūr	India	Tamil Nadu
1253628	Uttarkāshi	India	Uttarakhand
1253635	Uttamapālaiyam	India	Tamil Nadu
1253638	Utraula	India	Uttar Pradesh
1253671	Usilampatti	India	Tamil Nadu
1253673	Usehat	India	Uttar Pradesh
1253702	Uran	India	Maharashtra
1253736	Upleta	India	Gujarat
1253744	Uppal Kalan	India	Telangana
1253747	Unnāo	India	Uttar Pradesh
1253750	Unjha	India	Gujarat
1253783	Una	India	Gujarat
1253786	Un	India	Gujarat
1253805	Umreth	India	Gujarat
1253807	Umred	India	Maharashtra
1253860	Umarkot	India	Chhattisgarh
1253861	Umarkhed	India	Maharashtra
1253863	Umaria	India	Madhya Pradesh
1253870	Umarga	India	Maharashtra
1253888	Ullal	India	Karnataka
1253894	Ulhasnagar	India	Maharashtra
1253914	Ujjain	India	Madhya Pradesh
1253918	Ujhāni	India	Uttar Pradesh
1253952	Udipi	India	Karnataka
1253956	Udhampur	India	Kashmir
1253958	Udgīr	India	Maharashtra
1253972	Udankudi	India	Tamil Nadu
1253977	Udalguri	India	Assam
1253984	Udaipura	India	Madhya Pradesh
1253985	Udaipur	India	Rajasthan
1253986	Udaipur	India	Rajasthan
1253987	Udaipur	India	Tripura
1253993	Ooty	India	Tamil Nadu
1254000	Bara Uchāna	India	Haryana
1254043	Turaiyūr	India	Tamil Nadu
1254046	Tura	India	Meghalaya
1254054	Tuni	India	Andhra Pradesh
1254069	Tūndla	India	Uttar Pradesh
1254080	Tumsar	India	Maharashtra
1254089	Tumkūr	India	Karnataka
1254111	Tuljāpur	India	Maharashtra
1254131	Tufānganj	India	West Bengal
1254133	Tuensang	India	Nagaland
1254163	Thiruvananthapuram	India	Kerala
1254187	Trichūr	India	Kerala
1254241	Tonk	India	Rajasthan
1254249	Tondi	India	Tamil Nadu
1254274	Tohāna	India	Haryana
1254282	Todaraisingh	India	Rajasthan
1254283	Todabhim	India	Rajasthan
1254304	Titlāgarh	India	Odisha
1254309	Titāgarh	India	West Bengal
1254317	Tisaiyanvilai	India	Tamil Nadu
1254320	Tiruvottiyūr	India	Tamil Nadu
1254322	Cheyyar	India	Tamil Nadu
1254331	Tiruvallur	India	Tamil Nadu
1254335	Tiruvalla	India	Kerala
1254342	Thiruthani	India	Tamil Nadu
1254343	Tiruttangal	India	Tamil Nadu
1254346	Tirur	India	Kerala
1254347	Tiruppuvanam	India	Tamil Nadu
1254348	Tiruppur	India	Tamil Nadu
1254356	Tirupparangunram	India	Tamil Nadu
1254360	Tirupati	India	Andhra Pradesh
1254361	Tirunelveli	India	Tamil Nadu
1254373	Tirumala	India	Andhra Pradesh
1254377	Tirukkoyilur	India	Tamil Nadu
1254385	Tiruchengode	India	Tamil Nadu
1254388	Tiruchirappalli	India	Tamil Nadu
1254390	Tiruchchendur	India	Tamil Nadu
1254396	Tīrthahalli	India	Karnataka
1254420	Tiptūr	India	Karnataka
1254432	Tinsukia	India	Assam
1254444	Tindivanam	India	Tamil Nadu
1254481	Tilhar	India	Uttar Pradesh
1254534	Tīkamgarh	India	Madhya Pradesh
1254538	Tijāra	India	Rajasthan
1254570	Thoubāl	India	Manipur
1254589	Thiruvarur	India	Tamil Nadu
1254624	Thāsra	India	Gujarat
1254638	Tharād	India	Gujarat
1254649	Thanjāvūr	India	Tamil Nadu
1254657	Thānesar	India	Haryana
1254661	Thāne	India	Maharashtra
1254673	Thāna Bhawan	India	Uttar Pradesh
1254675	Thān	India	Gujarat
1254694	Thākurganj	India	Bihar
1254710	Tezpur	India	Assam
1254727	Terdāl	India	Karnataka
1254732	Teonthar	India	Madhya Pradesh
1254744	Thenkasi	India	Tamil Nadu
1254745	Teni	India	Tamil Nadu
1254780	Tellicherry	India	Kerala
1254787	Telhāra	India	Maharashtra
1254794	Tekkali	India	Andhra Pradesh
1254795	Tekkalakote	India	Karnataka
1254797	Tekāri	India	Bihar
1254868	Tarn Tāran	India	Punjab
1254880	Tarikere	India	Karnataka
1254904	Tharangambadi	India	Tamil Nadu
1255131	Taleigao	India	Goa
1255816	Sompeta	India	Andhra Pradesh
1255823	Someshwar	India	Karnataka
1255850	Solan	India	Himachal Pradesh
1255858	Sojītra	India	Gujarat
1255860	Sojat	India	Rajasthan
1255870	Sohna	India	Haryana
1255884	Sohāgpur	India	Madhya Pradesh
1255925	Siwāna	India	Rajasthan
1255927	Siwān	India	Bihar
1255947	Sivakasi	India	Tamil Nadu
1255950	Sivagiri	India	Tamil Nadu
1255951	Sivagiri	India	Tamil Nadu
1255953	Sivaganga	India	Tamil Nadu
1255955	Siuri	India	West Bengal
1255963	Sitārganj	India	Uttarakhand
1255969	Sītāpur	India	Uttar Pradesh
1255983	Sītāmarhi	India	Bihar
1255995	Siswā Bāzār	India	Uttar Pradesh
1256003	Sisauli	India	Uttar Pradesh
1256025	Sirūr	India	Maharashtra
1256027	Sirumugai	India	Tamil Nadu
1256029	Siruguppa	India	Karnataka
1256039	Sirsilla	India	Telangana
1256040	Sirsi	India	Uttar Pradesh
1256047	Sirsi	India	Karnataka
1256050	Sirsāganj	India	Uttar Pradesh
1256052	Sirsa	India	Haryana
1256064	Sironj	India	Madhya Pradesh
1256067	Sirohi	India	Rajasthan
1256075	Sīrkāzhi	India	Tamil Nadu
1256087	Sirhind	India	Punjab
1256104	Sīra	India	Karnataka
1256119	Sinnar	India	Maharashtra
1256124	Singur	India	West Bengal
1256176	Singarāyakonda	India	Andhra Pradesh
1256184	Singānallūr	India	Tamil Nadu
1256207	Sindhnūr	India	Karnataka
1256214	Sindgi	India	Karnataka
1256237	Shimla	India	Himachal Pradesh
1256246	Simdega	India	Jharkhand
1256259	Silvassa	India	Dadra and Nagar Haveli
1256269	Sillod	India	Maharashtra
1256287	Silchar	India	Assam
1256295	Silao	India	Bihar
1256320	Sīkar	India	Rajasthan
1256322	Sikandra Rao	India	Uttar Pradesh
1256328	Sikandarpur	India	Uttar Pradesh
1256329	Sikandarābād	India	Uttar Pradesh
1256333	Sikka	India	Gujarat
1256335	Sijua	India	Jharkhand
1256340	Sihorā	India	Madhya Pradesh
1256343	Sihor	India	Gujarat
1256363	Sidlaghatta	India	Karnataka
1256369	Sidhi	India	Madhya Pradesh
1256372	Sidhaulī	India	Uttar Pradesh
1256377	Siddipet	India	Telangana
1256382	Siddhapur	India	Gujarat
1256388	Sibsāgar	India	Assam
1256409	Shyamnagar	India	West Bengal
1256418	Shujālpur	India	Madhya Pradesh
1256421	Shrīrangapattana	India	Karnataka
1256422	Shrīrāmpur	India	West Bengal
1256426	Shrīgonda	India	Maharashtra
1256431	Shorāpur	India	Karnataka
1256432	Shoranūr	India	Kerala
1256435	Sholinghur	India	Tamil Nadu
1256436	Solāpur	India	Maharashtra
1256451	Shivpuri	India	Madhya Pradesh
1256468	Shīshgarh	India	Uttar Pradesh
1256475	Shirpur	India	Maharashtra
1256483	Shirhatti	India	Karnataka
1256489	Shirdi	India	Maharashtra
1256515	Shimoga	India	Karnataka
1256523	Shillong	India	Meghalaya
1256525	Shiliguri	India	West Bengal
1256529	Shikohābād	India	Uttar Pradesh
1256532	Shikārpūr	India	Uttar Pradesh
1256537	Shikārpur	India	Karnataka
1256539	Shiggaon	India	Karnataka
1256558	Shertallai	India	Kerala
1256569	Sherkot	India	Uttar Pradesh
1256572	Sherghāti	India	Bihar
1256593	Sheopur	India	Madhya Pradesh
1256597	Sheohar	India	Bihar
1256598	Sheoganj	India	Rajasthan
1256620	Shegaon	India	Maharashtra
1256639	Shāntipur	India	West Bengal
1256659	Shamsābād	India	Uttar Pradesh
1256660	Shamsābād	India	Uttar Pradesh
1256671	Shāmli	India	Uttar Pradesh
1256673	Shāmgarh	India	Madhya Pradesh
1256693	Shājāpur	India	Madhya Pradesh
1256698	Sheikhpura	India	Bihar
1256705	Shāhpura	India	Rajasthan
1256713	Shāhpur	India	Uttar Pradesh
1256715	Shāhpur	India	Bihar
1256720	Shāhpur	India	Madhya Pradesh
1256722	Shāhpur	India	Karnataka
1256731	Shāhi	India	Uttar Pradesh
1256735	Shāhganj	India	Uttar Pradesh
1256739	Shahdol	India	Madhya Pradesh
1256750	Shāhāda	India	Maharashtra
1256752	Shāhābād	India	Haryana
1256753	Shāhābād	India	Uttar Pradesh
1256755	Shāhābād	India	Uttar Pradesh
1256759	Shāhābād	India	Karnataka
1256812	Serchhīp	India	Mizoram
1256814	Seram	India	Karnataka
1256823	Seoni Mālwa	India	Madhya Pradesh
1256826	Seoni	India	Madhya Pradesh
1256828	Seondha	India	Madhya Pradesh
1256832	Seohāra	India	Uttar Pradesh
1256854	Sendhwa	India	Madhya Pradesh
1256913	Sehore	India	Madhya Pradesh
1256929	Sāyla	India	Gujarat
1256949	Sawāi Mādhopur	India	Rajasthan
1256959	Sāvda	India	Maharashtra
1256967	Savanūr	India	Karnataka
1256968	Sāvantvādi	India	Maharashtra
1256974	Sausar	India	Madhya Pradesh
1256983	Saundatti	India	Karnataka
1256989	Sathyamangalam	India	Tamil Nadu
1256995	Sattur	India	Tamil Nadu
1257001	Sattenapalle	India	Andhra Pradesh
1257022	Satna	India	Madhya Pradesh
1257055	Sātāra	India	Maharashtra
1257060	Satānā	India	Maharashtra
1257066	Sāsvad	India	Maharashtra
1257093	Sarwār	India	Rajasthan
1257149	Sarkhej	India	Gujarat
1257191	Sardulgarh	India	Punjab
1257198	Sardārshahr	India	Rajasthan
1257219	Sarauli	India	Uttar Pradesh
1257237	Sārangpur	India	Madhya Pradesh
1257259	Saraipali	India	Chhattisgarh
1257260	Sarāi Mīr	India	Uttar Pradesh
1257268	Sarāi Ākil	India	Uttar Pradesh
1257307	Saoner	India	Maharashtra
1257354	Sānkrāil	India	West Bengal
1257369	Sankeshwar	India	Karnataka
1257402	Sangrūr	India	Punjab
1257409	Sāngola	India	Maharashtra
1257410	Sangod	India	Rajasthan
1257416	Sāngli	India	Maharashtra
1257429	Sangariā	India	Rajasthan
1257431	Sangāreddi	India	Telangana
1257436	Sangamner	India	Maharashtra
1257459	Sandīla	India	Uttar Pradesh
1257461	Sāndi	India	Uttar Pradesh
1257476	Sancoale	India	Goa
1257477	Sānchor	India	Rajasthan
1257481	Sanāwad	India	Madhya Pradesh
1257482	Sanaur	India	Punjab
1257486	Sānand	India	Gujarat
1257498	Samthar	India	Uttar Pradesh
1257503	Samrāla	India	Punjab
1257528	Samdari	India	Rajasthan
1257539	Sāmbhar	India	Rajasthan
1257540	Sambhal	India	Uttar Pradesh
1257542	Sambalpur	India	Odisha
1257545	Sāmba	India	Kashmir
1257565	Sāmalkot	India	Andhra Pradesh
1257566	Samālkha	India	Haryana
1257587	Sālūr	India	Andhra Pradesh
1257588	Sālūmbar	India	Rajasthan
1257629	Salem	India	Tamil Nadu
1257638	Salāya	India	Gujarat
1257673	Saktī	India	Chhattisgarh
1257698	Sakleshpur	India	Karnataka
1257749	Saint Thomas Mount	India	Tamil Nadu
1257751	Sainthia	India	West Bengal
1257762	Selu	India	Maharashtra
1257771	Saiha	India	Mizoram
1257776	Saidpur	India	Uttar Pradesh
1257794	Sāhibganj	India	Jharkhand
1257800	Sahaswān	India	Uttar Pradesh
1257802	Sahaspur	India	Uttar Pradesh
1257804	Saharsa	India	Bihar
1257806	Sahāranpur	India	Uttar Pradesh
1257830	Sagauli	India	Bihar
1257845	Saugor	India	Madhya Pradesh
1257851	Sāgar	India	Karnataka
1257854	Safīpur	India	Uttar Pradesh
1257855	Safidon	India	Haryana
1257865	Sādri	India	Rajasthan
1257890	Sadāseopet	India	Telangana
1257895	Sadalgi	India	Karnataka
1257896	Sadābād	India	Uttar Pradesh
1257928	Sabalgarh	India	Madhya Pradesh
1257936	Rusera	India	Bihar
1257940	Rura	India	Uttar Pradesh
1257951	Ropar	India	Punjab
1258044	Roorkee	India	Uttarakhand
1258061	Ron	India	Karnataka
1258076	Rohtak	India	Haryana
1258099	Roha	India	Maharashtra
1258109	Robertsonpet	India	Karnataka
1258111	Robertsganj	India	Uttar Pradesh
1258124	Risod	India	Maharashtra
1258126	Rishra	India	West Bengal
1258128	Rishīkesh	India	Uttarakhand
1258140	Rīngas	India	Rajasthan
1258164	Richha	India	Uttar Pradesh
1258178	Rewāri	India	Haryana
1258182	Rewa	India	Madhya Pradesh
1258186	Revelganj	India	Bihar
1258203	Reoti	India	Uttar Pradesh
1258207	Renukūt	India	Uttar Pradesh
1258213	Renigunta	India	Andhra Pradesh
1258229	Remuna	India	Odisha
1258247	Rehli	India	Madhya Pradesh
1258270	Rāzām	India	Andhra Pradesh
1258278	Rāybāg	India	Karnataka
1258290	Rāyadrug	India	Andhra Pradesh
1258291	Rāyachoti	India	Andhra Pradesh
1258292	Rāya	India	Uttar Pradesh
1258294	Raxaul	India	Bihar
1258297	Rāwatbhāta	India	Rajasthan
1258307	Rāver	India	Maharashtra
1258338	Ratnagiri	India	Maharashtra
1258342	Ratlām	India	Madhya Pradesh
1258347	Ratia	India	Haryana
1258352	Rāth	India	Uttar Pradesh
1258362	Ratanpur	India	Chhattisgarh
1258366	Ratangarh	India	Rajasthan
1258380	Rasrā	India	Uttar Pradesh
1258386	Rasipuram	India	Tamil Nadu
1258406	Rāpar	India	Gujarat
1258455	Rānikhet	India	Uttarakhand
1258470	Rānīganj	India	West Bengal
1258474	Rānībennur	India	Karnataka
1258477	Rānia	India	Haryana
1258492	Rangia	India	Assam
1258501	Rangāpāra	India	Assam
1258526	Ranchi	India	Jharkhand
1258534	Rānāvāv	India	Gujarat
1258546	Rānāghāt	India	West Bengal
1258553	Rāmtek	India	Maharashtra
1258581	Rampur Hat	India	West Bengal
1258584	Rāmpura	India	Punjab
1258592	Rāmpura	India	Madhya Pradesh
1258598	Rāmpur	India	Uttar Pradesh
1258599	Rāmpur	India	Uttar Pradesh
1258637	Rāmnagar	India	Uttarakhand
1258639	Rāmnagar	India	Bihar
1258658	Rāmjībanpur	India	West Bengal
1258662	Rāmgundam	India	Telangana
1258677	Rāmgarh	India	Rajasthan
1258686	Rāmgarh	India	Jharkhand
1258692	Rāmganj Mandi	India	Rajasthan
1258698	Rameswaram	India	Tamil Nadu
1258726	Rāmāpuram	India	Andhra Pradesh
1258740	Ramanathapuram	India	Tamil Nadu
1258744	Rāmanagaram	India	Karnataka
1258756	Rāmachandrapuram	India	Andhra Pradesh
1258786	Rājūra	India	Maharashtra
1258795	Rājula	India	Gujarat
1258797	Rājsamand	India	Rajasthan
1258803	Rājpura	India	Punjab
1258815	Rajpur	India	Madhya Pradesh
1258816	Rajpur	India	Madhya Pradesh
1258819	Rājpīpla	India	Gujarat
1258843	Rājmahal	India	West Bengal
1258847	Rājkot	India	Gujarat
1258859	Rājgurunagar	India	Maharashtra
1258864	Rājgīr	India	Bihar
1258868	Rājgarh	India	Rajasthan
1258869	Rājgarh	India	Rajasthan
1258875	Rājgarh	India	Madhya Pradesh
1258876	Rājgarh	India	Madhya Pradesh
1258891	Rajaori	India	Kashmir
1258916	Rajapalaiyam	India	Tamil Nadu
1258922	Rājampet	India	Andhra Pradesh
1258928	Rājaldesar	India	Rajasthan
1258930	Rājākhera	India	Rajasthan
1258932	Rājahmundry	India	Andhra Pradesh
1258952	Raisen	India	Madhya Pradesh
1258967	Rāipur	India	Uttarakhand
1258972	Raipur	India	Rajasthan
1258980	Raipur	India	Chhattisgarh
1258993	Rāikot	India	Punjab
1259005	Raigarh	India	Chhattisgarh
1259009	Rāiganj	India	West Bengal
1259012	Rāichūr	India	Karnataka
1259019	Rāhuri	India	Maharashtra
1259026	Rahimatpur	India	Maharashtra
1259034	Rāhatgarh	India	Madhya Pradesh
1259049	Raghunathpur	India	West Bengal
1259056	Rāghogarh	India	Madhya Pradesh
1259060	Rafiganj	India	Bihar
1259064	Raebareli	India	Uttar Pradesh
1259069	Rādhanpur	India	Gujarat
1259083	Rabkavi	India	Karnataka
1259091	Kollam	India	Kerala
1259108	Kasba	India	Bihar
1259123	Puttūr	India	Andhra Pradesh
1259124	Puttūr	India	Karnataka
1259148	Pushkar	India	Rajasthan
1259154	Pusad	India	Maharashtra
1259157	Purwā	India	Uttar Pradesh
1259163	Puruliya	India	West Bengal
1259166	Purnia	India	Bihar
1259177	Pūrna	India	Maharashtra
1259184	Puri	India	Odisha
1259190	Pūranpur	India	Uttar Pradesh
1259210	Pupri	India	Bihar
1259228	Punganūru	India	Andhra Pradesh
1259229	Pune	India	Maharashtra
1259231	Pūndri	India	Haryana
1259239	Punāsa	India	Madhya Pradesh
1259243	Punalūr	India	Kerala
1259244	Pūnāhāna	India	Haryana
1259251	Pulwama	India	Kashmir
1259263	Puliyangudi	India	Tamil Nadu
1259264	Pulivendla	India	Andhra Pradesh
1259272	Pulgaon	India	Maharashtra
1259283	Pukhrāyān	India	Uttar Pradesh
1259297	Pudukkottai	India	Tamil Nadu
1259312	Proddatūr	India	Andhra Pradesh
1259338	Pratāpgarh	India	Rajasthan
1259388	Porsa	India	Madhya Pradesh
1259395	Porbandar	India	Gujarat
1259400	Poonamalle	India	Tamil Nadu
1259408	Ponnūru	India	Andhra Pradesh
1259409	Ponneri	India	Tamil Nadu
1259411	Ponnāni	India	Kerala
1259425	Puducherry	India	Pondicherry
1259429	Ponda	India	Goa
1259434	Polūr	India	Tamil Nadu
1259440	Pollachi	India	Tamil Nadu
1259444	Polavaram	India	Andhra Pradesh
1259446	Polasara	India	Odisha
1259460	Pokaran	India	Rajasthan
1259503	Pithorāgarh	India	Uttarakhand
1259508	Pithāpuram	India	Andhra Pradesh
1259530	Piro	India	Bihar
1259535	Piriyāpatna	India	Karnataka
1259541	Piravam	India	Kerala
1259554	Pipraich	India	Uttar Pradesh
1259592	Pipili	India	Odisha
1259608	Pīpār	India	Rajasthan
1259630	Pinjaur	India	Haryana
1259638	Pindwāra	India	Rajasthan
1259647	Pināhat	India	Uttar Pradesh
1259652	Pimpri	India	Maharashtra
1259680	Pilkhua	India	Uttar Pradesh
1259686	Pīlibhīt	India	Uttar Pradesh
1259688	Pilibangan	India	Rajasthan
1259693	Pilāni	India	Rajasthan
1259735	Phulpur	India	Uttar Pradesh
1259744	Phulera	India	Rajasthan
1259756	Phulabāni	India	Odisha
1259773	Phirangipuram	India	Andhra Pradesh
1259775	Phillaur	India	Punjab
1259784	Phek	India	Manipur
1259801	Phaphūnd	India	Uttar Pradesh
1259811	Phaltan	India	Maharashtra
1259813	Phalodi	India	Rajasthan
1259818	Phalauda	India	Uttar Pradesh
1259827	Phagwāra	India	Punjab
1259841	Petlād	India	Gujarat
1259855	Perundurai	India	Tamil Nadu
1259857	Perumpāvūr	India	Kerala
1259879	Periyakulam	India	Tamil Nadu
1259890	Peravurani	India	Tamil Nadu
1259892	Peranāmpattu	India	Tamil Nadu
1259896	Perambalur	India	Tamil Nadu
1259905	Penukonda	India	Andhra Pradesh
1259907	Penugonda	India	Andhra Pradesh
1259916	Pennāgaram	India	Tamil Nadu
1259917	Pennādam	India	Tamil Nadu
1259931	Pen	India	Maharashtra
1259939	Pehowa	India	Haryana
1259954	Peddāpuram	India	Andhra Pradesh
1259961	Peddapalli	India	Telangana
1259986	Pedana	India	Andhra Pradesh
1259994	Payyannūr	India	Kerala
1260003	Pawāyan	India	Uttar Pradesh
1260014	Pāvugada	India	Karnataka
1260016	Pauri	India	Uttarakhand
1260022	Pawni	India	Maharashtra
1260035	Pātūr	India	Maharashtra
1260045	Patti	India	Punjab
1260082	Patnāgarh	India	Odisha
1260086	Patna	India	Bihar
1260107	Patiāla	India	Punjab
1260120	Pāthri	India	Maharashtra
1260129	Patharia	India	Madhya Pradesh
1260134	Pāthardih	India	Jharkhand
1260135	Pāthardi	India	Maharashtra
1260137	Pathānkot	India	Punjab
1260138	Pathanāmthitta	India	Kerala
1260141	Pathalgaon	India	Chhattisgarh
1260156	Pataudi	India	Haryana
1260168	Patancheru	India	Telangana
1260173	Pātan	India	Gujarat
1260178	Patāmundai	India	Odisha
1260206	Pāsighāt	India	Arunachal Pradesh
1260210	Pasān	India	Chhattisgarh
1260221	Parvatsar	India	Rajasthan
1260228	Partūr	India	Maharashtra
1260274	Parola	India	Maharashtra
1260290	Parli Vaijnāth	India	Maharashtra
1260296	Parlākimidi	India	Andhra Pradesh
1260304	Pariyāpuram	India	Kerala
1260313	Parīchhatgarh	India	Uttar Pradesh
1260335	Pārdi	India	Gujarat
1260341	Parbhani	India	Maharashtra
1260354	Paravūr	India	Kerala
1260368	Parāsia	India	Madhya Pradesh
1260387	Paramagudi	India	Tamil Nadu
1260393	Parādīp Garh	India	Odisha
1260406	Pāppinisshēri	India	Kerala
1260417	Papanasam	India	Tamil Nadu
1260434	Panvel	India	Maharashtra
1260448	Panruti	India	Tamil Nadu
1260454	Panna	India	Madhya Pradesh
1260456	Panmana	India	Kerala
1260476	Pānīpat	India	Haryana
1260482	Pānihāti	India	West Bengal
1260527	Pandua	India	West Bengal
1260543	Pāndhurnā	India	Madhya Pradesh
1260546	Pandharpur	India	Maharashtra
1260553	French Rocks	India	Karnataka
1260607	Panaji	India	Goa
1260612	Panāgar	India	Madhya Pradesh
1260637	Palwal	India	Haryana
1260667	Pāloncha	India	Telangana
1260671	Palani	India	Tamil Nadu
1260674	Palmaner	India	Andhra Pradesh
1260681	Pallippatti	India	Tamil Nadu
1260685	Pallikondai	India	Tamil Nadu
1260694	Pallappatti	India	Tamil Nadu
1260697	Palladam	India	Tamil Nadu
1260702	Pālkonda	India	Andhra Pradesh
1260707	Pālitāna	India	Gujarat
1260713	Paliā Kalān	India	Uttar Pradesh
1260716	Pāli	India	Rajasthan
1260718	Pāli	India	Madhya Pradesh
1260728	Palakkad	India	Kerala
1260730	Pālghar	India	Maharashtra
1260734	Palera	India	Madhya Pradesh
1260771	Palāsa	India	Andhra Pradesh
1260777	Pālanpur	India	Gujarat
1260792	Pālakollu	India	Andhra Pradesh
1260793	Pālakkodu	India	Tamil Nadu
1260824	Pākaur	India	Jharkhand
1260830	Pākāla	India	Andhra Pradesh
1260833	Paithan	India	Maharashtra
1260868	Pahāsu	India	Uttar Pradesh
1260911	Padra	India	Gujarat
1260918	Padmanābhapuram	India	Tamil Nadu
1260938	Padampur	India	Rajasthan
1260940	Padampur	India	Odisha
1260942	Padam	India	Kashmir
1260954	Pachperwa	India	Uttar Pradesh
1260959	Pāchora	India	Maharashtra
1261008	Ottappālam	India	Kerala
1261012	Osmanabad	India	Maharashtra
1261039	Orai	India	Uttar Pradesh
1261066	Okha	India	Gujarat
1261068	Ozar	India	Maharashtra
1261086	Obra	India	Uttar Pradesh
1261122	Nūrpur	India	Uttar Pradesh
1261162	Nowrangapur	India	Odisha
1261181	North Lakhimpur	India	Assam
1261186	North Guwāhāti	India	Assam
1261205	Nongstoin	India	Meghalaya
1261227	Nokha	India	Rajasthan
1261234	Nohar	India	Rajasthan
1261242	Noāmundi	India	Jharkhand
1261258	Nizāmābād	India	Telangana
1261285	Nirmāli	India	Bihar
1261288	Nirmal	India	Telangana
1261309	Nipāni	India	Maharashtra
1261342	Neem ka Thana	India	Rajasthan
1261369	Nīmbāhera	India	Rajasthan
1261375	Nimāparha	India	Odisha
1261378	Nīmāj	India	Rajasthan
1261382	Nīlokheri	India	Haryana
1261394	Nīlēshwar	India	Kerala
1261401	Nilakottai	India	Tamil Nadu
1261402	Nīlgiri	India	Odisha
1261415	Nihtaur	India	Uttar Pradesh
1261446	Nidadavole	India	Andhra Pradesh
1261451	Nichlaul	India	Uttar Pradesh
1261470	Neyyāttinkara	India	Kerala
1261481	New Delhi	India	NCT
1261512	Neral	India	Maharashtra
1261517	Nepānagar	India	Madhya Pradesh
1261529	Nellore	India	Andhra Pradesh
1261532	Nellikkuppam	India	Tamil Nadu
1261539	Nelamangala	India	Karnataka
1261553	Nedumangād	India	Kerala
1261580	Nayāgarh	India	Odisha
1261598	Nawāshahr	India	Punjab
1261613	Nawalgarh	India	Rajasthan
1261614	Niwai	India	Rajasthan
1261631	Nawāda	India	Bihar
1261639	Nawābganj	India	Uttar Pradesh
1261641	Nawābganj	India	Uttar Pradesh
1261642	Nawābganj	India	Uttar Pradesh
1261647	Nāwa	India	Rajasthan
1261667	Navalgund	India	Karnataka
1261669	Navadwīp	India	West Bengal
1261672	Nautanwa	India	Uttar Pradesh
1261696	Naugachhia	India	Bihar
1261705	Nattam	India	Tamil Nadu
1261711	Nāthdwāra	India	Rajasthan
1261722	Nāsriganj	India	Bihar
1261726	Nāspur	India	Telangana
1261727	Nasīrābād	India	Rajasthan
1261731	Nashik	India	Maharashtra
1261736	Narwar	India	Madhya Pradesh
1261739	Narwāna	India	Haryana
1261748	Narsīpatnam	India	Andhra Pradesh
1261752	Narsinghgarh	India	Madhya Pradesh
1261754	Narsimhapur	India	Madhya Pradesh
1261771	Nārnaund	India	Haryana
1261772	Nārnaul	India	Haryana
1261800	Nargund	India	Karnataka
1261810	Naregal	India	Karnataka
1261823	Nārāyanpet	India	Telangana
1261828	Narāyangarh	India	Haryana
1261835	Nāravārikuppam	India	Tamil Nadu
1261837	Naraura	India	Uttar Pradesh
1261839	Narauli	India	Uttar Pradesh
1261852	Narasapur	India	Andhra Pradesh
1261853	Narasannapeta	India	Andhra Pradesh
1261871	Naraini	India	Madhya Pradesh
1261872	Naraina	India	Rajasthan
1261882	Napāsar	India	Rajasthan
1261901	Nānpāra	India	Uttar Pradesh
1261910	Nanjangūd	India	Karnataka
1261913	Nāngloi Jāt	India	NCT
1261922	Nāngal Township	India	Punjab
1261927	Nandyāl	India	Andhra Pradesh
1261931	Nandurbar	India	Maharashtra
1261932	Nāndūra Buzurg	India	Maharashtra
1261957	Nandikotkūr	India	Andhra Pradesh
1261960	Nandigāma	India	Andhra Pradesh
1261971	Nāndgaon	India	Maharashtra
1261977	Nanded	India	Maharashtra
1262013	Nāmrup	India	Assam
1262034	Nambiyūr	India	Tamil Nadu
1262039	Nāmakkal	India	Tamil Nadu
1262040	Nāmagiripettai	India	Tamil Nadu
1262065	Nalhāti	India	West Bengal
1262067	Nalgonda	India	Telangana
1262073	Naldurg	India	Maharashtra
1262089	Nakūr	India	Uttar Pradesh
1262092	Naksalbāri	India	West Bengal
1262097	Nakodar	India	Punjab
1262109	Najībābād	India	Uttar Pradesh
1262115	Nainwa	India	Rajasthan
1262117	Naini Tāl	India	Uttarakhand
1262131	Naihāti	India	West Bengal
1262140	Nahorkatiya	India	Assam
1262151	Nāhan	India	Himachal Pradesh
1262180	Nagpur	India	Maharashtra
1262187	Nāgod	India	Madhya Pradesh
1262200	Nagīna	India	Uttar Pradesh
1262204	Nāgercoil	India	Tamil Nadu
1262209	Nagda	India	Madhya Pradesh
1262216	Nāgaur	India	Rajasthan
1262230	Nāgar Karnūl	India	Telangana
1262240	Nagari	India	Andhra Pradesh
1262253	Nagar	India	Rajasthan
1262260	Nāgappattinam	India	Tamil Nadu
1262266	Nāgamangala	India	Karnataka
1262285	Naduvannūr	India	Kerala
1262292	Nadiād	India	Gujarat
1262296	Nādbai	India	Rajasthan
1262318	Nabīnagar	India	Bihar
1262319	Nābha	India	Punjab
1262321	Mysore	India	Karnataka
1262330	Muzaffarpur	India	Bihar
1262332	Muzaffarnagar	India	Uttar Pradesh
1262338	Mūvattupula	India	Kerala
1262346	Muttupet	India	Tamil Nadu
1262374	Mussoorie	India	Uttarakhand
1262380	Musiri	India	Tamil Nadu
1262395	Murwāra	India	Madhya Pradesh
1262410	Murtajāpur	India	Maharashtra
1262412	Murshidābād	India	West Bengal
1262419	Murlīganj	India	Bihar
1262426	Morinda	India	Punjab
1262444	Murbād	India	Maharashtra
1262453	Murādnagar	India	Uttar Pradesh
1262463	Munnar	India	Kerala
1262482	Monghyr	India	Bihar
1262484	Mungeli	India	Chhattisgarh
1262491	Mūndwa	India	Rajasthan
1262497	Mundra	India	Gujarat
1262510	Mundgod	India	Karnataka
1262516	Mundargi	India	Karnataka
1262534	Multai	India	Madhya Pradesh
1262546	Mūlki	India	Karnataka
1262553	Mulgund	India	Karnataka
1262562	Mulbāgal	India	Karnataka
1262566	Muluppilagadu	India	Kerala
1262574	Mūl	India	Maharashtra
1262578	Muktsar	India	Punjab
1262591	Mukher	India	Maharashtra
1262596	Mukeriān	India	Punjab
1262624	Muhammadābād	India	Uttar Pradesh
1262626	Muhammadābād	India	Uttar Pradesh
1262634	Mughal Sarāi	India	Uttar Pradesh
1262651	Mudkhed	India	Maharashtra
1262663	Mudhol	India	Karnataka
1262664	Mudgal	India	Karnataka
1262669	Muddebihāl	India	Karnataka
1262672	Mūdbidri	India	Karnataka
1262678	Mubārakpur	India	Uttar Pradesh
1262710	Mothīhāri	India	Bihar
1262734	Morwa	India	Gujarat
1262740	Morsi	India	Maharashtra
1262771	Morena	India	Madhya Pradesh
1262775	Morbi	India	Gujarat
1262783	Morār	India	Madhya Pradesh
1262794	Moram	India	Maharashtra
1262801	Morādābād	India	Uttar Pradesh
1262824	Mon	India	Nagaland
1262843	Mokokchūng	India	Nagaland
1262852	Mokameh	India	Bihar
1262951	Moga	India	Punjab
1262958	Modāsa	India	Gujarat
1262988	Misrikh	India	Uttar Pradesh
1262995	Mirzāpur	India	Uttar Pradesh
1263012	Miriālgūda	India	Telangana
1263015	Mīrganj	India	Uttar Pradesh
1263021	Mīrānpur Katra	India	Uttar Pradesh
1263022	Mīrānpur	India	Uttar Pradesh
1263034	Mīnjūr	India	Tamil Nadu
1263051	Milak	India	Uttar Pradesh
1263057	Mihona	India	Madhya Pradesh
1263083	Mhāsvād	India	Maharashtra
1263101	Mettur	India	Tamil Nadu
1263120	Merta	India	Rajasthan
1263142	Mendarda	India	Gujarat
1263148	Memāri	India	West Bengal
1263151	Melur	India	Tamil Nadu
1263185	Mehndāwal	India	Uttar Pradesh
1263195	Mehekar	India	Maharashtra
1263214	Meerut	India	Uttar Pradesh
1263220	Medinīpur	India	West Bengal
1263230	Medak	India	Telangana
1263247	Mayiladuthurai	India	Tamil Nadu
1263255	Mayāng Imphāl	India	Manipur
1263275	Mawāna	India	Uttar Pradesh
1263280	Mavoor	India	Kerala
1263285	Māvelikara	India	Kerala
1263293	Maur	India	Punjab
1263303	Maudaha	India	Uttar Pradesh
1263306	Mau Aimma	India	Uttar Pradesh
1263309	Mau	India	Madhya Pradesh
1263311	Mau	India	Uttar Pradesh
1263331	Mattanūr	India	Kerala
1263364	Mathura	India	Uttar Pradesh
1263395	Mātābhānga	India	West Bengal
1263427	Masaurhi Buzurg	India	Bihar
1263494	Marmagao	India	Goa
1263504	Mārkāpur	India	Andhra Pradesh
1263522	Mariāni	India	Assam
1263523	Mariāhu	India	Uttar Pradesh
1263528	Marhaura	India	Bihar
1263532	Margherita	India	Arunachal Pradesh
1263564	Marakkanam	India	Tamil Nadu
1263580	Māpuca	India	Goa
1263591	Mānwat	India	Maharashtra
1263594	Mānvi	India	Karnataka
1263610	Manthani	India	Telangana
1263622	Mānsa	India	Punjab
1263623	Mānsa	India	Gujarat
1263649	Manoharpur	India	Rajasthan
1263659	Mannargudi	India	Tamil Nadu
1263661	Mannārakkāt	India	Kerala
1263664	Manmād	India	Maharashtra
1263678	Mankāchar	India	Meghalaya
1263684	Mājalgaon	India	Maharashtra
1263691	Manjhanpur	India	Uttar Pradesh
1263694	Manjeri	India	Kerala
1263723	Manihāri	India	Bihar
1263730	Maniar	India	Uttar Pradesh
1263751	Māngrol	India	Rajasthan
1263752	Māngrol	India	Gujarat
1263761	Manglaur	India	Uttarakhand
1263780	Mangalore	India	Karnataka
1263787	Mangaldai	India	Assam
1263797	Mangalagiri	India	Andhra Pradesh
1263807	Maner	India	Bihar
1263814	Mandya	India	Karnataka
1263824	Māndvi	India	Gujarat
1263826	Māndvi	India	Gujarat
1263833	Māndu	India	Madhya Pradesh
1263834	Mandsaur	India	Madhya Pradesh
1263852	Mandlā	India	Madhya Pradesh
1263862	Mandi	India	Himachal Pradesh
1263879	Mandāwar	India	Uttar Pradesh
1263898	Mandapeta	India	Andhra Pradesh
1263900	Mandapam	India	Tamil Nadu
1263911	Māndalgarh	India	Rajasthan
1263936	Mancherāl	India	Telangana
1263940	Manāwar	India	Madhya Pradesh
1263943	Mānāvadar	India	Gujarat
1263952	Manapparai	India	Tamil Nadu
1263965	Manamadurai	India	Tamil Nadu
1263968	Manali	India	Tamil Nadu
1264007	Mālvan	India	Maharashtra
1264032	Mālpura	India	Rajasthan
1264037	Malpe	India	Karnataka
1264047	Mallasamudram	India	Tamil Nadu
1264071	Malkāpur	India	Maharashtra
1264075	Malakanagiri	India	Odisha
1264085	Malīhābād	India	Uttar Pradesh
1264111	Māler Kotla	India	Punjab
1264115	Mālegaon	India	Maharashtra
1264136	Malavalli	India	Karnataka
1264138	Malaut	India	Punjab
1264154	Malappuram	India	Kerala
1264196	Mākum	India	Assam
1264198	Maksi	India	Madhya Pradesh
1264206	Makrāna	India	Rajasthan
1264282	Mairwa	India	Bihar
1264301	Maināguri	India	West Bengal
1264317	Maihar	India	Madhya Pradesh
1264323	Mahwah	India	Rajasthan
1264344	Mahudha	India	Gujarat
1264356	Maholi	India	Uttar Pradesh
1264359	Mahobā	India	Uttar Pradesh
1264363	Mahmudābād	India	Uttar Pradesh
1264368	Mahīshādal	India	West Bengal
1264383	Mahgawān	India	Madhya Pradesh
1264385	Maheshwar	India	Madhya Pradesh
1264395	Mahendragarh	India	Haryana
1264398	Mahemdāvād	India	Gujarat
1264403	Mahē	India	Kerala
1264409	Mahbūbābād	India	Telangana
1264414	Mahāsamund	India	Chhattisgarh
1264433	Mahārāganj	India	Uttar Pradesh
1264436	Mahārājgani	India	Bihar
1264455	Maham	India	Haryana
1264457	Mahālingpur	India	Karnataka
1264489	Mahād	India	Maharashtra
1264504	Maghar	India	Uttar Pradesh
1264514	Māgadi	India	Karnataka
1264520	Madurāntakam	India	Tamil Nadu
1264521	Madurai	India	Tamil Nadu
1264523	Madukkūr	India	Tamil Nadu
1264524	Madukkarai	India	Tamil Nadu
1264527	Chennai	India	Tamil Nadu
1264540	Madikeri	India	Karnataka
1264543	Madhyamgram	India	West Bengal
1264551	Madhupur	India	Jharkhand
1264553	Maddagiri	India	Karnataka
1264570	Madhipura	India	Bihar
1264588	Madgaon	India	Goa
1264592	Maddūr	India	Karnataka
1264621	Madanapalle	India	Andhra Pradesh
1264637	Machilīpatnam	India	Andhra Pradesh
1264643	Machhlīshahr	India	Uttar Pradesh
1264644	Māchhīwāra	India	Punjab
1264647	Mācherla	India	Andhra Pradesh
1264688	Lunglei	India	Mizoram
1264700	Lūnāvāda	India	Gujarat
1264728	Ludhiāna	India	Punjab
1264733	Lucknow	India	Uttar Pradesh
1264735	Luckeesarai	India	Bihar
1264756	Losal	India	Rajasthan
1264793	Lonavla	India	Maharashtra
1264794	Lonār	India	Maharashtra
1264839	Lohārdaga	India	Jharkhand
1264890	Lingsugūr	India	Karnataka
1264912	Limbdi	India	Gujarat
1264949	Leteri	India	Madhya Pradesh
1264976	Leh	India	Kashmir
1264989	Lāwar Khās	India	Uttar Pradesh
1265007	Laungowāl	India	Punjab
1265014	Latur	India	Maharashtra
1265022	Lāthi	India	Gujarat
1265025	Lātehār	India	Jharkhand
1265053	Lar	India	Uttar Pradesh
1265143	Lālsot	India	Rajasthan
1265157	Lalitpur	India	Uttar Pradesh
1265163	Lalgudi	India	Tamil Nadu
1265166	Lālgola	India	West Bengal
1265169	Lālganj	India	Uttar Pradesh
1265170	Lālganj	India	Bihar
1265201	Lakshmeshwar	India	Karnataka
1265208	Laksar	India	Uttarakhand
1265220	Lakhyabad	India	West Bengal
1265233	Lakhnādon	India	Madhya Pradesh
1265242	Lakhīmpur	India	Uttar Pradesh
1265246	Lākheri	India	Rajasthan
1265310	Lāharpur	India	Uttar Pradesh
1265311	Lahār	India	Madhya Pradesh
1265323	Lādwa	India	Haryana
1265354	Lachhmangarh Sīkar	India	Rajasthan
1265387	Kuzhithurai	India	Tamil Nadu
1265400	Koothanallur	India	Tamil Nadu
1265401	Kuttampuzha	India	Kerala
1265415	Kutiyāna	India	Gujarat
1265418	Kutiatodu	India	Kerala
1265446	Kushtagi	India	Karnataka
1265504	Kurinjippādi	India	Tamil Nadu
1265521	Kurduvādi	India	Maharashtra
1265539	Kurandvād	India	Maharashtra
1265555	Kuppam	India	Andhra Pradesh
1265579	Kunnamkulam	India	Kerala
1265580	Kunnamangalam	India	Kerala
1265591	Kunigal	India	Karnataka
1265607	Kundgol	India	Karnataka
1265613	Kundarkhi	India	Uttar Pradesh
1265632	Kunda	India	Uttar Pradesh
1265645	Kumta	India	Karnataka
1265655	Kūmher	India	Rajasthan
1265660	Kumhāri	India	Chhattisgarh
1265670	Kumbhrāj	India	Madhya Pradesh
1265683	Kumbakonam	India	Tamil Nadu
1265709	Kulu	India	Himachal Pradesh
1265711	Kulti	India	West Bengal
1265716	Kulpahār	India	Uttar Pradesh
1265723	Kulittalai	India	Tamil Nadu
1265734	Kulgam	India	Kashmir
1265752	Kukshi	India	Madhya Pradesh
1265773	Kuju	India	Jharkhand
1265795	Kūdligi	India	Karnataka
1265821	Kuchera	India	Rajasthan
1265828	Kuchāman	India	Rajasthan
1265830	Kuchaiburi	India	Odisha
1265852	Krishnarājpet	India	Karnataka
1265863	Krishnagiri	India	Tamil Nadu
1265873	Kozhikode	India	Kerala
1265881	Koynanagar	India	Maharashtra
1265886	Kovvūr	India	Andhra Pradesh
1265888	Kovūr	India	Andhra Pradesh
1265891	Kovilpatti	India	Tamil Nadu
1265905	Kottūru	India	Karnataka
1265911	Kottayam	India	Kerala
1265938	Kottagūdem	India	Telangana
1265961	Kotputli	India	Rajasthan
1265964	Kotma	India	Madhya Pradesh
1266014	Kotdwāra	India	Uttarakhand
1266029	Kotapārh	India	Chhattisgarh
1266031	Kotamangalam	India	Kerala
1266038	Kotagiri	India	Tamil Nadu
1266049	Kota	India	Rajasthan
1266051	Kotā	India	Chhattisgarh
1266070	Kosigi	India	Andhra Pradesh
1266087	Kosamba	India	Gujarat
1266092	Korwai	India	Madhya Pradesh
1266116	Koregaon	India	Maharashtra
1266122	Korba	India	Chhattisgarh
1266124	Koratla	India	Telangana
1266128	Korāput	India	Odisha
1266154	Koppal	India	Karnataka
1266162	Kopargaon	India	Maharashtra
1266164	Kopāganj	India	Uttar Pradesh
1266178	Konnūr	India	Karnataka
1266179	Konnagar	India	West Bengal
1266209	Kondapalle	India	Andhra Pradesh
1266217	Konch	India	Uttar Pradesh
1266220	Konārka	India	Odisha
1266258	Kolasib	India	Mizoram
1266267	Kollegāl	India	Karnataka
1266285	Kolhāpur	India	Maharashtra
1266302	Kolāras	India	Madhya Pradesh
1266305	Kolār	India	Karnataka
1266322	Colachel	India	Tamil Nadu
1266330	Kokrajhar	India	Assam
1266366	Kohima	India	Nagaland
1266372	Koelwār	India	Bihar
1266385	Kodungallūr	India	Kerala
1266390	Kodoli	India	Maharashtra
1266397	Kodīnar	India	Gujarat
1266414	Kodarmā	India	Jharkhand
1266416	Kodār	India	Telangana
1266436	Koch Bihār	India	West Bengal
1266448	Koāth	India	Bihar
1266452	Kizhake Chālakudi	India	Kerala
1266461	Kithor	India	Uttar Pradesh
1266475	Kishtwār	India	Kashmir
1266486	Kishangarh	India	Rajasthan
1266489	Kishanganj	India	Bihar
1266509	Kīratpur	India	Uttar Pradesh
1266510	Kiraoli	India	Uttar Pradesh
1266518	Kinwat	India	Maharashtra
1266575	Kichha	India	Uttarakhand
1266596	Khūtār	India	Uttar Pradesh
1266607	Khurja	India	Uttar Pradesh
1266616	Khurda	India	Odisha
1266620	Khurai	India	Madhya Pradesh
1266622	Khunti	India	Jharkhand
1266649	Khowai	India	Tripura
1266666	Khopoli	India	Maharashtra
1266710	Khirkiyān	India	Madhya Pradesh
1266731	Khilchipur	India	Madhya Pradesh
1266744	Khetri	India	Rajasthan
1266746	Khetia	India	Maharashtra
1266762	Kheri	India	Uttar Pradesh
1266774	Kherālu	India	Gujarat
1266794	Khekra	India	Uttar Pradesh
1266806	Khed Brahma	India	Gujarat
1266809	Kheda	India	Gujarat
1266838	Khātra	India	West Bengal
1266843	Khatīma	India	Uttarakhand
1266847	Khātegaon	India	Madhya Pradesh
1266849	Khatauli	India	Uttar Pradesh
1266862	Khārupatia	India	Assam
1266872	Kharsia	India	Chhattisgarh
1266891	Kharkhauda	India	Haryana
1266945	Khardah	India	West Bengal
1266960	Kharar	India	Punjab
1266966	Kharakvasla	India	Maharashtra
1266975	Kharagpur	India	Bihar
1266976	Kharagpur	India	West Bengal
1267006	Khāpa	India	Maharashtra
1267016	Khanna	India	Punjab
1267031	Khandwa	India	Madhya Pradesh
1267044	Khandela	India	Rajasthan
1267065	Khānāpur	India	Karnataka
1267076	Khammam	India	Telangana
1267084	Khāmgaon	India	Maharashtra
1267090	Khambhāt	India	Gujarat
1267091	Khambhāliya	India	Gujarat
1267115	Khalīlābād	India	Uttar Pradesh
1267154	Khajurāho	India	Madhya Pradesh
1267173	Khairāgarh	India	Chhattisgarh
1267174	Khairāgarh	India	Chhattisgarh
1267175	Khairābād	India	Uttar Pradesh
1267182	Khair	India	Uttar Pradesh
1267187	Khagaul	India	Bihar
1267189	Khagaria	India	Bihar
1267195	Khadki	India	Maharashtra
1267202	Khada	India	Uttar Pradesh
1267203	Khāchrod	India	Madhya Pradesh
1267222	Kesinga	India	Odisha
1267226	Keshorai Pātan	India	Rajasthan
1267227	Keshod	India	Gujarat
1267239	Kerūr	India	Karnataka
1267283	Kendrāparha	India	Odisha
1267290	Kenda	India	West Bengal
1267297	Kemrī	India	Uttar Pradesh
1267360	Kāyankulam	India	Kerala
1267361	Kayalpattinam	India	Tamil Nadu
1267369	Kawardha	India	Chhattisgarh
1267394	Kāvali	India	Andhra Pradesh
1267433	Kattivākkam	India	Tamil Nadu
1267435	Kattanam	India	Kerala
1267439	Kātrās	India	Jharkhand
1267457	Kātoya	India	West Bengal
1267461	Kātol	India	Maharashtra
1267480	Katihar	India	Bihar
1267486	Kathua	India	Kashmir
1267492	Kāthor	India	Gujarat
1267517	Katghora	India	Chhattisgarh
1267537	Katangi	India	Madhya Pradesh
1267538	Katangi	India	Madhya Pradesh
1267558	Kasrāwad	India	Madhya Pradesh
1267579	Kashipur	India	Uttarakhand
1267616	Kāsaragod	India	Kerala
1267635	Karwar	India	Karnataka
1267648	Karur	India	Tamil Nadu
1267669	Kartārpur	India	Punjab
1267675	Kārsiyāng	India	West Bengal
1267696	Karol Bāgh	India	NCT
1267708	Karnāl	India	Haryana
1267716	Karmāla	India	Maharashtra
1267739	Kārkala	India	Karnataka
1267742	Karjat	India	Maharashtra
1267755	Karīmnagar	India	Telangana
1267758	Karīmganj	India	Assam
1267772	Karhal	India	Uttar Pradesh
1267786	Karera	India	Madhya Pradesh
1267794	Kareli	India	Madhya Pradesh
1267819	Karauli	India	Rajasthan
1267853	Kāranja	India	Maharashtra
1267869	Kāramadai	India	Tamil Nadu
1267885	Kāraikkudi	India	Tamil Nadu
1267887	Kāraikāl	India	Pondicherry
1267904	Karād	India	Maharashtra
1267911	Kapūrthala	India	Punjab
1267923	Kāpren	India	Rajasthan
1267939	Kapadvanj	India	Gujarat
1267972	Kānth	India	Uttar Pradesh
1267978	Kantābānji	India	Odisha
1267979	Kānt	India	Uttar Pradesh
1267995	Kanpur	India	Uttar Pradesh
1268007	Kannod	India	Madhya Pradesh
1268011	Kannauj	India	Uttar Pradesh
1268015	Kānnangād	India	Kerala
1268020	Kannad	India	Maharashtra
1268031	Kānker	India	Chhattisgarh
1268032	Kānke	India	Jharkhand
1268035	Kankauli	India	Maharashtra
1268059	Kanigiri	India	Andhra Pradesh
1268095	Kangayam	India	Tamil Nadu
1268111	Kandukūr	India	Andhra Pradesh
1268124	Kāndla	India	Gujarat
1268135	Kāndi	India	West Bengal
1268138	Kāndhla	India	Uttar Pradesh
1268159	Kānchipuram	India	Tamil Nadu
1268189	Kanakapura	India	Karnataka
1268205	Kāmthi	India	Maharashtra
1268214	Kampli	India	Karnataka
1268246	Cumbum	India	Tamil Nadu
1268259	Kāmāreddi	India	Telangana
1268266	Kāman	India	Rajasthan
1268276	Kamalganj	India	Uttar Pradesh
1268279	Kāmākhyānagar	India	Odisha
1268293	Kalyani	India	West Bengal
1268295	Kalyān	India	Maharashtra
1268310	Kalugumalai	India	Tamil Nadu
1268325	Kālpi	India	Uttar Pradesh
1268327	Kalpetta	India	Kerala
1268339	Kālol	India	Gujarat
1268341	Kālna	India	West Bengal
1268344	Kalmeshwar	India	Maharashtra
1268360	Kallidaikurichchi	India	Tamil Nadu
1268376	Kallakkurichchi	India	Tamil Nadu
1268381	Kālka	India	Himachal Pradesh
1268403	Kālimpong	India	West Bengal
1268434	Kalghatgi	India	Karnataka
1268450	Kālāvad	India	Gujarat
1268469	Kālānwāli	India	Haryana
1268476	Kalānaur	India	Haryana
1268480	Kalamnūri	India	Maharashtra
1268484	Kalamb	India	Maharashtra
1268495	Kalakkādu	India	Tamil Nadu
1268540	Kakrāla	India	Uttar Pradesh
1268545	Kākori	India	Uttar Pradesh
1268561	Kākināda	India	Andhra Pradesh
1268567	Kakching	India	Manipur
1268593	Kaithal	India	Haryana
1268601	Kairāna	India	Uttar Pradesh
1268615	Kaimori	India	Madhya Pradesh
1268616	Kaimganj	India	Uttar Pradesh
1268622	Kailāshahar	India	Tripura
1268627	Kaikalūr	India	Andhra Pradesh
1268651	Kāgal	India	Maharashtra
1268662	Kadūr	India	Karnataka
1268667	Kadod	India	Gujarat
1268673	Kadiri	India	Andhra Pradesh
1268680	Kadi	India	Gujarat
1268707	Kadayanallur	India	Tamil Nadu
1268715	Kānchrāpāra	India	West Bengal
1268722	Kachhwa	India	Uttar Pradesh
1268739	Kabrāi	India	Uttar Pradesh
1268761	Junnar	India	Maharashtra
1268772	Jūnāgarh	India	Chhattisgarh
1268773	Jūnāgadh	India	Gujarat
1268775	Jumri Tilaiyā	India	Jharkhand
1268782	Jalandhar	India	Punjab
1268799	Jugsālai	India	Jharkhand
1268820	Jorhāt	India	Assam
1268834	Jolārpettai	India	Tamil Nadu
1268855	Jogbani	India	Bihar
1268863	Jodiya Bandar	India	Gujarat
1268865	Jodhpur	India	Rajasthan
1268866	Jodhpur	India	Gujarat
1268896	Jintūr	India	Maharashtra
1268907	Jīnd	India	Haryana
1268929	Jhūsi	India	Uttar Pradesh
1268936	Jhunjhunūn	India	Rajasthan
1268961	Jhinjhāna	India	Uttar Pradesh
1268962	Jhīnjhak	India	Uttar Pradesh
1268977	Jhārsuguda	India	Odisha
1268988	Jharia	India	Jharkhand
1269006	Jhānsi	India	Uttar Pradesh
1269012	Jhanjhārpur	India	Bihar
1269019	Jhālu	India	Uttar Pradesh
1269020	Jhālrapātan	India	Rajasthan
1269027	Jhālāwār	India	Rajasthan
1269042	Jhajjar	India	Haryana
1269046	Jhā Jhā	India	Bihar
1269053	Jhābua	India	Madhya Pradesh
1269056	Jewar	India	Uttar Pradesh
1269057	Jevargi	India	Karnataka
1269065	Jetpur	India	Gujarat
1269092	Jeypore	India	Odisha
1269094	Jaynagar-Majilpur	India	West Bengal
1269102	Jayamkondacholapuram	India	Tamil Nadu
1269126	Jāwad	India	Madhya Pradesh
1269135	Jaunpur	India	Uttar Pradesh
1269153	Jatāra	India	Madhya Pradesh
1269154	Jatani	India	Odisha
1269158	Jaswantnagar	India	Uttar Pradesh
1269168	Jaspur	India	Uttarakhand
1269175	Jasidih	India	Jharkhand
1269177	Jashpurnagar	India	Chhattisgarh
1269179	Jasdan	India	Gujarat
1269183	Jarwal	India	Uttar Pradesh
1269217	Jaorā	India	Madhya Pradesh
1269239	Jānjgīr	India	Chhattisgarh
1269247	Jangipur	India	West Bengal
1269256	Jangaon	India	Telangana
1269269	Jandiāla	India	Punjab
1269280	Jāmuria	India	West Bengal
1269291	Jamūī	India	Bihar
1269298	Jāmtāra	India	Jharkhand
1269300	Jamshedpur	India	Jharkhand
1269317	Jāmnagar	India	Gujarat
1269321	Jammu	India	Kashmir
1269323	Jammalamadugu	India	Andhra Pradesh
1269328	Jamkhandi	India	Karnataka
1269350	Jambusar	India	Gujarat
1269374	Jamālpur	India	Bihar
1269377	Jāmai	India	Madhya Pradesh
1269379	Jāmadoba	India	Jharkhand
1269392	Jalor	India	Rajasthan
1269395	Jālna	India	Maharashtra
1269406	Jalgaon Jamod	India	Maharashtra
1269407	Jalgaon	India	Maharashtra
1269413	Jaleshwar	India	Odisha
1269415	Jalesar	India	Uttar Pradesh
1269422	Jālaun	India	Uttar Pradesh
1269435	Jalālpur	India	Uttar Pradesh
1269439	Jalālpur	India	Gujarat
1269441	Jalālī	India	Uttar Pradesh
1269445	Jalālābād	India	Punjab
1269446	Jalālābad	India	Uttar Pradesh
1269447	Jalālābād	India	Uttar Pradesh
1269477	Jājpur	India	Odisha
1269488	Jaito	India	Punjab
1269498	Jaitāran	India	Rajasthan
1269507	Jaisalmer	India	Rajasthan
1269509	Jais	India	Uttar Pradesh
1269515	Jaipur	India	Rajasthan
1269545	Jahāzpur	India	Rajasthan
1269551	Jahāngīrābād	India	Uttar Pradesh
1269557	Jahānābād	India	Bihar
1269562	Jagtiāl	India	Telangana
1269564	Jagraon	India	Punjab
1269570	Jaggayyapeta	India	Andhra Pradesh
1269573	Jagdīspur	India	Bihar
1269574	Jagdīshpur	India	Uttar Pradesh
1269578	Jagdalpur	India	Chhattisgarh
1269581	Jagatsinghapur	India	Odisha
1269602	Jagalūr	India	Karnataka
1269605	Jagādhri	India	Haryana
1269646	Itimādpur	India	Uttar Pradesh
1269653	Itārsi	India	Madhya Pradesh
1269655	Itānagar	India	Arunachal Pradesh
1269665	Islāmpur	India	West Bengal
1269666	Islāmpur	India	Bihar
1269670	Islāmnagar	India	Uttar Pradesh
1269690	Irugūr	India	Tamil Nadu
1269693	Irinjālakuda	India	Kerala
1269694	Iringal	India	Kerala
1269723	Ingrāj Bāzār	India	West Bengal
1269731	Indri	India	Haryana
1269743	Indore	India	Madhya Pradesh
1269751	Indi	India	Karnataka
1269752	Indergarh	India	Uttar Pradesh
1269761	Indāpur	India	Maharashtra
1269771	Imphal	India	Manipur
1269784	Ilkal	India	Karnataka
1269810	Igatpuri	India	Maharashtra
1269827	Ichchāpuram	India	Andhra Pradesh
1269834	Ichalkaranji	India	Maharashtra
1269843	Hyderabad	India	Telangana
1269849	Hadagalli	India	Karnataka
1269862	Husainābād	India	Jharkhand
1269873	Hunsūr	India	Karnataka
1269876	Hungund	India	Karnataka
1269908	Hukeri	India	Karnataka
1269910	Hugli	India	West Bengal
1269920	Hubli	India	Karnataka
1269927	Howli	India	Assam
1269934	Hosūr	India	Tamil Nadu
1269935	Hospet	India	Karnataka
1269936	Hoskote	India	Karnataka
1269943	Hosdurga	India	Karnataka
1269970	Honnāli	India	Karnataka
1269976	Honāvar	India	Karnataka
1269979	Homnābād	India	Karnataka
1269985	Hole Narsipur	India	Karnataka
1269990	Holalkere	India	Karnataka
1269993	Hojāi	India	Assam
1270000	Hodal	India	Haryana
1270021	Hisuā	India	Bihar
1270022	Hisar	India	Haryana
1270032	Hiriyūr	India	Karnataka
1270036	Hirekerūr	India	Karnataka
1270059	Hīrākud	India	Odisha
1270066	Hinjilikatu	India	Odisha
1270072	Hingoli	India	Maharashtra
1270079	Hindupur	India	Andhra Pradesh
1270082	Hindoria	India	Madhya Pradesh
1270090	Hindaun	India	Rajasthan
1270099	Himatnagar	India	Gujarat
1270102	Hilsa	India	Bihar
1270164	Hazārībāg	India	Jharkhand
1270171	Hāveri	India	Karnataka
1270185	Hatta	India	Madhya Pradesh
1270237	Hastināpur	India	Uttar Pradesh
1270239	Hassan	India	Karnataka
1270245	Hāsimāra	India	West Bengal
1270251	Hasanpur	India	Uttar Pradesh
1270265	Harūr	India	Tamil Nadu
1270287	Harpanahalli	India	Karnataka
1270291	Harpālpur	India	Madhya Pradesh
1270343	Hārij	India	Gujarat
1270349	Harihar	India	Karnataka
1270351	Haridwar	India	Uttarakhand
1270370	Hardoī	India	Uttar Pradesh
1270375	Harda Khās	India	Madhya Pradesh
1270393	Hāpur	India	Uttar Pradesh
1270396	Hāora	India	West Bengal
1270407	Hanumāngarh	India	Rajasthan
1270417	Hānsi	India	Haryana
1270435	Hāngal	India	Karnataka
1270437	Handiā	India	Uttar Pradesh
1270454	Hamīrpur	India	Himachal Pradesh
1270455	Hamīrpur	India	Uttar Pradesh
1270466	Halvad	India	Gujarat
1270474	Hālol	India	Gujarat
1270484	Hālīsahar	India	West Bengal
1270498	Haldwani	India	Uttarakhand
1270509	Haldaur	India	Uttar Pradesh
1270522	Hājo	India	Assam
1270525	Hājīpur	India	Bihar
1270530	Hailākāndi	India	Assam
1270543	Hāflong	India	Assam
1270554	Hadgāon	India	Maharashtra
1270568	Hābra	India	West Bengal
1270583	Gwalior	India	Madhya Pradesh
1270598	Guskhara	India	West Bengal
1270603	Guruvāyūr	India	Kerala
1270618	Gursarāi	India	Uttar Pradesh
1270619	Gursahāiganj	India	Uttar Pradesh
1270627	Gurmatkāl	India	Karnataka
1270642	Gurgaon	India	Haryana
1270667	Gunupur	India	Odisha
1270668	Guntūr	India	Andhra Pradesh
1270670	Guntakal Junction	India	Andhra Pradesh
1270674	Gunnaur	India	Uttar Pradesh
1270686	Gundlupet	India	Karnataka
1270711	Guna	India	Madhya Pradesh
1270718	Gummidipundi	India	Tamil Nadu
1270722	Gumla	India	Chhattisgarh
1270723	Gumia	India	Jharkhand
1270750	Guledagudda	India	Karnataka
1270752	Gulbarga	India	Karnataka
1270759	Gulāothi	India	Uttar Pradesh
1270763	Gulābpura	India	Rajasthan
1270791	Gūdūr	India	Andhra Pradesh
1270800	Gudiyatham	India	Tamil Nadu
1270801	Gudivāda	India	Andhra Pradesh
1270820	Gudalur	India	Tamil Nadu
1270824	Gubbi	India	Karnataka
1270845	Goyerkāta	India	West Bengal
1270863	Govardhan	India	Uttar Pradesh
1270896	Gosāba	India	West Bengal
1270926	Gorakhpur	India	Haryana
1270927	Gorakhpur	India	Uttar Pradesh
1270947	Gobichettipalayam	India	Tamil Nadu
1270965	Gopālganj	India	Bihar
1270990	Gondiā	India	Maharashtra
1270994	Gondal	India	Gujarat
1270996	Gondā City	India	Uttar Pradesh
1271005	Gomoh	India	Jharkhand
1271050	Golāghāt	India	Assam
1271064	Gokarna	India	Karnataka
1271067	Gokak	India	Karnataka
1271079	Gohāna	India	Haryana
1271083	Gohadi	India	Madhya Pradesh
1271107	Godhra	India	Gujarat
1271113	Godda	India	Jharkhand
1271131	Gobindpur	India	Jharkhand
1271142	Gobārdānga	India	West Bengal
1271151	Goālpāra	India	Assam
1271175	Girīdīh	India	Jharkhand
1271199	Gingee	India	Tamil Nadu
1271212	Giddarbāha	India	Punjab
1271213	Giddalūr	India	Andhra Pradesh
1271244	Ghugus	India	Maharashtra
1271250	Ghoti Budrukh	India	Maharashtra
1271259	Ghosī	India	Uttar Pradesh
1271308	Ghāziābād	India	Uttar Pradesh
1271319	Ghātsīla	India	Jharkhand
1271343	Ghātanji	India	Maharashtra
1271345	Ghātampur	India	Uttar Pradesh
1271346	Ghātāl	India	West Bengal
1271363	Gharaunda	India	Haryana
1271413	Gevrai	India	Maharashtra
1271439	Gaya	India	Bihar
1271453	Gauripur	India	Assam
1271459	Goribidnūr	India	Karnataka
1271476	Guwahati	India	Assam
1271493	Garhwa	India	Jharkhand
1271495	Garui	India	West Bengal
1271533	Gariadhar	India	Gujarat
1271538	Garhshankar	India	Punjab
1271543	Garhmuktesar	India	Uttar Pradesh
1271613	Gannavaram	India	Andhra Pradesh
1271631	Gangtok	India	Sikkim
1271642	Gangolli	India	Karnataka
1271644	Gangoh	India	Uttar Pradesh
1271662	Gangāwati	India	Karnataka
1271670	Gangārāmpur	India	West Bengal
1271675	Gangāpur	India	Rajasthan
1271676	Gangāpur	India	Rajasthan
1271680	Gangāpur	India	Maharashtra
1271685	Gangānagar	India	Rajasthan
1271688	Gangākher	India	Maharashtra
1271715	Ghandinagar	India	Gujarat
1271717	Gāndhīdhām	India	Gujarat
1271722	Gandevi	India	Gujarat
1271729	Gāndarbal	India	Kashmir
1271780	Gajraula	India	Uttar Pradesh
1271819	Gadwāl	India	Telangana
1271834	Gadhinglaj	India	Maharashtra
1271839	Gadhada	India	Gujarat
1271847	Gādarwāra	India	Madhya Pradesh
1271850	Gadag	India	Karnataka
1271874	Forbesganj	India	Bihar
1271881	Fīrozpur Jhirka	India	Haryana
1271883	Ferozepore	India	Punjab
1271885	Fīrozābād	India	Uttar Pradesh
1271888	Ferokh	India	Kerala
1271891	Fāzilka	India	Punjab
1271892	Fatwa	India	Bihar
1271910	Fatehpur	India	Rajasthan
1271911	Fatehpur	India	Uttar Pradesh
1271912	Fatehpur	India	Uttar Pradesh
1271923	Fatehgarh Chūriān	India	Punjab
1271929	Fatehganj West	India	Uttar Pradesh
1271934	Fatehābād	India	Haryana
1271936	Fatehābād	India	Uttar Pradesh
1271940	Farrukhnagar	India	Telangana
1271942	Farrukhābād	India	Uttar Pradesh
1271947	Farīdpur	India	Uttar Pradesh
1271949	Farīdkot	India	Punjab
1271951	Farīdābād	India	Haryana
1271954	Farakka	India	West Bengal
1271965	Fālākāta	India	West Bengal
1271975	Faizpur	India	Maharashtra
1271976	Fyzābād	India	Uttar Pradesh
1271987	Etāwah	India	Uttar Pradesh
1272013	Erode	India	Tamil Nadu
1272022	Erāttupetta	India	Kerala
1272025	Erandol	India	Maharashtra
1272045	Emmiganūr	India	Andhra Pradesh
1272051	Ellore	India	Andhra Pradesh
1272052	Elūr	India	Kerala
1272061	Ellenabad	India	Haryana
1272084	Elamanchili	India	Andhra Pradesh
1272101	Egra	India	West Bengal
1272140	Dwārka	India	Gujarat
1272175	Durgapur	India	West Bengal
1272177	Durgāpur	India	Maharashtra
1272181	Durg	India	Chhattisgarh
1272201	Dūngarpur	India	Rajasthan
1272207	Ganj Dundwāra	India	Uttar Pradesh
1272225	Dumraon	India	Bihar
1272229	Dumra	India	Bihar
1272242	Dum Duma	India	Assam
1272243	Dam Dam	India	West Bengal
1272259	Duliāgaon	India	Assam
1272277	Dugda	India	Jharkhand
1272320	Dubrājpur	India	West Bengal
1272367	Dornakal	India	Telangana
1272375	Dorāha	India	Punjab
1272396	Dongargarh	India	Chhattisgarh
1272411	Dondaicha	India	Maharashtra
1272423	Dombivli	India	Maharashtra
1272473	Dod Ballāpur	India	Karnataka
1272476	Doda	India	Kashmir
1272502	Diu	India	Daman and Diu
1272513	Dīsa	India	Gujarat
1272525	Diphu	India	Assam
1272540	Dindori	India	Madhya Pradesh
1272543	Dindigul	India	Tamil Nadu
1272546	Dīnānagar	India	Punjab
1272552	Dimāpur	India	Nagaland
1272596	Digras	India	Maharashtra
1272606	Dīglūr	India	Maharashtra
1272610	Dighwāra	India	Bihar
1272629	Digboi	India	Assam
1272639	Dīg	India	Rajasthan
1272640	Dīdwāna	India	Rajasthan
1272646	Dicholi	India	Goa
1272648	Dibrugarh	India	Assam
1272653	Dibai	India	Uttar Pradesh
1272670	Dhūri	India	Punjab
1272674	Dhupgāri	India	West Bengal
1272689	Dhuliān	India	West Bengal
1272691	Dhūlia	India	Maharashtra
1272694	Dhuburi	India	Assam
1272699	Dhrol	India	Gujarat
1272701	Dhrāngadhra	India	Gujarat
1272720	Dhorāji	India	Gujarat
1272722	Dhone	India	Andhra Pradesh
1272733	Dholka	India	Gujarat
1272768	Dhing	India	Assam
1272780	Dhenkānāl	India	Odisha
1272790	Dhekiajuli	India	Assam
1272802	Dhaurahra	India	Uttar Pradesh
1272805	Dhaulpur	India	Rajasthan
1272819	Dhārūr	India	Maharashtra
1272832	Dharmsāla	India	Himachal Pradesh
1272842	Dharmavaram	India	Andhra Pradesh
1272847	Dharmapuri	India	Tamil Nadu
1272852	Dharmanagar	India	Tripura
1272856	Dharmadam	India	Kerala
1272857	Dharmābād	India	Maharashtra
1272860	Dhāriwāl	India	Punjab
1272861	Dhāri	India	Gujarat
1272873	Dharapuram	India	Tamil Nadu
1272874	Dharangaon	India	Maharashtra
1272881	Dharampur	India	Gujarat
1272892	Dhār	India	Madhya Pradesh
1272962	Dhanera	India	Gujarat
1272970	Dhandhuka	India	Gujarat
1272983	Dhanaura	India	Uttar Pradesh
1272985	Dhanaula	India	Punjab
1272997	Dhamtari	India	Chhattisgarh
1273002	Dhāmpur	India	Uttar Pradesh
1273006	Dhāmnod	India	Madhya Pradesh
1273043	Dhāka	India	Bihar
1273066	Dewas	India	Madhya Pradesh
1273083	Deoli	India	Rajasthan
1273098	Devgarh	India	Rajasthan
1273104	Devgadh Bāriya	India	Gujarat
1273109	Devarkonda	India	Telangana
1273123	Devanhalli	India	Karnataka
1273128	Devakottai	India	Tamil Nadu
1273153	Deshnoke	India	Rajasthan
1273181	Depālpur	India	Madhya Pradesh
1273191	Deori Khās	India	Madhya Pradesh
1273193	Deoria	India	Uttar Pradesh
1273206	Deoraniān	India	Uttar Pradesh
1273228	Deoli	India	Maharashtra
1273232	Deolāli	India	Maharashtra
1273246	Deogarh	India	Odisha
1273265	Deoband	India	Uttar Pradesh
1273272	Denkanikota	India	Tamil Nadu
1273294	Delhi	India	NCT
1273309	Dehri	India	Bihar
1273369	Dausa	India	Rajasthan
1273374	Daund	India	Maharashtra
1273390	Daudnagar	India	Bihar
1273403	Datia	India	Madhya Pradesh
1273409	Dātāganj	India	Uttar Pradesh
1273410	Dasūya	India	Punjab
1273416	Dāsna	India	Uttar Pradesh
1273434	Daryāpur	India	Maharashtra
1273440	Dārwha	India	Maharashtra
1273467	Dārjiling	India	West Bengal
1273491	Darbhanga	India	Bihar
1273574	Dandeli	India	Karnataka
1273581	Dinapore	India	Bihar
1273587	Damoh	India	Madhya Pradesh
1273593	Dāmnagar	India	Gujarat
1273618	Daman	India	Daman and Diu
1273626	Daltonganj	India	Jharkhand
1273642	Dalkola	India	West Bengal
1273665	Dākor	India	Gujarat
1273687	Dohad	India	Gujarat
1273704	Dahegām	India	Gujarat
1273708	Dāhānu	India	Maharashtra
1273724	Dādri	India	Uttar Pradesh
1273745	Dabwāli	India	Haryana
1273751	Dabra	India	Madhya Pradesh
1273756	Daboh	India	Madhya Pradesh
1273766	Dabhoi	India	Gujarat
1273780	Cuttack	India	Odisha
1273788	Curchorem	India	Goa
1273793	Cuncolim	India	Goa
1273795	Cumbum	India	Andhra Pradesh
1273802	Cuddalore	India	Tamil Nadu
1273834	Coondapoor	India	Karnataka
1273850	Colonelganj	India	Uttar Pradesh
1273856	Colgong	India	Bihar
1273858	Calangute	India	Goa
1273865	Coimbatore	India	Tamil Nadu
1273874	Cochin	India	Kerala
1273880	Clement Town	India	Uttarakhand
1273892	Chūru	India	Rajasthan
1273909	Churāchāndpur	India	Manipur
1273923	Chunār	India	Uttar Pradesh
1273960	Chotila	India	Gujarat
1273992	Chopda	India	Maharashtra
1274020	Chodavaram	India	Andhra Pradesh
1274032	Chittūr	India	Kerala
1274040	Chittaurgarh	India	Rajasthan
1274043	Chittaranjan	India	West Bengal
1274056	Chitradurga	India	Karnataka
1274077	Chītāpur	India	Karnataka
1274102	Chidawa	India	Rajasthan
1274106	Chīrāla	India	Andhra Pradesh
1274116	Chīpurupalle	India	Andhra Pradesh
1274119	Chiplūn	India	Maharashtra
1274129	Chintāmani	India	Karnataka
1274146	Chinna Salem	India	Tamil Nadu
1274151	Chinnamanūr	India	Tamil Nadu
1274169	Chincholi	India	Karnataka
1274195	Chillupār	India	Uttar Pradesh
1274213	Chilakalūrupet	India	Andhra Pradesh
1274218	Chikodi	India	Karnataka
1274219	Chiknāyakanhalli	India	Karnataka
1274220	Chikmagalūr	India	Karnataka
1274237	Chikhli	India	Maharashtra
1274256	Chidambaram	India	Tamil Nadu
1274265	Chicholi	India	Maharashtra
1274284	Chhoti Sādri	India	Rajasthan
1274285	Chhota Udepur	India	Gujarat
1274304	Chhindwāra	India	Madhya Pradesh
1274315	Chhibrāmau	India	Uttar Pradesh
1274337	Chhatarpur	India	Madhya Pradesh
1274342	Chhātāpur	India	Bihar
1274343	Chhāta	India	Uttar Pradesh
1274346	Chharra	India	Uttar Pradesh
1274351	Chhaprauli	India	Uttar Pradesh
1274353	Chāpra	India	Bihar
1274359	Chhāpar	India	Rajasthan
1274369	Chhala	India	Gujarat
1274381	Chhabra	India	Rajasthan
1274394	Chetput	India	Tamil Nadu
1274422	Chennimalai	India	Tamil Nadu
1274428	Chengannūr	India	Kerala
1274429	Chengam	India	Tamil Nadu
1274430	Chengalpattu	India	Tamil Nadu
1274468	Chāvakkād	India	Kerala
1274532	Chaksu	India	Rajasthan
1274533	Chatrapur	India	Odisha
1274536	Chatra	India	Jharkhand
1274553	Chās	India	Jharkhand
1274560	Charthāwal	India	Uttar Pradesh
1274571	Charkhi Dādri	India	Haryana
1274574	Charkhāri	India	Uttar Pradesh
1274618	Chāpar	India	Assam
1274640	Channarāyapatna	India	Karnataka
1274641	Channapatna	India	Karnataka
1274642	Channagiri	India	Karnataka
1274664	Changanācheri	India	Kerala
1274674	Chāndūr Bāzār	India	Maharashtra
1274675	Chāndūr	India	Maharashtra
1274676	Chāndur	India	Maharashtra
1274693	Chānda	India	Maharashtra
1274699	Chandrakona	India	West Bengal
1274714	Chāndpur	India	Uttar Pradesh
1274746	Chandigarh	India	Chandigarh
1274755	Chanderi	India	Madhya Pradesh
1274767	Chanduasi	India	Uttar Pradesh
1274770	Chandauli	India	Uttar Pradesh
1274784	Chandannagar	India	West Bengal
1274807	Chānasma	India	Gujarat
1274837	Chāmpa	India	Chhattisgarh
1274848	Chamba	India	Himachal Pradesh
1274861	Challapalle	India	Andhra Pradesh
1274862	Challakere	India	Karnataka
1274868	Chālisgaon	India	Maharashtra
1274874	Chalāla	India	Gujarat
1274890	Chakradharpur	India	Jharkhand
1274896	Chaklāsi	India	Gujarat
1274899	Chākia	India	Bihar
1274914	Chākan	India	Maharashtra
1274928	Chāībāsa	India	Jharkhand
1274984	Canning	India	West Bengal
1274987	Cannanore	India	Kerala
1275016	Byādgi	India	Karnataka
1275019	Buxar	India	Bihar
1275050	Burla	India	Odisha
1275066	Burhar	India	Madhya Pradesh
1275068	Burhānpur	India	Madhya Pradesh
1275097	Būndu	India	Jharkhand
1275103	Būndi	India	Rajasthan
1275117	Buldāna	India	Maharashtra
1275120	Bulandshahr	India	Uttar Pradesh
1275147	Budhlāda	India	Punjab
1275163	Budaun	India	Uttar Pradesh
1275194	Brājarājnagar	India	Odisha
1275198	Brahmapur	India	Odisha
1275218	Botād	India	Gujarat
1275230	Borsad	India	Gujarat
1275248	Borivli	India	Maharashtra
1275321	Bongaigaon	India	Assam
1275339	Mumbai	India	Maharashtra
1275346	Bolpur	India	West Bengal
1275362	Bokāro	India	Jharkhand
1275364	Bokajān	India	Assam
1275368	Boisar	India	Maharashtra
1275388	Bodināyakkanūr	India	Tamil Nadu
1275389	Buddh Gaya	India	Bihar
1275391	Bodhan	India	Telangana
1275406	Bobbili	India	Andhra Pradesh
1275435	Biswān	India	Uttar Pradesh
1275441	Bissāu	India	Rajasthan
1275476	Bisauli	India	Uttar Pradesh
1275481	Bīsalpur	India	Uttar Pradesh
1275488	Birūr	India	Karnataka
1275499	Bīrpur	India	Bihar
1275506	Birmitrapur	India	Odisha
1275558	Binka	India	Odisha
1275572	Bindki	India	Uttar Pradesh
1275582	Etāwa	India	Madhya Pradesh
1275589	Bilthra	India	Uttar Pradesh
1275590	Bilsi	India	Uttar Pradesh
1275593	Bilsanda	India	Uttar Pradesh
1275610	Bilimora	India	Gujarat
1275614	Bilhaur	India	Uttar Pradesh
1275619	Bilgi	India	Karnataka
1275634	Bīlāspur	India	Uttar Pradesh
1275637	Bilāspur	India	Chhattisgarh
1275641	Bilāsipāra	India	Assam
1275646	Bilāri	India	Uttar Pradesh
1275647	Bilāra	India	Rajasthan
1275655	Bikramganj	India	Bihar
1275665	Bīkaner	India	Rajasthan
1275679	Bijnor	India	Uttar Pradesh
1275692	Bijbiāra	India	Kashmir
1275694	Bijāwar	India	Madhya Pradesh
1275701	Bijapur	India	Karnataka
1275716	Bihār	India	Bihar
1275719	Bihārīganj	India	Bihar
1275732	Bidhūna	India	Uttar Pradesh
1275738	Bīdar	India	Karnataka
1275762	Biaora	India	Madhya Pradesh
1275778	Bhusāval	India	Maharashtra
1275804	Bhūm	India	Maharashtra
1275812	Bhuj	India	Gujarat
1275814	Bhudgaon	India	Maharashtra
1275817	Bhubaneshwar	India	Odisha
1275818	Bhuban	India	Odisha
1275836	Bhor	India	Maharashtra
1275841	Bhopal	India	Madhya Pradesh
1275848	Bhongīr	India	Telangana
1275849	Bhongaon	India	Uttar Pradesh
1275882	Bhogpur	India	Punjab
1275899	Bhiwāni	India	Haryana
1275901	Bhiwandi	India	Maharashtra
1275905	Bhitarwār	India	Madhya Pradesh
1275920	Bhīnmāl	India	Rajasthan
1275921	Bhinga	India	Uttar Pradesh
1275926	Bhind	India	Madhya Pradesh
1275930	Bhīmunipatnam	India	Andhra Pradesh
1275947	Bhīmavaram	India	Andhra Pradesh
1275960	Bhīlwāra	India	Rajasthan
1275971	Bhilai	India	Chhattisgarh
1275977	Bhīkhi	India	Punjab
1275978	Bhikangaon	India	Madhya Pradesh
1276013	Bhāyāvadar	India	Gujarat
1276014	Bhayandar	India	Maharashtra
1276023	Bhawānipatna	India	Odisha
1276026	Bhawānīgarh	India	Punjab
1276027	Bhawāniganj	India	Madhya Pradesh
1276032	Bhāvnagar	India	Gujarat
1276037	Bhavāni	India	Tamil Nadu
1276058	Bhātpāra	India	West Bengal
1276067	Bhatkal	India	Karnataka
1276070	Bhatinda	India	Punjab
1276084	Bhātāpāra	India	Chhattisgarh
1276092	Bhasāwar	India	Rajasthan
1276095	Bharwāri	India	Uttar Pradesh
1276100	Bharūch	India	Gujarat
1276103	Bharthana	India	Uttar Pradesh
1276128	Bharatpur	India	Rajasthan
1276147	Bhānvad	India	Gujarat
1276151	Bhānpurī	India	Chhattisgarh
1276152	Bhānpura	India	Madhya Pradesh
1276159	Bhanjanagar	India	Odisha
1276178	Bhānder	India	Madhya Pradesh
1276191	Bhandāra	India	Maharashtra
1276219	Bhālki	India	Karnataka
1276265	Bhainsdehi	India	Madhya Pradesh
1276300	Bhāgalpur	India	Bihar
1276320	Bhadreswar	India	West Bengal
1276321	Bhadrāvati	India	Karnataka
1276325	Bhadrakh	India	Odisha
1276328	Bhadrāchalam	India	Telangana
1276330	Bhādra	India	Rajasthan
1276335	Bhadohi	India	Uttar Pradesh
1276353	Bhadaur	India	Punjab
1276355	Bhādāsar	India	Rajasthan
1276370	Bhachāu	India	Gujarat
1276371	Bhabhua	India	Bihar
1276378	Beypore	India	Kerala
1276381	Bewar	India	Uttar Pradesh
1276393	Bettiah	India	Bihar
1276416	Betamcherla	India	Andhra Pradesh
1276437	Beri Khās	India	Haryana
1276449	Berasia	India	Madhya Pradesh
1276455	Beohāri	India	Madhya Pradesh
1276486	Belūr	India	Karnataka
1276495	Belsand	India	Bihar
1276502	Belonia	India	Tripura
1276509	Bellary	India	Karnataka
1276533	Belgaum	India	Karnataka
1276548	Beldānga	India	West Bengal
1276574	Bela	India	Uttar Pradesh
1276589	Behror	India	Rajasthan
1276600	Behat	India	Uttar Pradesh
1276609	Begusarai	India	Bihar
1276615	Begūn	India	Rajasthan
1276621	Begamganj	India	Madhya Pradesh
1276627	Bedi	India	Gujarat
1276634	Beāwar	India	Rajasthan
1276652	Bayāna	India	Rajasthan
1276663	Bawāna	India	NCT
1276686	Bauda	India	Odisha
1276720	Batāla	India	Punjab
1276724	Baswa	India	Rajasthan
1276731	Bāsudebpur	India	Odisha
1276736	Bastī	India	Uttar Pradesh
1276752	Bāsoda	India	Madhya Pradesh
1276754	Basni	India	Rajasthan
1276757	Basmat	India	Maharashtra
1276764	Basi	India	Punjab
1276765	Basi	India	Punjab
1276767	Basi	India	Rajasthan
1276783	Basavakalyān	India	Karnataka
1276810	Barwāni	India	Madhya Pradesh
1276815	Barwāla	India	Haryana
1276829	Bāruni	India	Bihar
1276832	Bāruipur	India	West Bengal
1276856	Bārsi	India	Maharashtra
1276867	Barpeta	India	Assam
1276870	Barpāli	India	Odisha
1276895	Barnāla	India	Punjab
1276901	Bārmer	India	Rajasthan
1276919	Barki Saria	India	Jharkhand
1276927	Barka Kāna	India	Jharkhand
1276938	Barjala	India	Tripura
1276939	Bari Sādri	India	Rajasthan
1276948	Bāri	India	Rajasthan
1276954	Barhiya	India	Bihar
1276977	Bārh	India	Bihar
1276988	Bargarh	India	Odisha
1277013	Bareilly	India	Uttar Pradesh
1277022	Bārdoli	India	Gujarat
1277029	Barddhamān	India	West Bengal
1277038	Bar Bigha	India	Bihar
1277044	Baraut	India	Uttar Pradesh
1277053	Barauli	India	Bihar
1277065	Bārāsat	India	West Bengal
1277066	Bārāsat	India	West Bengal
1277082	Baranagar	India	West Bengal
1277084	Bārān	India	Rajasthan
1277085	Bāramūla	India	Kashmir
1277100	Bārākpur	India	West Bengal
1277183	Bāpatla	India	Andhra Pradesh
1277200	Banūr	India	Punjab
1277201	Bantvāl	India	Karnataka
1277202	Bāntva	India	Gujarat
1277214	Bānswāra	India	Rajasthan
1277216	Bānswāda	India	Telangana
1277232	Bānsi	India	Uttar Pradesh
1277238	Bānsdīh	India	Uttar Pradesh
1277240	Bānsbāria	India	West Bengal
1277255	Bannūr	India	Karnataka
1277263	Banmankhi	India	Bihar
1277264	Bānkura	India	West Bengal
1277273	Bānki	India	Odisha
1277289	Bānka	India	Bihar
1277318	Bāngarmau	India	Uttar Pradesh
1277320	Bangārapet	India	Karnataka
1277322	Bangaon	India	Bihar
1277330	Banganapalle	India	Andhra Pradesh
1277333	Bengaluru	India	Karnataka
1277338	Banga	India	Punjab
1277358	Bandipura	India	Kashmir
1277362	Bāndīkūi	India	Rajasthan
1277397	Bānda	India	Uttar Pradesh
1277398	Banda	India	Madhya Pradesh
1277409	Banat	India	Uttar Pradesh
1277426	Bānapur	India	Odisha
1277442	Bāmor Kalān	India	Madhya Pradesh
1277508	Bālurghāt	India	West Bengal
1277514	Bālugaon	India	Odisha
1277527	Bālotra	India	Rajasthan
1277530	Baloda Bāzār	India	Chhattisgarh
1277535	Balod	India	Chhattisgarh
1277539	Bāli	India	West Bengal
1277557	Ballālpur	India	Maharashtra
1277590	Bāli	India	Rajasthan
1277599	Balasore	India	Odisha
1277634	Balarāmpur	India	West Bengal
1277636	Bālāpur	India	Maharashtra
1277643	Balāngīr	India	Odisha
1277661	Bālāghāt	India	Madhya Pradesh
1277666	Bālāchor	India	Punjab
1277684	Bakhtiyārpur	India	Bihar
1277723	Baj Baj	India	West Bengal
1277748	Bairāgnia	India	Bihar
1277759	Byndoor	India	Karnataka
1277765	Bail-Hongal	India	Karnataka
1277776	Baihar	India	Madhya Pradesh
1277799	Bahraigh	India	Uttar Pradesh
1277808	Bahjoi	India	Uttar Pradesh
1277814	Baheri	India	Uttar Pradesh
1277820	Baharampur	India	West Bengal
1277835	Bahādurgarh	India	Haryana
1277836	Bahādurganj	India	Bihar
1277841	Bāh	India	Uttar Pradesh
1277844	Bagulā	India	West Bengal
1277882	Bāghpat	India	Uttar Pradesh
1277897	Bāghdogra	India	West Bengal
1277902	Bāgha Purāna	India	Punjab
1277909	Bāgepalli	India	Karnataka
1277924	Bagasra	India	Gujarat
1277930	Bagar	India	Rajasthan
1277936	Bagalkot	India	Karnataka
1277939	Bagaha	India	Bihar
1277940	Bagaha	India	Bihar
1277950	Badūria	India	West Bengal
1277970	Badnāwar	India	Madhya Pradesh
1277976	Badlapur	India	Maharashtra
1278017	Bādāmi	India	Karnataka
1278026	Bada Barabīl	India	Odisha
1278036	Bachhraon	India	Uttar Pradesh
1278052	Babrāla	India	Uttar Pradesh
1278054	Bābra	India	Gujarat
1278058	Babīna	India	Uttar Pradesh
1278064	Baberu	India	Uttar Pradesh
1278073	Bābai	India	Madhya Pradesh
1278083	Azamgarh	India	Uttar Pradesh
1278094	Ajodhya	India	Uttar Pradesh
1278100	Ayakudi	India	Tamil Nadu
1278124	Avinashi	India	Tamil Nadu
1278130	Āvadi	India	Tamil Nadu
1278139	Ausa	India	Maharashtra
1278148	Aurangābād	India	Bihar
1278149	Aurangabad	India	Maharashtra
1278152	Auraiya	India	Uttar Pradesh
1278156	Aurād	India	Karnataka
1278173	Attur	India	Tamil Nadu
1278176	Attingal	India	Kerala
1278178	Attili	India	Andhra Pradesh
1278190	Atraulī	India	Uttar Pradesh
1278201	Atmakūr	India	Andhra Pradesh
1278204	Adirampattinam	India	Tamil Nadu
1278208	Athni	India	Karnataka
1278216	Āthagarh	India	Odisha
1278228	Atarra	India	Uttar Pradesh
1278278	Āsind	India	Rajasthan
1278279	Āsika	India	Odisha
1278294	Ashta	India	Madhya Pradesh
1278296	Ashta	India	Maharashtra
1278297	Ashoknagar	India	Madhya Pradesh
1278314	Āsansol	India	West Bengal
1278320	Āsandh	India	Haryana
1278335	Ārvi	India	Maharashtra
1278340	Aruppukkottai	India	Tamil Nadu
1278343	Arumuganeri	India	Tamil Nadu
1278345	Arukutti	India	Kerala
1278354	Arsikere	India	Karnataka
1278365	Āron	India	Madhya Pradesh
1278393	Arkalgūd	India	Karnataka
1278405	Ariyalūr	India	Tamil Nadu
1278432	Arcot	India	Tamil Nadu
1278446	Arāria	India	Bihar
1278454	Ārani	India	Tamil Nadu
1278455	Ārangaon	India	Maharashtra
1278458	Arang	India	Chhattisgarh
1278466	Arāmbāgh	India	West Bengal
1278471	Arakkonam	India	Tamil Nadu
1278483	Arrah	India	Bihar
1278498	Aonla	India	Uttar Pradesh
1278507	Anūpshahr	India	Uttar Pradesh
1278508	Anūppur	India	Madhya Pradesh
1278510	Anūpgarh	India	Rajasthan
1278532	Anta	India	Rajasthan
1278534	Anshing	India	Maharashtra
1278539	Annur	India	Tamil Nadu
1278553	Ankleshwar	India	Gujarat
1278573	Anjār	India	Gujarat
1278580	Anjangaon	India	Maharashtra
1278588	Anjad	India	Madhya Pradesh
1278593	Angul	India	Odisha
1278602	Angamāli	India	Kerala
1278609	Anekal	India	Karnataka
1278621	Andol	India	Telangana
1278622	Anthiyur	India	Tamil Nadu
1278625	Āndippatti	India	Tamil Nadu
1278667	Anantnag	India	Kashmir
1278672	Anantapur	India	Andhra Pradesh
1278676	Anandpur	India	Punjab
1278685	Ānand	India	Gujarat
1278692	Anaimalai	India	Tamil Nadu
1278698	Amudālavalasa	India	Andhra Pradesh
1278703	Āmta	India	West Bengal
1278707	Amroli	India	Gujarat
1278708	Amroha	India	Uttar Pradesh
1278710	Amritsar	India	Punjab
1278715	Amreli	India	Gujarat
1278718	Amrāvati	India	Maharashtra
1278742	Amod	India	Gujarat
1278768	Āmli	India	Dadra and Nagar Haveli
1278774	Āmlāgora	India	West Bengal
1278775	Amla	India	Madhya Pradesh
1278808	Amet	India	Rajasthan
1278815	Ambur	India	Tamil Nadu
1278840	Ambattūr	India	Tamil Nadu
1278841	Ambasamudram	India	Tamil Nadu
1278860	Ambāla	India	Haryana
1278862	Ambājogāi	India	Maharashtra
1278868	Ambāh	India	Madhya Pradesh
1278871	Ambad	India	Maharashtra
1278895	Amarpur	India	Bihar
1278899	Amarpātan	India	Madhya Pradesh
1278903	Amarnāth	India	Maharashtra
1278931	Amalner	India	Maharashtra
1278935	Amalāpuram	India	Andhra Pradesh
1278941	Aluva	India	Kerala
1278946	Alwar	India	Rajasthan
1278964	Alot	India	Madhya Pradesh
1278969	Along	India	Arunachal Pradesh
1278973	Alnāvar	India	Karnataka
1278974	Almora	India	Uttarakhand
1278985	Alleppey	India	Kerala
1279005	Alīpur	India	NCT
1279017	Alīgarh	India	Uttar Pradesh
1279023	Alīganj	India	Uttar Pradesh
1279027	Alībāg	India	Maharashtra
1279058	Ālangulam	India	Tamil Nadu
1279061	Ālangāyam	India	Tamil Nadu
1279064	Alandur	India	Tamil Nadu
1279066	Alandi	India	Maharashtra
1279068	Aland	India	Karnataka
1279094	Akot	India	Maharashtra
1279105	Akola	India	Maharashtra
1279115	Aklera	India	Rajasthan
1279123	Akivīdu	India	Andhra Pradesh
1279134	Akbarpur	India	Uttar Pradesh
1279144	Akaltara	India	Chhattisgarh
1279147	Akalkot	India	Maharashtra
1279154	Ajra	India	Maharashtra
1279158	Ajnāla	India	Punjab
1279159	Ajmer	India	Rajasthan
1279186	Aizawl	India	Mizoram
1279219	Ahraura	India	Uttar Pradesh
1279228	Ahmadnagar	India	Maharashtra
1279233	Ahmedabad	India	Gujarat
1279259	Āgra	India	Uttar Pradesh
1279290	Agartala	India	Tripura
1279299	Agar	India	Madhya Pradesh
1279307	Afzalgarh	India	Uttar Pradesh
1279323	Adūr	India	Kerala
1279334	Adra	India	West Bengal
1279335	Ādoni	India	Andhra Pradesh
1279344	Ādilābād	India	Telangana
1279356	Addanki	India	Andhra Pradesh
1279382	Achhnera	India	Uttar Pradesh
1279390	Achalpur	India	Maharashtra
1279394	Ābu Road	India	Rajasthan
1279396	Ābu	India	Rajasthan
1279403	Abohar	India	Punjab
1279407	Abhayāpuri	India	Assam
1344069	Contai	India	West Bengal
1344377	Haldia	India	West Bengal
1348739	Dumjor	India	West Bengal
1348747	Bankra	India	West Bengal
1348753	Chakapara	India	West Bengal
1348775	Mahiari	India	West Bengal
1348780	Dhulagari	India	West Bengal
1348785	Pānchla	India	West Bengal
1348818	Nangi	India	West Bengal
1348820	Pujali	India	West Bengal
1349041	Monoharpur	India	West Bengal
1349357	Nabagrām	India	West Bengal
1430991	Soyībug	India	Kashmir
1445156	Singāpur	India	Telangana
1445378	Ghatkesar	India	Telangana
1462711	Vijayapura	India	Karnataka
1462733	Ādampur	India	Punjab
1465622	Porur	India	Tamil Nadu
1465828	Perungudi	India	Tamil Nadu
1465910	Madambakkam	India	Tamil Nadu
6324621	Powai	India	Maharashtra
6619347	Navi Mumbai	India	Maharashtra
6941937	Murudeshwara	India	Karnataka
6943660	Shivaji Nagar	India	Maharashtra
6954929	Greater Noida	India	Uttar Pradesh
6992326	Mohali	India	Punjab
7279595	Pithampur	India	Madhya Pradesh
7279597	Barbil	India	Odisha
7279599	Airoli	India	Maharashtra
7279600	Aluva	India	Kerala
7279734	Kotkapura	India	Punjab
7279735	Muvattupuzha	India	Kerala
7279741	Vapi	India	Gujarat
7279742	Baddi	India	Himachal Pradesh
7279746	Noida	India	Uttar Pradesh
7279747	Bhiwadi	India	Rajasthan
7279752	Mandideep	India	Madhya Pradesh
7279754	Singrauli	India	Madhya Pradesh
7284803	Birpara	India	West Bengal
7284820	Jaigaon	India	West Bengal
7302805	Akkarampalle	India	Andhra Pradesh
7302806	Bellampalli	India	Telangana
7302808	Chemmumiahpet	India	Andhra Pradesh
7302810	Gaddi Annaram	India	Telangana
7302812	Dasnapur	India	Telangana
7302825	Kanuru	India	Andhra Pradesh
7302828	Malkajgiri	India	Telangana
7302829	Mandamarri	India	Telangana
7302830	Chinnachowk	India	Andhra Pradesh
7302832	Kyathampalle	India	Telangana
7302833	Gajuwaka	India	Andhra Pradesh
7302836	Manuguru	India	Telangana
7302838	Kalyandurg	India	Andhra Pradesh
7302844	Ponnur	India	Andhra Pradesh
7302845	Quthbullapur	India	Telangana
7302846	Ramanayyapeta	India	Andhra Pradesh
7302847	Palwancha	India	Telangana
7302849	Barpeta Road	India	Assam
7302851	Sathupalli	India	Telangana
7302853	Yanamalakuduru	India	Andhra Pradesh
7302854	Marigaon	India	Assam
7302856	Serilingampalle	India	Telangana
7302857	Silapathar	India	Assam
7302859	Lumding Railway Colony	India	Assam
7302860	Aistala	India	West Bengal
7302861	Ashoknagar Kalyangarh	India	West Bengal
7302862	Bahula	India	West Bengal
7626554	Bhawanipur	India	Bihar
7645176	Zira	India	Punjab
8347656	Ramagundam	India	Telangana
8504418	Cherpulassery	India	Kerala
8581647	Kirandul	India	Chhattisgarh
8714565	Shiraguppi	India	Maharashtra
9212568	Neelankarai	India	Tamil Nadu
9212569	Injambakkam	India	Tamil Nadu
9781227	Kultali	India	West Bengal
9794300	Shahbazpur	India	Bihar
10627510	Kumbalam	India	Kerala
10628607	Aroor	India	Kerala
10628608	Kadakkavoor	India	Kerala
10629189	Kalavoor	India	Kerala
10630431	Kalamassery	India	Kerala
10792588	Cherthala	India	Kerala
89570	Zaxo	Iraq	Dahūk
89824	Umm Qaşr	Iraq	Basra Governorate
90026	Tozkhurmato	Iraq	Salah ad Din Governorate
90150	Tikrīt	Iraq	Salah ad Din Governorate
90353	Tallkayf	Iraq	Nīnawá
90708	Sīnah	Iraq	Dahūk
91597	Sāmarrā’	Iraq	Salah ad Din Governorate
91812	Nāḩīyat Saddat al Hindīyah	Iraq	Bābil
92002	Ruwāndiz	Iraq	Arbīl
92004	Rāwah	Iraq	Anbar
92430	Al-Hamdaniya	Iraq	Nīnawá
93709	Mandalī	Iraq	Diyālá
94220	Koysinceq	Iraq	Arbīl
94298	Kifrī	Iraq	Diyālá
94787	Kirkuk	Iraq	At Taʼmīm
95446	Erbil	Iraq	Arbīl
95788	Hīt	Iraq	Anbar
96205	Ḩalabjah	Iraq	As Sulaymānīyah
96309	Ḩadīthah	Iraq	Anbar
96994	Dihok	Iraq	Dahūk
97417	Jamjamāl	Iraq	As Sulaymānīyah
97783	Bayjī	Iraq	Salah ad Din Governorate
98112	Balad	Iraq	Salah ad Din Governorate
98182	Baghdad	Iraq	Mayorality of Baghdad
98245	Az Zubayr	Iraq	Basra Governorate
98459	Aş Şuwayrah	Iraq	Wāsiţ
98463	As Sulaymānīyah	Iraq	As Sulaymānīyah
98530	As Samawah	Iraq	Al Muthanná
98589	Nāḩiyat ash Shināfīyah	Iraq	Al Qādisīyah
98622	Ash Shaţrah	Iraq	Dhi Qar
98629	Ash Shāmīyah	Iraq	Al Qādisīyah
98677	Ar Ruţbah	Iraq	Anbar
98685	Ar Rumaythah	Iraq	Al Muthanná
98717	Ramadi	Iraq	Anbar
98822	‘Aqrah	Iraq	Nīnawá
98854	An Nāşirīyah	Iraq	Dhi Qar
98860	Najaf	Iraq	An Najaf
99010	Imam Qasim	Iraq	Bābil
99039	Al Musayyib	Iraq	Bābil
99060	Al Mishkhāb	Iraq	An Najaf
99062	Al Miqdādīyah	Iraq	Diyālá
99071	Al Mawşil al Jadīdah	Iraq	Nīnawá
99072	Mosul	Iraq	Nīnawá
99131	Al Kūt	Iraq	Wāsiţ
99135	Kufa	Iraq	An Najaf
99169	Khāliş	Iraq	Diyālá
99306	‘Alī al Gharbī	Iraq	Maysan
99344	Al Hindīyah	Iraq	Karbalāʼ
99347	Al Ḩillah	Iraq	Bābil
99350	Al Ḩayy	Iraq	Wāsiţ
99369	Al Hārithah	Iraq	Basra Governorate
99434	Nahiyat Ghammas	Iraq	Al Qādisīyah
99446	Al Fāw	Iraq	Basra Governorate
99454	Al Fallūjah	Iraq	Anbar
99532	Basrah	Iraq	Basra Governorate
99548	Al ‘Azīzīyah	Iraq	Wāsiţ
99608	Al ‘Amārah	Iraq	Maysan
99738	‘Afak	Iraq	Al Qādisīyah
99759	Ad Dujayl	Iraq	Salah ad Din Governorate
99762	Ad Dīwānīyah	Iraq	Al Qādisīyah
100077	Abū Ghurayb	Iraq	Mayorality of Baghdad
388349	Al Başrah al Qadīmah	Iraq	Basra Governorate
448149	Sinjār	Iraq	Nīnawá
14256	Āzādshahr	Iran	Hamadān
23814	Kahrīz	Iran	Kermānshāh
24851	Nūrābād	Iran	Lorestān
32767	Qarchak	Iran	Tehrān
32909	Shahre Jadide Andisheh	Iran	Tehrān
41210	Khorramdarreh	Iran	Zanjan
66093	Yasuj	Iran	Kohgīlūyeh va Būyer Aḩmad
110831	Āzādshahr	Iran	Golestān
111421	Zarand	Iran	Kerman
111453	Zanjān	Iran	Zanjan
111822	Yazd	Iran	Yazd
112214	Varāmīn	Iran	Tehrān
112646	Torbat-e Ḩeydarīyeh	Iran	Razavi Khorasan
112656	Tonekābon	Iran	Māzandarān
112931	Tehran	Iran	Tehrān
113343	Hashtpar	Iran	Gīlān
113491	Tākestān	Iran	Qazvīn
113508	Takāb	Iran	Āz̄ārbāyjān-e Gharbī
113632	Taft	Iran	Yazd
113646	Tabriz	Iran	East Azerbaijan
113659	Tabas	Iran	Yazd
114049	Sonqor	Iran	Kermānshāh
114259	Sirjan	Iran	Kerman
114584	Shūshtar	Iran	Khuzestan
114593	Shūsh	Iran	Khuzestan
115019	Shiraz	Iran	Fars
115770	Shahr-e Kord	Iran	Chahār Maḩāll va Bakhtīārī
115781	Shahr-e Bābak	Iran	Kerman
116102	Shādegān	Iran	Khuzestan
116402	Semnān	Iran	Semnān
116406	Semīrom	Iran	Isfahan
116667	Sāveh	Iran	Markazi
116996	Sari	Iran	Māzandarān
117392	Saqqez	Iran	Kordestān
117574	Sanandaj	Iran	Kordestān
117656	Salmās	Iran	Āz̄ārbāyjān-e Gharbī
117793	Shāhīn Dezh	Iran	Āz̄ārbāyjān-e Gharbī
118063	Sabzevar	Iran	Razavi Khorasan
118191	Rūdsar	Iran	Gīlān
118367	Robāţ Karīm	Iran	Tehrān
118704	Rāvar	Iran	Kerman
118743	Rasht	Iran	Gīlān
118805	Rāmshīr	Iran	Khuzestan
118826	Rāmhormoz	Iran	Khuzestan
118994	Rafsanjān	Iran	Kerman
119161	Qorveh	Iran	Kordestān
119208	Qom	Iran	Qom
119374	Qeshm	Iran	Hormozgan
119505	Qazvin	Iran	Qazvīn
119730	Qarah Ẕīā’ od Dīn	Iran	Āz̄ārbāyjān-e Gharbī
120678	Farrokh Shahr	Iran	Chahār Maḩāll va Bakhtīārī
120694	Qā’en	Iran	Khorāsān-e Jonūbī
120931	Sarpol-e Z̄ahāb	Iran	Kermānshāh
120972	Pīshvā	Iran	Tehrān
121110	Piranshahr	Iran	Āz̄ārbāyjān-e Gharbī
121240	Pāveh	Iran	Kermānshāh
121380	Pārsābād	Iran	Ardabīl
121801	Orūmīyeh	Iran	Āz̄ārbāyjān-e Gharbī
121861	Omīdīyeh	Iran	Khuzestan
121925	Nūrābād	Iran	Fars
121959	Nowshahr	Iran	Māzandarān
122285	Nīshābūr	Iran	Razavi Khorasan
122289	Neyrīz	Iran	Fars
122397	Nekā	Iran	Māzandarān
122438	Naz̧arābād	Iran	Alborz
122698	Naqadeh	Iran	Āz̄ārbāyjān-e Gharbī
122915	Nahāvand	Iran	Hamadān
123941	Mīnāb	Iran	Hormozgan
124085	Mīāndoāb	Iran	Āz̄ārbāyjān-e Gharbī
124193	Meybod	Iran	Yazd
124274	Mahrīz	Iran	Yazd
124620	Masjed Soleymān	Iran	Khuzestan
124647	Bardsīr	Iran	Kerman
124665	Mashhad	Iran	Razavi Khorasan
124862	Marand	Iran	East Azerbaijan
125185	Malāyer	Iran	Hamadān
125188	Malārd	Iran	Tehrān
125897	Langarūd	Iran	Gīlān
126914	Kīsh	Iran	Hormozgan
126972	Khvoy	Iran	Āz̄ārbāyjān-e Gharbī
127033	Khvānsār	Iran	Isfahan
127319	Khorramshahr	Iran	Khuzestan
127349	Khorramabad	Iran	Lorestān
127403	Khomeyn	Iran	Markazi
128226	Kermānshāh	Iran	Kermānshāh
128234	Kerman	Iran	Kerman
128321	Kāzerūn	Iran	Fars
128447	Kāshmar	Iran	Razavi Khorasan
128477	Kāshān	Iran	Isfahan
128747	Karaj	Iran	Alborz
128831	Kangāvar	Iran	Kermānshāh
128905	Kāmyārān	Iran	Kordestān
129512	Kalāleh	Iran	Golestān
129933	Jūybār	Iran	Māzandarān
130245	Javānrūd	Iran	Kermānshāh
130802	Īlām	Iran	Īlām
131962	Harsīn	Iran	Kermānshāh
132144	Hamadān	Iran	Hamadān
132938	Gonbad-e Kāvūs	Iran	Golestān
132961	Gonābād	Iran	Razavi Khorasan
133037	Golpāyegān	Iran	Isfahan
133595	Gerāsh	Iran	Fars
134217	Bandar-e Ganāveh	Iran	Bushehr
134441	Fūman	Iran	Gīlān
134518	Fīrūzābād	Iran	Fars
134602	Fereydūnkenār	Iran	Māzandarān
134721	Fasā	Iran	Fars
135298	Esfarāyen	Iran	Khorāsān-e Shomālī
135423	Shahrud	Iran	Semnān
136014	Dogonbadan	Iran	Kohgīlūyeh va Būyer Aḩmad
136399	Delījān	Iran	Markazi
136702	Dehlorān	Iran	Īlām
136987	Dehdasht	Iran	Kohgīlūyeh va Būyer Aḩmad
137268	Sūsangerd	Iran	Khuzestan
137436	Darreh Shahr	Iran	Īlām
137956	Dārāb	Iran	Fars
138025	Dāmghān	Iran	Semnān
138042	Damāvand	Iran	Tehrān
138742	Chenārān	Iran	Razavi Khorasan
139223	Chālūs	Iran	Māzandarān
139817	Bandar-e Būshehr	Iran	Bushehr
139889	Būkān	Iran	Āz̄ārbāyjān-e Gharbī
140044	Borūjerd	Iran	Lorestān
140046	Borūjen	Iran	Chahār Maḩāll va Bakhtīārī
140097	Borāzjān	Iran	Bushehr
140380	Bojnūrd	Iran	Khorāsān-e Shomālī
140463	Bīrjand	Iran	Khorāsān-e Jonūbī
140521	Bījār	Iran	Kordestān
140889	Bonāb	Iran	East Azerbaijan
140918	Behshahr	Iran	Māzandarān
140951	Behbahān	Iran	Khuzestan
141584	Bāneh	Iran	Kordestān
141679	Bandar-e Anzalī	Iran	Gīlān
141681	Bandar ‘Abbās	Iran	Hormozgan
141736	Bam	Iran	Kerman
142000	Bahār	Iran	Hamadān
142255	Bāfq	Iran	Yazd
142358	Bābolsar	Iran	Māzandarān
142363	Bābol	Iran	Māzandarān
142496	Aznā	Iran	Lorestān
142554	Hashtrūd	Iran	East Azerbaijan
142676	Āstārā	Iran	Gīlān
142679	Āstāneh-ye Ashrafīyeh	Iran	Gīlān
142872	Asadābād	Iran	Hamadān
143052	Ardestān	Iran	Isfahan
143073	Ardakān	Iran	Yazd
143083	Ardabīl	Iran	Ardabīl
143127	Arāk	Iran	Markazi
143748	Alvand	Iran	Zanjan
143860	Shahrīār	Iran	Tehrān
143921	Alīgūdarz	Iran	Lorestān
144269	Aleshtar	Iran	Lorestān
144410	Akbarābād	Iran	Fars
144443	‘Ajab Shīr	Iran	East Azerbaijan
144448	Ahvaz	Iran	Khuzestan
144616	Ahar	Iran	East Azerbaijan
144696	Aghajari	Iran	Khuzestan
144794	Ābyek	Iran	Markazi
145034	Abhar	Iran	Zanjan
145233	Ābdānān	Iran	Īlām
145449	Ābādeh	Iran	Fars
145459	Abadan	Iran	Khuzestan
417594	Shāhreẕā	Iran	Isfahan
418521	Rehnān	Iran	Isfahan
418571	Qahderījān	Iran	Isfahan
418606	Najafābād	Iran	Isfahan
418710	Khomeynī Shahr	Iran	Isfahan
418723	Kelīshād va Sūdarjān	Iran	Isfahan
418851	Falāvarjān	Iran	Isfahan
418863	Isfahan	Iran	Isfahan
418868	Dowlatābād	Iran	Isfahan
418896	Dorcheh Pīāz	Iran	Isfahan
1113217	Zābol	Iran	Sistan and Baluchestan
1159301	Zahedan	Iran	Sistan and Baluchestan
1159384	Tāybād	Iran	Razavi Khorasan
1159716	Sarakhs	Iran	Razavi Khorasan
1159877	Qaşr-e Qand	Iran	Sistan and Baluchestan
1160571	Khāsh	Iran	Sistan and Baluchestan
1160939	Īrānshahr	Iran	Sistan and Baluchestan
1161724	Chabahar	Iran	Sistan and Baluchestan
7100777	Mahdishahr	Iran	Semnān
10630176	Pasragad Branch	Iran	Hamadān
2633274	Akureyri	Iceland	Northeast
3413829	Reykjavík	Iceland	Capital Region
3415212	Kópavogur	Iceland	Capital Region
3416706	Hafnarfjörður	Iceland	Capital Region
2522713	Vittoria	Italy	Sicily
2522767	Villabate	Italy	Sicily
2522776	Vibo Valentia	Italy	Calabria
2522876	Trapani	Italy	Sicily
2523083	Siracusa	Italy	Sicily
2523087	Sinnai	Italy	Sardinia
2523113	Siderno	Italy	Calabria
2523136	Sestu	Italy	Sardinia
2523166	Selargius	Italy	Sardinia
2523180	Scordia	Italy	Sicily
2523192	Scicli	Italy	Sicily
2523194	Sciacca	Italy	Sicily
2523460	San Giovanni la Punta	Italy	Sicily
2523513	San Cataldo	Italy	Sicily
2523577	Rossano Stazione	Italy	Calabria
2523581	Rosolini	Italy	Sicily
2523619	Ribera	Italy	Sicily
2523650	Ragusa	Italy	Sicily
2523664	Quattromiglia	Italy	Calabria
2523665	Quartu Sant'Elena	Italy	Sardinia
2523693	Pozzallo	Italy	Sicily
2523705	Porto Empedocle	Italy	Sicily
2523796	Piazza Armerina	Italy	Sicily
2523866	Paternò	Italy	Sicily
2523871	Partinico	Italy	Sicily
2523902	Palmi	Italy	Calabria
2523908	Palma di Montechiaro	Italy	Sicily
2523920	Palermo	Italy	Sicily
2523927	Palagonia	Italy	Sicily
2523938	Pachino	Italy	Sicily
2523964	Oristano	Italy	Sardinia
2523998	Noto	Italy	Sicily
2524006	Niscemi	Italy	Sicily
2524084	Monserrato	Italy	Sardinia
2524085	Monreale	Italy	Sicily
2524119	Modica	Italy	Sicily
2524123	Misterbianco	Italy	Sicily
2524126	Misilmeri	Italy	Sicily
2524155	Milazzo	Italy	Sicily
2524170	Messina	Italy	Sicily
2524205	Mazara del Vallo	Italy	Sicily
2524236	Mascalucia	Italy	Sicily
2524245	Marsala	Italy	Sicily
2524393	Licata	Italy	Sicily
2524410	Lentini	Italy	Sicily
2524533	Iglesias	Italy	Sardinia
2524606	Gioia Tauro	Italy	Calabria
2524618	Giarre	Italy	Sicily
2524653	Gela	Italy	Sicily
2524734	Floridia	Italy	Sicily
2524786	Favara	Italy	Sicily
2524819	Enna	Italy	Sicily
2524907	Cosenza	Italy	Calabria
2524955	Comiso	Italy	Sicily
2525059	Catanzaro	Italy	Calabria
2525068	Catania	Italy	Sicily
2525070	Castrovillari	Italy	Calabria
2525083	Castelvetrano	Italy	Sicily
2525207	Casarano	Italy	Apulia
2525350	Carini	Italy	Sicily
2525362	Carbonia	Italy	Sardinia
2525405	Canicattì	Italy	Sicily
2525448	Caltanissetta	Italy	Sicily
2525450	Caltagirone	Italy	Sicily
2525498	Bronte	Italy	Sicily
2525560	Biancavilla	Italy	Sicily
2525571	Belpasso	Italy	Sicily
2525597	Barcellona Pozzo di Gotto	Italy	Sicily
2525628	Bagheria	Italy	Sicily
2525643	Avola	Italy	Sicily
2525646	Augusta	Italy	Sicily
2525655	Assemini	Italy	Sardinia
2525725	Amato	Italy	Calabria
2525755	Alcamo	Italy	Sicily
2525764	Agrigento	Italy	Sicily
2525790	Acireale	Italy	Sicily
2525791	Aci Catena	Italy	Sicily
3163853	Zola Predosa	Italy	Emilia-Romagna
3163995	Voghera	Italy	Lombardy
3164028	Vittorio Veneto	Italy	Veneto
3164039	Viterbo	Italy	Latium
3164080	Vimodrone	Italy	Lombardy
3164083	Vimercate	Italy	Lombardy
3164090	Lancenigo-Villorba	Italy	Veneto
3164153	Villaricca	Italy	Campania
3164241	Villafranca di Verona	Italy	Veneto
3164342	Vignola	Italy	Emilia-Romagna
3164376	Vigevano	Italy	Lombardy
3164419	Vicenza	Italy	Veneto
3164433	Viareggio	Italy	Tuscany
3164527	Verona	Italy	Veneto
3164582	Ventimiglia	Italy	Liguria
3164603	Venice	Italy	Veneto
3164617	Venaria Reale	Italy	Piedmont
3164630	Velletri	Italy	Latium
3164672	Vasto	Italy	Abruzzo
3164699	Varese	Italy	Lombardy
3164919	Valenzano	Italy	Apulia
3164920	Valenza	Italy	Piedmont
3164954	Valdagno	Italy	Veneto
3165072	Udine	Italy	Friuli Venezia Giulia
3165178	Triggiano	Italy	Apulia
3165185	Trieste	Italy	Friuli Venezia Giulia
3165201	Treviso	Italy	Veneto
3165207	Treviglio	Italy	Lombardy
3165240	Trentola-Ducenta	Italy	Campania
3165243	Trento	Italy	Trentino-Alto Adige
3165275	Trecate	Italy	Piedmont
3165322	Trani	Italy	Apulia
3165340	Tradate	Italy	Lombardy
3165370	Tortona	Italy	Piedmont
3165435	Torremaggiore	Italy	Apulia
3165456	Torre del Greco	Italy	Campania
3165475	Torre Annunziata	Italy	Campania
3165524	Turin	Italy	Piedmont
3165595	Tolentino	Italy	The Marches
3165624	Tivoli	Italy	Latium
3165698	Thiene	Italy	Veneto
3165737	Terzigno	Italy	Campania
3165762	Terracina	Italy	Latium
3165771	Terni	Italy	Umbria
3165773	Termoli	Italy	Molise
3165788	Terlizzi	Italy	Apulia
3165926	Taranto	Italy	Apulia
3166006	Suzzara	Italy	Lombardy
3166034	Sulmona	Italy	Abruzzo
3166236	Spoleto	Italy	Umbria
3166387	Sora	Italy	Latium
3166397	Sondrio	Italy	Lombardy
3166404	Somma Vesuviana	Italy	Campania
3166548	Siena	Italy	Tuscany
3166571	Sezze	Italy	Latium
3166574	Seveso	Italy	Lombardy
3166576	Settimo Torinese	Italy	Piedmont
3166595	Sestri Levante	Italy	Liguria
3166601	Sesto Fiorentino	Italy	Tuscany
3166706	Seriate	Italy	Lombardy
2525769	Adrano	Italy	Sicily
3166740	Senigallia	Italy	The Marches
3166753	Senago	Italy	Lombardy
3166808	Segrate	Italy	Lombardy
3166917	Schio	Italy	Veneto
3167010	Scafati	Italy	Campania
3167022	Savona	Italy	Liguria
3167034	Savigliano	Italy	Piedmont
3167044	Sava	Italy	Apulia
3167053	Sassuolo	Italy	Emilia-Romagna
3167096	Sassari	Italy	Sardinia
3167104	Sarzana	Italy	Liguria
3167113	Saronno	Italy	Lombardy
3167116	Sarno	Italy	Campania
3167184	San Vito dei Normanni	Italy	Apulia
3167327	Santeramo in Colle	Italy	Apulia
3167393	Sant'Antonio Abate	Italy	Campania
3167419	Sant'Antimo	Italy	Campania
3167561	Santa Maria Capua Vetere	Italy	Campania
3167731	San Severo	Italy	Apulia
3167744	San Sebastiano	Italy	Lombardy
3167751	San Salvo	Italy	Abruzzo
3167777	San Remo	Italy	Liguria
3167940	Sannicandro Garganico	Italy	Apulia
3167953	San Miniato	Italy	Tuscany
3167954	San Miniato Basso	Italy	Tuscany
3167978	San Mauro Torinese	Italy	Piedmont
3168175	San Lazzaro	Italy	Emilia-Romagna
3168209	San Giuseppe Vesuviano	Italy	Campania
3168222	San Giuliano Milanese	Italy	Lombardy
3168231	San Giovanni Valdarno	Italy	Tuscany
3168234	San Giovanni Rotondo	Italy	Apulia
3168236	San Giovanni Lupatoto	Italy	Veneto
3168309	San Giorgio a Cremano	Italy	Campania
3168414	San Donato Milanese	Italy	Lombardy
3168429	San Donà di Piave	Italy	Veneto
3168514	San Bonifacio	Italy	Veneto
3168550	San Benedetto del Tronto	Italy	The Marches
3168627	Salsomaggiore Terme	Italy	Emilia-Romagna
3168673	Salerno	Italy	Campania
3168730	Sacile	Italy	Friuli Venezia Giulia
3168770	Ruvo di Puglia	Italy	Apulia
3168775	Rutigliano	Italy	Apulia
3168837	Rozzano	Italy	Lombardy
3168843	Rovigo	Italy	Veneto
3168854	Rovereto	Italy	Trentino-Alto Adige
3168930	Rosignano Solvay-Castiglioncello	Italy	Tuscany
3168936	Roseto degli Abruzzi	Italy	Abruzzo
3169056	Romano di Lombardia	Italy	Lombardy
3169070	Rome	Italy	Latium
3169181	Rocca di Papa	Italy	Latium
3169231	Rivoli	Italy	Piedmont
3169361	Rimini	Italy	Emilia-Romagna
3169412	Rieti	Italy	Latium
3169447	Rho	Italy	Lombardy
3169522	Reggio nell'Emilia	Italy	Emilia-Romagna
3169561	Ravenna	Italy	Emilia-Romagna
3169602	Rapallo	Italy	Liguria
3169724	Qualiano	Italy	Campania
3169742	Putignano	Italy	Apulia
3169921	Prato	Italy	Tuscany
3169984	Pozzuoli	Italy	Campania
3170027	Potenza	Italy	Basilicate
3170069	Porto Torres	Italy	Sardinia
3170072	Porto Sant'Elpidio	Italy	The Marches
3170073	Porto San Giorgio	Italy	The Marches
3170086	Portogruaro	Italy	Veneto
3170102	Civitanova Marche	Italy	The Marches
3170116	Portici	Italy	Campania
3170272	Pontedera	Italy	Tuscany
3170335	Pompei	Italy	Campania
3170341	Pomigliano d'Arco	Italy	Campania
3170342	Pomezia	Italy	Latium
3170457	Poggiomarino	Italy	Campania
3170504	Poggibonsi	Italy	Tuscany
3170621	Pistoia	Italy	Tuscany
3170647	Pisa	Italy	Tuscany
3170659	Piossasco	Italy	Piedmont
3170674	Piombino	Italy	Tuscany
3170676	Pioltello	Italy	Lombardy
3170694	Pinerolo	Italy	Piedmont
3170778	Pietrasanta	Italy	Tuscany
3171058	Piacenza	Italy	Emilia-Romagna
3171168	Pescara	Italy	Abruzzo
3171173	Pesaro	Italy	The Marches
3171180	Perugia	Italy	Umbria
3171366	Pavia	Italy	Lombardy
3171457	Parma	Italy	Emilia-Romagna
3171484	Parabiago	Italy	Lombardy
3171586	Palazzolo sull'Oglio	Italy	Lombardy
3171664	Palagiano	Italy	Apulia
3171703	Pagani	Italy	Campania
3171728	Padova	Italy	Veneto
3171737	Paderno Dugnano	Italy	Lombardy
3171778	Ottaviano	Italy	Campania
3171786	Ostuni	Italy	Apulia
3171848	Osimo	Italy	The Marches
3171900	Orta Nova	Italy	Apulia
3171986	Orbassano	Italy	Piedmont
3172087	Olbia	Italy	Sardinia
3172116	Oderzo	Italy	Veneto
3172154	Nuoro	Italy	Sardinia
3172170	Novi Ligure	Italy	Piedmont
3172189	Novara	Italy	Piedmont
3172191	Nova Milanese	Italy	Lombardy
3172227	Nola	Italy	Campania
3172228	Noicattaro	Italy	Apulia
3172240	Noci	Italy	Apulia
3172243	Nocera Superiore	Italy	Campania
3172244	Nocera Inferiore	Italy	Campania
3172269	Nichelino	Italy	Piedmont
3172287	Nettuno	Italy	Latium
3172297	Nerviano	Italy	Lombardy
3172379	Nardò	Italy	Apulia
3172394	Napoli	Italy	Campania
3172472	Mugnano di Napoli	Italy	Campania
3172479	Muggiò	Italy	Lombardy
3172629	Monza	Italy	Lombardy
3172681	Montichiari	Italy	Lombardy
3172729	Montesilvano Marina	Italy	Abruzzo
3172768	Monterotondo	Italy	Latium
3172828	Montemurlo	Italy	Tuscany
3172996	Montecatini-Terme	Italy	Tuscany
3173029	Montebelluna	Italy	Veneto
3173131	Monopoli	Italy	Apulia
3173153	Monfalcone	Italy	Friuli Venezia Giulia
3173160	Mondragone	Italy	Campania
3173162	Mondovì	Italy	Piedmont
3173180	Moncalieri	Italy	Piedmont
3173287	Molfetta	Italy	Apulia
3173302	Mola di Bari	Italy	Apulia
3173326	Modugno	Italy	Apulia
3173331	Modena	Italy	Emilia-Romagna
3173369	Mirano	Italy	Veneto
3173370	Mirandola	Italy	Emilia-Romagna
3173385	Mira Taglio	Italy	Veneto
3173391	Minturno	Italy	Latium
3173435	Milano	Italy	Lombardy
3173529	Mestre	Italy	Veneto
3173537	Mesagne	Italy	Apulia
3173577	Merano	Italy	Trentino-Alto Adige
3173582	Mentana	Italy	Latium
3173599	Melzo	Italy	Lombardy
3173614	Melito di Napoli	Italy	Campania
3173631	Melegnano	Italy	Lombardy
3173671	Meda	Italy	Lombardy
3173721	Matera	Italy	Basilicate
3173762	Massafra	Italy	Apulia
3173775	Massa	Italy	Tuscany
3173914	Marino	Italy	Latium
3173935	Marina di Carrara	Italy	Tuscany
3173945	Marigliano	Italy	Campania
3173949	Mariano Comense	Italy	Lombardy
3173995	Marcianise	Italy	Campania
3174021	Marano di Napoli	Italy	Campania
3174051	Mantova	Italy	Lombardy
3174092	Manfredonia	Italy	Apulia
3174096	Manduria	Italy	Apulia
3174141	Malnate	Italy	Lombardy
3174295	Magenta	Italy	Lombardy
3174358	Maddaloni	Italy	Campania
3174380	Macerata	Italy	The Marches
3174526	Lucera	Italy	Apulia
3174530	Lucca	Italy	Tuscany
3174638	Lodi	Italy	Lombardy
3174659	Livorno	Italy	Tuscany
3174679	Lissone	Italy	Lombardy
3174719	Limbiate	Italy	Lombardy
3174741	Lido di Ostia	Italy	Latium
3174748	Lido	Italy	Veneto
3174921	Legnano	Italy	Lombardy
3174922	Legnago	Italy	Veneto
3174945	Lecco	Italy	Lombardy
3174953	Lecce	Italy	Apulia
3175058	Latina	Italy	Latium
3175081	La Spezia	Italy	Liguria
3175173	Lanciano	Italy	Abruzzo
3175238	Lainate	Italy	Lombardy
3175298	Ladispoli	Italy	Latium
3175384	Ivrea	Italy	Piedmont
3175445	Isernia	Italy	Molise
3175453	Ischia Porto	Italy	Campania
3175458	Ischia	Italy	Campania
3175500	Pallanza-Intra-Suna	Italy	Piedmont
3175532	Imperia	Italy	Liguria
3175537	Imola	Italy	Emilia-Romagna
3175628	Jesi	Italy	The Marches
3175678	Guidonia	Italy	Latium
3175743	Grumo Nevano	Italy	Campania
3175755	Grugliasco	Italy	Piedmont
3175775	Grottaferrata	Italy	Latium
3175786	Grosseto	Italy	Tuscany
3175860	Gravina in Puglia	Italy	Apulia
3175952	Gragnano	Italy	Campania
3175986	Gorizia	Italy	Friuli Venezia Giulia
3175990	Gorgonzola	Italy	Lombardy
3176041	Giussano	Italy	Lombardy
3176053	Giulianova	Italy	Abruzzo
3176059	Giugliano in Campania	Italy	Campania
3176072	Giovinazzo	Italy	Apulia
3176090	Gioia del Colle	Italy	Apulia
3176097	Ginosa	Italy	Apulia
3176177	Ghedi	Italy	Lombardy
3176219	Genoa	Italy	Liguria
3176322	Garbagnate Milanese	Italy	Lombardy
3176366	Gallipoli	Italy	Apulia
3176391	Gallarate	Italy	Lombardy
3176407	Galatina	Italy	Apulia
3176438	Gaeta	Italy	Latium
3176515	Frosinone	Italy	Latium
3176560	Frattaminore	Italy	Campania
3176561	Frattamaggiore	Italy	Campania
3176589	Frascati	Italy	Latium
3176603	Francavilla Fontana	Italy	Apulia
3176605	Francavilla al Mare	Italy	Abruzzo
3176639	Fossano	Italy	Piedmont
3176722	Fornacelle	Italy	Tuscany
3176733	Formigine	Italy	Emilia-Romagna
3176738	Formia	Italy	Latium
3176746	Forlì	Italy	Emilia-Romagna
3176843	Fondi	Italy	Latium
3176849	Follonica	Italy	Tuscany
3176854	Foligno	Italy	Umbria
3176885	Foggia	Italy	Apulia
3176923	Fiumicino-Isola Sacra	Italy	Latium
3176959	Florence	Italy	Tuscany
3176970	Fiorano	Italy	Emilia-Romagna
3177029	Fidenza	Italy	Emilia-Romagna
3177090	Ferrara	Italy	Emilia-Romagna
3177099	Fermo	Italy	The Marches
3177171	Fasano	Italy	Apulia
3177219	Fano	Italy	The Marches
3177300	Faenza	Italy	Emilia-Romagna
3177315	Fabriano	Italy	The Marches
3177363	Ercolano	Italy	Campania
3177372	Erba	Italy	Lombardy
3177400	Empoli	Italy	Tuscany
3177438	Eboli	Italy	Campania
3177532	Domodossola	Italy	Piedmont
3177608	Desio	Italy	Lombardy
3177610	Desenzano del Garda	Italy	Lombardy
3177650	Dalmine	Italy	Lombardy
3177664	Cusano Milanino	Italy	Lombardy
3177700	Cuneo	Italy	Piedmont
3177838	Cremona	Italy	Lombardy
3177841	Crema	Italy	Lombardy
3178004	Corsico	Italy	Lombardy
3178074	Cornaredo	Italy	Lombardy
3178087	Cormano	Italy	Lombardy
3178112	Cordenons	Italy	Friuli Venezia Giulia
3178131	Corato	Italy	Apulia
3178141	Copertino	Italy	Apulia
3178147	Conversano	Italy	Apulia
3178197	Conegliano	Italy	Veneto
3178229	Como	Italy	Lombardy
3178283	Cologno Monzese	Italy	Lombardy
3178388	Collegno	Italy	Piedmont
3178398	Colleferro	Italy	Latium
3178402	Colle di Val d'Elsa	Italy	Tuscany
3178587	Civitavecchia	Italy	Latium
3178619	Città di Castello	Italy	Umbria
3178650	Ciriè	Italy	Piedmont
3178671	Cinisello Balsamo	Italy	Lombardy
3178738	Ciampino	Italy	Latium
3178745	Chivasso	Italy	Piedmont
3178784	Chioggia	Italy	Veneto
3178796	Chieti	Italy	Abruzzo
3178818	Chieri	Italy	Piedmont
3178832	Chiavari	Italy	Liguria
3178850	Chiari	Italy	Lombardy
3178956	Cesenatico	Italy	Emilia-Romagna
3178957	Cesena	Italy	Emilia-Romagna
3178972	Cesano Maderno	Italy	Lombardy
3178998	Cervia	Italy	Emilia-Romagna
3178999	Cerveteri	Italy	Latium
3179075	Cerignola	Italy	Apulia
3179109	Cercola	Italy	Campania
3179162	Cento	Italy	Emilia-Romagna
3179218	Ceglie Messapica	Italy	Apulia
3179235	Cecina	Italy	Tuscany
3179337	Cava Dè Tirreni	Italy	Campania
3179347	Cattolica	Italy	Emilia-Romagna
3179415	Castiglione delle Stiviere	Italy	Lombardy
3179443	Castel Volturno	Italy	Campania
3179560	Castel Maggiore	Italy	Emilia-Romagna
3179661	Castellammare di Stabia	Italy	Campania
3179684	Castelfranco Veneto	Italy	Veneto
3179686	Castelfranco Emilia	Italy	Emilia-Romagna
3179781	Cassino	Italy	Latium
3179795	Cassano d'Adda	Italy	Lombardy
3179806	Casoria	Italy	Campania
3179866	Caserta	Italy	Campania
3179977	Cascina	Italy	Tuscany
3180133	Casamassima	Italy	Apulia
3180172	Casalnuovo di Napoli	Italy	Campania
3180224	Casalecchio di Reno	Italy	Emilia-Romagna
3180240	Casal di Principe	Italy	Campania
3180423	Carrara	Italy	Tuscany
3180445	Carpi Centro	Italy	Emilia-Romagna
3180496	Carmagnola	Italy	Piedmont
3180541	Cardito	Italy	Campania
3180581	Carate Brianza	Italy	Lombardy
3180601	Capua	Italy	Campania
3180733	Capannori	Italy	Tuscany
3180758	Cantù	Italy	Lombardy
3180792	Canosa di Puglia	Italy	Apulia
3180991	Campobasso	Italy	Molise
3181018	Campi Bisenzio	Italy	Tuscany
3181125	Camaiore	Italy	Tuscany
3181258	Caivano	Italy	Campania
3181355	Busto Arsizio	Italy	Lombardy
3181359	Bussolengo	Italy	Veneto
3181471	Brusciano	Italy	Campania
3181528	Brindisi	Italy	Apulia
3181548	Bresso	Italy	Lombardy
3181550	Bressanone	Italy	Trentino-Alto Adige
3181554	Brescia	Italy	Lombardy
3181631	Bra	Italy	Piedmont
3181641	Bovisio-Masciago	Italy	Lombardy
3181683	Boscoreale	Italy	Campania
3181790	Borgomanero	Italy	Piedmont
3181913	Bolzano	Italy	Trentino-Alto Adige
3181928	Bologna	Italy	Emilia-Romagna
3181931	Bollate	Italy	Lombardy
3181995	Bitonto	Italy	Apulia
3182007	Bisceglie	Italy	Apulia
3182043	Biella	Italy	Piedmont
3182179	Benevento	Italy	Campania
3182210	Belluno	Italy	Veneto
3182272	Battipaglia	Italy	Campania
3182289	Bastia umbra	Italy	Umbria
3182297	Bassano del Grappa	Italy	Veneto
3182340	Barletta	Italy	Apulia
3182351	Bari	Italy	Apulia
3182361	Bareggio	Italy	Lombardy
3182518	Bagnoli	Italy	Campania
3182599	Bacoli	Italy	Campania
3182636	Avezzano	Italy	Abruzzo
3182640	Aversa	Italy	Campania
3182650	Avellino	Italy	Campania
3182714	Asti	Italy	Piedmont
3182757	Arzignano	Italy	Veneto
3182765	Arzano	Italy	Campania
3182851	Ariccia	Italy	Latium
3182884	Arezzo	Italy	Tuscany
3182886	Arese	Italy	Lombardy
3182897	Ardea	Italy	Latium
3182904	Arcore	Italy	Lombardy
3182957	Aprilia	Italy	Latium
3182997	Aosta	Italy	Aosta Valley
3183005	Anzio	Italy	Latium
3183063	Angri	Italy	Campania
3183072	Andria	Italy	Apulia
3183089	Ancona	Italy	The Marches
3183178	Altamura	Italy	Apulia
3183187	Alpignano	Italy	Piedmont
3183284	Alghero	Italy	Sardinia
3183319	Albignasego	Italy	Veneto
3183343	Albenga	Italy	Liguria
3183356	Albano Laziale	Italy	Latium
3183364	Alba	Italy	Piedmont
3183412	Agropoli	Italy	Campania
3183455	Afragola	Italy	Campania
3183472	Adelfia	Italy	Apulia
3183490	Acqui Terme	Italy	Piedmont
3183494	Acquaviva delle Fonti	Italy	Apulia
3183541	Acerra	Italy	Campania
3183573	Abbiategrasso	Italy	Lombardy
3219114	Spinea-Orgnano	Italy	Veneto
6457398	Verbania	Italy	Piedmont
6534216	Lumezzane	Italy	Lombardy
6534232	Lamezia Terme	Italy	Calabria
6534234	Caronno Pertusella	Italy	Lombardy
6534235	Cassano Magnago	Italy	Lombardy
6534252	San Felice A Cancello	Italy	Campania
6534253	San Nicola la Strada	Italy	Campania
6534256	Quarto	Italy	Campania
6534264	Orta di Atella	Italy	Campania
6534267	Casavatore	Italy	Campania
6534268	Volla	Italy	Campania
6534275	Gravina di Catania	Italy	Sicily
6534280	Cesano Boscone	Italy	Lombardy
6534284	Tor Lupara	Italy	Latium
6620312	Torvaianica	Italy	Latium
8378910	Villanova	Italy	Latium
8394392	Marina di Ardea-Tor San Lorenzo	Italy	Latium
8948703	San Paolo	Italy	Apulia
8948704	Monterusciello	Italy	Campania
8948705	Romano Banco	Italy	Lombardy
8948706	Casa Santa	Italy	Sicily
8948708	Arpino	Italy	Campania
8948709	Paolo VI	Italy	Apulia
9003711	Corigliano Scalo	Italy	Calabria
3042091	Saint Helier	Jersey	St Helier
3488465	Spanish Town	Jamaica	Saint Catherine
3488613	Savanna-la-Mar	Jamaica	Westmoreland
3488981	Portmore	Jamaica	Saint Catherine
3489227	Old Harbour	Jamaica	Saint Catherine
3489297	New Kingston	Jamaica	Saint Andrew
3489460	Montego Bay	Jamaica	Saint James
3489523	May Pen	Jamaica	Clarendon
3489577	Mandeville	Jamaica	Manchester
3489760	Linstead	Jamaica	Saint Catherine
3489854	Kingston	Jamaica	Kingston
246013	Wādī as Sīr	Jordan	Amman
246314	Umm as Summāq	Jordan	Amman
247105	Saḩāb	Jordan	Amman
248370	Mādabā	Jordan	Madaba
248382	Ma'an	Jordan	Ma’an
248414	Kurayyimah	Jordan	Irbid
248803	Judita	Jordan	Irbid
248875	Jarash	Jordan	Jerash
248923	‘Izrā	Jordan	Karak
248946	Irbid	Jordan	Irbid
250090	Zarqa	Jordan	Zarqa
250152	Aydūn	Jordan	Irbid
250198	Aţ Ţafīlah	Jordan	Tafielah
250258	As Salţ	Jordan	Balqa
250267	Safi	Jordan	Karak
250336	Ar Ramthā	Jordan	Irbid
250420	‘Anjarah	Jordan	Ajlun
250441	Amman	Jordan	Amman
250582	Mafraq	Jordan	Mafraq
250624	Qīr Moāv	Jordan	Ma’an
250637	Al Jubayhah	Jordan	Amman
250774	Aqaba	Jordan	Aqaba
250799	‘Ajlūn	Jordan	Ajlun
6946409	Karak City	Jordan	Karak
7838895	Russeifa	Jordan	Zarqa
1847947	Shingū	Japan	Wakayama
1847963	Atsugi	Japan	Kanagawa
1847966	Akashi	Japan	Hyōgo
1847968	Zushi	Japan	Kanagawa
1848004	Zama	Japan	Kanagawa
1848016	Yuza	Japan	Yamagata
1848055	Gero	Japan	Gifu
1848096	Yūki	Japan	Ibaraki
1848113	Yugawara	Japan	Kanagawa
1848188	Yoshikawa	Japan	Saitama
1848194	Yoshii	Japan	Gunma
1848210	Yoshida-kasugachō	Japan	Niigata
1848243	Yorii	Japan	Saitama
1848254	Yono	Japan	Saitama
1848277	Yonago	Japan	Tottori
1848313	Yokosuka	Japan	Kanagawa
1848354	Yokohama	Japan	Kanagawa
1848373	Yokkaichi	Japan	Mie
1848439	Yawata	Japan	Kyoto
1848445	Yatsushiro	Japan	Kumamoto
1848447	Yatsuomachi-higashikumisaka	Japan	Toyama
1848482	Yasugichō	Japan	Shimane
1848498	Yashiro	Japan	Hyōgo
1848499	Yashio-shi	Japan	Saitama
1848522	Yao	Japan	Ōsaka
1848550	Yanai	Japan	Yamaguchi
1848573	Yanagawa	Japan	Fukuoka
1848633	Yamazakichō-nakabirose	Japan	Hyōgo
1848689	Yamaguchi	Japan	Yamaguchi
1848705	Yamaga	Japan	Kumamoto
1848774	Yaizu	Japan	Shizuoka
1848776	Yaita	Japan	Tochigi
1848933	Wakimachi	Japan	Tokushima
1849053	Utsunomiya	Japan	Tochigi
1849069	Uto	Japan	Kumamoto
1849094	Usuki	Japan	Oita
1849183	Ureshinomachi-shimojuku	Japan	Saga Prefecture
1849186	Urayasu	Japan	Tokyo
1849237	Uozu	Japan	Toyama
1849299	Umi	Japan	Fukuoka
1849367	Ujiie	Japan	Tochigi
1849372	Uji	Japan	Kyoto
1849407	Uenohara	Japan	Yamanashi
1849414	Ueno-ebisumachi	Japan	Mie
1849424	Ueki	Japan	Kumamoto
1849429	Ueda	Japan	Nagano
1849498	Ube	Japan	Yamaguchi
1849519	Tsuyama	Japan	Okayama
1849539	Tsushima	Japan	Aichi
1849561	Tsurusaki	Japan	Oita
1849584	Tsurugi-asahimachi	Japan	Ishikawa
1849592	Tsuruga	Japan	Fukui
1849647	Tsuma	Japan	Miyazaki
1849661	Tsukumiura	Japan	Oita
1849706	Tsukawaki	Japan	Oita
1849782	Tsubata	Japan	Ishikawa
1849788	Tsubame	Japan	Niigata
1849796	Tsu	Japan	Mie
1849814	Toyota	Japan	Aichi
1849817	Toyoshina	Japan	Nagano
1849831	Toyooka	Japan	Hyōgo
1849837	Toyonaka	Japan	Ōsaka
1849845	Toyokawa	Japan	Aichi
1849846	Toyohashi	Japan	Aichi
1849892	Tottori	Japan	Tottori
1849904	Tosu	Japan	Saga Prefecture
1850004	Tonoshō	Japan	Kagawa
1850091	Tomioka	Japan	Gunma
1850108	Tomigusuku	Japan	Okinawa
1850147	Tokyo	Japan	Tokyo
1850152	Tokuyama	Japan	Yamaguchi
1850158	Tokushima	Japan	Tokushima
1850181	Tokorozawa	Japan	Saitama
1850185	Tokoname	Japan	Aichi
1850207	Toki	Japan	Gifu
1850217	Tōkamachi	Japan	Niigata
1850269	Togitsu	Japan	Nagasaki
1850307	Tochio-honchō	Japan	Niigata
1850311	Tochigi	Japan	Tochigi
1850345	Toba	Japan	Mie
1850396	Tenri	Japan	Nara
1850405	Tennō	Japan	Akita
1850472	Tawaramoto	Japan	Nara
1850499	Tatsunochō-tominaga	Japan	Hyōgo
1850523	Tateyama	Japan	Chiba
1850559	Tatebayashi	Japan	Gunma
1850589	Tarumizu	Japan	Kagoshima
1850600	Tarui	Japan	Gifu
1850627	Tanushimarumachi-toyoki	Japan	Fukuoka
1850630	Tanuma	Japan	Tochigi
1850692	Nishi-Tokyo-shi	Japan	Tokyo
1850693	Tanashichō	Japan	Tokyo
1850707	Tanabe	Japan	Kyoto
1850708	Tanabe	Japan	Wakayama
1850742	Tamano	Japan	Okayama
1850745	Tamana	Japan	Kumamoto
1850746	Tamamura	Japan	Gunma
1850834	Takeochō-takeo	Japan	Saga Prefecture
1850860	Takehara	Japan	Hiroshima
1850872	Takefu	Japan	Fukui
1850878	Takedamachi	Japan	Oita
1850892	Takayama	Japan	Gifu
1850910	Takatsuki	Japan	Ōsaka
1851002	Takasaki	Japan	Gunma
1851012	Takarazuka	Japan	Hyōgo
1851032	Takaoka	Japan	Toyama
1851068	Takanabe	Japan	Miyazaki
1851100	Takamatsu	Japan	Kagawa
1851125	Takaishi	Japan	Ōsaka
1851137	Takahashi	Japan	Okayama
1851155	Takahama	Japan	Aichi
1851193	Tajimi	Japan	Gifu
1851259	Tahara	Japan	Aichi
1851273	Tagawa	Japan	Fukuoka
1851282	Tadotsu	Japan	Kagawa
1851348	Suzuka	Japan	Mie
1851357	Suzaka	Japan	Nagano
1851368	Suwa	Japan	Nagano
1851390	Susaki	Japan	Kochi
1851426	Sumoto	Japan	Hyōgo
1851462	Sukumo	Japan	Kochi
1851483	Suita	Japan	Ōsaka
1851494	Suibara	Japan	Niigata
1851504	Sugito	Japan	Saitama
1851604	Sōka	Japan	Saitama
1851606	Sōja	Japan	Okayama
1851622	Sobue	Japan	Aichi
1851711	Shōbu	Japan	Saitama
1851713	Shōbara	Japan	Hiroshima
1851717	Shizuoka	Japan	Shizuoka
1851813	Shirone	Japan	Niigata
1851883	Shiraoka	Japan	Saitama
1851935	Shirahamachō-usazakiminami	Japan	Hyōgo
1851952	Shiozawa	Japan	Niigata
1852003	Shiojiri	Japan	Nagano
1852046	Shinshiro	Japan	Aichi
1852102	Shin’ichi	Japan	Hiroshima
1852109	Shingū	Japan	Fukuoka
1852225	Shimonoseki	Japan	Yamaguchi
1852347	Shimodate	Japan	Ibaraki
1852357	Shimoda	Japan	Shizuoka
1852383	Minato	Japan	Wakayama
1852472	Shimada	Japan	Shizuoka
1852479	Shimabara	Japan	Nagasaki
1852502	Shiki	Japan	Saitama
1852561	Shido	Japan	Kagawa
1852588	Shibushi	Japan	Kagoshima
1852595	Shibukawa	Japan	Gunma
1852607	Shibata	Japan	Niigata
1852663	Seto	Japan	Aichi
1852673	Setakamachi-takayanagi	Japan	Fukuoka
1852736	Satsumasendai	Japan	Kagoshima
1852849	Satte	Japan	Saitama
1852899	Sasebo	Japan	Nagasaki
1852901	Sasayama	Japan	Hyōgo
1852915	Sasaguri	Japan	Fukuoka
1852964	Sano	Japan	Tochigi
1852984	Sanjō	Japan	Niigata
1853008	Sandachō	Japan	Hyōgo
1853066	Sakurai	Japan	Nara
1853081	Saku	Japan	Nagano
1853174	Sakaiminato	Japan	Shimane
1853190	Sakaidechō	Japan	Kagawa
1853192	Sakai-nakajima	Japan	Gunma
1853193	Sakai	Japan	Ibaraki
1853195	Sakai	Japan	Ōsaka
1853209	Sakado	Japan	Saitama
1853237	Saiki	Japan	Oita
1853280	Sagara	Japan	Shizuoka
1853303	Saga	Japan	Saga Prefecture
1853338	Sabae	Japan	Fukui
1853354	Ryūō	Japan	Yamanashi
1853433	Ōzu	Japan	Kumamoto
1853483	Oyama	Japan	Tochigi
1853486	Ōyama	Japan	Shizuoka
1853514	Owase	Japan	Mie
1853564	Ōtsuki	Japan	Yamanashi
1853574	Ōtsu	Japan	Shiga Prefecture
1853662	Ōtake	Japan	Yamaguchi
1853677	Ōta	Japan	Gunma
1853909	Osaka	Japan	Ōsaka
1853992	Onomichi	Japan	Hiroshima
1854018	Onoda	Japan	Yamaguchi
1854022	Ono	Japan	Fukui
1854026	Ono	Japan	Hyōgo
1854028	Ōno-hara	Japan	Hiroshima
1854083	Ōmuta	Japan	Fukuoka
1854093	Ōmura	Japan	Nagasaki
1854162	Ōme	Japan	Tokyo
1854186	Ōmachi	Japan	Nagano
1854246	Ōkuchi-shinohara	Japan	Kagoshima
1854371	Okegawa	Japan	Saitama
1854376	Okazaki	Japan	Aichi
1854384	Okaya	Japan	Nagano
1854405	Ōkawa	Japan	Saga Prefecture
1854444	Ojiya	Japan	Niigata
1854487	Ōita	Japan	Oita
1854492	Ōiso	Japan	Kanagawa
1854530	Ōi	Japan	Saitama
1854629	Ogōri-shimogō	Japan	Yamaguchi
1854665	Ogawa	Japan	Saitama
1854703	Ōgaki	Japan	Gifu
1854747	Odawara	Japan	Kanagawa
1854774	Ōdachō-ōda	Japan	Shimane
1854803	Ōbu	Japan	Aichi
1854849	Obama	Japan	Fukui
1854868	Nyūzen	Japan	Toyama
1854902	Numazu	Japan	Shizuoka
1854905	Numata	Japan	Gunma
1854979	Nonoichi	Japan	Ishikawa
1855066	Nōgata	Japan	Fukuoka
1855078	Noda	Japan	Chiba
1855095	Nobeoka	Japan	Miyazaki
1855134	Nishiwaki	Japan	Hyōgo
1855189	Nishio	Japan	Aichi
1855203	Nishinoomote	Japan	Kagoshima
1855363	Nirasaki	Japan	Yamanashi
1855380	Ninomiya	Japan	Kanagawa
1855395	Nikkō	Japan	Tochigi
1855410	Niitsu-honchō	Japan	Niigata
1855416	Niimi	Japan	Okayama
1855425	Niihama	Japan	Ehime
1855431	Niigata	Japan	Niigata
1855476	Nichinan	Japan	Miyazaki
1855540	Naze	Japan	Kagoshima
1855580	Narutochō-mitsuishi	Japan	Tokushima
1855612	Nara-shi	Japan	Nara
1855670	Nanao	Japan	Ishikawa
1855694	Namerikawa	Japan	Toyama
1855753	Nakatsugawa	Japan	Gifu
1855757	Nakatsu	Japan	Fukuoka
1855852	Nakanojōmachi	Japan	Gunma
1855863	Nakano	Japan	Nagano
1855891	Nakamura	Japan	Kochi
1856035	Naha	Japan	Okinawa
1856057	Nagoya	Japan	Aichi
1856068	Nago	Japan	Okinawa
1856177	Nagasaki	Japan	Nagasaki
1856184	Nagareyama	Japan	Chiba
1856199	Nagaoka	Japan	Niigata
1856215	Nagano	Japan	Nagano
1856243	Nagahama	Japan	Shiga Prefecture
1856293	Nabari	Japan	Mie
1856367	Musashino	Japan	Tokyo
1856392	Muroto-misakicho	Japan	Kochi
1856426	Muramatsu	Japan	Niigata
1856434	Murakami	Japan	Niigata
1856456	Mukō	Japan	Kyoto
1856560	Morohongō	Japan	Saitama
1856569	Moriyama	Japan	Shiga Prefecture
1856584	Moriguchi	Japan	Ōsaka
1856586	Mori	Japan	Shizuoka
1856667	Mizunami	Japan	Gifu
1856698	Miyoshi	Japan	Hiroshima
1856703	Miyazu	Japan	Kyoto
1856717	Miyazaki	Japan	Miyazaki
1856775	Miyakonojō	Japan	Miyazaki
1856828	Miyata	Japan	Fukuoka
1856878	Mitsuke	Japan	Niigata
1856881	Mitsukaidō	Japan	Ibaraki
1856938	Mitake	Japan	Gifu
1856942	Mitaka-shi	Japan	Tokyo
1857046	Mino	Japan	Ōsaka
1857062	Mino	Japan	Gifu
1857144	Minamirinkan	Japan	Kanagawa
1857208	Minamata	Japan	Kumamoto
1857209	Minakuchichō-matoba	Japan	Shiga Prefecture
1857260	Mikuni	Japan	Fukui
1857276	Miki	Japan	Hyōgo
1857334	Mihara	Japan	Hiroshima
1857379	Mibu	Japan	Tochigi
1857403	Menuma	Japan	Saitama
1857470	Matsutō	Japan	Ishikawa
1857519	Matsumoto	Japan	Nagano
1857550	Matsue	Japan	Shimane
1857553	Matsudo	Japan	Chiba
1857568	Matsubara	Japan	Ōsaka
1857594	Masuda	Japan	Shimane
1857651	Maruoka	Japan	Fukui
1857659	Kamimaruko	Japan	Nagano
1857665	Marugame	Japan	Kagawa
1857712	Makurazaki	Japan	Kagoshima
1857751	Maki	Japan	Niigata
1857766	Maizuru	Japan	Kyoto
1857843	Maebashi	Japan	Gunma
1857844	Maebaru-chūō	Japan	Fukuoka
1857871	Machida	Japan	Tokyo
1857910	Kyoto	Japan	Kyoto
1858041	Kushikino	Japan	Kagoshima
1858088	Kurume	Japan	Fukuoka
1858249	Kuroda	Japan	Aichi
1858283	Kurihashi	Japan	Saitama
1858296	Kure	Japan	Hiroshima
1858301	Kurayoshi	Japan	Tottori
1858311	Kurashiki	Japan	Okayama
1858421	Kumamoto	Japan	Kumamoto
1858428	Kumagaya	Japan	Saitama
1858445	Kukichūō	Japan	Saitama
1858498	Kudamatsu	Japan	Yamaguchi
1858591	Kozakai-chō	Japan	Aichi
1858729	Koshigaya	Japan	Saitama
1858756	Kosai-shi	Japan	Shizuoka
1858794	Kōnosu	Japan	Saitama
1858836	Kōnan	Japan	Aichi
1858858	Komoro	Japan	Nagano
1858866	Komono	Japan	Mie
1858910	Komatsu	Japan	Ishikawa
1858926	Komaki	Japan	Aichi
1858964	Kokubunji	Japan	Tokyo
1858972	Kokubu-matsuki	Japan	Kagoshima
1859093	Koga	Japan	Ibaraki
1859094	Koga	Japan	Fukuoka
1859100	Kōfu	Japan	Yamanashi
1859113	Kodamachō-kodamaminami	Japan	Saitama
1859146	Kochi	Japan	Kochi
1859171	Kobe	Japan	Hyōgo
1859175	Kobayashi	Japan	Miyazaki
1859234	Kitsuki	Japan	Oita
1859307	Kitakyushu	Japan	Fukuoka
1859319	Kitakata	Japan	Fukushima
1859383	Kishiwada	Japan	Ōsaka
1859393	Kisarazu	Japan	Chiba
1859405	Kiryū	Japan	Gunma
1859492	Kikuchi	Japan	Kumamoto
1859586	Kazo	Japan	Saitama
1859647	Kawasaki	Japan	Fukuoka
1859675	Kawanishi	Japan	Hyōgo
1859730	Kawaguchi	Japan	Saitama
1859740	Kawagoe	Japan	Saitama
1859765	Katsuyama	Japan	Fukui
1859884	Kasukabe	Japan	Saitama
1859891	Kasugai	Japan	Aichi
1859908	Kashiwazaki	Japan	Niigata
1859924	Kashiwa	Japan	Chiba
1859941	Kashima	Japan	Saga Prefecture
1859951	Kashihara-shi	Japan	Nara
1859952	Kashihara	Japan	Ōsaka
1859990	Kasaoka	Japan	Okayama
1859998	Kasamatsuchō	Japan	Gifu
1860034	Kariya	Japan	Aichi
1860063	Karatsu	Japan	Saga Prefecture
1860095	Kanzakimachi-kanzaki	Japan	Saga Prefecture
1860098	Kanuma	Japan	Tochigi
1860112	Kanoya	Japan	Kagoshima
1860122	Kan’onjichō	Japan	Kagawa
1860176	Kannabechō-yahiro	Japan	Hiroshima
1860191	Kanie	Japan	Aichi
1860211	Kanekomachi	Japan	Gunma
1860234	Kanda	Japan	Fukuoka
1860243	Kanazawa	Japan	Ishikawa
1860256	Kanaya	Japan	Shizuoka
1860335	Kamogatachō-kamogata	Japan	Okayama
1860341	Kamo	Japan	Niigata
1860437	Kamirenjaku	Japan	Tokyo
1860458	Kaminokawa	Japan	Tochigi
1860563	Kamiichi	Japan	Toyama
1860626	Kameyama	Japan	Mie
1860635	Kameoka	Japan	Kyoto
1860648	Kameda-honchō	Japan	Niigata
1860672	Kamakura	Japan	Kanagawa
1860704	Kakogawachō-honmachi	Japan	Hyōgo
1860728	Kakegawa	Japan	Shizuoka
1860735	Kakamigahara	Japan	Gifu
1860748	Kashima-shi	Japan	Ibaraki
1860750	Kajiki	Japan	Kagoshima
1860765	Kaizuka	Japan	Ōsaka
1860785	Kainan	Japan	Wakayama
1860827	Kagoshima	Japan	Kagoshima
1860871	Kadoma	Japan	Ōsaka
1861084	Izumo	Japan	Shimane
1861095	Izumiōtsu	Japan	Ōsaka
1861107	Izumi	Japan	Ōsaka
1861108	Izumi	Japan	Kagoshima
1861171	Iwata	Japan	Shizuoka
1861207	Iwakura	Japan	Aichi
1861212	Iwakuni	Japan	Yamaguchi
1861223	Iwai	Japan	Ibaraki
1861244	Iwade	Japan	Wakayama
1861261	Itsukaichi	Japan	Tokyo
1861280	Itoman	Japan	Okinawa
1861285	Itoigawa	Japan	Niigata
1861290	Itō	Japan	Shizuoka
1861310	Itami	Japan	Hyōgo
1861383	Ishiki	Japan	Aichi
1861393	Ishikawa	Japan	Okinawa
1861400	Ishii	Japan	Tokushima
1861406	Ishige	Japan	Ibaraki
1861436	Isesaki	Japan	Gunma
1861449	Isehara	Japan	Kanagawa
1861450	Ise	Japan	Mie
1861454	Isawa	Japan	Yamanashi
1861464	Isahaya	Japan	Nagasaki
1861528	Inuyama	Japan	Gifu
1861584	Ino	Japan	Kochi
1861586	Innoshima	Japan	Hiroshima
1861602	Inazawa	Japan	Aichi
1861641	Ina	Japan	Nagano
1861677	Imarichō-kō	Japan	Saga Prefecture
1861699	Imaichi	Japan	Tochigi
1861749	Ikoma	Japan	Nara
1861795	Ikeda	Japan	Ōsaka
1861825	Ijūin	Japan	Kagoshima
1861835	Iizuka	Japan	Fukuoka
1861838	Iiyama	Japan	Nagano
1861864	Iida	Japan	Nagano
1861949	Ichinomiya	Japan	Aichi
1862010	Ibusuki	Japan	Kagoshima
1862033	Ibaraki	Japan	Ōsaka
1862034	Ibara	Japan	Okayama
1862098	Hotaka	Japan	Nagano
1862198	Honjō	Japan	Saitama
1862230	Hondo	Japan	Kumamoto
1862302	Hōfu	Japan	Yamaguchi
1862352	Hitoyoshi	Japan	Kumamoto
1862373	Hita	Japan	Oita
1862415	Hiroshima	Japan	Hiroshima
1862462	Hiratsuka	Japan	Kanagawa
1862471	Hiratachō	Japan	Shimane
1862505	Hirara	Japan	Okinawa
1862540	Hirakata	Japan	Ōsaka
1862555	Hirado	Japan	Nagasaki
1862599	Hino	Japan	Tokyo
1862601	Hino	Japan	Shiga Prefecture
1862612	Himimachi	Japan	Toyama
1862627	Himeji	Japan	Hyōgo
1862636	Hikone	Japan	Shiga Prefecture
1862689	Hiji	Japan	Oita
1862912	Hekinan	Japan	Aichi
1862992	Hayama	Japan	Kanagawa
1863023	Hatogaya-honchō	Japan	Saitama
1863082	Hashimoto	Japan	Wakayama
1863173	Hanyū	Japan	Saitama
1863183	Hannō	Japan	Saitama
1863209	Handa	Japan	Aichi
1863279	Hamanoichi	Japan	Kagoshima
1863289	Hamamatsu	Japan	Shizuoka
1863293	Hamakita	Japan	Shizuoka
1863310	Hamada	Japan	Shimane
1863341	Hakui	Japan	Ishikawa
1863398	Haibara-akanedai	Japan	Nara
1863418	Hagi	Japan	Yamaguchi
1863431	Hadano	Japan	Kanagawa
1863440	Hachiōji	Japan	Tokyo
1863451	Ōmihachiman	Japan	Shiga Prefecture
1863482	Gyōda	Japan	Saitama
1863495	Gushikawa	Japan	Okinawa
1863521	Gōtsuchō	Japan	Shimane
1863528	Gotenba	Japan	Shizuoka
1863540	Gosen	Japan	Niigata
1863541	Gose	Japan	Nara
1863592	Gojō	Japan	Nara
1863614	Gobō	Japan	Wakayama
1863627	Ginowan	Japan	Okinawa
1863641	Gifu-shi	Japan	Gifu
1863693	Gamagōri	Japan	Aichi
1863713	Futtsu	Japan	Chiba
1863905	Honchō	Japan	Chiba
1863917	Fukuyama	Japan	Hiroshima
1863945	Fukuroi	Japan	Shizuoka
1863953	Fukura	Japan	Hyōgo
1863967	Fukuoka	Japan	Fukuoka
1863978	Nishifukuma	Japan	Fukuoka
1863985	Fukui-shi	Japan	Fukui
1863997	Fukuechō	Japan	Nagasaki
1864009	Fukuchiyama	Japan	Kyoto
1864025	Fukiage-fujimi	Japan	Saitama
1864031	Fukayachō	Japan	Saitama
1864092	Fujisawa	Japan	Kanagawa
1864098	Fujioka	Japan	Tochigi
1864099	Fujioka	Japan	Gunma
1864105	Fujinomiya	Japan	Shizuoka
1864132	Fujieda	Japan	Shizuoka
1864134	Fuji	Japan	Shizuoka
1864155	Fuchūchō	Japan	Hiroshima
1864180	Enzan	Japan	Yamanashi
1864518	Chōfugaoka	Japan	Tokyo
1864549	Chiryū	Japan	Aichi
1864557	Chino	Japan	Nagano
1864572	Chikushino-shi	Japan	Fukuoka
1864624	Chigasaki	Japan	Kanagawa
1864637	Chichibu	Japan	Saitama
1864652	Chatan	Japan	Okinawa
1864750	Beppu	Japan	Oita
1864873	Ayabe	Japan	Kyoto
1864945	Atami	Japan	Shizuoka
1864985	Ashiya	Japan	Hyōgo
1865005	Ashikaga	Japan	Tochigi
1865207	Arai	Japan	Niigata
1865290	Annaka	Japan	Gunma
1865294	Anjō	Japan	Aichi
1865375	Amagi	Japan	Fukuoka
1865387	Amagasaki	Japan	Hyōgo
1865401	Akune	Japan	Kagoshima
1865412	Kariya	Japan	Hyōgo
1865449	Aki	Japan	Kochi
1865661	Aioi	Japan	Hyōgo
1865714	Ageoshimo	Japan	Saitama
1894616	Okinawa	Japan	Okinawa
1895695	Kushima	Japan	Miyazaki
1896348	Hikari	Japan	Yamaguchi
1899102	Nagato	Japan	Yamaguchi
1907123	Hasuda	Japan	Saitama
1907125	Kamifukuoka	Japan	Saitama
1907148	Fussa	Japan	Tokyo
1907299	Asaka	Japan	Saitama
1907300	Wako	Japan	Saitama
1907301	Shimotoda	Japan	Saitama
1907307	Kimitsu	Japan	Chiba
1907309	Miura	Japan	Kanagawa
1926004	Wakayama	Japan	Wakayama
1926006	Iyo	Japan	Ehime
1926020	Uwajima	Japan	Ehime
1926054	Saijō	Japan	Ehime
1926055	Ōzu	Japan	Ehime
1926099	Matsuyama	Japan	Ehime
1926101	Masaki-chō	Japan	Ehime
1926116	Kawanoechō	Japan	Ehime
1926142	Hōjō	Japan	Ehime
2110460	Yuzawa	Japan	Akita
2110498	Yonezawa	Japan	Yamagata
2110506	Yokotemachi	Japan	Akita
2110518	Yōkaichiba	Japan	Chiba
2110538	Yanagawamachi-saiwaichō	Japan	Fukushima
2110541	Yamoto	Japan	Miyagi
2110556	Yamagata	Japan	Yamagata
2110560	Yamada	Japan	Iwate
2110579	Yachimata	Japan	Chiba
2110586	Watari	Japan	Miyagi
2110596	Wakuya	Japan	Miyagi
2110629	Ushiku	Japan	Ibaraki
2110683	Tsukuba	Japan	Ibaraki
2110735	Tōno	Japan	Iwate
2110743	Tomobe	Japan	Ibaraki
2110744	Tomiya	Japan	Miyagi
2110774	Tōgane	Japan	Chiba
2110793	Tendō	Japan	Yamagata
2110891	Takahata	Japan	Yamagata
2110893	Takahagi	Japan	Ibaraki
2110959	Sukagawa	Japan	Fukushima
2110994	Shizukuishi	Japan	Iwate
2111008	Shisui	Japan	Chiba
2111016	Shiroishi	Japan	Miyagi
2111018	Shiroi	Japan	Chiba
2111049	Shiogama	Japan	Miyagi
2111065	Shinjō	Japan	Yamagata
2111149	Sendai	Japan	Miyagi
2111173	Sawara	Japan	Chiba
2111248	Sagae	Japan	Yamagata
2111258	Ryūgasaki	Japan	Ibaraki
2111277	Rifu	Japan	Miyagi
2111310	Ōtsuchi	Japan	Iwate
2111325	Ōtawara	Japan	Tochigi
2111425	Ōmiya	Japan	Ibaraki
2111429	Omigawa	Japan	Chiba
2111435	Ōmagari	Japan	Akita
2111441	Okunoya	Japan	Ibaraki
2111461	Ōkawara	Japan	Miyagi
2111495	Ōhara	Japan	Chiba
2111559	Obanazawa	Japan	Yamagata
2111567	Ōarai	Japan	Ibaraki
2111568	Ōami	Japan	Chiba
2111656	Nihommatsu	Japan	Fukushima
2111677	Narutō	Japan	Chiba
2111684	Narita	Japan	Chiba
2111704	Namie	Japan	Fukushima
2111749	Naka	Japan	Ibaraki
2111781	Nagai	Japan	Yamagata
2111824	Motomiya	Japan	Fukushima
2111827	Motegi	Japan	Tochigi
2111831	Moriya	Japan	Ibaraki
2111834	Morioka	Japan	Iwate
2111836	Mooka	Japan	Tochigi
2111855	Mobara	Japan	Chiba
2111884	Miyako	Japan	Iwate
2111901	Mito	Japan	Ibaraki
2111943	Miharu	Japan	Fukushima
2111964	Matsushima	Japan	Miyagi
2111999	Mashiko	Japan	Tochigi
2112008	Marumori	Japan	Miyagi
2112019	Makabe	Japan	Ibaraki
2112077	Kuroiso	Japan	Tochigi
2112141	Kōriyama	Japan	Fukushima
2112182	Kogota	Japan	Miyagi
2112232	Kitaibaraki	Japan	Ibaraki
2112297	Kamogawa	Japan	Chiba
2112309	Katsuura	Japan	Chiba
2112312	Katsuta	Japan	Ibaraki
2112319	Katori-shi	Japan	Chiba
2112343	Kasama	Japan	Ibaraki
2112354	Karasuyama	Japan	Tochigi
2112409	Kaminoyama	Japan	Yamagata
2112444	Kamaishi	Japan	Iwate
2112455	Kakuda	Japan	Miyagi
2112521	Iwase	Japan	Ibaraki
2112539	Iwaki	Japan	Fukushima
2112555	Itako	Japan	Ibaraki
2112571	Ishioka	Japan	Ibaraki
2112576	Ishinomaki	Japan	Miyagi
2112583	Ishikawa	Japan	Fukushima
2112615	Inawashiro	Japan	Fukushima
2112656	Ichinoseki	Japan	Iwate
2112664	Ichihara	Japan	Chiba
2112692	Hobaramachi	Japan	Fukushima
2112708	Hitachi	Japan	Ibaraki
2112758	Higashine	Japan	Yamagata
2112802	Hasaki	Japan	Chiba
2112823	Hanamaki	Japan	Iwate
2112899	Furukawa	Japan	Miyagi
2112913	Funaishikawa	Japan	Ibaraki
2112923	Fukushima	Japan	Fukushima
2112940	Fujishiro	Japan	Ibaraki
2112963	Edosaki	Japan	Ibaraki
2112989	Daigo	Japan	Ibaraki
2113015	Chiba	Japan	Chiba
2113077	Asahi	Japan	Chiba
2113115	Ami	Japan	Ibaraki
2113126	Akita	Japan	Akita
2113164	Abiko	Japan	Chiba
2113719	Akitashi	Japan	Akita
2127383	Bihoro	Japan	Hokkaido
2127515	Wakkanai	Japan	Hokkaido
2127733	Tomakomai	Japan	Hokkaido
2127802	Tōbetsu	Japan	Hokkaido
2127878	Mutsu	Japan	Aomori
2127896	Takikawa	Japan	Hokkaido
2127910	Takanosu	Japan	Akita
2128025	Shizunai-furukawachō	Japan	Hokkaido
2128072	Shiraoi	Japan	Hokkaido
2128147	Shimo-furano	Japan	Hokkaido
2128206	Shibetsu	Japan	Hokkaido
2128295	Sapporo	Japan	Hokkaido
2128382	Rumoi	Japan	Hokkaido
2128558	Otofuke	Japan	Hokkaido
2128574	Otaru	Japan	Hokkaido
2128787	Ōdate	Japan	Akita
2128815	Obihiro	Japan	Hokkaido
2128867	Noshiro	Japan	Akita
2128975	Nemuro	Japan	Hokkaido
2128983	Nayoro	Japan	Hokkaido
2129003	Nanae	Japan	Hokkaido
2129101	Muroran	Japan	Hokkaido
2129163	Mombetsu	Japan	Hokkaido
2129211	Misawa	Japan	Aomori
2129218	Yoichi	Japan	Hokkaido
2129324	Makubetsu	Japan	Hokkaido
2129376	Kushiro	Japan	Hokkaido
2129395	Kuroishi	Japan	Aomori
2129513	Shimokizukuri	Japan	Aomori
2129537	Kitami	Japan	Hokkaido
2129766	Kamiiso	Japan	Hokkaido
2129868	Iwanai	Japan	Hokkaido
2129870	Iwamizawa	Japan	Hokkaido
2129909	Ishikari	Japan	Hokkaido
2129961	Ichinohe	Japan	Iwate
2130057	Hirosaki	Japan	Aomori
2130146	Hanawa	Japan	Akita
2130188	Hakodate	Japan	Hokkaido
2130203	Hachinohe	Japan	Aomori
2130332	Fukagawa	Japan	Hokkaido
2130404	Ebetsu	Japan	Hokkaido
2130421	Date	Japan	Hokkaido
2130452	Chitose	Japan	Hokkaido
2130534	Bibai	Japan	Hokkaido
2130612	Ashibetsu	Japan	Hokkaido
2130629	Asahikawa	Japan	Hokkaido
2130658	Aomorishi	Japan	Aomori
2130741	Abashiri	Japan	Hokkaido
2131612	Goshogawara	Japan	Aomori
6324583	Aso	Japan	Kumamoto
6694821	Nanto-shi	Japan	Toyama
6696932	Kawage	Japan	Mie
6822096	Hitachi-Naka	Japan	Ibaraki
6822108	Inashiki	Japan	Ibaraki
6822146	Ōnojō	Japan	Fukuoka
6822217	Minokamo	Japan	Gifu
6822219	Gujō	Japan	Gifu
6825489	Jōetsu	Japan	Niigata
6940394	Saitama	Japan	Saitama
7279570	Higashimurayama-shi	Japan	Tokyo
7281819	Fujikawaguchiko	Japan	Yamanashi
7422816	Dazaifu	Japan	Fukuoka
8125829	Kamigyō-ku	Japan	Kyoto
8198709	Buzen	Japan	Fukuoka
8555918	Sendai	Japan	Miyagi
178443	Wajir	Kenya	Wajir
178522	Voi	Kenya	Taita Taveta
179330	Thika	Kenya	Nairobi Area
181135	Rongai	Kenya	Nakuru
181501	Pumwani	Kenya	Nairobi Area
182701	Nyeri	Kenya	Nyeri
183027	Nyahururu	Kenya	Laikipia
184379	Narok	Kenya	Narok
184433	Nanyuki	Kenya	Laikipia
184622	Nakuru	Kenya	Nakuru
184707	Naivasha	Kenya	Nakuru
184745	Nairobi	Kenya	Nairobi Area
185702	Mumias	Kenya	Kakamega
185939	Muhoroni	Kenya	Kisumu
186301	Mombasa	Kenya	Mombasa
186315	Molo	Kenya	Nakuru
186731	Migori	Kenya	Migori
186827	Meru	Kenya	Meru
187110	Mbale	Kenya	Vihiga
187585	Marsabit	Kenya	Marsabit
187725	Maralal	Kenya	Samburu
187896	Mandera	Kenya	Mandera
187968	Malindi	Kenya	Kilifi
188080	Makueni	Kenya	Makueni
188492	Machakos	Kenya	Machakos
188657	Lugulu	Kenya	Busia
189280	Lodwar	Kenya	Turkana
189741	Lamu	Kenya	Lamu
191038	Kitui	Kenya	Kitui
191245	Kisumu	Kenya	Kisumu
191299	Kisii	Kenya	Kisii
192067	Kilifi	Kenya	Kilifi
192710	Kiambu	Kenya	Kiambu
192859	Keruguya	Kenya	Kirinyaga
192900	Kericho	Kenya	Kericho
193627	Karuri	Kenya	Murang'A
194160	Kapenguria	Kenya	West Pokot
195272	Kakamega	Kenya	Kakamega
195821	Kabarnet	Kenya	Baringo
196231	Isiolo	Kenya	Isiolo
197745	Garissa	Kenya	Garissa
198476	Embu	Kenya	Embu
198629	Eldoret	Kenya	Uasin Gishu
199989	Busia	Kenya	Busia
200067	Bungoma	Kenya	Bungoma
200787	Athi River	Kenya	Machakos
383388	Siaya	Kenya	Siaya
7931933	Ol Kalou	Kenya	Nyandarua
1222562	Suluktu	Kyrgyzstan	Batken
1222662	Isfana	Kyrgyzstan	Batken
1527004	Balykchy	Kyrgyzstan	Ysyk-Köl
1527199	Tokmok	Kyrgyzstan	Chüy
1527299	Talas	Kyrgyzstan	Talas
1527497	Kyzyl-Suu	Kyrgyzstan	Ysyk-Köl
1527513	Uzgen	Kyrgyzstan	Osh
1527534	Osh	Kyrgyzstan	Osh
1527592	Naryn	Kyrgyzstan	Naryn
1527719	Kyzyl-Kyya	Kyrgyzstan	Batken
1528091	Kara Suu	Kyrgyzstan	Osh
1528121	Karakol	Kyrgyzstan	Ysyk-Köl
1528182	Kara-Balta	Kyrgyzstan	Chüy
1528193	Kant	Kyrgyzstan	Chüy
1528249	Jalal-Abad	Kyrgyzstan	Jalal-Abad
1528283	Iradan	Kyrgyzstan	Batken
1528512	Cholpon-Ata	Kyrgyzstan	Ysyk-Köl
1528675	Bishkek	Kyrgyzstan	Bishkek
1528717	Bazar-Korgon	Kyrgyzstan	Jalal-Abad
1528796	At-Bashi	Kyrgyzstan	Naryn
11054823	Osh City	Kyrgyzstan	Osh City
1821306	Phnom Penh	Cambodia	Phnom Penh
1821935	Ta Khmau	Cambodia	Kandal
1821940	Takeo	Cambodia	Takeo
1821993	Svay Rieng	Cambodia	Svay Rieng
1822029	Stung Treng	Cambodia	Stung Treng
1822207	Sisŏphŏn	Cambodia	Banteay Meanchey
1822214	Siem Reap	Cambodia	Siem Reap
1822610	Prey Veng	Cambodia	Prey Veng
1822768	Pursat	Cambodia	Pursat
1822906	Phumĭ Véal Srê	Cambodia	Takeo
1825093	Sâmraông	Cambodia	Ŏtâr Méanchey
1830098	Tbêng Méanchey	Cambodia	Preah Vihear
1830205	Pailin	Cambodia	Pailin
1830377	Lumphăt	Cambodia	Ratanakiri
1830468	Koh Kong	Cambodia	Koh Kong
1830564	Kratié	Cambodia	Kratie
1831112	Kampot	Cambodia	Kampot
1831125	Kampong Thom	Cambodia	Kampong Thom
1831133	Kampong Speu	Cambodia	Kampong Speu
1831142	Sihanoukville	Cambodia	Preah Sihanouk
1831167	Kampong Chhnang	Cambodia	Kampong Chhnang
1831173	Kampong Cham	Cambodia	Kampong Cham
1831732	Ban Lŭng	Cambodia	Ratanakiri
1831797	Battambang	Cambodia	Battambang
8740221	Smach Mean Chey	Cambodia	Koh Kong
2110257	Tarawa	Kiribati	Gilbert Islands
921753	Moutsamoudou	Comoros	Anjouan
921772	Moroni	Comoros	Grande Comore
1866569	Yŏnan-ŭp	North Korea	Hwanghae-namdo
1866923	Wŏnsan	North Korea	Kangwŏn-do
1867927	T’ongch’ŏn-ŭp	North Korea	Kangwŏn-do
1868998	Sŭngho 1-tong	North Korea	Pyongyang
1869021	Sunan	North Korea	Pyongyang
1869446	Songnim	North Korea	Hwanghae-bukto
1870413	Sil-li	North Korea	P'yŏngan-namdo
1870434	Sinmak	North Korea	Hwanghae-bukto
1870742	Sinanju	North Korea	P'yŏngan-namdo
1870883	Sariwŏn	North Korea	Hwanghae-bukto
1871484	Samho-rodongjagu	North Korea	Hamgyŏng-namdo
1871859	Pyongyang	North Korea	Pyongyang
1871871	P’yŏngsŏng	North Korea	P'yŏngan-namdo
1873172	Ongjin	North Korea	Hwanghae-namdo
1873757	Namp’o	North Korea	P'yŏngan-namdo
1875107	Kusŏng	North Korea	P'yŏngan-bukto
1875506	Kujang-ŭp	North Korea	P'yŏngan-bukto
1875588	Kowŏn-ŭp	North Korea	Hamgyŏng-namdo
1875632	Kosan	North Korea	Kangwŏn-do
1876153	Kangdong-ŭp	North Korea	Pyongyang
1876373	Kaesŏng	North Korea	Hwanghae-namdo
1876873	Hwangju-ŭp	North Korea	Hwanghae-bukto
1877030	Hŭngnam	North Korea	Hamgyŏng-namdo
1877046	Hŭkkyo-ri	North Korea	Hwanghae-bukto
1877148	Hoeyang	North Korea	Kangwŏn-do
1877615	Haeju	North Korea	Hwanghae-namdo
1877872	Chunghwa	North Korea	Pyongyang
1878389	Chŏngju	North Korea	P'yŏngan-bukto
1879029	Changyŏn	North Korea	Hwanghae-namdo
1879487	Chaeryŏng-ŭp	North Korea	Hwanghae-namdo
1879544	Ayang-ni	North Korea	Hwanghae-namdo
1879613	Anju	North Korea	P'yŏngan-namdo
1879672	Anbyŏn-ŭp	North Korea	Kangwŏn-do
1879682	Anak	North Korea	Hwanghae-bukto
2038854	Yuktae-dong	North Korea	Hamgyŏng-namdo
2039623	Ŭiju	North Korea	P'yŏngan-bukto
2040674	Sŏnbong	North Korea	Rason
2040893	Sinŭiju	North Korea	P'yŏngan-bukto
2041533	Sakchu-ŭp	North Korea	P'yŏngan-bukto
2042249	Yŏnggwang-ŭp	North Korea	Hamgyŏng-namdo
2042267	Onsŏng	North Korea	Hamgyŏng-bukto
2042498	Nanam	North Korea	Hamgyŏng-bukto
2042645	Najin	North Korea	Rason
2042738	Musan-ŭp	North Korea	Hamgyŏng-bukto
2042987	Kyŏngsŏng	North Korea	Hamgyŏng-bukto
2043484	Kilju	North Korea	Hamgyŏng-bukto
2043572	Kanggye-si	North Korea	Chagang-do
2043835	Hyesan-dong	North Korea	Yanggang-do
2043837	Hyesan-si	North Korea	Yanggang-do
2044050	Hongwŏn	North Korea	Hamgyŏng-namdo
2044091	Hoeryŏng	North Korea	Hamgyŏng-bukto
2044757	Chongjin	North Korea	Hamgyŏng-bukto
2045311	Aoji-ri	North Korea	Hamgyŏng-bukto
1832015	Heung-hai	South Korea	Gyeongsangbuk-do
1832215	Enjitsu	South Korea	Gyeongsangbuk-do
1832257	Neietsu	South Korea	Gangwon-do
1832384	Eisen	South Korea	Gyeongsangbuk-do
1832501	Reiko	South Korea	Jeollanam-do
1832566	Yŏng-dong	South Korea	Chungcheongbuk-do
1832617	Eisen	South Korea	Gyeongsangbuk-do
1832743	Yeoju	South Korea	Gyeonggi-do
1832771	Yesan	South Korea	Chungcheongnam-do
1832828	Yangsan	South Korea	Gyeongsangnam-do
1832830	Yangp'yŏng	South Korea	Gyeonggi-do
1832847	Yangju	South Korea	Gyeonggi-do
1832909	Yanggu	South Korea	Gangwon-do
1833105	Wŏnju	South Korea	Gangwon-do
1833514	Waegwan	South Korea	Gyeongsangbuk-do
1833747	Ulsan	South Korea	Ulsan
1833788	Uijeongbu-si	South Korea	Gyeonggi-do
1834885	Tangjin	South Korea	Chungcheongnam-do
1835096	Taesal-li	South Korea	Chungcheongnam-do
1835235	Daejeon	South Korea	Daejeon
1835329	Daegu	South Korea	Daegu
1835447	Taisen-ri	South Korea	Chungcheongnam-do
1835515	T’aebaek	South Korea	Gangwon-do
1835553	Suwon-si	South Korea	Gyeonggi-do
1835648	Suncheon	South Korea	Jeollanam-do
1835848	Seoul	South Korea	Seoul
1835895	Suisan	South Korea	Chungcheongnam-do
1835967	Jenzan	South Korea	Gyeongsangbuk-do
1836553	Sokcho	South Korea	Gangwon-do
1837706	Sangju	South Korea	Gyeongsangbuk-do
1838069	Santyoku	South Korea	Gangwon-do
1838508	Fuyo	South Korea	Chungcheongnam-do
1838524	Busan	South Korea	Busan
1838716	Bucheon-si	South Korea	Gyeonggi-do
1838722	Puan	South Korea	Jeollabuk-do
1839011	Beolgyo	South Korea	Jeollanam-do
1839071	Pohang	South Korea	Gyeongsangbuk-do
1839652	Osan	South Korea	Gyeonggi-do
1839726	Asan	South Korea	Chungcheongnam-do
1839873	Okcheon	South Korea	Chungcheongbuk-do
1840179	Kosong	South Korea	Gangwon-do
1840211	Nonsan	South Korea	Chungcheongnam-do
1840379	Nangen	South Korea	Jeollabuk-do
1840536	Naju	South Korea	Jeollanam-do
1840862	Munsan	South Korea	Gyeonggi-do
1840886	Mungyeong	South Korea	Gyeongsangbuk-do
1840982	Muan	South Korea	Jeollanam-do
1841066	Moppo	South Korea	Jeollanam-do
1841598	Gyeongsan-si	South Korea	Gyeongsangbuk-do
1841603	Kyonju	South Korea	Gyeongsangbuk-do
1841775	Kwangyang	South Korea	Jeollanam-do
1841810	Gwangju	South Korea	Gyeonggi-do
1841811	Gwangju	South Korea	Gwangju
1841976	Kurye	South Korea	Jeollanam-do
1841988	Guri-si	South Korea	Gyeonggi-do
1842016	Kunwi	South Korea	Gyeongsangbuk-do
1842025	Kunsan	South Korea	Jeollabuk-do
1842153	Kinzan	South Korea	Chungcheongnam-do
1842225	Gumi	South Korea	Gyeongsangbuk-do
1842485	Goyang-si	South Korea	Gyeonggi-do
1842518	Goseong	South Korea	Gyeongsangnam-do
1842616	Gongju	South Korea	Chungcheongnam-do
1842754	Kyosai	South Korea	Gyeongsangnam-do
1842800	Koesan	South Korea	Chungcheongbuk-do
1842859	Koch'ang	South Korea	Jeollabuk-do
1842939	Kimje	South Korea	Jeollabuk-do
1842944	Gimcheon	South Korea	Gyeongsangbuk-do
1842966	Gijang	South Korea	Busan
1843082	Gapyeong	South Korea	Gyeonggi-do
1843137	Kang-neung	South Korea	Gangwon-do
1843163	Ganghwa-gun	South Korea	Incheon
1843491	Iksan	South Korea	Jeollabuk-do
1843564	Incheon	South Korea	Incheon
1843585	Imsil	South Korea	Jeollabuk-do
1843702	Icheon-si	South Korea	Gyeonggi-do
1843841	Hwasun	South Korea	Jeollanam-do
1843847	Hwaseong-si	South Korea	Gyeonggi-do
1844045	Hwacheon	South Korea	Gangwon-do
1844174	Hongsung	South Korea	Chungcheongnam-do
1844191	Hongch’ŏn	South Korea	Gangwon-do
1844308	Hayang	South Korea	Gyeongsangbuk-do
1844751	Haenam	South Korea	Jeollanam-do
1845457	Jeonju	South Korea	Jeollabuk-do
1845519	Cheongsong gun	South Korea	Gyeongsangbuk-do
1845604	Cheongju-si	South Korea	Chungcheongbuk-do
1845759	Cheonan	South Korea	Chungcheongnam-do
1846052	Chinju	South Korea	Gyeongsangnam-do
1846095	Chinch'ŏn	South Korea	Chungcheongbuk-do
1846114	Jinan-gun	South Korea	Jeollabuk-do
1846266	Jeju City	South Korea	Jeju-do
1846326	Changwon	South Korea	Gyeongsangnam-do
1846355	Changsu	South Korea	Jeollabuk-do
1846898	Anyang-si	South Korea	Gyeonggi-do
1846912	Anseong	South Korea	Gyeonggi-do
1846918	Ansan-si	South Korea	Gyeonggi-do
1846986	Andong	South Korea	Gyeongsangbuk-do
1847050	Gaigeturi	South Korea	Jeju-do
1884138	Yeosu	South Korea	Jeollanam-do
1886598	Yŏnmu	South Korea	Chungcheongnam-do
1892823	Tonghae	South Korea	Gangwon-do
1896953	Pubal	South Korea	Gyeonggi-do
1897000	Seongnam-si	South Korea	Gyeonggi-do
1897118	Hwado	South Korea	Gyeonggi-do
1897122	Namyangju	South Korea	Gyeonggi-do
1912205	Ungsang	South Korea	Gyeongsangnam-do
1912209	Wabu	South Korea	Gyeonggi-do
1925936	Naesŏ	South Korea	Gyeongsangnam-do
1925943	Hwawŏn	South Korea	Daegu
1948005	Kwangmyŏng	South Korea	Gyeonggi-do
6395804	Sinan	South Korea	Jeollanam-do
6621166	Seogwipo	South Korea	Jeju-do
285603	Janūb as Surrah	Kuwait	Al Farwaniyah
285629	Ḩawallī	Kuwait	Muḩāfaz̧at Ḩawallī
285663	Bayān	Kuwait	N/A
285704	As Sālimīyah	Kuwait	Muḩāfaz̧at Ḩawallī
285726	Ar Rumaythīyah	Kuwait	Muḩāfaz̧at Ḩawallī
285728	Ar Riqqah	Kuwait	Al Aḩmadī
285778	Al Manqaf	Kuwait	Al Aḩmadī
285782	Al Mahbūlah	Kuwait	Al Aḩmadī
285787	Kuwait City	Kuwait	Al Asimah
285799	Al Jahrā’	Kuwait	Al Jahrāʼ
285811	Al Faḩāḩīl	Kuwait	Al Aḩmadī
285812	Al Finţās	Kuwait	Al Aḩmadī
285815	Al Farwānīyah	Kuwait	Al Farwaniyah
285839	Al Aḩmadī	Kuwait	Al Aḩmadī
285856	Ad Dasmah	Kuwait	Al Asimah
387958	Salwá	Kuwait	Muḩāfaz̧at Ḩawallī
388065	Ar Rābiyah	Kuwait	Al Asimah
3580661	George Town	Cayman Islands	George Town
607610	Zhanaozen	Kazakhstan	Mangghystaū
608359	Shalqar	Kazakhstan	Aqtöbe
608362	Shalkar	Kazakhstan	Atyraū
608668	Oral	Kazakhstan	Batys Qazaqstan
608679	Kandyagash	Kazakhstan	Aqtöbe
609123	Qulsary	Kazakhstan	Atyraū
609404	Khromtau	Kazakhstan	Aqtöbe
609655	Karagandy	Kazakhstan	Qaraghandy
609924	Embi	Kazakhstan	Aqtöbe
610445	Balyqshy	Kazakhstan	Atyraū
610529	Atyrau	Kazakhstan	Atyraū
610611	Aqtöbe	Kazakhstan	Aqtöbe
610612	Aktau	Kazakhstan	Mangghystaū
610613	Aqsay	Kazakhstan	Batys Qazaqstan
1516438	Zyryanovsk	Kazakhstan	East Kazakhstan
1516519	Zhosaly	Kazakhstan	Qyzylorda
1516589	Zhezqazghan	Kazakhstan	Qaraghandy
1516601	Dzhetygara	Kazakhstan	Qostanay
1516788	Zhangatas	Kazakhstan	Zhambyl
1516789	Ayteke Bi	Kazakhstan	Qyzylorda
1516905	Taraz	Kazakhstan	Zhambyl
1517323	Yanykurgan	Kazakhstan	Qyzylorda
1517501	Vannovka	Kazakhstan	Ongtüstik Qazaqstan
1517637	Ush-Tyube	Kazakhstan	Almaty Oblysy
1517945	Turkestan	Kazakhstan	Ongtüstik Qazaqstan
1518262	Temirtau	Kazakhstan	Qaraghandy
1518296	Tekeli	Kazakhstan	Almaty Oblysy
1518431	Tasböget	Kazakhstan	Qyzylorda
1518518	Talghar	Kazakhstan	Almaty Oblysy
1518542	Taldykorgan	Kazakhstan	Almaty Oblysy
1518543	Taldyqorghan	Kazakhstan	Almaty Oblysy
1518980	Shymkent	Kazakhstan	Ongtüstik Qazaqstan
1519030	Chu	Kazakhstan	Zhambyl
1519226	Shemonaīkha	Kazakhstan	East Kazakhstan
1519422	Semey	Kazakhstan	East Kazakhstan
1519673	Saryaghash	Kazakhstan	Ongtüstik Qazaqstan
1519691	Sarkand	Kazakhstan	Almaty Oblysy
1519725	Sorang	Kazakhstan	Qaraghandy
1519843	Rudnyy	Kazakhstan	Qostanay
1519922	Kyzylorda	Kazakhstan	Qyzylorda
1519928	Kostanay	Kazakhstan	Qostanay
1519938	Karatau	Kazakhstan	Zhambyl
1519948	Kapshagay	Kazakhstan	Almaty Oblysy
1520172	Petropavl	Kazakhstan	Soltüstik Qazaqstan
1520240	Pavlodar	Kazakhstan	Pavlodar
1520253	Zharkent	Kazakhstan	Almaty Oblysy
1520316	Ust-Kamenogorsk	Kazakhstan	East Kazakhstan
1520947	Sarykemer	Kazakhstan	Zhambyl
1520969	Merke	Kazakhstan	Zhambyl
1521230	Makīnsk	Kazakhstan	Aqmola
1521315	Lisakovsk	Kazakhstan	Qostanay
1521368	Baykonyr	Kazakhstan	Bayqongyr Qalasy
1521370	Ridder	Kazakhstan	East Kazakhstan
1521379	Lenger	Kazakhstan	Ongtüstik Qazaqstan
1522203	Kokshetau	Kazakhstan	Aqmola
1523741	Esik	Kazakhstan	Almaty Oblysy
1524245	Georgīevka	Kazakhstan	East Kazakhstan
1524298	Aksu	Kazakhstan	Pavlodar
1524308	Otegen Batyra	Kazakhstan	Almaty Oblysy
1524325	Ekibastuz	Kazakhstan	Pavlodar
1524801	Shīeli	Kazakhstan	Qyzylorda
1524889	Shardara	Kazakhstan	Ongtüstik Qazaqstan
1524958	Burunday	Kazakhstan	Almaty Oblysy
1525462	Aksu	Kazakhstan	Ongtüstik Qazaqstan
1525798	Balqash	Kazakhstan	Qaraghandy
1525988	Ayagoz	Kazakhstan	East Kazakhstan
1526038	Atbasar	Kazakhstan	Aqmola
1526168	Arys	Kazakhstan	Ongtüstik Qazaqstan
1526193	Arkalyk	Kazakhstan	Qostanay
1526265	Aral	Kazakhstan	Qyzylorda
1526273	Astana	Kazakhstan	Astana Qalasy
1526384	Almaty	Kazakhstan	Almaty Qalasy
1526797	Akkol’	Kazakhstan	Aqmola
1526970	Abay	Kazakhstan	Qaraghandy
9862222	Kyzyl-Orda	Kazakhstan	Qyzylorda
1651944	Vientiane	Laos	Vientiane
1652203	Xam Nua	Laos	Houaphan
1653316	Savannakhét	Laos	Savannahkhét
1654379	Pakxé	Laos	Champasak
1655078	Muang Xay	Laos	Oudômxai
1655087	Vangviang	Laos	Vientiane Province
1655123	Muang Phônsavan	Laos	Xiangkhoang
1655140	Muang Pakxan	Laos	Bolikhamsai Province
1655199	Thakhèk	Laos	Khammouan
1655559	Luang Prabang	Laos	Louangphabang
1952156	Phonsavan	Laos	Xiangkhoang
266045	Zahlé	Lebanon	Béqaa
266826	Tripoli	Lebanon	Liban-Nord
267008	Tyre	Lebanon	Liban-Sud
268064	Sidon	Lebanon	Liban-Sud
268743	Ra’s Bayrūt	Lebanon	Beyrouth
273140	Djounie	Lebanon	Mont-Liban
273203	Jbaïl	Lebanon	Mont-Liban
274874	Habboûch	Lebanon	Nabatîyé
276359	Bcharré	Lebanon	Liban-Nord
276781	Beirut	Lebanon	Beyrouth
278832	En Nâqoûra	Lebanon	Liban-Sud
278913	Nabatîyé et Tahta	Lebanon	Nabatîyé
3576812	Castries	Saint Lucia	Castries Quarter
3042030	Vaduz	Liechtenstein	Vaduz
1223648	Welisara	Sri Lanka	Western
1223738	Weligama	Sri Lanka	Southern
1224085	Wattala	Sri Lanka	Western
1225018	Vavuniya	Sri Lanka	Northern Province
1225142	Valvedditturai	Sri Lanka	Northern Province
1226260	Trincomalee	Sri Lanka	Eastern Province
1228730	Ratnapura	Sri Lanka	Sabaragamuwa
1229293	Puttalam	Sri Lanka	North Western
1230089	Pita Kotte	Sri Lanka	Western
1230613	Peliyagoda	Sri Lanka	Western
1231410	Panadura	Sri Lanka	Western
1232783	Nuwara Eliya	Sri Lanka	Central
1233369	Negombo	Sri Lanka	Western
1234378	Mulleriyawa	Sri Lanka	Western
1234569	Dehiwala-Mount Lavinia	Sri Lanka	Western
1234633	Moratuwa	Sri Lanka	Western
1235846	Matara	Sri Lanka	Southern
1236854	Maharagama	Sri Lanka	Western
1237980	Kurunegala	Sri Lanka	North Western
1238992	Sri Jayewardenepura Kotte	Sri Lanka	Western
1239047	Kotikawatta	Sri Lanka	Western
1239593	Kolonnawa	Sri Lanka	Western
1240622	Kelaniya	Sri Lanka	Western
1240935	Katunayaka	Sri Lanka	Western
1241622	Kandy	Sri Lanka	Central
1241750	Kandana	Sri Lanka	Western
1241964	Kalutara	Sri Lanka	Western
1242110	Kalmunai	Sri Lanka	Eastern Province
1242835	Ja Ela	Sri Lanka	Western
1243936	Homagama	Sri Lanka	Western
1244397	Hendala	Sri Lanka	Western
1244596	Hatton	Sri Lanka	Central
1244773	Hanwella Ihala	Sri Lanka	Western
1246000	Gampola	Sri Lanka	Central
1246294	Galle	Sri Lanka	Southern
1246321	Galkissa	Sri Lanka	Western
1246924	Eravur Town	Sri Lanka	Eastern Province
1248749	Dambulla	Sri Lanka	Central
1248991	Colombo	Sri Lanka	Western
1249145	Chilaw	Sri Lanka	North Western
1249931	Beruwala	Sri Lanka	Western
1249978	Bentota	Sri Lanka	Southern
1250164	Battaramulla South	Sri Lanka	Western
1250615	Badulla	Sri Lanka	Uva
1251081	Anuradhapura	Sri Lanka	North Central
1251459	Ampara	Sri Lanka	Eastern Province
1251574	Ambalangoda	Sri Lanka	Southern
8260318	Shanjeev Home	Sri Lanka	Eastern Province
9259456	Mount Lavinia	Sri Lanka	Western
2272491	Zwedru	Liberia	Grand Gedeh
2272790	New Yekepa	Liberia	Nimba
2273312	Voinjama	Liberia	Lofa
2274895	Monrovia	Liberia	Montserrado
2276086	Kakata	Liberia	Margibi
2276492	Harper	Liberia	Maryland
2276600	Greenville	Liberia	Sinoe
2277060	Gbarnga	Liberia	Bong
2278158	Buchanan	Liberia	Grand Bassa
2278682	Bensonville	Liberia	Montserrado
932183	Quthing	Lesotho	Quthing
932218	Qacha’s Nek	Lesotho	Qachaʼs Nek
932505	Maseru	Lesotho	Maseru
932521	Maputsoe	Lesotho	Leribe
932614	Mafeteng	Lesotho	Mafeteng
932698	Leribe	Lesotho	Leribe
932886	Butha-Buthe	Lesotho	Butha-Buthe
593063	Visaginas	Lithuania	Utenos apskritis
593116	Vilnius	Lithuania	Vilnius County
593672	Utena	Lithuania	Utenos apskritis
593733	Ukmerge	Lithuania	Vilnius County
593926	Telsiai	Lithuania	Telšių apskritis
593959	Taurage	Lithuania	Tauragės apskritis
594656	Silute	Lithuania	Klaipėdos apskritis
594739	Šiauliai	Lithuania	Šiaulių apskritis
595213	Rokiškis	Lithuania	Panevėžys
595449	Radviliskis	Lithuania	Šiaulių apskritis
595689	Plunge	Lithuania	Telšių apskritis
596128	Panevėžys	Lithuania	Panevėžys
596479	Fabijoniškės	Lithuania	Vilnius County
597188	Mazeikiai	Lithuania	Telšių apskritis
597231	Marijampolė	Lithuania	Marijampolės apskritis
597989	Kretinga	Lithuania	Klaipėdos apskritis
598098	Klaipėda	Lithuania	Klaipėdos apskritis
598272	Kėdainiai	Lithuania	Kauno apskritis
598316	Kaunas	Lithuania	Kauno apskritis
598818	Jonava	Lithuania	Kauno apskritis
599506	Gargždai	Lithuania	Klaipėdos apskritis
599757	Druskininkai	Lithuania	Alytaus apskritis
601084	Alytus	Lithuania	Alytaus apskritis
601138	Aleksotas	Lithuania	Kauno apskritis
6618486	Dainava (Kaunas)	Lithuania	Kauno apskritis
9610004	Šilainiai	Lithuania	Kauno apskritis
9610008	Eiguliai	Lithuania	Kauno apskritis
10062599	Pašilaičiai	Lithuania	Vilnius County
10062600	Pilaitė	Lithuania	Vilnius County
10062601	Justiniškės	Lithuania	Vilnius County
10062602	Šeškinė	Lithuania	Vilnius County
10062605	Lazdynai	Lithuania	Vilnius County
2960316	Luxembourg	Luxembourg	Luxembourg
2960596	Esch-sur-Alzette	Luxembourg	Luxembourg
2960634	Dudelange	Luxembourg	Luxembourg
453754	Valmiera	Latvia	Valmieras Rajons
454310	Ventspils	Latvia	Ventspils
454432	Vec-Liepāja	Latvia	Liepāja
454768	Tukums	Latvia	Tukuma Rajons
455898	Salaspils	Latvia	Salaspils
456172	Riga	Latvia	Riga
457065	Ogre	Latvia	Ogre
457954	Liepāja	Latvia	Liepāja
459201	Jūrmala	Latvia	Jūrmala
459279	Jelgava	Latvia	Jelgava
459283	Jēkabpils	Latvia	Jēkabpils Municipality
460413	Daugavpils	Latvia	Daugavpils municipality
460570	Cēsis	Latvia	Cēsu Rajons
81302	Tobruk	Libya	Sha‘bīyat al Buţnān
81604	Sulūq	Libya	Banghāzī
87205	Darnah	Libya	Darnah
88319	Benghazi	Libya	Banghāzī
88562	At Tāj	Libya	Al Kufrah
88834	Tūkrah	Libya	Al Marj
88835	Al Qubbah	Libya	Darnah
88903	Al Marj	Libya	Al Marj
88962	Al Jawf	Libya	Al Kufrah
89055	Al Bayḑā’	Libya	Al Jabal al Akhḑar
89087	Al Abyār	Libya	Al Marj
89113	Ajdabiya	Libya	Sha‘bīyat al Wāḩāt
2208425	Zuwārah	Libya	An Nuqāţ al Khams
2208485	Zliten	Libya	Mişrātah
2208655	Zalţan	Libya	An Nuqāţ al Khams
2208791	Yafran	Libya	Sha‘bīyat al Jabal al Gharbī
2209055	Waddān	Libya	Al Jufrah
2210221	Tarhuna	Libya	Al Marqab
2210247	Tripoli	Libya	Tripoli
2210394	Tagiura	Libya	Tripoli
2210554	Sirte	Libya	Surt
2210560	Şurmān	Libya	Az Zāwiyah
2212771	Şabrātah	Libya	Az Zāwiyah
2212775	Sabhā	Libya	Sabhā
2214603	Murzuq	Libya	Murzuq
2214827	Mizdah	Libya	Sha‘bīyat al Jabal al Gharbī
2214846	Mişrātah	Libya	Mişrātah
2215163	Masallātah	Libya	Al Marqab
2216645	Hūn	Libya	Al Jufrah
2216885	Zawiya	Libya	Az Zāwiyah
2217351	Ghat	Libya	Sha‘bīyat Ghāt
2217362	Gharyan	Libya	Sha‘bīyat al Jabal al Gharbī
2218478	Brak	Libya	Ash Shāţiʼ
2218840	Banī Walīd	Libya	Mişrātah
2218963	Az Zintān	Libya	Sha‘bīyat al Jabal al Gharbī
2218970	Az Zāwīyah	Libya	Az Zāwiyah
2219905	Al Khums	Libya	Al Marqab
2219960	Al Jadīd	Libya	Sabhā
2526435	Zaïo	Morocco	Oriental
2526452	Zagora	Morocco	Souss-Massa-Drâa
2526488	Youssoufia	Morocco	Doukkala-Abda
2527089	Tiznit	Morocco	Souss-Massa-Drâa
2527645	Tirhanimîne	Morocco	Taza-Al Hoceima-Taounate
2527915	Tinghir	Morocco	Souss-Massa-Drâa
2528659	Tiflet	Morocco	Rabat-Salé-Zemmour-Zaër
2528910	Tétouan	Morocco	Tanger-Tétouan
2529317	Taza	Morocco	Taza-Al Hoceima-Taounate
2529649	Taroudant	Morocco	Souss-Massa-Drâa
2530048	Taourirt	Morocco	Oriental
2530155	Taounate	Morocco	Taza-Al Hoceima-Taounate
2530241	Tan-Tan	Morocco	Guelmim-Es Smara
2530335	Tangier	Morocco	Tanger-Tétouan
2531480	Tahla	Morocco	Taza-Al Hoceima-Taounate
2532394	Souq Larb’a al Gharb	Morocco	Gharb-Chrarda-Beni Hssen
2532945	Sidi Slimane	Morocco	Gharb-Chrarda-Beni Hssen
2533191	Sidi Qacem	Morocco	Gharb-Chrarda-Beni Hssen
2534515	Sidi Ifni	Morocco	Souss-Massa-Drâa
2536074	Sidi Bennour	Morocco	Doukkala-Abda
2537406	Settat	Morocco	Chaouia-Ouardigha
2537545	Sefrou	Morocco	Fès-Boulemane
2537763	Sale	Morocco	Rabat-Salé-Zemmour-Zaër
2537881	Safi	Morocco	Doukkala-Abda
2538475	Rabat	Morocco	Rabat-Salé-Zemmour-Zaër
2539134	Oulad Teïma	Morocco	Souss-Massa-Drâa
2540483	Oujda	Morocco	Oriental
2540689	Oued Zem	Morocco	Chaouia-Ouardigha
2540810	Ouezzane	Morocco	Gharb-Chrarda-Beni Hssen
2540850	Ouarzazat	Morocco	Souss-Massa-Drâa
2541479	Nador	Morocco	Oriental
2542051	Mohammedia	Morocco	Grand Casablanca
2542227	Midelt	Morocco	Meknès-Tafilalet
2542715	Meknès	Morocco	Meknès-Tafilalet
2542866	Mechraa Bel Ksiri	Morocco	Gharb-Chrarda-Beni Hssen
2542987	Martil	Morocco	Tanger-Tétouan
2542997	Marrakesh	Morocco	Marrakech-Tensift-Al Haouz
2543549	Larache	Morocco	Tanger-Tétouan
2544001	Ksar El Kebir	Morocco	Tanger-Tétouan
2544248	Khouribga	Morocco	Chaouia-Ouardigha
2544333	Khenifra	Morocco	Meknès-Tafilalet
2544571	Kenitra	Morocco	Gharb-Chrarda-Beni Hssen
2544720	Kasba Tadla	Morocco	Tadla-Azilal
2545017	Jerada	Morocco	Oriental
2548489	Guercif	Morocco	Taza-Al Hoceima-Taounate
2548526	Guelmim	Morocco	Guelmim-Es Smara
2548830	Fkih Ben Salah	Morocco	Tadla-Azilal
2548880	Fès al Bali	Morocco	Fès-Boulemane
2548885	Fes	Morocco	Fès-Boulemane
2549263	Essaouira	Morocco	Marrakech-Tensift-Al Haouz
2550078	El Jadida	Morocco	Doukkala-Abda
2550252	El Hajeb	Morocco	Meknès-Tafilalet
2550806	El Aïoun	Morocco	Oriental
2553455	Chefchaouene	Morocco	Tanger-Tétouan
2553604	Casablanca	Morocco	Grand Casablanca
2553751	Bouznika	Morocco	Chaouia-Ouardigha
2555467	Berkane	Morocco	Oriental
2555745	Beni Mellal	Morocco	Tadla-Azilal
2556272	Berrechid	Morocco	Chaouia-Ouardigha
2556657	Azemmour	Morocco	Doukkala-Abda
2557055	Asilah	Morocco	Tanger-Tétouan
2558470	Khemisset	Morocco	Rabat-Salé-Zemmour-Zaër
2558545	Al Hoceïma	Morocco	Taza-Al Hoceima-Taounate
2561124	Ahfir	Morocco	Oriental
2561668	Agadir	Morocco	Souss-Massa-Drâa
2562055	Skhirate	Morocco	Rabat-Salé-Zemmour-Zaër
6546693	Boujniba	Morocco	Chaouia-Ouardigha
8542188	Dakhla	Morocco	Oued ed Dahab-Lagouira
2992741	Monte-Carlo	Monaco	
2993458	Monaco	Monaco	
617180	Ungheni	Moldova	Ungheni
617239	Tiraspolul	Moldova	Stînga Nistrului
617302	Straşeni	Moldova	Strășeni
617345	Bilicenii Vechi	Moldova	Sîngerei
617367	Soroca	Moldova	Raionul Soroca
617381	Slobozia	Moldova	Stînga Nistrului
617486	Rîbniţa	Moldova	Stînga Nistrului
617638	Orhei	Moldova	Orhei
617993	Hînceşti	Moldova	Hînceşti
618120	Căuşeni	Moldova	Căuşeni
618329	Floreşti	Moldova	Floreşti
618365	Dubăsari	Moldova	Teleneşti
618370	Drochia	Moldova	Drochia
618405	Comrat	Moldova	Găgăuzia
618426	Chişinău	Moldova	Chişinău
618450	Ceadîr-Lunga	Moldova	Găgăuzia
618456	Cahul	Moldova	Cahul
618577	Bender	Moldova	Bender
3193044	Podgorica	Montenegro	Podgorica
3193161	Pljevlja	Montenegro	Pljevlja
3194494	Nikšić	Montenegro	Opština Nikšić
3199394	Herceg-Novi	Montenegro	Herceg Novi
3202641	Cetinje	Montenegro	Cetinje
3203106	Budva	Montenegro	Budva
3204176	Bijelo Polje	Montenegro	Bijelo Polje
3204509	Bar	Montenegro	Bar
3578851	Marigot	Saint Martin	N/A
1053384	Toamasina	Madagascar	Atsinanana
1053778	Vohipaho	Madagascar	Atsimo-Atsinanana
1054035	Vohibinany	Madagascar	Atsinanana
1054192	Vavatenina	Madagascar	Analanjirofo
1054329	Vangaindrano	Madagascar	Atsimo-Atsinanana
1054463	Tsiroanomandidy	Madagascar	Bongolava
1054500	Tsiombe	Madagascar	Androy
1055059	Tsaratanana	Madagascar	Betsiboka
1055429	Toliara	Madagascar	Atsimo-Andrefana
1055433	Fort Dauphin	Madagascar	Anosy
1056151	Soavinandriana	Madagascar	Itasy
1056381	Soanindrariny	Madagascar	Vakinankaratra
1056386	Soanierana Ivongo	Madagascar	Analanjirofo
1056531	Sitampiky	Madagascar	Boeny
1056899	Sambava	Madagascar	Sava
1057095	Sakaraha	Madagascar	Atsimo-Andrefana
1057277	Sahavato	Madagascar	Vatovavy Fitovinany
1057688	Sadabe	Madagascar	Analamanga
1058080	Nosy Varika	Madagascar	Vatovavy Fitovinany
1058381	Morondava	Madagascar	Menabe
1059051	Miandrivazo	Madagascar	Menabe
1059059	Miandrarivo	Madagascar	Vakinankaratra
1059507	Marovoay	Madagascar	Boeny
1060007	Marolambo	Madagascar	Atsinanana
1060283	Maroantsetra	Madagascar	Analanjirofo
1060673	Manjakandriana	Madagascar	Analamanga
1061335	Mananjary	Madagascar	Vatovavy Fitovinany
1061412	Mananara	Madagascar	Analanjirofo
1061605	Manakara	Madagascar	Vatovavy Fitovinany
1061912	Maintirano	Madagascar	Melaky
1062553	Mahanoro	Madagascar	Atsinanana
1062663	Mahajanga	Madagascar	Boeny
1062842	Maevatanana	Madagascar	Betsiboka
1064234	Ikongo	Madagascar	Vatovavy Fitovinany
1064258	Ikalamavony	Madagascar	Upper Matsiatra
1064275	Ihosy	Madagascar	Ihorombe
1064366	Ifanadiana	Madagascar	Vatovavy Fitovinany
1064978	Fenoarivo Be	Madagascar	Bongolava
1064980	Fenoarivo Atsinanana	Madagascar	Analanjirofo
1065140	Faratsiho	Madagascar	Vakinankaratra
1065158	Farafangana	Madagascar	Atsimo-Atsinanana
1065222	Fandriana	Madagascar	Amoron'i Mania
1066310	Betioky	Madagascar	Atsimo-Andrefana
1066514	Betafo	Madagascar	Vakinankaratra
1066831	Beroroha	Madagascar	Atsimo-Andrefana
1067531	Belo sur Tsiribihina	Madagascar	Menabe
1067565	Beloha	Madagascar	Androy
1068670	Bealanana	Madagascar	Sofia
1068865	Arivonimamo	Madagascar	Itasy
1068955	Antsohimbondrona	Madagascar	Diana
1068971	Antsohihy	Madagascar	Sofia
1069129	Antsiranana	Madagascar	Diana
1069166	Antsirabe	Madagascar	Vakinankaratra
1070661	Antanifotsy	Madagascar	Vakinankaratra
1070940	Antananarivo	Madagascar	Analamanga
1071296	Antalaha	Madagascar	Sava
1072711	Ankazondandy	Madagascar	Analamanga
1072879	Ankazoabo	Madagascar	Atsimo-Andrefana
1073482	Anjozorobe	Madagascar	Analamanga
1076105	Hell-Ville	Madagascar	Diana
1076194	Andilamena	Madagascar	Alaotra Mangoro
1076454	Andapa	Madagascar	Sava
1078171	Ampasimanolotra	Madagascar	Atsinanana
1078446	Amparafaravola	Madagascar	Alaotra Mangoro
1078553	Ampanihy	Madagascar	Atsimo-Andrefana
1078966	Ampahana	Madagascar	Sava
1079048	Ambovombe	Madagascar	Androy
1079088	Ambositra	Madagascar	Amoron'i Mania
1079777	Ambohitrolomahitsy	Madagascar	Analamanga
1081790	Amboasary	Madagascar	Anosy
1081863	Amboanjo	Madagascar	Vatovavy Fitovinany
1082243	Ambilobe	Madagascar	Diana
1082992	Ambatolampy	Madagascar	Vakinankaratra
1083257	Ambato Boeny	Madagascar	Boeny
1083676	Ambarakaraka	Madagascar	Diana
1083724	Ambanja	Madagascar	Diana
1083968	Ambalavao	Madagascar	Upper Matsiatra
1084740	Alarobia	Madagascar	Analamanga
2113779	Majuro	Marshall Islands	Majuro Atoll
7874852	RMI Capitol	Marshall Islands	Majuro Atoll
783926	Желино	Macedonia	Želino
784424	Vinica	Macedonia	Vinica
785058	Veles	Macedonia	Veles
785082	Tetovo	Macedonia	Tetovo
785113	Теарце	Macedonia	Tearce
785380	Strumica	Macedonia	Strumica
785387	Struga	Macedonia	Struga
785482	Shtip	Macedonia	Štip
785842	Skopje	Macedonia	Karpoš
786093	Сарај	Macedonia	Saraj
786341	Ресен	Macedonia	Resen
786565	Радовиш	Macedonia	Radoviš
786735	Prilep	Macedonia	Prilep
787487	Ohrid	Macedonia	Ohrid
787715	Неготино	Macedonia	Vrapčište
787716	Negotino	Macedonia	Negotino
788654	Липково	Macedonia	Opstina Lipkovo
788886	Kumanovo	Macedonia	Kumanovo
789045	Крива Паланка	Macedonia	Kriva Palanka
789403	Kochani	Macedonia	Kočani
789527	Kičevo	Macedonia	Kičevo
789541	Kavadarci	Macedonia	Kavadarci
789611	Kamenjane	Macedonia	Bogovinje
790295	Gostivar	Macedonia	Gostivar
790744	Gevgelija	Macedonia	Gevgelija
791559	Delcevo	Macedonia	Delčevo
791606	Debar	Macedonia	Debar
792227	Brvenica	Macedonia	Brvenica
792578	Bitola	Macedonia	Bitola
833258	Šuto Orizare	Macedonia	Šuto Orizari
833260	Butel	Macedonia	Butel
833262	Čair	Macedonia	Čair
833357	Ilinden	Macedonia	Ilinden
863675	Kisela Voda	Macedonia	Kisela Voda
7886881	Centar Župa	Macedonia	Centar Župa
2448442	Yorosso	Mali	Sikasso
2449067	Timbuktu	Mali	Tombouctou
2451185	Sikasso	Mali	Sikasso
2451478	Ségou	Mali	Ségou
2451778	San	Mali	Ségou
2451935	Sagalo	Mali	Kayes
2453348	Mopti	Mali	Mopti
2453662	Markala	Mali	Ségou
2454268	Koutiala	Mali	Sikasso
2454955	Kolokani	Mali	Koulikoro
2455518	Kayes	Mali	Kayes
2455558	Kati	Mali	Koulikoro
2455735	Kangaba	Mali	Koulikoro
2457163	Gao	Mali	Gao
2458589	Djénné	Mali	Mopti
2459775	Bougouni	Mali	Sikasso
2460546	Banamba	Mali	Koulikoro
2460596	Bamako	Mali	Bamako
2460755	Bafoulabé	Mali	Kayes
1285173	Yenangyaung	Myanmar	Magway
1285871	Nyaungdon	Myanmar	Ayeyarwady
1285899	Yamethin	Myanmar	Mandalay
1289828	Wakema	Myanmar	Ayeyarwady
1290596	Taungoo	Myanmar	Bago
1291193	Thongwa	Myanmar	Yangon
1292037	Thayetmyo	Myanmar	Magway
1292288	Thaton	Myanmar	Mon
1292313	Tharyarwady	Myanmar	Bago
1292579	Thanatpin	Myanmar	Bago
1292580	Thanatpin	Myanmar	Bago
1293625	Dawei	Myanmar	Tanintharyi
1293960	Taunggyi	Myanmar	Shan
1294041	Taungdwingyi	Myanmar	Magway
1295395	Syriam	Myanmar	Yangon
1295765	Sittwe	Myanmar	Rakhine
1296736	Shwebo	Myanmar	Sagain
1298482	Sagaing	Myanmar	Sagain
1298911	Pyu	Myanmar	Bago
1298987	Pyinmana	Myanmar	Mandalay
1299154	Pyay	Myanmar	Bago
1299237	Pyapon	Myanmar	Ayeyarwady
1300466	Bago	Myanmar	Bago
1300969	Paungde	Myanmar	Bago
1302439	Pakokku	Myanmar	Magway
1302849	Hpa-an	Myanmar	Kayin
1303406	Nyaunglebin	Myanmar	Bago
1307741	Myitkyina	Myanmar	Kachin
1307835	Myingyan	Myanmar	Mandalay
1308052	Myawadi	Myanmar	Kayin
1308204	Myanaung	Myanmar	Ayeyarwady
1308415	Mudon	Myanmar	Mon
1308465	Mawlamyine	Myanmar	Mon
1308522	Monywa	Myanmar	Sagain
1308937	Mogok	Myanmar	Mandalay
1309289	Minbu	Myanmar	Magway
1309611	Myeik	Myanmar	Tanintharyi
1309793	Meiktila	Myanmar	Mandalay
1309937	Pyin Oo Lwin	Myanmar	Mandalay
1310120	Mawlaik	Myanmar	Sagain
1310362	Maubin	Myanmar	Ayeyarwady
1310460	Martaban	Myanmar	Mon
1311874	Mandalay	Myanmar	Mandalay
1312609	Magway	Myanmar	Magway
1313479	Loikaw	Myanmar	Kayah
1314042	Letpandan	Myanmar	Bago
1314759	Lashio	Myanmar	Shan
1316703	Kyaukse	Myanmar	Mandalay
1317375	Kyaikto	Myanmar	Mon
1317402	Kyaikkami	Myanmar	Mon
1319533	Kayan	Myanmar	Yangon
1320944	Kanbe	Myanmar	Yangon
1325211	Hinthada	Myanmar	Ayeyarwady
1325443	Hakha	Myanmar	Chin
1327659	Chauk	Myanmar	Magway
1328121	Bogale	Myanmar	Ayeyarwady
1328218	Bhamo	Myanmar	Kachin
1328421	Pathein	Myanmar	Ayeyarwady
1329239	Myaydo	Myanmar	Magway
6611854	Nay Pyi Taw	Myanmar	Mandalay
1515007	Uliastay	Mongolia	Dzabkhan
1515029	Ulaangom	Mongolia	Uvs
1516048	Khovd	Mongolia	Hovd
2028462	Ulan Bator	Mongolia	Ulaanbaatar
2029156	Sühbaatar	Mongolia	Selenge
2030065	Mandalgovi	Mongolia	Middle Govĭ
2030474	Hovd	Mongolia	Övörhangay
2031405	Erdenet	Mongolia	Orhon
2031533	Dzüünharaa	Mongolia	Selenge
2031964	Darhan	Mongolia	Darhan Uul
2032007	Dalandzadgad	Mongolia	Ömnögovĭ
2032081	Saynshand	Mongolia	East Gobi Aymag
2032201	Bulgan	Mongolia	Bulgan
2032532	Bayanhongor	Mongolia	Bayanhongor
2032533	Bayanhongor	Mongolia	Bayanhongor
2032614	Baruun-Urt	Mongolia	Sühbaatar
2032814	Arvayheer	Mongolia	Övörhangay
7648817	Зуунмод	Mongolia	Central Aimak
1821274	Macau	Macao	Macau
3569915	Saint-Joseph	Martinique	Martinique
3569926	Sainte-Marie	Martinique	Martinique
3570166	Petite Rivière Salée	Martinique	Martinique
3570412	Le Robert	Martinique	Martinique
3570428	Le Lamentin	Martinique	Martinique
3570429	Le François	Martinique	Martinique
3570446	La Trinité	Martinique	Martinique
3570675	Fort-de-France	Martinique	Martinique
3570785	Ducos	Martinique	Martinique
2375558	Zouerate	Mauritania	Tiris Zemmour
2376189	Tékane	Mauritania	Trarza
2376719	Sélibaby	Mauritania	Guidimaka
2376898	Rosso	Mauritania	Trarza
2377450	Nouakchott	Mauritania	Nouakchott
2377457	Nouâdhibou	Mauritania	Dakhlet Nouadhibou
2377539	Néma	Mauritania	Hodh ech Chargui
2378538	Kiffa	Mauritania	Assaba
2378736	Kaédi	Mauritania	Gorgol
2381334	Atar	Mauritania	Adrar
2381659	Aleg	Mauritania	Brakna
7266440	Brades	Montserrat	Saint Peter
2562266	Żabbar	Malta	Ħaż-Żabbar
2562305	Valletta	Malta	Il-Belt Valletta
2562629	Qormi	Malta	Qormi
2562704	Mosta	Malta	Il-Mosta
2563191	Birkirkara	Malta	Birkirkara
933945	Vacoas	Mauritius	Plaines Wilhems
933959	Triolet	Mauritius	Pamplemousses
934032	Saint Pierre	Mauritius	Moka
934131	Quatre Bornes	Mauritius	Plaines Wilhems
934154	Port Louis	Mauritius	Port Louis
934322	Mahébourg	Mauritius	Grand Port
934488	Goodlands	Mauritius	Rivière du Rempart
934570	Curepipe	Mauritius	Plaines Wilhems
934631	Centre de Flacq	Mauritius	Flacq
1106809	Le Hochet	Mauritius	Pamplemousses
1282027	Male	Maldives	Kaafu Atoll
235715	Karonga	Malawi	Northern Region
923295	Zomba	Malawi	Southern Region
924055	Salima	Malawi	Central Region
924102	Rumphi	Malawi	Northern Region
924572	Nsanje	Malawi	Southern Region
924705	Nkhotakota	Malawi	Central Region
925475	Mzuzu	Malawi	Northern Region
925498	Mzimba	Malawi	Northern Region
925789	Mulanje	Malawi	Southern Region
926747	Mchinji	Malawi	Central Region
927246	Mangochi	Malawi	Southern Region
927834	Liwonde	Malawi	Southern Region
927967	Lilongwe	Malawi	Central Region
928534	Kasungu	Malawi	Central Region
930025	Dedza	Malawi	Central Region
931755	Blantyre	Malawi	Southern Region
931865	Balaka	Malawi	Southern Region
3483197	San Fernando	Mexico	Tamaulipas
3513966	Zumpango	Mexico	México
3513967	Zumpango del Río	Mexico	Guerrero
3514134	Zacualtipán	Mexico	Hidalgo
3514148	Zacatlán	Mexico	Puebla
3514163	Zacatepec	Mexico	Morelos
3514278	Yecapixtla	Mexico	Morelos
3514321	Yautepec	Mexico	Morelos
3514398	Xoxocotla	Mexico	Morelos
3514409	Xonacatlán	Mexico	Morelos
3514437	Xochitepec	Mexico	Morelos
3514450	Xochimilco	Mexico	Mexico City
3514510	Xicotepec de Juárez	Mexico	Puebla
3514518	Xico	Mexico	Veracruz
3514663	Álvaro Obregón	Mexico	Mexico City
3514670	Villahermosa	Mexico	Tabasco
3514674	Gustavo A. Madero	Mexico	Mexico City
3514683	Villa Cuauhtémoc Otzolotepec	Mexico	México
3514783	Veracruz	Mexico	Veracruz
3514785	Venustiano Carranza	Mexico	Chiapas
3514868	Valle Hermoso	Mexico	Tamaulipas
3514876	Valladolid	Mexico	Yucatán
3514929	Uman	Mexico	Yucatán
3515001	Tuxtla Gutiérrez	Mexico	Chiapas
3515011	Tuxpan de Rodríguez Cano	Mexico	Veracruz
3515042	Tultitlán	Mexico	México
3515044	Tultepec	Mexico	México
3515062	Tulancingo	Mexico	Hidalgo
3515064	Tula de Allende	Mexico	Hidalgo
3515302	Toluca	Mexico	México
3515358	Tlazcalancingo	Mexico	Puebla
3515373	Tlaquiltenango	Mexico	Morelos
3515384	Tlapa de Comonfort	Mexico	Guerrero
3515386	Tlapacoyan	Mexico	Veracruz
3515428	Tlalpan	Mexico	Mexico City
3515431	Tlalnepantla	Mexico	México
3515504	Tizimín	Mexico	Yucatán
3515505	Tizayuca	Mexico	Morelos
3515510	Tixtla de Guerrero	Mexico	Guerrero
3515665	Ticul	Mexico	Yucatán
3515679	Santiago Tíanguistenco	Mexico	México
3515690	Tezontepec de Aldama	Mexico	Hidalgo
3515696	Teziutlan	Mexico	Puebla
3515715	Texcoco de Mora	Mexico	México
3515794	Tequixquiac	Mexico	México
3515796	Tequisquiapan	Mexico	Querétaro
3515811	Tepoztlán	Mexico	Morelos
3515827	Tepotzotlán	Mexico	México
3515904	Tepeaca	Mexico	Puebla
3515906	Tepatlaxco de Hidalgo	Mexico	Puebla
3515942	Teoloyucan	Mexico	México
3515956	Tenosique de Pino Suárez	Mexico	Tabasco
3515993	Tenango de Arista	Mexico	Morelos
3516035	Temixco	Mexico	Morelos
3516053	Temapache	Mexico	Veracruz
3516060	Teloloapan	Mexico	Guerrero
3516076	Tecax	Mexico	Yucatán
3516109	Tehuacán	Mexico	Puebla
3516188	Tecamachalco	Mexico	Puebla
3516210	Teapa	Mexico	Tabasco
3516225	Taxco de Alarcón	Mexico	Guerrero
3516266	Tapachula	Mexico	Chiapas
3516271	Tantoyuca	Mexico	Veracruz
3516355	Tampico	Mexico	Tamaulipas
3516843	Santo Domingo Tehuantepec	Mexico	Oaxaca
3516912	Santiago Tuxtla	Mexico	Veracruz
3516926	Santiago Pinotepa Nacional	Mexico	Oaxaca
3516982	Santiago Tulantepec	Mexico	Hidalgo
3517231	Moyotzingo	Mexico	Puebla
3517270	Santa María Chimalhuacán	Mexico	México
3517517	Santa Cruz Xoxocotlán	Mexico	Oaxaca
3517524	Tecamac de Felipe Villanueva	Mexico	Morelos
3517742	Chiautempan	Mexico	Tlaxcala
3517831	San Salvador El Seco	Mexico	Puebla
3517832	San Salvador Atenco	Mexico	México
3518135	San Pablo de las Salinas	Mexico	México
3518138	San Pablo Autopan	Mexico	Morelos
3518221	San Miguel Zinacantepec	Mexico	México
3518277	Coatlinchán	Mexico	México
3518387	San Mateo Atenco	Mexico	Morelos
3518475	Teolocholco	Mexico	Tlaxcala
3518618	Teotihuacán de Arista	Mexico	Morelos
3518692	San Juan del Río	Mexico	Querétaro
3518723	Tuxtepec	Mexico	Oaxaca
3519290	San Francisco Acuautla	Mexico	México
3519531	Sanctorum	Mexico	Puebla
3519537	San Cristóbal de las Casas	Mexico	Chiapas
3519907	San Andres Tuxtla	Mexico	Veracruz
3520064	Salina Cruz	Mexico	Oaxaca
3520235	Río Verde	Mexico	San Luis Potosí
3520271	Río Bravo	Mexico	Tamaulipas
3520274	Río Blanco	Mexico	Veracruz
3520339	Reynosa	Mexico	Tamaulipas
3520994	Puerto Escondido	Mexico	Oaxaca
3521051	Puente de Ixtla	Mexico	Morelos
3521081	Puebla	Mexico	Puebla
3521103	Progreso de Alvaro Obregon	Mexico	Hidalgo
3521108	Progreso de Castro	Mexico	Yucatán
3521305	Polanco	Mexico	Mexico City
3521342	Playa del Carmen	Mexico	Quintana Roo
3521476	Pijijiapan	Mexico	Chiapas
3521596	Peto	Mexico	Yucatán
3521628	Perote	Mexico	Veracruz
3521912	Paraiso	Mexico	Tabasco
3521922	Papantla de Olarte	Mexico	Veracruz
3521941	Pánuco	Mexico	Veracruz
3522118	Palmarito Tochapán	Mexico	Puebla
3522164	Palenque	Mexico	Chiapas
3522210	Pachuca de Soto	Mexico	Hidalgo
3522232	Ozumba de Alzate	Mexico	México
3522251	Oxkutzkab	Mexico	Yucatán
3522307	Orizaba	Mexico	Veracruz
3522343	Ometepec	Mexico	Guerrero
3522444	Ocozocoautla de Espinosa	Mexico	Chiapas
3522445	Ocoyoacac	Mexico	Morelos
3522484	Ocosingo	Mexico	Chiapas
3522507	Oaxaca de Juárez	Mexico	Oaxaca
3522551	Nuevo Laredo	Mexico	Tamaulipas
3522696	Nogales	Mexico	Veracruz
3522790	Naucalpan de Juárez	Mexico	México
3522804	Naranjos	Mexico	Veracruz
3522845	Villa Nanchital	Mexico	Veracruz
3522924	Motul	Mexico	Yucatán
3522926	Motozintla	Mexico	Chiapas
3523011	Montemorelos	Mexico	Nuevo León
3523061	Santiago Momoxpan	Mexico	Puebla
3523127	Mixquiahuala de Juarez	Mexico	Hidalgo
3523141	Misantla	Mexico	Veracruz
3523149	Miramar	Mexico	Tamaulipas
3523183	Minatitlan	Mexico	Veracruz
3523202	Milpa Alta	Mexico	Mexico City
3523240	Miahuatlán de Porfirio Díaz	Mexico	Oaxaca
3523303	Metepec	Mexico	Morelos
3523349	Mérida	Mexico	Yucatán
3523466	Heroica Matamoros	Mexico	Tamaulipas
3523513	Martínez de la Torre	Mexico	Veracruz
3523590	Mapastepec	Mexico	Chiapas
3523683	Malinaltepec	Mexico	Guerrero
3523760	Magdalena Contreras	Mexico	Mexico City
3523791	Macuspana	Mexico	Tabasco
3523900	Reyes Acozac	Mexico	Morelos
3523908	Los Reyes La Paz	Mexico	México
3524348	Linares	Mexico	Nuevo León
3524389	Lerma de Villada	Mexico	Morelos
3524391	Lerdo de Tejada	Mexico	Veracruz
3524744	Las Margaritas	Mexico	Chiapas
3524903	Las Choapas	Mexico	Veracruz
3525596	La Isla	Mexico	Veracruz
3526323	Kanasín	Mexico	Yucatán
3526357	Juchitán de Zaragoza	Mexico	Oaxaca
3526467	Jojutla	Mexico	Morelos
3526485	Jiutepec	Mexico	Morelos
3526617	Xalapa de Enríquez	Mexico	Veracruz
3526657	Izúcar de Matamoros	Mexico	Puebla
3526674	San Jerónimo Ixtepec	Mexico	Oaxaca
3526681	Ixtapan de la Sal	Mexico	México
3526682	Ixtapaluca	Mexico	México
3526683	Iztapalapa	Mexico	Mexico City
3526696	Ixtac Zoquitlán	Mexico	Veracruz
3526700	Iztacalco	Mexico	Mexico City
3526708	Ixmiquilpan	Mexico	Hidalgo
3526798	Iguala de la Independencia	Mexico	Guerrero
3526855	Huixtla	Mexico	Chiapas
3526864	Huitzuco de los Figueroa	Mexico	Guerrero
3526908	Huimanguillo	Mexico	Tabasco
3526952	Huejutla de Reyes	Mexico	Hidalgo
3526953	Huejotzingo	Mexico	Puebla
3526992	Huauchinango	Mexico	Puebla
3526993	Huatusco de Chicuellar	Mexico	Veracruz
3527023	Ciudad de Huajuapan de León	Mexico	Oaxaca
3527542	Frontera Comalapa	Mexico	Chiapas
3527545	Frontera	Mexico	Tabasco
3527639	Felipe Carrillo Puerto	Mexico	Quintana Roo
3527795	Escárcega	Mexico	Campeche
3527879	Emiliano Zapata	Mexico	Morelos
3527880	Emiliano Zapata	Mexico	Chiapas
3528756	Ciudad Mante	Mexico	Tamaulipas
3529612	Ecatepec	Mexico	México
3529886	Cunduacán	Mexico	Tabasco
3529947	Cuernavaca	Mexico	Morelos
3529981	Cuautlancingo	Mexico	Puebla
3529982	Cuautla Morelos	Mexico	Morelos
3529986	Cuautitlán	Mexico	México
3529989	Cuautepec de Hinojosa	Mexico	Hidalgo
3530049	Cuajimalpa	Mexico	Mexico City
3530103	San Miguel de Cozumel	Mexico	Quintana Roo
3530123	Coyotepec	Mexico	Morelos
3530139	Coyoacán	Mexico	Mexico City
3530167	Cosoleacaque	Mexico	Veracruz
3530240	Córdoba	Mexico	Veracruz
3530276	San Bernardino Contla	Mexico	Tlaxcala
3530367	Comitán	Mexico	Chiapas
3530385	Comalcalco	Mexico	Tabasco
3530513	Coatzintla	Mexico	Veracruz
3530517	Coatzacoalcos	Mexico	Veracruz
3530531	Coatepec	Mexico	Veracruz
3530569	Coacalco	Mexico	México
3530580	Ciudad Victoria	Mexico	Tamaulipas
3530582	Ciudad Valles	Mexico	San Luis Potosí
3530584	Ciudad Serdán	Mexico	Puebla
3530587	Ciudad Sahagun	Mexico	Hidalgo
3530589	Ciudad Nezahualcoyotl	Mexico	México
3530590	Ciudad Miguel Alemán	Mexico	Tamaulipas
3530592	Ciudad Mendoza	Mexico	Veracruz
3530594	Ciudad Madero	Mexico	Tamaulipas
3530596	Ciudad Fernández	Mexico	San Luis Potosí
3530597	Mexico City	Mexico	Mexico City
3530599	Ciudad del Carmen	Mexico	Campeche
3530757	Cholula	Mexico	Puebla
3530870	Chilpancingo de los Bravos	Mexico	Guerrero
3530886	Chilapa de Alvarez	Mexico	Guerrero
3530908	Chignahuapan	Mexico	Puebla
3530932	Chiconcuac	Mexico	México
3530937	San Vicente Chicoloapan	Mexico	México
3530978	Chichén-Itzá	Mexico	Yucatán
3531007	Chiautla	Mexico	México
3531013	Chiapa de Corzo	Mexico	Chiapas
3531023	Chetumal	Mexico	Quintana Roo
3531177	Champotón	Mexico	Campeche
3531200	Chalco de Díaz Covarrubias	Mexico	México
3531321	Cerro Azul	Mexico	Veracruz
3531416	Catemaco	Mexico	Veracruz
3531556	Carlos A. Carrillo	Mexico	Veracruz
3531574	Cardenas	Mexico	San Luis Potosí
3531576	Cárdenas	Mexico	Tabasco
3531598	Capulhuac	Mexico	Morelos
3531673	Cancún	Mexico	Quintana Roo
3531732	Campeche	Mexico	Campeche
3531865	Cadereyta	Mexico	Nuevo León
3532254	Berriozábal	Mexico	Chiapas
3532414	Banderilla	Mexico	Veracruz
3532497	Azcapotzalco	Mexico	Mexico City
3532545	Axochiapan	Mexico	Morelos
3532592	Atlixco	Mexico	Puebla
3532617	Atlacomulco	Mexico	México
3532624	Ciudad López Mateos	Mexico	México
3532792	Apizaco	Mexico	Tlaxcala
3532815	Apan	Mexico	Hidalgo
3532881	Amozoc de Mota	Mexico	Puebla
3532899	Amecameca	Mexico	México
3532969	Altotonga	Mexico	Veracruz
3532989	Altepexi	Mexico	Puebla
3533005	Altamira	Mexico	Tamaulipas
3533056	Allende	Mexico	Veracruz
3533107	Álamo	Mexico	Veracruz
3533126	Ajalpan	Mexico	Puebla
3533269	Agua Dulce	Mexico	Veracruz
3533389	Actopan	Mexico	Hidalgo
3533426	Acayucan	Mexico	Veracruz
3533433	Acatzingo de Hidalgo	Mexico	Puebla
3533440	Acatlán de Osorio	Mexico	Puebla
3533462	Acapulco de Juárez	Mexico	Guerrero
3533486	Acajete	Mexico	Puebla
3762770	San Antonio de la Cal	Mexico	Oaxaca
3792044	Hidalgo	Mexico	Nuevo León
3802739	Río de Teapa	Mexico	Tabasco
3815324	Huamantla	Mexico	Tlaxcala
3815392	Zacatelco	Mexico	Tlaxcala
3815447	Papalotla	Mexico	Tlaxcala
3815453	Vicente Guerrero	Mexico	Tlaxcala
3816721	Tonalá	Mexico	Chiapas
3816739	Arriaga	Mexico	Chiapas
3818742	San Andrés Cholula	Mexico	Puebla
3824166	Tampico	Mexico	Tamaulipas
3824536	Alto Lucero	Mexico	Veracruz
3827254	San Mateo Otzacatipan	Mexico	Morelos
3827256	Santa María Totoltepec	Mexico	México
3827403	San Lorenzo Acopilco	Mexico	Mexico City
3827406	Benito Juarez	Mexico	Mexico City
3827407	Venustiano Carranza	Mexico	Mexico City
3827408	Miguel Hidalgo	Mexico	Mexico City
3827409	Cuauhtémoc	Mexico	Mexico City
3827414	Huixquilucan	Mexico	México
3827586	Melchor Ocampo	Mexico	México
3827588	Huilango	Mexico	México
3827598	Ojo de Agua	Mexico	México
3827606	Buenavista	Mexico	México
3970972	Miguel Alemán (La Doce)	Mexico	Sonora
3976999	Cihuatlán	Mexico	Jalisco
3979505	Guadalupe Victoria	Mexico	Baja California
3979673	Ixtapa-Zihuatanejo	Mexico	Guerrero
3979717	Zapotlanejo	Mexico	Jalisco
3979727	Zapotiltic	Mexico	Jalisco
3979770	Zapopan	Mexico	Jalisco
3979802	Zamora	Mexico	Michoacán
3979822	Zacoalco de Torres	Mexico	Jalisco
3979844	Zacatecas	Mexico	Zacatecas
3979846	Zacapú	Mexico	Michoacán
3979856	Yurécuaro	Mexico	Michoacán
3980174	Villagrán	Mexico	Guanajuato
3980180	Ciudad Frontera	Mexico	Coahuila
3980190	García	Mexico	Nuevo León
3980194	Ciudad de Villa de Álvarez	Mexico	Colima
3980605	Valle de Santiago	Mexico	Guanajuato
3980621	Valle de Bravo	Mexico	México
3980760	Uruapan	Mexico	Michoacán
3980777	Uriangato	Mexico	Guanajuato
3980844	Tuxpan	Mexico	Jalisco
3981254	Torreon	Mexico	Coahuila
3981369	Tonalá	Mexico	Jalisco
3981461	Tlaquepaque	Mexico	Jalisco
3981609	Tijuana	Mexico	Baja California
3981791	Tesistán	Mexico	Jalisco
3981885	Tequila	Mexico	Jalisco
3981941	Tepic	Mexico	Nayarit
3981984	Tepatitlán de Morelos	Mexico	Jalisco
3982007	Tepalcatepec	Mexico	Michoacán
3982034	Teocaltiche	Mexico	Jalisco
3982121	Tejupilco de Hidalgo	Mexico	México
3982213	Tecoman	Mexico	Colima
3982266	Tecate	Mexico	Baja California
3982545	Tangancícuaro de Arista	Mexico	México
3982567	Tamazula de Gordiano	Mexico	Jalisco
3982616	Tala	Mexico	Jalisco
3982693	Tacámbaro de Codallos	Mexico	Michoacán
3982887	Sombrerete	Mexico	Zacatecas
3983058	Silao	Mexico	Guanajuato
3983216	Sayula	Mexico	Jalisco
3983631	Santiago Papasquiaro	Mexico	Durango
3983636	Santiago Ixcuintla	Mexico	Nayarit
3983671	Santiago	Mexico	Nuevo León
3983820	Santa Rosa Jauregui	Mexico	Querétaro
3984583	Santa Catarina	Mexico	Nuevo León
3984680	Santa Anita	Mexico	Jalisco
3984791	San Sebastián el Grande	Mexico	Jalisco
3985129	San Pedro	Mexico	Coahuila
3985241	San Nicolás de los Garza	Mexico	Nuevo León
3985323	San Miguel el Alto	Mexico	Jalisco
3985327	San Miguel de Papasquiaro	Mexico	Durango
3985344	San Miguel de Allende	Mexico	Guanajuato
3985604	San Luis Río Colorado	Mexico	Sonora
3985606	San Luis Potosí	Mexico	San Luis Potosí
3985620	San Luis de la Paz	Mexico	Guanajuato
3985621	San Luis de la Paz	Mexico	Guerrero
3985710	Cabo San Lucas	Mexico	Baja California Sur
3985865	San Juan de los Lagos	Mexico	Jalisco
3986172	San José del Cabo	Mexico	Baja California Sur
3986984	San Francisco del Rincón	Mexico	Guanajuato
3987224	San Felipe	Mexico	Baja California
3987246	San Felipe	Mexico	Guanajuato
3987500	San Buenaventura	Mexico	Coahuila
3988025	Nicolás R Casillas	Mexico	Jalisco
3988050	Salvatierra	Mexico	Guanajuato
3988086	Saltillo	Mexico	Coahuila
3988214	Salamanca	Mexico	Guanajuato
3988258	Sahuayo de Morelos	Mexico	Michoacán
3988327	Sabinas Hidalgo	Mexico	Nuevo León
3988333	Ciudad Sabinas	Mexico	Coahuila
3988392	Rosarito	Mexico	Baja California
3988462	Romita	Mexico	Guanajuato
3988594	Río Grande	Mexico	Zacatecas
3988651	Rincón de Romos	Mexico	Aguascalientes
3991043	Ramos Arizpe	Mexico	Coahuila
3991164	Santiago de Querétaro	Mexico	Querétaro
3991219	Puruándiro	Mexico	México
3991328	Puerto Vallarta	Mexico	Jalisco
3992619	Piedras Negras	Mexico	Coahuila
3992842	Petatlán	Mexico	Guerrero
3992986	Pénjamo	Mexico	Guanajuato
3993179	Pátzcuaro	Mexico	Michoacán
3993335	Parras de la Fuente	Mexico	Coahuila
3993457	Paracho de Verduzco	Mexico	Michoacán
3993893	Palau	Mexico	Coahuila
3994469	Ojinaga	Mexico	Chihuahua
3994489	Ocotlán	Mexico	Jalisco
3994604	Nuevo México	Mexico	Jalisco
3994616	Nuevo Casas Grandes	Mexico	Chihuahua
3994667	Nueva Rosita	Mexico	Coahuila
3994674	Nueva Italia de Ruiz	Mexico	Michoacán
3994912	Nochistlán	Mexico	Zacatecas
3995017	Navolato	Mexico	Sinaloa
3995019	Navojoa	Mexico	Sonora
3995050	Nava	Mexico	Coahuila
3995343	Moroleón	Mexico	Guanajuato
3995465	Monterrey	Mexico	Nuevo León
3995523	Monclova	Mexico	Coahuila
3996069	Mexicali	Mexico	Baja California
3996234	Pedro Meoqui	Mexico	Chihuahua
3996271	Melchor Múzquiz	Mexico	Coahuila
3996299	Medina	Mexico	Guanajuato
3996322	Mazatlán	Mexico	Sinaloa
3996387	Matehuala	Mexico	San Luis Potosí
3996426	Matamoros	Mexico	Coahuila
3996595	Marfil	Mexico	Guanajuato
3996626	Maravatío	Mexico	Michoacán
3996663	Manzanillo	Mexico	Colima
3996893	Magdalena de Kino	Mexico	Sonora
3996956	San Pedro Madera	Mexico	Chihuahua
3997479	Los Mochis	Mexico	Sinaloa
3998291	Loreto	Mexico	Zacatecas
3998655	León	Mexico	Guanajuato
3999325	Las Pintas de Arriba	Mexico	Jalisco
4000900	La Paz	Mexico	Baja California Sur
4001056	La Orilla	Mexico	Michoacán
4002224	Lagos de Moreno	Mexico	Jalisco
4002745	La Cruz	Mexico	Sinaloa
4003526	La Barca	Mexico	Jalisco
4003662	Santa Cruz de Juventino Rosas	Mexico	Guanajuato
4003908	Jocotepec	Mexico	Jalisco
4003923	Jiquílpan de Juárez	Mexico	México
4003938	Jiménez	Mexico	Chihuahua
4003995	Jesús María	Mexico	Aguascalientes
4004092	Jaral del Progreso	Mexico	Guanajuato
4004126	Jamay	Mexico	Jalisco
4004153	Jalostotitlán	Mexico	Jalisco
4004267	Ixtlán del Río	Mexico	Nayarit
4004293	Ixtapa	Mexico	Jalisco
4004330	Irapuato	Mexico	Guanajuato
4004555	Huetamo de Núñez	Mexico	Michoacán
4004647	Huatabampo	Mexico	Sonora
4004867	Hidalgo del Parral	Mexico	Chihuahua
4004885	Heróica Zitácuaro	Mexico	Michoacán
4004886	Nogales	Mexico	Sonora
4004887	Heroica Caborca	Mexico	Sonora
4004898	Hermosillo	Mexico	Sonora
4005143	Heroica Guaymas	Mexico	Sonora
4005219	Guasave	Mexico	Sinaloa
4005270	Guanajuato	Mexico	Guanajuato
4005297	Guamúchil	Mexico	Sinaloa
4005492	Guadalupe	Mexico	Nuevo León
4005509	Guadalupe	Mexico	Zacatecas
4005539	Guadalajara	Mexico	Jalisco
4005864	Juan Jose Rios	Mexico	Sinaloa
4005867	General Escobedo	Mexico	Nuevo León
4005937	Garza García	Mexico	Nuevo León
4006163	Fresnillo	Mexico	Zacatecas
4006622	Escuinapa de Hidalgo	Mexico	Sinaloa
4006702	Ensenada	Mexico	Baja California
4006783	Encarnación de Díaz	Mexico	Jalisco
4006806	Empalme	Mexico	Sonora
4007676	Pueblo Nuevo	Mexico	Durango
4007684	El Salto	Mexico	Jalisco
4008303	El Pueblito	Mexico	Querétaro
4009697	El Grullo	Mexico	Jalisco
4011743	Victoria de Durango	Mexico	Durango
4012176	Culiacán	Mexico	Sinaloa
4012406	Cuauhtémoc	Mexico	Chihuahua
4012693	Villa de Costa Rica	Mexico	Sinaloa
4012721	Cortazar	Mexico	Guanajuato
4013085	Compostela	Mexico	Nayarit
4013516	Colima	Mexico	Colima
4013704	Ciudad Obregón	Mexico	Sonora
4013706	Ciudad Lerdo	Mexico	Coahuila
4013708	Ciudad Juárez	Mexico	Chihuahua
4013712	Ciudad Hidalgo	Mexico	Michoacán
4013714	Ciudad Guzmán	Mexico	Jalisco
4013720	Ciudad Delicias	Mexico	Chihuahua
4013723	Ciudad Constitución	Mexico	Baja California Sur
4013724	Ciudad Camargo	Mexico	Chihuahua
4013726	Ciudad Anáhuac	Mexico	Nuevo León
4013727	Ciudad Altamirano	Mexico	Guerrero
4013728	Ciudad Acuña	Mexico	Coahuila
4014338	Chihuahua	Mexico	Chihuahua
4014553	Chapala	Mexico	Jalisco
4015022	Castaños	Mexico	Coahuila
4015700	Cananea	Mexico	Sonora
4015938	Villa Juárez	Mexico	Sinaloa
4016086	Calvillo	Mexico	Aguascalientes
4016132	Víctor Rosales	Mexico	Zacatecas
4017957	Autlán de Navarro	Mexico	Jalisco
4017984	Atoyac de Álvarez	Mexico	Guerrero
4017992	Atotonilco el Alto	Mexico	Jalisco
4018227	Armeria	Mexico	Colima
4018320	Arcelia	Mexico	Guerrero
4018348	Arandas	Mexico	Jalisco
4018390	Apodaca	Mexico	Nuevo León
4018403	Apaseo el Grande	Mexico	Guanajuato
4018404	Apaseo el Alto	Mexico	Guanajuato
4018582	Ameca	Mexico	Jalisco
4018761	Allende	Mexico	Coahuila
4018762	Allende	Mexico	Nuevo León
4019233	Aguascalientes	Mexico	Aguascalientes
4019260	Agua Prieta	Mexico	Sonora
4019819	Acaponeta	Mexico	Nayarit
4019827	Acámbaro	Mexico	Guanajuato
4019869	Abasolo	Mexico	Guanajuato
4022908	Anáhuac	Mexico	Nuevo León
4026075	Guacamayas	Mexico	Michoacán
4026082	Ciudad Lázaro Cárdenas	Mexico	Michoacán
7280708	Colonia del Valle	Mexico	Mexico City
7280711	Colonia Lindavista	Mexico	México
7280718	Colonia Nativitas	Mexico	Mexico City
8599061	Las Delicias	Mexico	Baja California
8617692	San Pedro Garza Garcia	Mexico	Nuevo León
8858078	Soledad de Graciano Sánchez	Mexico	San Luis Potosí
8858079	Manzanillo	Mexico	Colima
8858082	Naucalpan de Juárez	Mexico	México
8858085	Hacienda Santa Fe	Mexico	Jalisco
8858086	Fuentes del Valle	Mexico	México
8858087	San Salvador Tizatlalli	Mexico	México
8858088	Jardines de la Silla (Jardines)	Mexico	Nuevo León
8858089	San Buenaventura	Mexico	México
8858090	Colonia Santa Teresa	Mexico	México
8858091	San Jerónimo Cuatro Vientos	Mexico	México
8858092	San Martín Azcatepec	Mexico	México
8858093	Fraccionamiento Real Palmas	Mexico	Nuevo León
8858094	Pórticos de San Antonio	Mexico	Baja California
8858095	San Isidro	Mexico	México
8858096	Centro Familiar la Soledad	Mexico	Guanajuato
8858097	San José Guadalupe Otzacatipan	Mexico	México
8858098	Las Pintitas	Mexico	Jalisco
8858099	Emiliano Zapata	Mexico	México
8858100	San Antonio Tecómitl	Mexico	Mexico City
8858102	Teotihuacán de Arista	Mexico	México
8858104	San Jorge Pueblo Nuevo	Mexico	México
8858105	Manuel Ojinaga	Mexico	Chihuahua
8858106	Terrazas del Valle	Mexico	Baja California
8858107	La Ermita	Mexico	Guanajuato
8858108	Lomas del Sur	Mexico	Jalisco
8858109	Parque Industrial Ciudad Mitras	Mexico	Nuevo León
8858110	Mitras Poniente	Mexico	Nuevo León
8858111	Villa del Prado 2da Sección	Mexico	Baja California
8858112	Tres de Mayo	Mexico	Morelos
8858113	Don Antonio	Mexico	Hidalgo
8858114	Heroica Ciudad de Tlaxiaco	Mexico	Oaxaca
8858115	Ciudad de Huitzuco	Mexico	Guerrero
8858116	Casa Blanca	Mexico	Puebla
8858118	Ampliación San Mateo (Colonia Solidaridad)	Mexico	México
8858119	Fraccionamiento Ciudad Olmeca	Mexico	Veracruz
8858120	San Rafael Tlanalapan	Mexico	Puebla
8858121	Tecámac de Felipe Villanueva	Mexico	México
8858122	Venceremos	Mexico	Querétaro
8858123	Alborada Jaltenco	Mexico	México
8858124	Crucecita	Mexico	Oaxaca
1222387	Padang Mat Sirat	Malaysia	Kedah
1222396	Kuah	Malaysia	Kedah
1732602	Jerantut	Malaysia	Pahang
1732663	Raub	Malaysia	Pahang
1732687	Batu Pahat	Malaysia	Johor
1732698	Parit Raja	Malaysia	Johor
1732706	Pekan Nenas	Malaysia	Johor
1732711	Pontian Kechil	Malaysia	Johor
1732721	Kampung Pasir Gudang Baru	Malaysia	Johor
1732738	Kota Tinggi	Malaysia	Johor
1732741	Taman Senai	Malaysia	Johor
1732742	Kulai	Malaysia	Johor
1732745	Skudai	Malaysia	Johor
1732811	Kluang	Malaysia	Johor
1732814	Yong Peng	Malaysia	Johor
1732826	Mersing	Malaysia	Johor
1732846	Segamat	Malaysia	Johor
1732857	Tangkak	Malaysia	Johor
1732869	Muar	Malaysia	Johor
1732871	Bakri	Malaysia	Johor
1732877	Labis	Malaysia	Johor
1732891	Kuala Selangor	Malaysia	Selangor
1732892	Batang Berjuntai	Malaysia	Selangor
1732893	Batu Arang	Malaysia	Selangor
1732903	Shah Alam	Malaysia	Selangor
1732905	Klang	Malaysia	Selangor
1732945	Cukai	Malaysia	Terengganu
1733353	Papar	Malaysia	Sabah
1733432	Kota Kinabalu	Malaysia	Sabah
1733438	Donggongon	Malaysia	Sabah
1733440	Putatan	Malaysia	Sabah
1733449	Kinarut	Malaysia	Sabah
1733502	Ranau	Malaysia	Sabah
1733697	Semporna	Malaysia	Sabah
1733782	Victoria	Malaysia	Labuan
1733874	Beaufort	Malaysia	Sabah
1733953	Lahad Datu	Malaysia	Sabah
1734052	Sandakan	Malaysia	Sabah
1734098	Keningau	Malaysia	Sabah
1734199	Tawau	Malaysia	Sabah
1734313	Paka	Malaysia	Terengganu
1734393	Kulim	Malaysia	Kedah
1734409	Bagan Serai	Malaysia	Perak
1734439	Bedong	Malaysia	Kedah
1734576	Simpang Empat	Malaysia	Perak
1734586	Taiping	Malaysia	Perak
1734599	Kuala Kangsar	Malaysia	Perak
1734634	Ipoh	Malaysia	Perak
1734651	Gua Musang	Malaysia	Kelantan
1734705	Kuala Terengganu	Malaysia	Terengganu
1734715	Marang	Malaysia	Terengganu
1734738	Tampin	Malaysia	Negeri Sembilan
1734745	Alor Gajah	Malaysia	Melaka
1734757	Sungai Udang	Malaysia	Melaka
1734759	Malacca	Malaysia	Melaka
1734781	Banting	Malaysia	Selangor
1734793	Jenjarum	Malaysia	Selangor
1734798	Semenyih	Malaysia	Selangor
1734810	Seremban	Malaysia	Negeri Sembilan
1734815	Port Dickson	Malaysia	Negeri Sembilan
1734821	Sepang	Malaysia	Selangor
1734839	Bahau	Malaysia	Negeri Sembilan
1734841	Kuala Pilah	Malaysia	Negeri Sembilan
1734971	Pekan	Malaysia	Pahang
1735018	Mentekab	Malaysia	Pahang
1735022	Temerluh	Malaysia	Pahang
1735076	Butterworth	Malaysia	Penang
1735077	Perai	Malaysia	Penang
1735079	Bukit Mertajam	Malaysia	Penang
1735089	Parit Buntar	Malaysia	Perak
1735093	Tasek Glugor	Malaysia	Penang
1735106	George Town	Malaysia	Penang
1735148	Serendah	Malaysia	Selangor
1735150	Rawang	Malaysia	Selangor
1735158	Petaling Jaya	Malaysia	Selangor
1735161	Kuala Lumpur	Malaysia	Kuala Lumpur
1735195	Sabak Bernam	Malaysia	Selangor
1735199	Sungai Besar	Malaysia	Selangor
1735227	Kuantan	Malaysia	Pahang
1735268	Batu Gajah	Malaysia	Perak
1735274	Kampar	Malaysia	Perak
1735282	Tapah Road	Malaysia	Perak
1735287	Bidur	Malaysia	Perak
1735450	Lumut	Malaysia	Perak
1735459	Teluk Intan	Malaysia	Perak
1735485	Gurun	Malaysia	Kedah
1735506	Kepala Batas	Malaysia	Penang
1735553	Tanah Merah	Malaysia	Kelantan
1735634	Kuching	Malaysia	Sarawak
1735799	Simanggang	Malaysia	Sarawak
1735837	Sarikei	Malaysia	Sarawak
1735902	Sibu	Malaysia	Sarawak
1736278	Kangar	Malaysia	Perlis
1736302	Jitra	Malaysia	Kedah
1736305	Kuala Kedah	Malaysia	Kedah
1736309	Alor Setar	Malaysia	Kedah
1736372	Pasir Mas	Malaysia	Kelantan
1736376	Kota Bharu	Malaysia	Kelantan
1736458	Kudat	Malaysia	Sabah
1737486	Bintulu	Malaysia	Sarawak
1737714	Limbang	Malaysia	Sarawak
1738050	Miri	Malaysia	Sarawak
1738294	Ulu Tiram	Malaysia	Johor
1741550	Tanjung Tokong	Malaysia	Penang
1741562	Tanjung Sepat	Malaysia	Selangor
1750500	Permatang Kuching	Malaysia	Penang
1750582	Peringat	Malaysia	Kelantan
1752256	Pantai Remis	Malaysia	Perak
1759486	Kuang	Malaysia	Selangor
1761242	Klebang Besar	Malaysia	Melaka
1763412	Kampung Tanjung Karang	Malaysia	Selangor
1764160	Kampung Sungai Ara	Malaysia	Penang
1764318	Kampung Simpang Renggam	Malaysia	Johor
1766249	Kampong Pangkal Kalong	Malaysia	Kelantan
1767021	Kampong Masjid Tanah	Malaysia	Melaka
1768664	Kampong Kadok	Malaysia	Kelantan
1769612	Kampong Dungun	Malaysia	Perak
1770351	Kampung Bukit Baharu	Malaysia	Melaka
1771023	Kampung Baru Subang	Malaysia	Selangor
1771287	Kampung Baharu Nilai	Malaysia	Negeri Sembilan
1771304	Kampong Baharu Balakong	Malaysia	Selangor
1771485	Kampung Ayer Molek	Malaysia	Melaka
1778290	Bukit Rambai	Malaysia	Melaka
1779790	Bentong Town	Malaysia	Pahang
1780890	Batu Berendam	Malaysia	Melaka
6697380	Putrajaya	Malaysia	Putrajaya
8504423	Subang Jaya	Malaysia	Selangor
10792382	Putra Heights	Malaysia	Selangor
11002069	Pantai Cenang	Malaysia	Perlis
1024552	Xai-Xai	Mozambique	Gaza
1024696	Dondo	Mozambique	Sofala
1024701	Macia	Mozambique	Gaza
1026014	Tete	Mozambique	Tete
1028079	Ressano Garcia	Mozambique	Maputo
1028434	Quelimane	Mozambique	Zambézia
1028918	Pemba	Mozambique	Cabo Delgado
1033356	Nampula	Mozambique	Nampula
1035025	Nacala	Mozambique	Nampula
1037125	Montepuez	Mozambique	Cabo Delgado
1037370	Mocímboa	Mozambique	Cabo Delgado
1039536	Maxixe	Mozambique	Inhambane
1039854	Matola	Mozambique	Maputo
1040652	Maputo	Mozambique	Maputo City
1040938	Manjacaze	Mozambique	Gaza
1043893	Lichinga	Mozambique	Niassa
1045114	Inhambane	Mozambique	Inhambane
1047660	Cuamba	Mozambique	Niassa
1048364	Chokwé	Mozambique	Gaza
1049261	Chimoio	Mozambique	Manica
1049861	Chibuto	Mozambique	Gaza
1052373	Beira	Mozambique	Sofala
1052944	António Enes	Mozambique	Nampula
1088155	Mutuáli	Mozambique	Nampula
877178	Katima Mulilo	Namibia	Zambezi
3352136	Windhoek	Namibia	Khomas
3352844	Swakopmund	Namibia	Erongo
3353383	Rundu	Namibia	Kavango East
3353540	Rehoboth	Namibia	Hardap
3353811	Otjiwarongo	Namibia	Otjozondjupa
3354021	Oshakati	Namibia	Oshana
3355672	Lüderitz	Namibia	Karas
3356264	Keetmanshoop	Namibia	Karas
3357114	Grootfontein	Namibia	Otjozondjupa
3357247	Gobabis	Namibia	Omaheke
3359638	Walvis Bay	Namibia	Erongo
2139521	Nouméa	New Caledonia	South Province
2140066	Mont-Dore	New Caledonia	South Province
2141394	Dumbéa	New Caledonia	South Province
2437732	Birni N Konni	Niger	Tahoua
2437798	Zinder	Niger	Zinder
2438678	Tillabéri	Niger	Tillabéri
2438774	Tibiri	Niger	Maradi
2438823	Tessaoua	Niger	Maradi
2438855	Téra	Niger	Tillabéri
2439155	Tanout	Niger	Zinder
2439376	Tahoua	Niger	Tahoua
2440485	Niamey	Niger	Niamey
2440495	Nguigmi	Niger	Diffa
2441194	Mayahi	Niger	Maradi
2441217	Matamey	Niger	Zinder
2441291	Maradi	Niger	Maradi
2441482	Magaria	Niger	Zinder
2441530	Madaoua	Niger	Tahoua
2443304	Illéla	Niger	Tahoua
2444489	Gaya	Niger	Dosso
2445488	Dosso	Niger	Dosso
2445553	Dogondoutchi	Niger	Dosso
2445704	Diffa	Niger	Diffa
2446267	Dakoro	Niger	Maradi
2447416	Ayorou	Niger	Tillabéri
2447938	Alaghsas	Niger	Agadez
2448085	Agadez	Niger	Agadez
2317548	Zuru	Nigeria	Kebbi
2317569	Zungeru	Nigeria	Niger
2317765	Zaria	Nigeria	Kaduna
2318044	Yola	Nigeria	Adamawa
2318123	Yenagoa	Nigeria	Bayelsa
2318921	Wukari	Nigeria	Taraba
2318933	Wudil	Nigeria	Kano
2319133	Warri	Nigeria	Delta
2319257	Wamba	Nigeria	Nassarawa
2319480	Uyo	Nigeria	Akwa Ibom
2319668	Uromi	Nigeria	Edo
2320576	Umuahia	Nigeria	Abia
2320829	Ughelli	Nigeria	Delta
2320831	Ugep	Nigeria	Cross River
2320920	Uga	Nigeria	Anambra
2321031	Ubiaja	Nigeria	Edo
2322495	Tambuwal	Nigeria	Sokoto
2322529	Talata Mafara	Nigeria	Zamfara
2322552	Takum	Nigeria	Benue
2322794	Suleja	Nigeria	Niger
2322911	Sokoto	Nigeria	Sokoto
2322957	Soba	Nigeria	Kaduna
2323390	Saki	Nigeria	Oyo
2323411	Shagamu	Nigeria	Ogun
2323675	Sapele	Nigeria	Delta
2324504	Rijau	Nigeria	Niger
2324575	Rano	Nigeria	Kano
2324767	Potiskum	Nigeria	Yobe
2324857	Pindiga	Nigeria	Gombe
2325060	Pankshin	Nigeria	Plateau
2325161	Ozubulu	Nigeria	Anambra
2325200	Oyo	Nigeria	Oyo
2325249	Oyan	Nigeria	Osun
2325314	Owo	Nigeria	Ondo
2325330	Owerri	Nigeria	Imo
2325506	Otan Ayegbaju	Nigeria	Osun
2325590	Osogbo	Nigeria	Osun
2325733	Orita Eruwa	Nigeria	Oyo
2326016	Onitsha	Nigeria	Anambra
2326171	Ondo	Nigeria	Ondo
2326302	Olupona	Nigeria	Osun
2326811	Okuta	Nigeria	Kwara
2326899	Okrika	Nigeria	Rivers
2327143	Okigwe	Nigeria	Imo
2327220	Okene	Nigeria	Kogi
2327223	Oke Mesi	Nigeria	Osun
2327233	Oke Ila	Nigeria	Ekiti
2327494	Ohafia-Ifigh	Nigeria	Abia
2327521	Oguta	Nigeria	Imo
2327650	Ogoja	Nigeria	Cross River
2327827	Ogaminana	Nigeria	Kogi
2327879	Offa	Nigeria	Kwara
2328090	Ode	Nigeria	Ondo
2328151	Obudu	Nigeria	Cross River
2328185	Obonoma	Nigeria	Rivers
2328617	Numan	Nigeria	Adamawa
2328684	Nsukka	Nigeria	Enugu
2328765	Nnewi	Nigeria	Anambra
2328790	Nkwerre	Nigeria	Imo
2328811	Nkpor	Nigeria	Anambra
2328952	Nguru	Nigeria	Yobe
2329451	Nasarawa	Nigeria	Nassarawa
2329821	Mubi	Nigeria	Adamawa
2329920	Moriki	Nigeria	Zamfara
2329946	Monguno	Nigeria	Borno
2329981	Mokwa	Nigeria	Niger
2330028	Modakeke	Nigeria	Osun
2330100	Minna	Nigeria	Niger
2330719	Marte	Nigeria	Borno
2331005	Malumfashi	Nigeria	Katsina
2331140	Makurdi	Nigeria	Benue
2331158	Makoko	Nigeria	Lagos
2331447	Maiduguri	Nigeria	Borno
2331528	Magumeri	Nigeria	Borno
2331939	Lokoja	Nigeria	Kogi
2332079	Lere	Nigeria	Kaduna
2332249	Lapai	Nigeria	Niger
2332357	Lalupon	Nigeria	Oyo
2332504	Lafiagi	Nigeria	Kwara
2332515	Lafia	Nigeria	Nassarawa
2332871	Kwale	Nigeria	Delta
2333451	Kumo	Nigeria	Gombe
2333490	Kumagunnam	Nigeria	Yobe
2333563	Kukawa	Nigeria	Borno
2334008	Kontagora	Nigeria	Niger
2334306	Kiyawa	Nigeria	Jigawa
2334327	Kisi	Nigeria	Oyo
2334652	Keffi	Nigeria	Nassarawa
2334756	Kaura Namoda	Nigeria	Zamfara
2334801	Katsina-Ala	Nigeria	Benue
2334802	Katsina	Nigeria	Katsina
2335015	Kari	Nigeria	Bauchi
2335204	Kano	Nigeria	Kano
2335333	Kamba	Nigeria	Kebbi
2335596	Kaiama	Nigeria	Kwara
2335614	Kagoro	Nigeria	Kaduna
2335713	Kafanchan	Nigeria	Kaduna
2335727	Kaduna	Nigeria	Kaduna
2335798	Kachia	Nigeria	Kaduna
2335843	Kabba	Nigeria	Kogi
2335953	Jos	Nigeria	Plateau
2336056	Jimeta	Nigeria	Adamawa
2336237	Jega	Nigeria	Kebbi
2336251	Jebba	Nigeria	Kwara
2336589	Jalingo	Nigeria	Taraba
2336905	Iwo	Nigeria	Osun
2336985	Itu	Nigeria	Akwa Ibom
2337148	Isieke	Nigeria	Ebonyi
2337235	Isanlu-Itedoijowa	Nigeria	Kogi
2337352	Ipoti	Nigeria	Ekiti
2337379	Iperu	Nigeria	Ogun
2337490	Inisa	Nigeria	Osun
2337639	Ilorin	Nigeria	Kwara
2337659	Ilobu	Nigeria	Osun
2337680	Illela	Nigeria	Sokoto
2337704	Ilesa	Nigeria	Osun
2337759	Ilaro	Nigeria	Ogun
2337765	Ila Orangun	Nigeria	Osun
2338106	Ikot Ekpene	Nigeria	Akwa Ibom
2338242	Ikom	Nigeria	Cross River
2338269	Ikirun	Nigeria	Osun
2338273	Ikire	Nigeria	Osun
2338313	Ikeja	Nigeria	Lagos
2338385	Ijero-Ekiti	Nigeria	Ekiti
2338400	Ijebu-Ode	Nigeria	Ogun
2338401	Ijebu-Jesa	Nigeria	Osun
2338403	Ijebu-Igbo	Nigeria	Ogun
2338497	Ihiala	Nigeria	Anambra
2338630	Igede-Ekiti	Nigeria	Ekiti
2338640	Igbo-Ukwu	Nigeria	Anambra
2338660	Igbor	Nigeria	Benue
2338669	Igbo-Ora	Nigeria	Oyo
2338711	Igboho	Nigeria	Oyo
2338772	Igbeti	Nigeria	Oyo
2338810	Igbara-Odo	Nigeria	Ekiti
2338876	Ifo	Nigeria	Ogun
2339150	Idanre	Nigeria	Ondo
2339156	Idah	Nigeria	Kogi
2339293	Ibeto	Nigeria	Niger
2339354	Ibadan	Nigeria	Oyo
2339631	Hadejia	Nigeria	Jigawa
2339665	Gwoza	Nigeria	Borno
2339756	Gwarzo	Nigeria	Kano
2339786	Gwaram	Nigeria	Jigawa
2339892	Gwadabawa	Nigeria	Sokoto
2339937	Gusau	Nigeria	Zamfara
2340086	Gummi	Nigeria	Zamfara
2340091	Gumel	Nigeria	Jigawa
2340451	Gombe	Nigeria	Gombe
2341275	Gembu	Nigeria	Taraba
2341294	Geidam	Nigeria	Yobe
2341355	Gbongan	Nigeria	Osun
2341580	Gaya	Nigeria	Kano
2341656	Gashua	Nigeria	Yobe
2341758	Garko	Nigeria	Gombe
2341955	Ganye	Nigeria	Adamawa
2342192	Gamboru	Nigeria	Borno
2342490	Funtua	Nigeria	Katsina
2342628	Fiditi	Nigeria	Oyo
2342883	Ezza-Ohu	Nigeria	Ebonyi
2343093	Esuk Oron	Nigeria	Akwa Ibom
2343252	Epe	Nigeria	Lagos
2343273	Enugu-Ezike	Nigeria	Enugu
2343279	Enugu	Nigeria	Enugu
2343299	Emure-Ekiti	Nigeria	Ekiti
2343512	Elele	Nigeria	Rivers
2343641	Ekpoma	Nigeria	Edo
2343720	Eket	Nigeria	Akwa Ibom
2343784	Ejigbo	Nigeria	Osun
2343822	Eha Amufu	Nigeria	Enugu
2343943	Egbe	Nigeria	Kogi
2343985	Effium	Nigeria	Ebonyi
2344082	Ebute Ikorodu	Nigeria	Lagos
2344229	Dutsen Wai	Nigeria	Kaduna
2344245	Dutse	Nigeria	Jigawa
2344418	Dukku	Nigeria	Gombe
2344600	Doma	Nigeria	Nassarawa
2344854	Dikwa	Nigeria	Borno
2345029	Deba	Nigeria	Gombe
2345094	Daura	Nigeria	Katsina
2345096	Daura	Nigeria	Yobe
2345152	Darazo	Nigeria	Bauchi
2345498	Damboa	Nigeria	Borno
2345521	Damaturu	Nigeria	Yobe
2346229	Calabar	Nigeria	Cross River
2346561	Bukuru	Nigeria	Plateau
2346615	Buguma	Nigeria	Rivers
2346812	Bonny	Nigeria	Rivers
2346951	Bode Saadu	Nigeria	Kwara
2346995	Biu	Nigeria	Borno
2347057	Birnin Kudu	Nigeria	Jigawa
2347059	Birnin Kebbi	Nigeria	Kebbi
2347061	Sofo-Birnin-Gwari	Nigeria	Kaduna
2347155	Billiri	Nigeria	Gombe
2347209	Bida	Nigeria	Niger
2347283	Benin City	Nigeria	Edo
2347303	Bende	Nigeria	Abia
2347330	Beli	Nigeria	Taraba
2347470	Bauchi	Nigeria	Bauchi
2347592	Baro	Nigeria	Niger
2347954	Bama	Nigeria	Borno
2348507	Babana	Nigeria	Niger
2348595	Azare	Nigeria	Bauchi
2348773	Awka	Nigeria	Anambra
2348783	Awgu	Nigeria	Enugu
2348892	Auchi	Nigeria	Edo
2349276	Asaba	Nigeria	Delta
2349431	Argungu	Nigeria	Kebbi
2349529	Aramoko-Ekiti	Nigeria	Ekiti
2349558	Apomu	Nigeria	Osun
2349951	Anchau	Nigeria	Kaduna
2350249	Amaigbo	Nigeria	Abia
2350806	Akwanga	Nigeria	Nassarawa
2350841	Akure	Nigeria	Ondo
2350886	Aku	Nigeria	Enugu
2351740	Agulu	Nigeria	Anambra
2351979	Agbor	Nigeria	Delta
2352250	Afikpo	Nigeria	Ebonyi
2352356	Ado Odo	Nigeria	Ogun
2352379	Ado-Ekiti	Nigeria	Ekiti
2352778	Abuja	Nigeria	Abuja Federal Capital Territory
2352947	Abeokuta	Nigeria	Ogun
2353099	Abakaliki	Nigeria	Ebonyi
2353151	Aba	Nigeria	Abia
2591159	Degema Hulk	Nigeria	Rivers
3616035	Tipitapa	Nicaragua	Managua
3616232	Somoto	Nicaragua	Madriz
3616253	Siuna	Nicaragua	Atlántico Norte (RAAN)
3616594	San Rafael del Sur	Nicaragua	Managua
3616682	San Marcos	Nicaragua	Carazo
3617052	Rivas	Nicaragua	Rivas
3617069	Río Blanco	Nicaragua	Matagalpa
3617095	Rama	Nicaragua	Atlántico Sur
3617154	Puerto Cabezas	Nicaragua	Atlántico Norte (RAAN)
3617448	Ocotal	Nicaragua	Nueva Segovia
3617459	Nueva Guinea	Nicaragua	Atlántico Sur
3617513	Nandaime	Nicaragua	Granada
3617522	Nagarote	Nicaragua	León
3617708	Matagalpa	Nicaragua	Matagalpa
3617723	Masaya	Nicaragua	Masaya
3617725	Masatepe	Nicaragua	Masaya
3617763	Managua	Nicaragua	Managua
3618030	León	Nicaragua	León
3618908	Juigalpa	Nicaragua	Chontales
3618926	Jinotepe	Nicaragua	Carazo
3618929	Jinotega	Nicaragua	Jinotega
3618954	Jalapa	Nicaragua	Nueva Segovia
3619136	Granada	Nicaragua	Granada
3619194	Estelí	Nicaragua	Estelí
3619267	El Viejo	Nicaragua	Chinandega
3619853	El Crucero	Nicaragua	Managua
3620170	Diriamba	Nicaragua	Carazo
3620269	Corinto	Nicaragua	Chinandega
3620381	Chinandega	Nicaragua	Chinandega
3620390	Chichigalpa	Nicaragua	Chinandega
3620544	Camoapa	Nicaragua	Boaco
3620674	Boaco	Nicaragua	Boaco
3828262	Ciudad Sandino	Nicaragua	Managua
2743477	Zwolle	Netherlands	Overijssel
2743493	Zwijndrecht	Netherlands	South Holland
2743608	Zutphen	Netherlands	Gelderland
2743619	Zundert	Netherlands	North Brabant
2743856	Zoetermeer	Netherlands	South Holland
2743949	Zevenaar	Netherlands	Gelderland
2743977	Zeist	Netherlands	Utrecht
2743997	Zeewolde	Netherlands	Flevoland
2744042	Zandvoort	Netherlands	North Holland
2744102	Zaltbommel	Netherlands	Gelderland
2744114	Zaanstad	Netherlands	North Holland
2744118	Zaandam	Netherlands	North Holland
2744194	Wolvega	Netherlands	Friesland
2744248	Woerden	Netherlands	Utrecht
2744324	Wisch	Netherlands	Gelderland
2744332	Winterswijk	Netherlands	Gelderland
2744344	Winschoten	Netherlands	Groningen
2744483	Wijk bij Duurstede	Netherlands	Utrecht
2744514	Wijchen	Netherlands	Gelderland
2744549	Wierden	Netherlands	Overijssel
2744675	Westervoort	Netherlands	Gelderland
2744827	Werkendam	Netherlands	North Brabant
2744904	Weesp	Netherlands	North Holland
2744911	Weert	Netherlands	Limburg
2744991	Wassenaar	Netherlands	South Holland
2745088	Wageningen	Netherlands	Gelderland
2745123	Waalwijk	Netherlands	North Brabant
2745127	Waalre	Netherlands	North Brabant
2745154	Vught	Netherlands	North Brabant
2745297	Voorst	Netherlands	Gelderland
2745301	Voorschoten	Netherlands	South Holland
2745311	Voorhout	Netherlands	South Holland
2745321	Voorburg	Netherlands	South Holland
2745340	Volendam	Netherlands	North Holland
2745392	Vlissingen	Netherlands	Zeeland
2745461	Vlagtwedde	Netherlands	Groningen
2745467	Vlaardingen	Netherlands	South Holland
2745580	Vianen	Netherlands	Utrecht
2745634	Venray	Netherlands	Limburg
2745641	Venlo	Netherlands	Limburg
2745677	Velp	Netherlands	Gelderland
2745706	Veldhoven	Netherlands	North Brabant
2745726	Veghel	Netherlands	North Brabant
2745739	Veere	Netherlands	Zeeland
2745774	Veenendaal	Netherlands	Utrecht
2745783	Veendam	Netherlands	Groningen
2745860	Valkenswaard	Netherlands	North Brabant
2745912	Utrecht	Netherlands	Utrecht
2745932	Urk	Netherlands	Flevoland
2745973	Uithoorn	Netherlands	North Holland
2746005	Uden	Netherlands	North Brabant
2746133	Tubbergen	Netherlands	Overijssel
2746215	Tongelre	Netherlands	North Brabant
2746301	Tilburg	Netherlands	North Brabant
2746331	Tiel	Netherlands	Gelderland
2746420	Terneuzen	Netherlands	Zeeland
2746504	Tegelen	Netherlands	Limburg
2746766	Steenwijk	Netherlands	Overijssel
2746839	Staphorst	Netherlands	Overijssel
2746860	Stadskanaal	Netherlands	Groningen
2746932	Spijkenisse	Netherlands	South Holland
2747021	Someren	Netherlands	North Brabant
2747034	Soest	Netherlands	Utrecht
2747063	Sneek	Netherlands	Friesland
2747169	Sliedrecht	Netherlands	South Holland
2747203	Sittard	Netherlands	Limburg
2747227	Sint-Oedenrode	Netherlands	North Brabant
2747351	's-Hertogenbosch	Netherlands	North Brabant
2747364	's-Gravenzande	Netherlands	South Holland
2747373	The Hague	Netherlands	South Holland
2747584	Schijndel	Netherlands	North Brabant
2747596	Schiedam	Netherlands	South Holland
2747599	Scheveningen	Netherlands	South Holland
2747720	Schagen	Netherlands	North Holland
2747858	Rucphen	Netherlands	North Brabant
2747891	Rotterdam	Netherlands	South Holland
2748000	Roermond	Netherlands	Limburg
2748076	Rijswijk	Netherlands	South Holland
2748172	Ridderkerk	Netherlands	South Holland
2748178	Rhoon	Netherlands	South Holland
2748185	Rhenen	Netherlands	Utrecht
2748371	Raalte	Netherlands	Overijssel
2748392	Putten	Netherlands	Gelderland
2748413	Purmerend	Netherlands	North Holland
2748591	Pijnacker	Netherlands	South Holland
2748729	Papendrecht	Netherlands	South Holland
2749182	Oud-Beijerland	Netherlands	South Holland
2749234	Oss	Netherlands	North Brabant
2749450	Oosterhout	Netherlands	North Brabant
2749644	Oldenzaal	Netherlands	Overijssel
2749668	Oldebroek	Netherlands	Gelderland
2749680	Oisterwijk	Netherlands	North Brabant
2749723	Oegstgeest	Netherlands	South Holland
2749753	Nuth	Netherlands	Limburg
2749756	Nunspeet	Netherlands	Gelderland
2749780	Nuenen	Netherlands	North Brabant
2749812	Noordwijk-Binnen	Netherlands	South Holland
2750053	Nijmegen	Netherlands	Gelderland
2750065	Nijkerk	Netherlands	Gelderland
2750325	Nieuwegein	Netherlands	Utrecht
2750467	Nederweert	Netherlands	Limburg
2750521	Naarden	Netherlands	North Holland
2750523	Naaldwijk	Netherlands	South Holland
2750815	Mijdrecht	Netherlands	Utrecht
2750884	Middelharnis	Netherlands	South Holland
2750896	Middelburg	Netherlands	Zeeland
2750947	Meppel	Netherlands	Drenthe
2751037	Meerssen	Netherlands	Limburg
2751073	Medemblik	Netherlands	North Holland
2751283	Maastricht	Netherlands	Limburg
2751285	Maassluis	Netherlands	South Holland
2751316	Maarssen	Netherlands	Utrecht
2751424	Losser	Netherlands	Overijssel
2751547	Lisse	Netherlands	South Holland
2751582	Lindenholt	Netherlands	Gelderland
2751651	Lichtenvoorde	Netherlands	Gelderland
2751687	Leusden	Netherlands	Utrecht
2751738	Lelystad	Netherlands	Flevoland
2751771	Leiderdorp	Netherlands	South Holland
2751773	Leiden	Netherlands	South Holland
2751792	Leeuwarden	Netherlands	Friesland
2751808	Leerdam	Netherlands	South Holland
2751834	Leek	Netherlands	Groningen
2752264	Krimpen aan den IJssel	Netherlands	South Holland
2752420	Korrewegwijk	Netherlands	Groningen
2752923	Kerkrade	Netherlands	Limburg
2753010	Katwijk aan Zee	Netherlands	South Holland
2753106	Kampen	Netherlands	Overijssel
2753355	IJsselstein	Netherlands	Utrecht
2753468	Huizen	Netherlands	North Holland
2753557	Houten	Netherlands	Utrecht
2753587	Horst	Netherlands	Gelderland
2753706	Hoogezand	Netherlands	Groningen
2753719	Hoogeveen	Netherlands	Drenthe
2753801	Hoofddorp	Netherlands	North Holland
2753955	Hoge Vucht	Netherlands	North Brabant
2753996	Hoensbroek	Netherlands	Limburg
2754066	Hilvarenbeek	Netherlands	North Brabant
2754073	Hillegom	Netherlands	South Holland
2754135	Heusden	Netherlands	North Brabant
2754394	Hengelo	Netherlands	Overijssel
2754408	Hendrik-Ido-Ambacht	Netherlands	South Holland
2754447	Helmond	Netherlands	North Brabant
2754454	Hellevoetsluis	Netherlands	South Holland
2754516	Heiloo	Netherlands	North Holland
2754635	Heesch	Netherlands	North Brabant
2754652	Heerlen	Netherlands	Limburg
2754669	Heerenveen	Netherlands	Friesland
2754681	Heerde	Netherlands	Gelderland
2754692	Heemstede	Netherlands	North Holland
2754697	Heemskerk	Netherlands	North Holland
2754817	Harlingen	Netherlands	Friesland
2754837	Harenkarspel	Netherlands	North Holland
2754841	Haren	Netherlands	Groningen
2754848	Harderwijk	Netherlands	Gelderland
2754861	Hardenberg	Netherlands	Overijssel
2755003	Haarlem	Netherlands	North Holland
2755030	Haaksbergen	Netherlands	Overijssel
2755251	Groningen	Netherlands	Groningen
2755272	Groesbeek	Netherlands	Gelderland
2755420	Gouda	Netherlands	South Holland
2755434	Gorinchem	Netherlands	South Holland
2755464	Goirle	Netherlands	North Brabant
2755476	Goes	Netherlands	Zeeland
2755584	Gennep	Netherlands	Limburg
2755619	Geldrop	Netherlands	North Brabant
2755633	Geldermalsen	Netherlands	Gelderland
2755669	Geertruidenberg	Netherlands	North Brabant
2756039	Ermelo	Netherlands	Gelderland
2756059	Epe	Netherlands	Gelderland
2756071	Enschede	Netherlands	Overijssel
2756077	Enkhuizen	Netherlands	North Holland
2756136	Emmen	Netherlands	Drenthe
2756139	Emmeloord	Netherlands	Flevoland
2756161	Elst	Netherlands	Gelderland
2756232	Elburg	Netherlands	Gelderland
2756253	Eindhoven	Netherlands	North Brabant
2756295	Eibergen	Netherlands	Gelderland
2756342	Eersel	Netherlands	North Brabant
2756429	Ede	Netherlands	Gelderland
2756507	Duiven	Netherlands	Gelderland
2756559	Dronten	Netherlands	Flevoland
2756569	Drimmelen	Netherlands	North Brabant
2756619	Driebergen-Rijsenburg	Netherlands	Utrecht
2756644	Drachten	Netherlands	Friesland
2756669	Dordrecht	Netherlands	South Holland
2756723	Dongen	Netherlands	North Brabant
2756767	Doetinchem	Netherlands	Gelderland
2756888	Diemen	Netherlands	North Holland
2756987	Deventer	Netherlands	Overijssel
2757220	Den Helder	Netherlands	North Holland
2757340	Delfzijl	Netherlands	Groningen
2757345	Delft	Netherlands	South Holland
2757347	Delfshaven	Netherlands	South Holland
2757783	De Bilt	Netherlands	Utrecht
2757850	Dalfsen	Netherlands	Overijssel
2757872	Culemborg	Netherlands	Gelderland
2757890	Cranendonck	Netherlands	North Brabant
2757991	Castricum	Netherlands	North Holland
2758012	Capelle aan den IJssel	Netherlands	South Holland
2758064	Bussum	Netherlands	North Holland
2758104	Bunschoten	Netherlands	Utrecht
2758174	Brunssum	Netherlands	Limburg
2758177	Brummen	Netherlands	Gelderland
2758245	Broek op Langedijk	Netherlands	North Holland
2758258	Broek in Waterland	Netherlands	North Holland
2758401	Breda	Netherlands	North Brabant
2758460	Boxtel	Netherlands	North Brabant
2758547	Boskoop	Netherlands	South Holland
2758587	Borssele	Netherlands	Zeeland
2758598	Borne	Netherlands	Overijssel
2758602	Born	Netherlands	Limburg
2758621	Borger	Netherlands	Drenthe
2758804	Bloemendaal	Netherlands	North Holland
2758878	Bladel	Netherlands	North Brabant
2758998	Beverwijk	Netherlands	North Holland
2759016	Beuningen	Netherlands	Gelderland
2759040	Best	Netherlands	North Brabant
2759113	Bergschenhoek	Netherlands	South Holland
2759132	Bergeijk	Netherlands	North Brabant
2759145	Bergen op Zoom	Netherlands	North Brabant
2759178	Benthuizen	Netherlands	South Holland
2759350	Beek	Netherlands	Limburg
2759407	Barneveld	Netherlands	Gelderland
2759426	Barendrecht	Netherlands	South Holland
2759544	Baarn	Netherlands	Utrecht
2759621	Asten	Netherlands	North Brabant
2759633	Assen	Netherlands	Drenthe
2759661	Arnhem	Netherlands	Gelderland
2759706	Apeldoorn	Netherlands	Gelderland
2759746	Anloo	Netherlands	Drenthe
2759798	Amstelveen	Netherlands	North Holland
2759821	Amersfoort	Netherlands	Utrecht
2759875	Alphen aan den Rijn	Netherlands	South Holland
2759879	Almere Stad	Netherlands	Flevoland
2759887	Almelo	Netherlands	Overijssel
2759899	Alkmaar	Netherlands	North Holland
2759915	Alblasserdam	Netherlands	South Holland
2760123	Aalten	Netherlands	Gelderland
2760134	Aalsmeer	Netherlands	North Holland
6544881	Amsterdam-Zuidoost	Netherlands	North Holland
6929992	Berkel en Rodenrijs	Netherlands	South Holland
6941548	Ypenburg	Netherlands	South Holland
3133880	Trondheim	Norway	Sør-Trøndelag
3133895	Tromsø	Norway	Troms
3134331	Tønsberg	Norway	Vestfold
3136947	Steinkjer	Norway	Nord-Trøndelag
3137115	Stavanger	Norway	Rogaland
3140084	Sarpsborg	Norway	Østfold
3140321	Sandnes	Norway	Rogaland
3140390	Sandefjord	Norway	Vestfold
3142657	Porsgrunn	Norway	Telemark
3143244	Oslo	Norway	Oslo
3145375	Moss	Norway	Østfold
3145580	Molde	Norway	Møre og Romsdal
3145614	Mo i Rana	Norway	Nordland
3147474	Lillehammer	Norway	Oppland
3148129	Larvik	Norway	Vestfold
3149318	Kristiansand	Norway	Vest-Agder
3149563	Kongsberg	Norway	Buskerud
3151770	Horten	Norway	Vestfold
3153623	Haugesund	Norway	Rogaland
3153823	Harstad	Norway	Troms
3154084	Hamar	Norway	Hedmark
3154209	Halden	Norway	Østfold
3155573	Gjøvik	Norway	Oppland
3156529	Fredrikstad	Norway	Østfold
3159016	Drammen	Norway	Buskerud
3160881	Bodø	Norway	Nordland
3161732	Bergen	Norway	Hordaland
3162955	Arendal	Norway	Aust-Agder
3163392	Ålesund	Norway	Møre og Romsdal
3336587	Askøy	Norway	Hordaland
6697344	Ytrebygda	Norway	Hordaland
1282616	Wāling	Nepal	Western Region
1282635	Tulsīpur	Nepal	Mid Western
1282666	Tīkāpur	Nepal	Far Western
1282714	Tānsen	Nepal	Western Region
1282884	Rājbirāj	Nepal	Eastern Region
1282898	Pokhara	Nepal	Western Region
1282931	Pātan	Nepal	Central Region
1282950	Panauti̇̄	Nepal	Central Region
1283082	Malangwa	Nepal	Central Region
1283095	Mahendranagar	Nepal	Far Western
1283161	Lahān	Nepal	Eastern Region
1283190	Kirtipur	Nepal	Central Region
1283217	Khāndbāri	Nepal	Eastern Region
1283240	Kathmandu	Nepal	Central Region
1283318	Janakpur	Nepal	Central Region
1283323	Jaleswar	Nepal	Central Region
1283329	Ithari	Nepal	Eastern Region
1283333	Ilām	Nepal	Eastern Region
1283339	Hetauda	Nepal	Central Region
1283368	Gulariyā	Nepal	Mid Western
1283401	Gaur	Nepal	Central Region
1283465	Dhankutā	Nepal	Eastern Region
1283467	Dhangarhi	Nepal	Far Western
1283484	Dārchulā	Nepal	Western Region
1283496	Dailekh	Nepal	Mid Western
1283499	Dadeldhurā	Nepal	Far Western
1283562	Butwāl	Nepal	Western Region
1283581	Bīrganj	Nepal	Central Region
1283582	Birātnagar	Nepal	Eastern Region
1283613	Bharatpur	Nepal	Central Region
1283621	Bhairāhawā	Nepal	Western Region
1283628	Bhadrapur	Nepal	Eastern Region
1283679	Banepā	Nepal	Central Region
1283711	Bāglung	Nepal	Western Region
6254843	Birendranagar	Nepal	Mid Western
6254845	Dipayal	Nepal	Far Western
6941099	Nepalgunj	Nepal	Mid Western
7626461	Yaren	Nauru	Yaren
4036284	Alofi	Niue	N/A
2179670	Wanganui	New Zealand	Manawatu-Wanganui
2181133	Timaru	New Zealand	Canterbury
2181742	Taupo	New Zealand	Waikato
2184155	Pukekohe East	New Zealand	Auckland
2184397	Porirua	New Zealand	Wellington
2184904	Paraparaumu	New Zealand	Wellington
2185018	Palmerston North	New Zealand	Manawatu-Wanganui
2185964	North Shore	New Zealand	Auckland
2186239	New Plymouth	New Zealand	Taranaki
2186280	Nelson	New Zealand	Nelson
2186313	Napier	New Zealand	Hawke's Bay
2187404	Manukau City	New Zealand	Auckland
2187454	Mangere	New Zealand	Auckland
2188164	Lower Hutt	New Zealand	Wellington
2189529	Invercargill	New Zealand	Southland
2190324	Hamilton	New Zealand	Waikato
2191562	Dunedin	New Zealand	Otago
2192362	Christchurch	New Zealand	Canterbury
2193733	Auckland	New Zealand	Auckland
2206371	Levin	New Zealand	Manawatu-Wanganui
2206854	Gisborne	New Zealand	Gisborne
2206890	Masterton	New Zealand	Wellington
2208032	Tauranga	New Zealand	Bay of Plenty
2208329	Papakura	New Zealand	Auckland
2208330	Whakatane	New Zealand	Bay of Plenty
6217081	Ashburton	New Zealand	Canterbury
6230919	Whangarei	New Zealand	Northland
6240770	Cambridge	New Zealand	Waikato
6241325	Rotorua	New Zealand	Bay of Plenty
6243926	Blenheim	New Zealand	Marlborough
6244895	Upper Hutt	New Zealand	Wellington
7302484	Waitakere	New Zealand	Auckland
286245	Sur	Oman	Ash Sharqiyah South Governorate
286282	Sohar	Oman	Al Batinah North Governorate
286293	Sufālat Samā’il	Oman	Muḩāfaz̧at ad Dākhilīyah
286402	Shināş	Oman	Al Batinah North Governorate
286621	Şalālah	Oman	Z̧ufār
286647	Şaḩam	Oman	Al Batinah North Governorate
286987	Nizwá	Oman	Muḩāfaz̧at ad Dākhilīyah
287286	Muscat	Oman	Muḩāfaz̧at Masqaţ
287614	Khasab	Oman	Musandam
287814	Izkī	Oman	Muḩāfaz̧at ad Dākhilīyah
287830	‘Ibrī	Oman	Az̧ Z̧āhirah
288721	Bidbid	Oman	Muḩāfaz̧at ad Dākhilīyah
288764	Bawshar	Oman	Muḩāfaz̧at Masqaţ
288789	Barkā’	Oman	Al Batinah South Governorate
288899	Bahlā’	Oman	Muḩāfaz̧at ad Dākhilīyah
288902	Badīyah	Oman	Ash Sharqiyah North Governorate
288955	As Suwayq	Oman	Al Batinah North Governorate
289174	Al Liwā’	Oman	Al Batinah North Governorate
289199	Al Khābūrah	Oman	Al Batinah North Governorate
289317	Al Buraymī	Oman	Al Buraimi
289433	Ādam	Oman	Muḩāfaz̧at ad Dākhilīyah
411849	Yanqul	Oman	Az̧ Z̧āhirah
3700038	Vista Alegre	Panama	Panamá
3700164	Veracruz	Panama	Panamá
3700563	Tocumen	Panama	Panamá
3701117	Santiago de Veraguas	Panama	Veraguas
3701329	San Miguelito	Panama	Panamá
3702431	Puerto Armuelles	Panama	Chiriquí
3703229	Pedregal	Panama	Chiriquí
3703443	Panamá	Panama	Panamá
3703647	Pacora	Panama	Panamá
3703833	Nuevo Arraiján	Panama	Panamá
3706567	Las Cumbres	Panama	Panamá
3707899	La Concepción	Panama	Chiriquí
3707961	La Chorrera	Panama	Panamá
3708066	La Cabima	Panama	Panamá
3711668	David	Panama	Chiriquí
3712076	Colón	Panama	Colón
3712384	Chitré	Panama	Herrera
3712505	Chepo	Panama	Panamá
3712560	Changuinola	Panama	Bocas del Toro
3712884	Cativá	Panama	Colón
3714637	Arraiján	Panama	Panamá
3714932	Alcalde Díaz	Panama	Panamá
3715042	Aguadulce	Panama	Coclé
3690654	Yurimaguas	Peru	Loreto
3690875	Virú	Peru	La Libertad
3691094	Uchiza	Peru	San Martín
3691148	Tumbes	Peru	Tumbes
3691175	Trujillo	Peru	La Libertad
3691324	Tocache	Peru	San Martín
3691348	Tingo María	Peru	Huanuco
3691530	Tambo Grande	Peru	Piura
3691582	Talara	Peru	Piura
3691674	Sullana	Peru	Piura
3692073	Santiago de Cao	Peru	La Libertad
3692310	San Pedro de Lloc	Peru	La Libertad
3692667	Saña	Peru	Lambayeque
3692863	Rioja	Peru	San Martín
3693057	Querecotillo	Peru	Piura
3693345	Pucallpa	Peru	Ucayali
3693528	Piura	Peru	Piura
3693584	Pimentel	Peru	Lambayeque
3693645	Picsi	Peru	Lambayeque
3694112	Paita	Peru	Piura
3694178	Pacasmayo	Peru	La Libertad
3694564	Moyobamba	Peru	San Martín
3694666	Monsefú	Peru	Lambayeque
3694725	Moche	Peru	La Libertad
3694939	Marcavelica	Peru	Piura
3695466	La Unión	Peru	Piura
3695617	Laredo	Peru	La Libertad
3695675	La Peca	Peru	Amazonas
3695754	Lambayeque	Peru	Lambayeque
3696057	Juanjuí	Peru	San Martín
3696150	Jaén	Peru	Cajamarca
3696183	Iquitos	Peru	Loreto
3696378	Huaraz	Peru	Ancash
3696417	Huánuco	Peru	Huanuco
3696847	Guadalupe	Peru	La Libertad
3697033	Ferreñafe	Peru	Lambayeque
3697990	Coishco	Peru	Ancash
3698105	Chulucanas	Peru	Piura
3698176	Chongoyape	Peru	Lambayeque
3698194	Chocope	Peru	La Libertad
3698304	Chimbote	Peru	Ancash
3698350	Chiclayo	Peru	Lambayeque
3698390	Chepén	Peru	La Libertad
3698540	Chachapoyas	Peru	Amazonas
3698658	Catacaos	Peru	Piura
3699088	Cajamarca	Peru	Cajamarca
3699364	Bellavista	Peru	San Martín
3699484	Bagua Grande	Peru	Amazonas
3818398	Zarumilla	Peru	Tumbes
3925476	Yunguyo	Peru	Puno
3925863	Yanacancha	Peru	Huanuco
3927758	Tarma	Peru	Junín
3927942	Tambopata	Peru	Madre de Dios
3928128	Tacna	Peru	Tacna
3928245	Santiago de Surco	Peru	Lima region
3928679	Sicuani	Peru	Cusco
3928924	Satipo	Peru	Junín
3928993	San Vicente de Cañete	Peru	Lima region
3929295	Santa Ana	Peru	Cusco
3929631	San Isidro	Peru	Lima region
3929768	San Clemente	Peru	Ica
3931276	Puno	Peru	Puno
3932145	Pisco	Peru	Ica
3933024	Paramonga	Peru	Lima region
3934239	Nuevo Imperial	Peru	Lima region
3934356	Nazca	Peru	Ica
3934608	Moquegua	Peru	Moquegua
3934707	Mollendo	Peru	Arequipa
3935288	Minas de Marcona	Peru	Ica
3935572	Mala	Peru	Lima region
3936456	Lima	Peru	Lima Province
3936952	La Oroya	Peru	Junín
3937486	Junín	Peru	Junín
3937513	Juliaca	Peru	Puno
3937733	Jauja	Peru	Junín
3938396	Imperial	Peru	Lima region
3938415	Ilo	Peru	Moquegua
3938451	Ilave	Peru	Puno
3938527	Ica	Peru	Ica
3939168	Huarmey	Peru	Ancash
3939285	Huaral	Peru	Lima region
3939386	Huanta	Peru	Ayacucho
3939459	Huancayo	Peru	Junín
3939470	Huancavelica	Peru	Huancavelica
3939761	Hualmay	Peru	Lima region
3940002	Huacho	Peru	Lima region
3941584	Cusco	Peru	Cusco
3943423	Chosica	Peru	Lima region
3943789	Chincha Alta	Peru	Ica
3944179	Chaupimarca	Peru	Pasco
3944399	Chancay	Peru	Lima region
3944797	Cerro de Pasco	Peru	Pasco
3946083	Callao	Peru	Callao
3946820	Barranca	Peru	Lima region
3946985	Ayaviri	Peru	Puno
3947019	Ayacucho	Peru	Ayacucho
3947322	Arequipa	Peru	Arequipa
3947740	Andahuaylas	Peru	Apurímac
3948642	Abancay	Peru	Apurímac
7626291	La Rinconada	Peru	Puno
4033936	Papeete	French Polynesia	Îles du Vent
4034561	Faaa	French Polynesia	Îles du Vent
2083537	Wewak	Papua New Guinea	East Sepik
2088122	Port Moresby	Papua New Guinea	National Capital
2088163	Popondetta	Papua New Guinea	Northern Province
2090409	Mount Hagen	Papua New Guinea	Western Highlands
2090990	Mendi	Papua New Guinea	Southern Highlands
2091996	Madang	Papua New Guinea	Madang
2092740	Lae	Papua New Guinea	Morobe
2093685	Kokopo	Papua New Guinea	East New Britain
2093967	Kimbe	Papua New Guinea	West New Britain
2096742	Goroka	Papua New Guinea	Eastern Highlands
2098329	Daru	Papua New Guinea	Western Province
2098869	Bulolo	Papua New Guinea	Morobe
2100633	Arawa	Papua New Guinea	Bougainville
1679678	Wao	Philippines	Autonomous Region in Muslim Mindanao
1679802	Virac	Philippines	Bicol
1679980	Vigan	Philippines	Ilocos
1680007	Victorias	Philippines	Western Visayas
1680018	Victoria	Philippines	Calabarzon
1680040	Veruela	Philippines	Caraga
1680116	Valencia	Philippines	Northern Mindanao
1680197	Urdaneta	Philippines	Ilocos
1680505	Ualog	Philippines	Western Visayas
1680613	Tupi	Philippines	Davao
1680932	Tuguegarao City	Philippines	Cagayan Valley
1681333	Trento	Philippines	Caraga
1681602	Toledo	Philippines	Central Visayas
1681676	Tiwi	Philippines	Bicol
1682472	Ternate	Philippines	Calabarzon
1682478	Teresa	Philippines	Calabarzon
1682537	Telabastagan	Philippines	Central Luzon
1682598	Taytay	Philippines	Calabarzon
1682659	Tayabas	Philippines	Calabarzon
1683013	Tanza	Philippines	Metro Manila
1683088	Tanjay	Philippines	Central Visayas
1683116	Tangub	Philippines	Northern Mindanao
1683302	Tandag	Philippines	Caraga
1683319	Tanay	Philippines	Calabarzon
1683340	Tanauan	Philippines	Calabarzon
1683342	Tanauan	Philippines	Eastern Visayas
1683800	Taloc	Philippines	Western Visayas
1683860	Talisay	Philippines	Calabarzon
1683877	Talisay	Philippines	Western Visayas
1683881	Talisay	Philippines	Central Visayas
1684016	Talavera	Philippines	Central Luzon
1684137	Talacogon	Philippines	Caraga
1684269	Tagum	Philippines	Davao
1684308	Taguig	Philippines	Calabarzon
1684320	Tagudin	Philippines	Ilocos
1684497	Tagbilaran City	Philippines	Central Visayas
1684577	Tagas	Philippines	Bicol
1684681	Tacurong	Philippines	Soccsksargen
1684803	Tabuk	Philippines	Cordillera
1685117	Tabaco	Philippines	Bicol
1685146	Taal	Philippines	Calabarzon
1685218	Surigao	Philippines	Caraga
1685230	Surallah	Philippines	Soccsksargen
1685577	Subic	Philippines	Central Luzon
1685622	Suay	Philippines	Western Visayas
1685755	Sorsogon	Philippines	Bicol
1685875	Solano	Philippines	Cagayan Valley
1685880	Solana	Philippines	Cagayan Valley
1686004	Sitangkai	Philippines	Autonomous Region in Muslim Mindanao
1686102	Sipalay	Philippines	Western Visayas
1686547	Silang	Philippines	Calabarzon
1686728	Sibulan	Philippines	Central Visayas
1686933	Sexmoan	Philippines	Central Luzon
1687029	Sebu	Philippines	Soccsksargen
1687164	Sariaya	Philippines	Calabarzon
1687534	Santo Tomas	Philippines	Calabarzon
1687687	Santol	Philippines	Central Luzon
1687801	Santiago	Philippines	Cagayan Valley
1687894	Santa Rosa	Philippines	Calabarzon
1688017	Santa Maria	Philippines	Ilocos
1688058	Santa Maria	Philippines	Davao
1688232	Santa Cruz	Philippines	Central Luzon
1688248	Santa Cruz	Philippines	Central Luzon
1688253	Santa Cruz	Philippines	Calabarzon
1688363	Santa Catalina	Philippines	Central Visayas
1688372	Santa Barbara	Philippines	Ilocos
1688398	Santa Ana	Philippines	Central Luzon
1688425	San Simon	Philippines	Central Luzon
1688749	San Pedro	Philippines	Calabarzon
1688795	San Pascual	Philippines	Calabarzon
1688830	San Pablo	Philippines	Calabarzon
1688859	San Nicolas	Philippines	Ilocos
1688949	San Miguel	Philippines	Central Luzon
1688954	San Miguel	Philippines	Central Luzon
1689052	San Mateo	Philippines	Cagayan Valley
1689056	San Mateo	Philippines	Calabarzon
1689087	San Mariano	Philippines	Davao
1689099	San Marcelino	Philippines	Central Luzon
1689129	San Luis	Philippines	Central Luzon
1689171	San Leonardo	Philippines	Central Luzon
1689286	San Juan	Philippines	Metro Manila
1689395	San Jose del Monte	Philippines	Central Luzon
1689498	San Jose	Philippines	Bicol
1689510	San Jose	Philippines	Mimaropa
1689832	San Ildefonso	Philippines	Central Luzon
1689973	San Francisco	Philippines	Central Luzon
1689994	Aurora	Philippines	Calabarzon
1690019	San Francisco	Philippines	Caraga
1690033	San Fernando	Philippines	Ilocos
1690060	San Fernando	Philippines	Central Visayas
1690313	San Antonio	Philippines	Central Luzon
1690315	San Antonio	Philippines	Central Luzon
1690570	Sampaloc	Philippines	Calabarzon
1690664	Samal	Philippines	Central Luzon
1690666	Samal	Philippines	Davao
1691150	Sagay	Philippines	Western Visayas
1691280	Sablayan	Philippines	Mimaropa
1691441	Roxas	Philippines	Cagayan Valley
1691444	Roxas City	Philippines	Western Visayas
1691446	Roxas	Philippines	Mimaropa
1691538	Romblon	Philippines	Mimaropa
1691606	Rizal	Philippines	Central Luzon
1691804	Recodo	Philippines	Zamboanga Peninsula
1691904	Ramos	Philippines	Central Luzon
1691911	Ramon	Philippines	Cagayan Valley
1692184	Quiapo	Philippines	Metro Manila
1692199	Quezon	Philippines	Central Luzon
1692214	Quezon	Philippines	Northern Mindanao
1692489	Pulupandan	Philippines	Western Visayas
1692520	Pulong Santa Cruz	Philippines	Calabarzon
1692565	Pulilan	Philippines	Central Luzon
1692685	Puerto Princesa	Philippines	Mimaropa
1692872	Port Area	Philippines	Metro Manila
1692914	Porac	Philippines	Central Luzon
1693077	Polomolok	Philippines	Davao
1693136	Polangui	Philippines	Bicol
1693239	Plaridel	Philippines	Central Luzon
1693401	Pio	Philippines	Central Luzon
1693574	Pinamungahan	Philippines	Central Visayas
1693618	Pinamalayan	Philippines	Mimaropa
1693778	Pililla	Philippines	Calabarzon
1693839	Pilar	Philippines	Central Luzon
1693870	Pila	Philippines	Calabarzon
1694290	Patuto	Philippines	Calabarzon
1694498	Passi	Philippines	Western Visayas
1694775	Parang	Philippines	Autonomous Region in Muslim Mindanao
1694791	Paraiso	Philippines	Western Visayas
1694826	Papaya	Philippines	Central Luzon
1694861	Paombong	Philippines	Central Luzon
1694914	Pantubig	Philippines	Central Luzon
1695097	Paniqui	Philippines	Central Luzon
1695283	Pangil	Philippines	Calabarzon
1695462	Pandi	Philippines	Central Luzon
1695583	Pandacaqui	Philippines	Central Luzon
1695743	Panalanoy	Philippines	Eastern Visayas
1695804	Panabo	Philippines	Davao
1696041	Palo	Philippines	Eastern Visayas
1696165	Palayan City	Philippines	Central Luzon
1696614	Pagbilao	Philippines	Calabarzon
1696710	Pagadian	Philippines	Zamboanga Peninsula
1696718	Paete	Philippines	Calabarzon
1696814	Pacol	Philippines	Western Visayas
1696899	Ozamiz City	Philippines	Northern Mindanao
1697006	Oroquieta	Philippines	Northern Mindanao
1697018	Ormoc	Philippines	Eastern Visayas
1697023	Orion	Philippines	Central Luzon
1697046	Orani	Philippines	Central Luzon
1697175	Olongapo	Philippines	Central Luzon
1697376	Obando	Philippines	Central Luzon
1697486	Noveleta	Philippines	Calabarzon
1697497	Norzagaray	Philippines	Central Luzon
1697773	New Corella	Philippines	Davao
1698030	Nasugbu	Philippines	Calabarzon
1698103	Narra	Philippines	Mimaropa
1698548	Naic	Philippines	Calabarzon
1698740	Nagcarlan	Philippines	Calabarzon
1698829	Naga	Philippines	Bicol
1698839	Naga	Philippines	Central Visayas
1698887	Nabunturan	Philippines	Davao
1698921	Nabua	Philippines	Bicol
1699054	Muricay	Philippines	Zamboanga Peninsula
1699060	Murcia	Philippines	Western Visayas
1699088	Muñoz	Philippines	Central Luzon
1699204	Morong	Philippines	Central Luzon
1699205	Morong	Philippines	Calabarzon
1699296	Rodriguez	Philippines	Calabarzon
1699323	Monkayo	Philippines	Davao
1699572	Minglanilla	Philippines	Central Visayas
1699755	Midsayap	Philippines	Soccsksargen
1699802	Meycauayan	Philippines	Central Luzon
1699805	Mexico	Philippines	Central Luzon
1699833	Mercedes	Philippines	Bicol
1699858	Mendez-Nuñez	Philippines	Calabarzon
1700179	Mauban	Philippines	Calabarzon
1700360	Mati	Philippines	Davao
1700665	Masinloc	Philippines	Central Luzon
1700712	Masbate	Philippines	Bicol
1700753	Masantol	Philippines	Central Luzon
1700868	Mariveles	Philippines	Central Luzon
1700917	Marilao	Philippines	Central Luzon
1700980	Mariano	Philippines	Northern Mindanao
1701124	Maramag	Philippines	Northern Mindanao
1701149	Maragondon	Philippines	Calabarzon
1701472	Mantampay	Philippines	Northern Mindanao
1701500	Mansilingan	Philippines	Western Visayas
1701516	Mansalay	Philippines	Mimaropa
1701537	Manolo Fortich	Philippines	Northern Mindanao
1701668	Manila	Philippines	Metro Manila
1701692	Manibaug Pasig	Philippines	Central Luzon
1701872	Mangaldan	Philippines	Ilocos
1701947	Mandaue City	Philippines	Central Visayas
1701966	Mandaluyong City	Philippines	Metro Manila
1702002	Mankayan	Philippines	Cordillera
1702032	Manay	Philippines	Davao
1702077	Manapla	Philippines	Western Visayas
1702096	Manaoag	Philippines	Ilocos
1702263	Mamburao	Philippines	Mimaropa
1702372	Mamatid	Philippines	Calabarzon
1702413	Malvar	Philippines	Calabarzon
1702425	Maluso	Philippines	Autonomous Region in Muslim Mindanao
1702442	Maluñgun	Philippines	Soccsksargen
1702540	Malolos	Philippines	Central Luzon
1702763	Malilipot	Philippines	Bicol
1703051	Malapatan	Philippines	Soccsksargen
1703116	Malanday	Philippines	Calabarzon
1703355	Malabanban Norte	Philippines	Calabarzon
1703417	Makati City	Philippines	Metro Manila
1703598	Mahayag	Philippines	Zamboanga Peninsula
1703773	Magsaysay	Philippines	Davao
1704002	Magarao	Philippines	Bicol
1704021	Maganoy	Philippines	Autonomous Region in Muslim Mindanao
1704067	Magalang	Philippines	Central Luzon
1704703	Mabalacat City	Philippines	Central Luzon
1704758	Maasin	Philippines	Eastern Visayas
1704781	Maao	Philippines	Western Visayas
1704968	Lupon	Philippines	Davao
1705190	Lumbang	Philippines	Calabarzon
1705357	Lucena	Philippines	Calabarzon
1705367	Lucban	Philippines	Calabarzon
1705440	Lubao	Philippines	Central Luzon
1705536	Los Baños	Philippines	Calabarzon
1705572	Lopez	Philippines	Calabarzon
1705871	Loboc	Philippines	Central Visayas
1706090	Lipa City	Philippines	Calabarzon
1706188	Lingayen	Philippines	Ilocos
1706361	Limay	Philippines	Central Luzon
1706393	Liloan	Philippines	Central Visayas
1706402	Lilio	Philippines	Calabarzon
1706609	Libon	Philippines	Bicol
1706684	Libertad	Philippines	Caraga
1706889	Legaspi	Philippines	Bicol
1707049	Laur	Philippines	Central Luzon
1707123	La Trinidad	Philippines	Cordillera
1707267	Lapu-Lapu City	Philippines	Central Visayas
1707324	La Paz	Philippines	Central Luzon
1707398	Laoang	Philippines	Eastern Visayas
1707404	Laoag	Philippines	Ilocos
1707944	Lala	Philippines	Northern Mindanao
1708056	Laguilayan	Philippines	Soccsksargen
1708226	La Carlota	Philippines	Western Visayas
1708291	Labo	Philippines	Bicol
1708522	Koronadal	Philippines	Soccsksargen
1708824	Kidapawan	Philippines	Soccsksargen
1709003	Kawit	Philippines	Calabarzon
1709632	Kalibo (poblacion)	Philippines	Western Visayas
1709968	Kabankalan	Philippines	Western Visayas
1710011	Kabacan	Philippines	Soccsksargen
1710103	Jose Pañganiban	Philippines	Bicol
1710141	Jolo	Philippines	Autonomous Region in Muslim Mindanao
1710258	Jasaan	Philippines	Northern Mindanao
1710357	Jalajala	Philippines	Calabarzon
1710378	Jagna	Philippines	Central Visayas
1710389	Jaen	Philippines	Central Luzon
1710441	Itogon	Philippines	Cordillera
1710470	Isulan	Philippines	Soccsksargen
1710518	Isabela	Philippines	Western Visayas
1710531	Irosin	Philippines	Bicol
1710544	Iriga City	Philippines	Bicol
1710612	Ipil	Philippines	Zamboanga Peninsula
1710770	Indang	Philippines	Calabarzon
1710914	Imus	Philippines	Calabarzon
1711005	Iloilo	Philippines	Western Visayas
1711082	Iligan City	Philippines	Soccsksargen
1711146	Ilagan	Philippines	Cagayan Valley
1711437	Iba	Philippines	Central Luzon
1711621	Hinigaran	Philippines	Western Visayas
1711718	Himamaylan	Philippines	Western Visayas
1711829	Hermosa	Philippines	Central Luzon
1711982	Hagonoy	Philippines	Central Luzon
1712051	Guyong	Philippines	Central Luzon
1712162	Gumaca	Philippines	Calabarzon
1712232	Guiset East	Philippines	Ilocos
1712488	Guimba	Philippines	Central Luzon
1712520	Guihulñgan	Philippines	Central Visayas
1712531	Guiguinto	Philippines	Central Luzon
1712808	Goa	Philippines	Bicol
1712819	Glan	Philippines	Soccsksargen
1713004	Gerona	Philippines	Central Luzon
1713014	General Trias	Philippines	Calabarzon
1713018	General Tinio	Philippines	Central Luzon
1713027	General Mamerto Natividad	Philippines	Central Luzon
1713226	Gapan	Philippines	Central Luzon
1713818	Escalante	Philippines	Western Visayas
1713857	Saravia	Philippines	Western Visayas
1714201	Dumaguete	Philippines	Central Visayas
1714441	Don Carlos	Philippines	Northern Mindanao
1714482	Domalanoan	Philippines	Ilocos
1714519	Dologon	Philippines	Northern Mindanao
1714674	Dipolog	Philippines	Zamboanga Peninsula
1714766	Dinalupihan	Philippines	Central Luzon
1714956	Digos	Philippines	Davao
1715094	Diadi	Philippines	Cagayan Valley
1715169	Del Pilar	Philippines	Central Luzon
1715348	Davao	Philippines	Davao
1715430	Dasmariñas	Philippines	Calabarzon
1715542	Dapitan	Philippines	Zamboanga Peninsula
1715804	Danao	Philippines	Central Visayas
1715812	Danao	Philippines	Central Visayas
1716287	Daet	Philippines	Bicol
1716618	Cuenca	Philippines	Calabarzon
1716858	Cordova	Philippines	Central Visayas
1716924	Consolacion	Philippines	Central Visayas
1716995	Concepcion	Philippines	Central Luzon
1717008	Concepcion Ibaba	Philippines	Calabarzon
1717051	Compostela	Philippines	Central Visayas
1717053	Compostela	Philippines	Davao
1717512	Cebu City	Philippines	Central Visayas
1717641	Cavite City	Philippines	Calabarzon
1717911	Catbalogan	Philippines	Eastern Visayas
1717926	Catarman	Philippines	Eastern Visayas
1717960	Catanauan	Philippines	Calabarzon
1718306	Carmona	Philippines	Calabarzon
1718328	Cogan	Philippines	Central Visayas
1718393	Carigara	Philippines	Eastern Visayas
1718426	Cardona	Philippines	Calabarzon
1718436	Carcar	Philippines	Central Visayas
1718722	Capas	Philippines	Central Luzon
1719053	Canlaon	Philippines	Central Visayas
1719274	Candelaria	Philippines	Calabarzon
1719329	Candaba	Philippines	Central Luzon
1719683	Camiling	Philippines	Central Luzon
1720034	Calumpit	Philippines	Central Luzon
1720052	Calumpang	Philippines	Metro Manila
1720464	Calauan	Philippines	Calabarzon
1720472	Calauag	Philippines	Calabarzon
1720499	Calatagan	Philippines	Calabarzon
1720508	Calasiao	Philippines	Ilocos
1720561	Calapan	Philippines	Mimaropa
1720681	Calamba	Philippines	Calabarzon
1720751	Calaca	Philippines	Calabarzon
1720793	Calabanga	Philippines	Bicol
1720840	Cainta	Philippines	Calabarzon
1721080	Cagayan de Oro	Philippines	Northern Mindanao
1721168	Cadiz	Philippines	Western Visayas
1721636	Cabiao	Philippines	Central Luzon
1721695	Cabayangan	Philippines	Davao
1721906	Cabanatuan City	Philippines	Central Luzon
1722005	Cabagan	Philippines	Cagayan Valley
1722032	Cabadbaran	Philippines	Caraga
1722186	Butuan	Philippines	Caraga
1722267	Bustos	Philippines	Central Luzon
1722433	Burgos	Philippines	Central Luzon
1722731	Bunawan	Philippines	Caraga
1722818	Buluan	Philippines	Autonomous Region in Muslim Mindanao
1722930	Bulaon	Philippines	Central Luzon
1722985	Bulan	Philippines	Bicol
1723066	Bulacan	Philippines	Central Luzon
1723166	Buhi	Philippines	Bicol
1723257	Bugo	Philippines	Northern Mindanao
1723481	Buenavista	Philippines	Caraga
1723510	Budta	Philippines	Autonomous Region in Muslim Mindanao
1723822	Botolan	Philippines	Central Luzon
1723893	Borongan	Philippines	Eastern Visayas
1724088	Bongao	Philippines	Autonomous Region in Muslim Mindanao
1724106	Bongabon	Philippines	Central Luzon
1724435	Bogo	Philippines	Central Visayas
1724489	Bocaue	Philippines	Central Luzon
1724767	Bislig	Philippines	Caraga
1724933	Binonga	Philippines	Western Visayas
1724956	Binmaley	Philippines	Ilocos
1725157	Binalbagan	Philippines	Western Visayas
1725359	Bignay Uno	Philippines	Calabarzon
1725684	Bayugan	Philippines	Caraga
1725729	Bayombong	Philippines	Cagayan Valley
1725799	Baybay	Philippines	Eastern Visayas
1725804	Bayawan	Philippines	Central Visayas
1725863	Bayambang	Philippines	Ilocos
1725919	Bay	Philippines	Calabarzon
1725983	Bauang	Philippines	Ilocos
1725991	Bauan	Philippines	Calabarzon
1726156	Bato	Philippines	Bicol
1726280	Batangas	Philippines	Calabarzon
1726339	Batac City	Philippines	Ilocos
1726765	Baras	Philippines	Calabarzon
1727080	Bansalan	Philippines	Davao
1727400	Bañga	Philippines	Soccsksargen
1727522	Banaybanay	Philippines	Calabarzon
1727663	Bambang	Philippines	Cagayan Valley
1727995	Baliuag	Philippines	Central Luzon
1728336	Balayan	Philippines	Calabarzon
1728523	Balanga	Philippines	Central Luzon
1728546	Balamban	Philippines	Central Visayas
1728584	Balagtas	Philippines	Central Luzon
1728772	Bais	Philippines	Central Visayas
1728825	Bah-Bah	Philippines	Caraga
1728930	Baguio	Philippines	Cordillera
1729085	Bago City	Philippines	Western Visayas
1729324	Baggabag B	Philippines	Cagayan Valley
1729524	Bacoor	Philippines	Calabarzon
1729564	Bacolod City	Philippines	Western Visayas
1729734	Babo-Pangulo	Philippines	Central Luzon
1729814	Baao	Philippines	Bicol
1729987	Atimonan	Philippines	Calabarzon
1730097	Asia	Philippines	Western Visayas
1730171	Aringay	Philippines	Ilocos
1730398	Aparri	Philippines	Cagayan Valley
1730413	Apalit	Philippines	Central Luzon
1730501	Antipolo	Philippines	Calabarzon
1730713	Angono	Philippines	Calabarzon
1730737	Angeles City	Philippines	Central Luzon
1730749	Angat	Philippines	Central Luzon
1731212	Amadeo	Philippines	Calabarzon
1731486	Alicia	Philippines	Cagayan Valley
1731528	Aliaga	Philippines	Central Luzon
1731686	Alaminos	Philippines	Calabarzon
1731744	Alabel	Philippines	Soccsksargen
1731959	Agoo	Philippines	Ilocos
1732312	Abuyog	Philippines	Eastern Visayas
1732354	Abucay	Philippines	Central Luzon
1978681	Malingao	Philippines	Soccsksargen
7290466	Pasig City	Philippines	Metro Manila
8299649	Pandan	Philippines	Western Visayas
10628881	Apas	Philippines	Central Visayas
1108161	Chuhar Jamāli	Pakistan	Sindh
1161983	Rāwala Kot	Pakistan	Azad Kashmir
1161991	Pīr jo Goth	Pakistan	Sindh
1162004	Khairpur	Pakistan	Sindh
1162105	Zhob	Pakistan	Balochistān
1162261	Zaida	Pakistan	Khyber Pakhtunkhwa
1162275	Zāhir Pīr	Pakistan	Punjab
1162285	Zafarwāl	Pakistan	Punjab
1162316	Yazman	Pakistan	Punjab
1162456	Wazīrābād	Pakistan	Punjab
1162589	Wārāh	Pakistan	Sindh
1162813	Vihāri	Pakistan	Punjab
1162855	Utmānzai	Pakistan	Khyber Pakhtunkhwa
1162862	Uthal	Pakistan	Balochistān
1162868	Usta Muhammad	Pakistan	Balochistān
1162959	Umarkot	Pakistan	Sindh
1163021	Ubauro	Pakistan	Sindh
1163224	Topi	Pakistan	Khyber Pakhtunkhwa
1163272	Toba Tek Singh	Pakistan	Punjab
1163414	Thul	Pakistan	Sindh
1163582	Thatta	Pakistan	Sindh
1163595	Thāru Shāh	Pakistan	Sindh
1163724	Taunsa	Pakistan	Punjab
1163905	Tānk	Pakistan	Khyber Pakhtunkhwa
1163927	Tangi	Pakistan	Khyber Pakhtunkhwa
1163952	Tando Muhammad Khān	Pakistan	Sindh
1163958	Tando Jām	Pakistan	Sindh
1163965	Tando Allāhyār	Pakistan	Sindh
1163967	Tando Ādam	Pakistan	Sindh
1163968	Tāndliānwāla	Pakistan	Punjab
1164045	Talhār	Pakistan	Sindh
1164064	Talamba	Pakistan	Punjab
1164069	Talagang	Pakistan	Punjab
1164216	Swābi	Pakistan	Khyber Pakhtunkhwa
1164245	Surkhpur	Pakistan	Punjab
1164408	Sukkur	Pakistan	Sindh
1164419	Sukheke Mandi	Pakistan	Punjab
1164679	Sodhra	Pakistan	Punjab
1164716	Sīta Road	Pakistan	Sindh
1164776	Sinjhoro	Pakistan	Sindh
1164825	Sillānwāli	Pakistan	Punjab
1164896	Sibi	Pakistan	Balochistān
1164909	Sialkot	Pakistan	Punjab
1164970	Shujāābād	Pakistan	Punjab
1164987	Shorko	Pakistan	Khyber Pakhtunkhwa
1165108	Shikārpur	Pakistan	Sindh
1165221	Sheikhupura	Pakistan	Punjab
1165260	Sharqpur	Pakistan	Punjab
1165388	Shakargarr	Pakistan	Punjab
1165507	Shāhpur Chākar	Pakistan	Sindh
1165569	Shahkot	Pakistan	Punjab
1165635	Shāhdādpur	Pakistan	Sindh
1165638	Shāhdādkot	Pakistan	Sindh
1165744	Shabqadar	Pakistan	Khyber Pakhtunkhwa
1165789	Sehwān	Pakistan	Sindh
1166000	Sargodha	Pakistan	Punjab
1166062	Sarāi Sidhu	Pakistan	Punjab
1166066	Sarāi Naurang	Pakistan	Khyber Pakhtunkhwa
1166073	Sarāi Ālamgīr	Pakistan	Punjab
1166146	Sangla Hill	Pakistan	Punjab
1166164	Sānghar	Pakistan	Sindh
1166265	Sambriāl	Pakistan	Punjab
1166381	Sakrand	Pakistan	Sindh
1166547	Sāhīwāl	Pakistan	Punjab
1166548	Sahiwal	Pakistan	Punjab
1166827	Rohri	Pakistan	Sindh
1166933	Renāla Khurd	Pakistan	Punjab
1166993	Rawalpindi	Pakistan	Punjab
1167031	Ratodero	Pakistan	Sindh
1167142	Rānīpur	Pakistan	Sindh
1167380	Rājanpur	Pakistan	Punjab
1167386	Rāja Jang	Pakistan	Punjab
1167398	Rāiwind	Pakistan	Punjab
1167501	Rādhan	Pakistan	Sindh
1167507	Rabwāh	Pakistan	Punjab
1167528	Quetta	Pakistan	Balochistān
1167622	Kambar	Pakistan	Sindh
1167648	Qādirpur Rān	Pakistan	Punjab
1167821	Pishin	Pakistan	Balochistān
1167873	Pīr Mahal	Pakistan	Punjab
1168015	Pindi Gheb	Pakistan	Punjab
1168036	Pind Dādan Khān	Pakistan	Punjab
1168166	Phālia	Pakistan	Punjab
1168197	Peshawar	Pakistan	Khyber Pakhtunkhwa
1168226	Pattoki	Pakistan	Punjab
1168307	Pasrūr	Pakistan	Punjab
1168312	Pasni	Pakistan	Balochistān
1168412	Pāno Āqil	Pakistan	Sindh
1168555	Pākpattan	Pakistan	Punjab
1168633	Pahārpur	Pakistan	Khyber Pakhtunkhwa
1168652	Pad Īdan	Pakistan	Sindh
1168680	Pabbi	Pakistan	Khyber Pakhtunkhwa
1168718	Okāra	Pakistan	Punjab
1168749	Nushki	Pakistan	Balochistān
1169116	Nawābshāh	Pakistan	Sindh
1169143	Naushahro Fīroz	Pakistan	Sindh
1169187	Naudero	Pakistan	Sindh
1169254	Nasīrābād	Pakistan	Sindh
1169278	Nārowāl	Pakistan	Punjab
1169334	Nārang	Pakistan	Punjab
1169367	Naukot	Pakistan	Sindh
1169372	Nankāna Sāhib	Pakistan	Punjab
1169605	Muzaffargarh	Pakistan	Punjab
1169607	Muzaffarābād	Pakistan	Azad Kashmir
1169620	Mustafābād	Pakistan	Punjab
1169684	Murree	Pakistan	Punjab
1169692	Murīdke	Pakistan	Punjab
1169825	Multān	Pakistan	Punjab
1170013	Moro	Pakistan	Sindh
1170219	Mithi	Pakistan	Sindh
1170222	Mitha Tiwāna	Pakistan	Punjab
1170294	Mīrpur Māthelo	Pakistan	Sindh
1170295	Mirpur Khas	Pakistan	Sindh
1170398	Minchinābād	Pakistan	Punjab
1170425	Miānwāli	Pakistan	Punjab
1170486	Miān Channūn	Pakistan	Punjab
1170564	Mehrābpur	Pakistan	Balochistān
1170584	Mehar	Pakistan	Sindh
1170667	Mātli	Pakistan	Sindh
1170677	Matiāri	Pakistan	Sindh
1170706	Mastung	Pakistan	Balochistān
1170880	Mardan	Pakistan	Khyber Pakhtunkhwa
1170951	Mānsehra	Pakistan	Khyber Pakhtunkhwa
1171050	Mangla	Pakistan	Punjab
1171123	Mandi Bahāuddīn	Pakistan	Punjab
1171165	Mānānwāla	Pakistan	Punjab
1171198	Māmu Kānjan	Pakistan	Punjab
1171305	Malir Cantonment	Pakistan	Sindh
1171376	Malakwāl	Pakistan	Punjab
1171502	Mailsi	Pakistan	Punjab
1171868	Loralai	Pakistan	Balochistān
1171965	Lodhrān	Pakistan	Punjab
1172035	Layyah	Pakistan	Punjab
1172128	Lārkāna	Pakistan	Sindh
1172295	Lāliān	Pakistan	Punjab
1172318	Lāla Mūsa	Pakistan	Punjab
1172451	Lahore	Pakistan	Punjab
1172488	Ladhewāla Warāich	Pakistan	Punjab
1172513	Lāchi	Pakistan	Khyber Pakhtunkhwa
1172657	Kunri	Pakistan	Sindh
1172663	Kunjāh	Pakistan	Punjab
1172682	Kundiān	Pakistan	Punjab
1172779	Kulāchi	Pakistan	Khyber Pakhtunkhwa
1172888	Kot Samāba	Pakistan	Punjab
1172904	Kotri	Pakistan	Sindh
1172915	Kot Rādha Kishan	Pakistan	Punjab
1172964	Kot Mūmin	Pakistan	Punjab
1172993	Kot Malik	Pakistan	Balochistān
1173025	Kotli Lohārān	Pakistan	Punjab
1173055	Kotli	Pakistan	Azad Kashmir
1173272	Kot Ghulām Muhammad	Pakistan	Punjab
1173302	Kot Diji	Pakistan	Sindh
1173378	Kot Addu	Pakistan	Punjab
1173491	Kohāt	Pakistan	Khyber Pakhtunkhwa
1173687	Khushāb	Pakistan	Punjab
1173920	Khewra	Pakistan	Punjab
1174042	Khāriān	Pakistan	Punjab
1174062	Khārān	Pakistan	Balochistān
1174167	Khānpur	Pakistan	Punjab
1174171	Khānpur	Pakistan	Sindh
1174211	Khāngarh	Pakistan	Punjab
1174217	Khāngāh Dogrān	Pakistan	Punjab
1174301	Khalābat	Pakistan	Khyber Pakhtunkhwa
1174344	Khairpur Nathan Shāh	Pakistan	Sindh
1174355	Khairpur	Pakistan	Punjab
1174357	Khairpur	Pakistan	Sindh
1174625	Kasūr	Pakistan	Punjab
1174653	Kashmor	Pakistan	Sindh
1174720	Karor	Pakistan	Punjab
1174872	Karachi	Pakistan	Sindh
1174984	Kanganpur	Pakistan	Punjab
1175010	Kandiāro	Pakistan	Sindh
1175021	Kandhkot	Pakistan	Sindh
1175088	Kamoke	Pakistan	Punjab
1175098	Kamīr	Pakistan	Punjab
1175125	Kamar Mushāni	Pakistan	Punjab
1175156	Kamālia	Pakistan	Punjab
1175180	Kalūr Kot	Pakistan	Punjab
1175232	Kallar Kahār	Pakistan	Punjab
1175283	Kāleke Mandi	Pakistan	Punjab
1175296	Kalāt	Pakistan	Balochistān
1175365	Kālābāgh	Pakistan	Punjab
1175436	Kahūta	Pakistan	Punjab
1175446	Kohror Pakka	Pakistan	Punjab
1175453	Kāhna	Pakistan	Punjab
1175560	Kabīrwāla	Pakistan	Punjab
1175678	Johi	Pakistan	Sindh
1175748	Jhumra	Pakistan	Punjab
1175762	Jhol	Pakistan	Sindh
1175864	Jhelum	Pakistan	Punjab
1175870	Jhawāriān	Pakistan	Punjab
1175892	Jhang Sadr	Pakistan	Punjab
1176022	Jauharābād	Pakistan	Punjab
1176035	Jatoi Shimāli	Pakistan	Punjab
1176106	Jarānwāla	Pakistan	Punjab
1176218	Jand	Pakistan	Punjab
1176241	Jāmpur	Pakistan	Punjab
1176358	Jalālpur Pīrwāla	Pakistan	Punjab
1176368	Jalālpur	Pakistan	Punjab
1176444	Jahāniān Shāh	Pakistan	Punjab
1176515	Jacobābād	Pakistan	Sindh
1176734	Hyderabad	Pakistan	Sindh
1176800	Hujra	Pakistan	Punjab
1176889	Hingorja	Pakistan	Sindh
1176948	Hazro	Pakistan	Punjab
1176995	Haveliān	Pakistan	Khyber Pakhtunkhwa
1176997	Haveli	Pakistan	Punjab
1177042	Hāsilpur	Pakistan	Punjab
1177064	Hasan Abdāl	Pakistan	Punjab
1177073	Haru Zbad	Pakistan	Punjab
1177089	Harnoli	Pakistan	Punjab
1177107	Harīpur	Pakistan	Khyber Pakhtunkhwa
1177203	Hangu	Pakistan	Khyber Pakhtunkhwa
1177278	Hāla	Pakistan	Sindh
1177384	Hāfizābād	Pakistan	Punjab
1177397	Hadāli	Pakistan	Punjab
1177446	Gwadar	Pakistan	Balochistān
1177654	Gujrāt	Pakistan	Punjab
1177682	Gūjar Khān	Pakistan	Punjab
1178231	Gojra	Pakistan	Punjab
1178456	Ghotki	Pakistan	Sindh
1178560	Ghauspur	Pakistan	Sindh
1178587	Ghāro	Pakistan	Sindh
1178841	Garh Mahārāja	Pakistan	Punjab
1179061	Gambat	Pakistan	Sindh
1179223	Fort Abbās	Pakistan	Punjab
1179255	Fazalpur	Pakistan	Punjab
1179305	Chak Two Hundred Forty-Nine TDA	Pakistan	Punjab
1179346	Faruka	Pakistan	Punjab
1179377	Faqīrwāli	Pakistan	Punjab
1179400	Faisalābād	Pakistan	Punjab
1179406	Eminābād	Pakistan	Punjab
1179450	Dunyāpur	Pakistan	Punjab
1179463	Dunga Bunga	Pakistan	Punjab
1179496	Dullewāla	Pakistan	Punjab
1179760	Dīpālpur	Pakistan	Punjab
1179790	Dinga	Pakistan	Punjab
1179834	Dijkot	Pakistan	Punjab
1179837	Digri	Pakistan	Sindh
1179902	Dhoro Naro	Pakistan	Sindh
1180133	Dhanot	Pakistan	Punjab
1180281	Dera Ismāīl Khān	Pakistan	Khyber Pakhtunkhwa
1180289	Dera Ghazi Khan	Pakistan	Punjab
1180295	Dera Bugti	Pakistan	Balochistān
1180374	Daur	Pakistan	Sindh
1180419	Dāūd Khel	Pakistan	Punjab
1180436	Daska	Pakistan	Punjab
1180454	Darya Khān	Pakistan	Punjab
1180752	Dājal	Pakistan	Punjab
1180809	Dadu	Pakistan	Sindh
1180983	Chūhar Kāna	Pakistan	Punjab
1181022	Chor	Pakistan	Sindh
1181053	Choa Saidān Shāh	Pakistan	Punjab
1181073	Chishtiān Mandi	Pakistan	Punjab
1181096	Chiniot	Pakistan	Punjab
1181163	Chīchāwatni	Pakistan	Punjab
1181352	Chawinda	Pakistan	Punjab
1181439	Charsadda	Pakistan	Khyber Pakhtunkhwa
1181611	Chaman	Pakistan	Balochistān
1181636	Chakwāl	Pakistan	Punjab
1181887	Chak Āzam Saffo	Pakistan	Punjab
1182092	Būrewāla	Pakistan	Punjab
1182607	Bhit Shāh	Pakistan	Sindh
1182637	Bhimbar	Pakistan	Azad Kashmir
1182665	Bhera	Pakistan	Punjab
1182682	Bhawāna	Pakistan	Punjab
1182775	Bhān	Pakistan	Sindh
1182787	Bhalwāl	Pakistan	Punjab
1182815	Bhakkar	Pakistan	Punjab
1182829	Bhāi Pheru	Pakistan	Punjab
1182998	Bela	Pakistan	Balochistān
1183090	Bat Khela	Pakistan	Khyber Pakhtunkhwa
1183224	Basīrpur	Pakistan	Punjab
1183460	Bannu	Pakistan	Khyber Pakhtunkhwa
1183880	Bahāwalpur	Pakistan	Punjab
1183883	Bahāwalnagar	Pakistan	Punjab
1184055	Badīn	Pakistan	Sindh
1184075	Baddomalhi	Pakistan	Punjab
1184249	Attock City	Pakistan	Punjab
1184569	Amangarh	Pakistan	Khyber Pakhtunkhwa
1184655	Alīpur	Pakistan	Punjab
1184752	Akora	Pakistan	Khyber Pakhtunkhwa
1184845	Ahmadpur East	Pakistan	Punjab
1185056	Abbottābād	Pakistan	Khyber Pakhtunkhwa
1332083	Bahāwalnagar	Pakistan	Punjab
1341204	Nowshera Cantonment	Pakistan	Khyber Pakhtunkhwa
1356491	Ahmadpur Siāl	Pakistan	Punjab
1357699	New Bādāh	Pakistan	Sindh
1360491	Tando Ghulām Ali	Pakistan	Sindh
1412008	Sethārja Old	Pakistan	Sindh
6457378	Malakwal City	Pakistan	Punjab
752967	Żyrardów	Poland	Masovian Voivodeship
753142	Żoliborz	Poland	Masovian Voivodeship
753276	Zielonka	Poland	Masovian Voivodeship
753866	Zamość	Poland	Lublin Voivodeship
753895	Zambrów	Poland	Podlasie
754351	Ząbki	Poland	Masovian Voivodeship
754454	Wyszków	Poland	Masovian Voivodeship
754800	Wołomin	Poland	Masovian Voivodeship
755330	Wola	Poland	Masovian Voivodeship
755475	Włochy	Poland	Masovian Voivodeship
755889	Wieliczka	Poland	Lesser Poland Voivodeship
756004	Wesoła	Poland	Masovian Voivodeship
756092	Wawer	Poland	Masovian Voivodeship
756135	Warsaw	Poland	Masovian Voivodeship
756320	Ursus	Poland	Masovian Voivodeship
756868	Tomaszów Lubelski	Poland	Lublin Voivodeship
757026	Tarnów	Poland	Lesser Poland Voivodeship
757033	Tarnobrzeg	Poland	Subcarpathian Voivodeship
757065	Targówek	Poland	Masovian Voivodeship
757357	Szczytno	Poland	Warmian-Masurian Voivodeship
757692	Świdnik	Poland	Lublin Voivodeship
757718	Suwałki	Poland	Podlasie
757809	Sulejówek	Poland	Masovian Voivodeship
758252	Staszów	Poland	Świętokrzyskie
758390	Starachowice	Poland	Świętokrzyskie
758445	Stalowa Wola	Poland	Subcarpathian Voivodeship
758470	Śródmieście	Poland	Masovian Voivodeship
758626	Sokołów Podlaski	Poland	Masovian Voivodeship
758651	Sokółka	Poland	Podlasie
758682	Sochaczew	Poland	Masovian Voivodeship
759123	Skierniewice	Poland	Łódź Voivodeship
759141	Skarżysko-Kamienna	Poland	Świętokrzyskie
759320	Siemiatycze	Poland	Podlasie
759412	Siedlce	Poland	Masovian Voivodeship
759591	Sanok	Poland	Subcarpathian Voivodeship
759603	Sandomierz	Poland	Świętokrzyskie
760343	Ropczyce	Poland	Subcarpathian Voivodeship
760503	Rembertów	Poland	Masovian Voivodeship
760584	Rawa Mazowiecka	Poland	Łódź Voivodeship
760680	Radzyń Podlaski	Poland	Lublin Voivodeship
760778	Radom	Poland	Masovian Voivodeship
760917	Pułtusk	Poland	Masovian Voivodeship
760924	Puławy	Poland	Lublin Voivodeship
761131	Przeworsk	Poland	Subcarpathian Voivodeship
761168	Przemyśl	Poland	Subcarpathian Voivodeship
761218	Przasnysz	Poland	Masovian Voivodeship
761228	Pruszków	Poland	Masovian Voivodeship
762021	Płońsk	Poland	Masovian Voivodeship
762120	Pisz	Poland	Warmian-Masurian Voivodeship
762199	Pionki	Poland	Masovian Voivodeship
762381	Piastów	Poland	Masovian Voivodeship
762423	Piaseczno	Poland	Masovian Voivodeship
762788	Otwock	Poland	Masovian Voivodeship
762863	Ostrowiec Świętokrzyski	Poland	Świętokrzyskie
762909	Ostrołęka	Poland	Masovian Voivodeship
763111	Opoczno	Poland	Łódź Voivodeship
763166	Olsztyn	Poland	Warmian-Masurian Voivodeship
763291	Olecko	Poland	Warmian-Masurian Voivodeship
763442	Ochota	Poland	Masovian Voivodeship
763523	Nowy Targ	Poland	Lesser Poland Voivodeship
763534	Nowy Sącz	Poland	Lesser Poland Voivodeship
763556	Nowy Dwór Mazowiecki	Poland	Masovian Voivodeship
763829	Nisko	Poland	Subcarpathian Voivodeship
764312	Mrągowo	Poland	Warmian-Masurian Voivodeship
764484	Mokotów	Poland	Masovian Voivodeship
764634	Mława	Poland	Masovian Voivodeship
764679	Mińsk Mazowiecki	Poland	Masovian Voivodeship
764849	Mielec	Poland	Subcarpathian Voivodeship
764862	Międzyrzec Podlaski	Poland	Lublin Voivodeship
765191	Marki	Poland	Masovian Voivodeship
765749	Łuków	Poland	Lublin Voivodeship
765876	Lublin	Poland	Lublin Voivodeship
765927	Lubartów	Poland	Lublin Voivodeship
766027	Łomża	Poland	Podlasie
766307	Lidzbark Warmiński	Poland	Warmian-Masurian Voivodeship
766555	Legionowo	Poland	Masovian Voivodeship
766583	Łęczna	Poland	Lublin Voivodeship
766783	Łapy	Poland	Podlasie
766810	Łańcut	Poland	Subcarpathian Voivodeship
767470	Krosno	Poland	Subcarpathian Voivodeship
767605	Krasnystaw	Poland	Lublin Voivodeship
767623	Kraśnik	Poland	Lublin Voivodeship
767814	Kozienice	Poland	Masovian Voivodeship
768216	Konstancin-Jeziorna	Poland	Masovian Voivodeship
768218	Końskie	Poland	Świętokrzyskie
768905	Kobyłka	Poland	Masovian Voivodeship
769250	Kielce	Poland	Świętokrzyskie
769893	Kabaty	Poland	Masovian Voivodeship
769981	Józefów	Poland	Masovian Voivodeship
770157	Jędrzejów	Poland	Świętokrzyskie
770293	Jasło	Poland	Subcarpathian Voivodeship
770380	Jarosław	Poland	Subcarpathian Voivodeship
770966	Hrubieszów	Poland	Lublin Voivodeship
771158	Hajnówka	Poland	Podlasie
771401	Grodzisk Mazowiecki	Poland	Masovian Voivodeship
771506	Grajewo	Poland	Podlasie
771804	Gorlice	Poland	Lesser Poland Voivodeship
772195	Giżycko	Poland	Warmian-Masurian Voivodeship
772227	Gierłoż	Poland	Warmian-Masurian Voivodeship
772339	Garwolin	Poland	Masovian Voivodeship
772621	Ełk	Poland	Warmian-Masurian Voivodeship
772748	Działdowo	Poland	Warmian-Masurian Voivodeship
773357	Dęblin	Poland	Lublin Voivodeship
773380	Dębica	Poland	Subcarpathian Voivodeship
774208	Ciechanów	Poland	Masovian Voivodeship
774558	Chełm	Poland	Lublin Voivodeship
774747	Busko-Zdrój	Poland	Świętokrzyskie
775183	Brzesko	Poland	Lesser Poland Voivodeship
775758	Bochnia	Poland	Lesser Poland Voivodeship
775922	Biłgoraj	Poland	Lublin Voivodeship
775986	Bielsk Podlaski	Poland	Podlasie
776069	Białystok	Poland	Podlasie
776103	Białołeka	Poland	Masovian Voivodeship
776175	Biała Podlaska	Poland	Lublin Voivodeship
776251	Bemowo	Poland	Masovian Voivodeship
776337	Bartoszyce	Poland	Warmian-Masurian Voivodeship
776597	Augustów	Poland	Podlasie
3079855	Żywiec	Poland	Silesian Voivodeship
3080004	Żory	Poland	Silesian Voivodeship
3080071	Złotów	Poland	Greater Poland Voivodeship
3080074	Złotoryja	Poland	Lower Silesian Voivodeship
3080165	Zielona Góra	Poland	Lubusz
3080231	Zgorzelec	Poland	Lower Silesian Voivodeship
3080251	Zgierz	Poland	Łódź Voivodeship
3080414	Zduńska Wola	Poland	Łódź Voivodeship
3080644	Żary	Poland	Lubusz
3080866	Zakopane	Poland	Lesser Poland Voivodeship
3080944	Żagań	Poland	Lubusz
3080985	Zabrze	Poland	Silesian Voivodeship
3081046	Ząbkowice Śląskie	Poland	Lower Silesian Voivodeship
3081324	Września	Poland	Greater Poland Voivodeship
3081368	Wrocław	Poland	Lower Silesian Voivodeship
3081677	Wodzisław Śląski	Poland	Silesian Voivodeship
3081741	Włocławek	Poland	Kujawsko-Pomorskie
3082197	Wieluń	Poland	Łódź Voivodeship
3082473	Wejherowo	Poland	Pomeranian Voivodeship
3082704	Wałcz	Poland	West Pomeranian Voivodeship
3082707	Wałbrzych	Poland	Lower Silesian Voivodeship
3082712	Wągrowiec	Poland	Greater Poland Voivodeship
3082722	Wadowice	Poland	Lesser Poland Voivodeship
3082751	Ustroń	Poland	Silesian Voivodeship
3082756	Ustka	Poland	Pomeranian Voivodeship
3082914	Tychy	Poland	Silesian Voivodeship
3083111	Trzebinia	Poland	Lesser Poland Voivodeship
3083185	Trzcianka	Poland	Greater Poland Voivodeship
3083271	Toruń	Poland	Kujawsko-Pomorskie
3083426	Tczew	Poland	Pomeranian Voivodeship
3083440	Tarnowskie Góry	Poland	Silesian Voivodeship
3083826	Szczecinek	Poland	West Pomeranian Voivodeship
3083829	Szczecin	Poland	West Pomeranian Voivodeship
3083878	Szamotuły	Poland	Greater Poland Voivodeship
3083955	Świnoujście	Poland	West Pomeranian Voivodeship
3083988	Świętochłowice	Poland	Silesian Voivodeship
3084062	Świebodzin	Poland	Lubusz
3084074	Świecie	Poland	Kujawsko-Pomorskie
3084084	Świebodzice	Poland	Lower Silesian Voivodeship
3084085	Świdwin	Poland	West Pomeranian Voivodeship
3084093	Świdnica	Poland	Lower Silesian Voivodeship
3084130	Swarzędz	Poland	Greater Poland Voivodeship
3084241	Sulechów	Poland	Lubusz
3084415	Strzelce Opolskie	Poland	Opole Voivodeship
3084826	Starogard Gdański	Poland	Pomeranian Voivodeship
3084840	Stargard Szczeciński	Poland	West Pomeranian Voivodeship
3085045	Środa Wielkopolska	Poland	Greater Poland Voivodeship
3085056	Śrem	Poland	Greater Poland Voivodeship
3085128	Sosnowiec	Poland	Silesian Voivodeship
3085151	Sopot	Poland	Pomeranian Voivodeship
3085172	Solec Kujawski	Poland	Kujawsko-Pomorskie
3085450	Słupsk	Poland	Pomeranian Voivodeship
3085495	Słubice	Poland	Lubusz
3085941	Sierpc	Poland	Masovian Voivodeship
3085978	Sieradz	Poland	Łódź Voivodeship
3086024	Siemianowice Śląskie	Poland	Silesian Voivodeship
3086511	Rypin	Poland	Kujawsko-Pomorskie
3086531	Rydułtowy	Poland	Silesian Voivodeship
3086586	Rybnik	Poland	Silesian Voivodeship
3086706	Rumia	Poland	Pomeranian Voivodeship
3087281	Reda	Poland	Pomeranian Voivodeship
3087307	Rawicz	Poland	Greater Poland Voivodeship
3087418	Radzionków	Poland	Silesian Voivodeship
3087497	Radomsko	Poland	Łódź Voivodeship
3087529	Radlin	Poland	Silesian Voivodeship
3087584	Racibórz	Poland	Silesian Voivodeship
3087628	Pyskowice	Poland	Silesian Voivodeship
3087705	Pszczyna	Poland	Silesian Voivodeship
3088034	Pruszcz Gdański	Poland	Pomeranian Voivodeship
3088065	Prudnik	Poland	Opole Voivodeship
3088171	Poznań	Poland	Greater Poland Voivodeship
3088435	Polkowice	Poland	Lower Silesian Voivodeship
3088461	Police	Poland	West Pomeranian Voivodeship
3088825	Płock	Poland	Masovian Voivodeship
3088848	Pleszew	Poland	Greater Poland Voivodeship
3088972	Piotrków Trybunalski	Poland	Łódź Voivodeship
3089033	Piła	Poland	Greater Poland Voivodeship
3089578	Pabianice	Poland	Łódź Voivodeship
3089582	Ozorków	Poland	Łódź Voivodeship
3089658	Oświęcim	Poland	Lesser Poland Voivodeship
3089684	Ostrów Wielkopolski	Poland	Greater Poland Voivodeship
3089779	Ostróda	Poland	Warmian-Masurian Voivodeship
3089965	Orzesze	Poland	Silesian Voivodeship
3090048	Opole	Poland	Opole Voivodeship
3090146	Olkusz	Poland	Lesser Poland Voivodeship
3090170	Oleśnica	Poland	Lower Silesian Voivodeship
3090205	Oława	Poland	Lower Silesian Voivodeship
3090403	Oborniki	Poland	Greater Poland Voivodeship
3090436	Nysa	Poland	Opole Voivodeship
3090452	Nowy Tomyśl	Poland	Greater Poland Voivodeship
3090558	Nowogard	Poland	West Pomeranian Voivodeship
3090764	Nowa Sól	Poland	Lubusz
3090768	Nowa Ruda	Poland	Lower Silesian Voivodeship
3091141	Namysłów	Poland	Opole Voivodeship
3091150	Nakło nad Notecią	Poland	Kujawsko-Pomorskie
3091217	Myszków	Poland	Silesian Voivodeship
3091232	Mysłowice	Poland	Silesian Voivodeship
3091256	Myślenice	Poland	Lesser Poland Voivodeship
3091969	Międzyrzecz	Poland	Lubusz
3092472	Malbork	Poland	Pomeranian Voivodeship
3092856	Luboń	Poland	Greater Poland Voivodeship
3092906	Lubliniec	Poland	Silesian Voivodeship
3092931	Lubin	Poland	Lower Silesian Voivodeship
3093040	Lubań	Poland	Lower Silesian Voivodeship
3093066	Łowicz	Poland	Łódź Voivodeship
3093133	Łódź	Poland	Łódź Voivodeship
3093457	Libiąż	Poland	Lesser Poland Voivodeship
3093524	Leszno	Poland	Greater Poland Voivodeship
3093692	Legnica	Poland	Lower Silesian Voivodeship
3093708	Lędziny	Poland	Silesian Voivodeship
3093726	Łęczyca	Poland	Łódź Voivodeship
3093739	Lębork	Poland	Pomeranian Voivodeship
3093785	Łaziska Górne	Poland	Silesian Voivodeship
3093902	Łask	Poland	Łódź Voivodeship
3094086	Kwidzyn	Poland	Pomeranian Voivodeship
3094170	Kutno	Poland	Łódź Voivodeship
3094788	Krapkowice	Poland	Opole Voivodeship
3094802	Kraków	Poland	Lesser Poland Voivodeship
3095049	Koszalin	Poland	West Pomeranian Voivodeship
3095057	Kostrzyn nad Odrą	Poland	Lubusz
3095126	Kościerzyna	Poland	Pomeranian Voivodeship
3095151	Kościan	Poland	Greater Poland Voivodeship
3095277	Konstantynów Łódzki	Poland	Łódź Voivodeship
3095321	Konin	Poland	Greater Poland Voivodeship
3095795	Kołobrzeg	Poland	West Pomeranian Voivodeship
3095797	Koło	Poland	Greater Poland Voivodeship
3095971	Knurów	Poland	Silesian Voivodeship
3096003	Kluczbork	Poland	Opole Voivodeship
3096053	Kłodzko	Poland	Lower Silesian Voivodeship
3096328	Kęty	Poland	Lesser Poland Voivodeship
3096372	Kędzierzyn-Koźle	Poland	Opole Voivodeship
3096472	Katowice	Poland	Silesian Voivodeship
3096525	Kartuzy	Poland	Pomeranian Voivodeship
3096880	Kalisz	Poland	Greater Poland Voivodeship
3097257	Jelenia Góra	Poland	Lower Silesian Voivodeship
3097271	Jelcz	Poland	Lower Silesian Voivodeship
3097333	Jaworzno	Poland	Silesian Voivodeship
3097367	Jawor	Poland	Lower Silesian Voivodeship
3097391	Jastrzębie Zdrój	Poland	Silesian Voivodeship
3097528	Jarocin	Poland	Greater Poland Voivodeship
3097872	Inowrocław	Poland	Kujawsko-Pomorskie
3097902	Iława	Poland	Warmian-Masurian Voivodeship
3098130	Gubin	Poland	Lubusz
3098200	Gryfino	Poland	West Pomeranian Voivodeship
3098201	Gryfice	Poland	West Pomeranian Voivodeship
3098218	Grudziądz	Poland	Kujawsko-Pomorskie
3098619	Gostynin	Poland	Masovian Voivodeship
3098625	Gostyń	Poland	Greater Poland Voivodeship
3098722	Gorzów Wielkopolski	Poland	Lubusz
3098966	Goleniów	Poland	West Pomeranian Voivodeship
3099112	Gniezno	Poland	Greater Poland Voivodeship
3099169	Głuchołazy	Poland	Opole Voivodeship
3099180	Głowno	Poland	Łódź Voivodeship
3099213	Głogów	Poland	Lower Silesian Voivodeship
3099230	Gliwice	Poland	Silesian Voivodeship
3099654	Fordon	Poland	Kujawsko-Pomorskie
3099759	Elbląg	Poland	Warmian-Masurian Voivodeship
3100796	Dąbrowa Górnicza	Poland	Silesian Voivodeship
3100946	Częstochowa	Poland	Silesian Voivodeship
3100974	Czerwionka-Leszczyny	Poland	Silesian Voivodeship
3101057	Czeladź	Poland	Silesian Voivodeship
3101076	Czechowice-Dziedzice	Poland	Silesian Voivodeship
3101321	Cieszyn	Poland	Silesian Voivodeship
3101547	Chrzanów	Poland	Lesser Poland Voivodeship
3101613	Choszczno	Poland	West Pomeranian Voivodeship
3101619	Chorzów	Poland	Silesian Voivodeship
3101672	Chojnice	Poland	Pomeranian Voivodeship
3101680	Chodzież	Poland	Greater Poland Voivodeship
3101787	Chełmża	Poland	Kujawsko-Pomorskie
3101795	Chełmno	Poland	Kujawsko-Pomorskie
3101943	Bytów	Poland	Pomeranian Voivodeship
3101950	Bytom	Poland	Silesian Voivodeship
3102014	Bydgoszcz	Poland	Kujawsko-Pomorskie
3102459	Brzeg	Poland	Opole Voivodeship
3102627	Brodnica	Poland	Kujawsko-Pomorskie
3102677	Braniewo	Poland	Warmian-Masurian Voivodeship
3102987	Bolesławiec	Poland	Lower Silesian Voivodeship
3103096	Bogatynia	Poland	Lower Silesian Voivodeship
3103365	Bieruń	Poland	Silesian Voivodeship
3103402	Bielsko-Biala	Poland	Silesian Voivodeship
3103476	Bielawa	Poland	Lower Silesian Voivodeship
3103556	Białogard	Poland	West Pomeranian Voivodeship
3103709	Bełchatów	Poland	Łódź Voivodeship
3103719	Będzin	Poland	Silesian Voivodeship
3104115	Andrychów	Poland	Lesser Poland Voivodeship
3104132	Aleksandrów Łódzki	Poland	Łódź Voivodeship
6545326	Ursynów	Poland	Masovian Voivodeship
6545347	Praga Północ	Poland	Masovian Voivodeship
6545348	Praga Południe	Poland	Masovian Voivodeship
7303641	Jelcz Laskowice	Poland	Lower Silesian Voivodeship
3424934	Saint-Pierre	Saint Pierre and Miquelon	Saint-Pierre
4030723	Adamstown	Pitcairn	N/A
4562506	Aguadilla	Puerto Rico	Aguadilla
4562635	Arecibo	Puerto Rico	Arecibo
4562768	Barceloneta	Puerto Rico	Barceloneta
4562831	Bayamón	Puerto Rico	Bayamón
4563008	Caguas	Puerto Rico	Caguas
4563122	Candelaria	Puerto Rico	Toa Baja
4563243	Carolina	Puerto Rico	Carolina
4563298	Cataño	Puerto Rico	Catano
4563308	Cayey	Puerto Rico	Cayey
4564946	Fajardo	Puerto Rico	Fajardo
4565105	Guayama	Puerto Rico	Guayama
4565564	Humacao	Puerto Rico	Humacao
4566002	Levittown	Puerto Rico	Toa Baja
4566137	Manatí	Puerto Rico	Manati
4566385	Mayagüez	Puerto Rico	Mayaguez
4566880	Ponce	Puerto Rico	Ponce
4568127	San Juan	Puerto Rico	San Juan
4568451	Trujillo Alto	Puerto Rico	Trujillo Alto
4568533	Vega Baja	Puerto Rico	Vega Baja
4568917	Yauco	Puerto Rico	Yauco
281102	Rafaḩ	Palestinian Territory	Gaza Strip
281124	Khān Yūnis	Palestinian Territory	Gaza Strip
281129	Jabālyā	Palestinian Territory	Gaza Strip
281133	Gaza	Palestinian Territory	Gaza Strip
281141	Dayr al Balaḩ	Palestinian Territory	Gaza Strip
281145	Bayt Lāhyā	Palestinian Territory	Gaza Strip
281146	Bayt Ḩānūn	Palestinian Territory	Gaza Strip
281148	Banī Suhaylā	Palestinian Territory	Gaza Strip
281161	Al Burayj	Palestinian Territory	Gaza Strip
281165	‘Abasān al Kabīrah	Palestinian Territory	Gaza Strip
281292	Yuta	Palestinian Territory	West Bank
281577	Ţūlkarm	Palestinian Territory	West Bank
281581	Ţūbās	Palestinian Territory	West Bank
281793	Sa‘īr	Palestinian Territory	West Bank
282239	Ramallah	Palestinian Territory	West Bank
282457	Qalqīlyah	Palestinian Territory	West Bank
282476	Qabāţīyah	Palestinian Territory	West Bank
282615	Nablus	Palestinian Territory	West Bank
283506	Janīn	Palestinian Territory	West Bank
283621	Idhnā	Palestinian Territory	West Bank
283806	Ḩalḩūl	Palestinian Territory	West Bank
284011	Dūrā	Palestinian Territory	West Bank
284315	Bethlehem	Palestinian Territory	West Bank
284431	Banī Na‘īm	Palestinian Territory	West Bank
284446	Balāţah	Palestinian Territory	West Bank
284486	Az̧ Z̧āhirīyah	Palestinian Territory	West Bank
284583	As Samū‘	Palestinian Territory	West Bank
284890	Ar Rām wa Ḑāḩiyat al Barīd	Palestinian Territory	West Bank
284899	Jericho	Palestinian Territory	West Bank
284999	Al Yāmūn	Palestinian Territory	West Bank
285066	Hebron	Palestinian Territory	West Bank
285108	Al Bīrah	Palestinian Territory	West Bank
285111	Al ‘Ayzarīyah	Palestinian Territory	West Bank
6945291	Old City	Palestinian Territory	West Bank
6967865	Al Qarārah	Palestinian Territory	Gaza Strip
6967990	Az Zuwāydah	Palestinian Territory	Gaza Strip
7303419	East Jerusalem	Palestinian Territory	West Bank
2261639	Vila Franca de Xira	Portugal	Lisbon
2261697	Vialonga	Portugal	Lisbon
2262581	Torres Vedras	Portugal	Lisbon
2262644	Tomar	Portugal	Santarém
2262912	Sintra	Portugal	Lisbon
2262957	Sesimbra	Portugal	Setúbal
2262963	Setúbal	Portugal	Setúbal
2263352	São Domingos de Rana	Portugal	Lisbon
2263480	Santarém	Portugal	Santarém
2263667	Sacavém	Portugal	Lisbon
2263827	Rio de Mouro	Portugal	Lisbon
2264087	Ramada	Portugal	Lisbon
2264268	Queluz	Portugal	Lisbon
2264299	Quarteira	Portugal	Faro
2264359	Póvoa de Santa Iria	Portugal	Lisbon
2264456	Portimão	Portugal	Faro
2264508	Portalegre	Portugal	Portalegre
2264526	Pontinha	Portugal	Lisbon
2264575	Pombal	Portugal	Leiria
2264736	Piedade	Portugal	Setúbal
2264923	Peniche	Portugal	Leiria
2265169	Parede	Portugal	Lisbon
2265223	Palmela	Portugal	Setúbal
2265326	Paço de Arcos	Portugal	Lisbon
2265447	Olhão	Portugal	Faro
2265467	Odivelas	Portugal	Lisbon
2265788	Montijo	Portugal	Setúbal
2265927	Monte Estoril	Portugal	Lisbon
2266249	Monsanto	Portugal	Santarém
2266319	Moita	Portugal	Setúbal
2266703	Marinha Grande	Portugal	Leiria
2266977	Loures	Portugal	Lisbon
2266988	Loulé	Portugal	Faro
2267057	Lisbon	Portugal	Lisbon
2267067	Linda-a-Velha	Portugal	Lisbon
2267095	Leiria	Portugal	Leiria
2267131	Laranjeiro	Portugal	Faro
2267226	Lagos	Portugal	Faro
2268339	Faro	Portugal	Faro
2268406	Évora	Portugal	Évora
2268436	Estoril	Portugal	Lisbon
2268575	Entroncamento	Portugal	Santarém
2269041	Corroios	Portugal	Setúbal
2269282	Charneca	Portugal	Setúbal
2269514	Castelo Branco	Portugal	Castelo Branco
2269594	Cascais	Portugal	Lisbon
2270157	Carnaxide	Portugal	Lisbon
2270184	Carcavelos	Portugal	Lisbon
2270229	Caparica	Portugal	Setúbal
2270377	Camarate	Portugal	Lisbon
2270437	Caldas da Rainha	Portugal	Leiria
2270503	Cacém	Portugal	Lisbon
2270981	Belas	Portugal	Lisbon
2270985	Beja	Portugal	Beja
2271071	Barreiro	Portugal	Setúbal
2271473	Arrentela	Portugal	Setúbal
2271680	Amora	Portugal	Setúbal
2271772	Amadora	Portugal	Lisbon
2271961	Almada	Portugal	Setúbal
2271985	Algés	Portugal	Lisbon
2272215	Alcabideche	Portugal	Lisbon
2272222	Albufeira	Portugal	Faro
2732265	Viseu	Portugal	Viseu
2732438	Vila Real	Portugal	Vila Real
2732475	Vilar de Andorinho	Portugal	Porto
2732649	Vila do Conde	Portugal	Porto
2732773	Viana do Castelo	Portugal	Viana do Castelo
2732978	Valongo	Portugal	Porto
2734106	Sequeira	Portugal	Guarda
2734140	Senhora da Hora	Portugal	Porto
2734363	São Pedro da Cova	Portugal	Porto
2734434	São Mamede de Infesta	Portugal	Porto
2734484	São João da Madeira	Portugal	Aveiro
2735083	Rio Tinto	Portugal	Porto
2735787	Póvoa de Varzim	Portugal	Porto
2735943	Porto	Portugal	Porto
2736041	Ponte de Lima	Portugal	Viana do Castelo
2736521	Pedroso	Portugal	Porto
2736930	Ovar	Portugal	Aveiro
2737039	Oliveira do Douro	Portugal	Porto
2737523	Monção	Portugal	Viana do Castelo
2737824	Matosinhos	Portugal	Porto
2738014	Maia	Portugal	Porto
2738348	Leça da Palmeira	Portugal	Porto
2738707	Ílhavo	Portugal	Aveiro
2738752	Guimarães	Portugal	Braga
2738785	Guarda	Portugal	Guarda
2738925	Gondomar	Portugal	Porto
2739723	Feira	Portugal	Aveiro
2739756	Fânzeres	Portugal	Porto
2739788	Fafe	Portugal	Braga
2739848	Esposende	Portugal	Braga
2739849	Esposende	Portugal	Braga
2739997	Ermesinde	Portugal	Porto
2740174	Custoias	Portugal	Guarda
2740313	Covilhã	Portugal	Castelo Branco
2740637	Coimbra	Portugal	Coimbra
2741551	Canidelo	Portugal	Porto
2742032	Braga	Portugal	Braga
2742051	Bougado	Portugal	Porto
2742416	Barcelos	Portugal	Braga
2742506	Baguim do Monte	Portugal	Porto
2742611	Aveiro	Portugal	Aveiro
2743304	Águas Santas	Portugal	Porto
3372783	Ponta Delgada	Portugal	Azores
7303944	Melekeok	Palau	Melekeok
3436714	Villarrica	Paraguay	Guairá
3436725	Villa Hayes	Paraguay	Presidente Hayes
3436728	Villa Elisa	Paraguay	Central
3437056	San Lorenzo	Paraguay	Central
3437063	San Juan Bautista	Paraguay	Misiones
3437127	San Antonio	Paraguay	Central
3437526	Pilar	Paraguay	Ñeembucú
3437547	Pedro Juan Caballero	Paraguay	Amambay
3437665	Nemby	Paraguay	Central
3437842	Limpio	Paraguay	Central
3437863	Lambaré	Paraguay	Central
3437918	Itauguá	Paraguay	Central
3437954	Itá	Paraguay	Central
3438115	Fernando de la Mora	Paraguay	Central
3438735	Encarnación	Paraguay	Itapúa
3438819	Coronel Oviedo	Paraguay	Caaguazú
3438834	Concepción	Paraguay	Concepción
3438995	Colonia Mariano Roque Alonso	Paraguay	Central
3439101	Ciudad del Este	Paraguay	Alto Paraná
3439214	Capiatá	Paraguay	Central
3439297	Caazapá	Paraguay	Caazapá
3439317	Caaguazú	Paraguay	Caaguazú
3439320	Caacupé	Paraguay	Cordillera
289523	Umm Şalāl Muḩammad	Qatar	Baladīyat Umm Şalāl
289888	Ar Rayyān	Qatar	Baladīyat ar Rayyān
289915	Al Wakrah	Qatar	Al Wakrah
289962	Al Khawr	Qatar	Al Khawr
290030	Doha	Qatar	Baladīyat ad Dawḩah
935214	Saint-Pierre	Reunion	Réunion
935221	Saint-Paul	Reunion	Réunion
935223	Saint-Louis	Reunion	Réunion
935225	Saint-Leu	Reunion	Réunion
935227	Saint-Joseph	Reunion	Réunion
935255	Sainte-Marie	Reunion	Réunion
935264	Saint-Denis	Reunion	Réunion
935267	Saint-Benoît	Reunion	Réunion
935268	Saint-André	Reunion	Réunion
935582	Le Tampon	Reunion	Réunion
935616	Le Port	Reunion	Réunion
935691	La Possession	Reunion	Réunion
7932385	Piton Saint-Leu	Reunion	N/A
662187	Zimnicea	Romania	Teleorman
662284	Zărnești	Romania	Braşov
662334	Zalău	Romania	Sălaj
662432	Vulcan	Romania	Hunedoara
662476	Voluntari	Romania	Ilfov
662699	Vişeu de Sus	Romania	Maramureş
663100	Vatra Dornei	Romania	Suceava
663118	Vaslui	Romania	Vaslui
664074	Urziceni	Romania	Ialomiţa
664460	Turda	Romania	Cluj
664518	Tulcea	Romania	Tulcea
664963	Târnăveni	Romania	Mureş
665000	Târgu Secuiesc	Romania	Covasna
665003	Târgu Neamţ	Romania	Neamţ
665004	Târgu-Mureş	Romania	Mureş
665010	Târgu Jiu	Romania	Gorj
665024	Târgovişte	Romania	Dâmboviţa
665087	Timişoara	Romania	Timiş
665355	Tecuci	Romania	Galaţi
665850	Suceava	Romania	Suceava
666767	Slatina	Romania	Olt
667101	Şimleu Silvaniei	Romania	Sălaj
667268	Sibiu	Romania	Sibiu
667303	Sfântu-Gheorghe	Romania	Covasna
667526	Sebeş	Romania	Alba
667873	Satu Mare	Romania	Satu Mare
668129	Salonta	Romania	Bihor
668314	Săcele	Romania	Braşov
668605	Roșiorii de Vede	Romania	Teleorman
668732	Roman	Romania	Neamţ
668828	Râşnov	Romania	Braşov
668872	Râmnicu Vâlcea	Romania	Vâlcea
668873	Râmnicu Sărat	Romania	Buzău
668954	Reşiţa	Romania	Caraş-Severin
668995	Reghin-Sat	Romania	Mureş
669289	Rădăuți	Romania	Suceava
669870	Popeşti-Leordeni	Romania	Ilfov
670474	Ploieşti	Romania	Prahova
670609	Piteşti	Romania	Argeş
670889	Piatra Neamţ	Romania	Neamţ
670938	Petroşani	Romania	Hunedoara
670969	Petrila	Romania	Hunedoara
671382	Pantelimon	Romania	Ilfov
671757	Orăştie	Romania	Hunedoara
671832	Olteniţa	Romania	Călăraşi
671964	Odorheiu Secuiesc	Romania	Harghita
672024	Ocna Mureş	Romania	Alba
672486	Năvodari	Romania	Constanța
672757	Motru	Romania	Gorj
672862	Moreni	Romania	Dâmboviţa
672926	Moineşti	Romania	Bacău
673033	Mizil	Romania	Prahova
673441	Miercurea-Ciuc	Romania	Harghita
673634	Mediaş	Romania	Sibiu
673636	Medgidia	Romania	Constanța
673921	Mangalia	Romania	Constanța
674295	Lupeni	Romania	Hunedoara
674531	Lugoj	Romania	Timiş
675810	Iaşi	Romania	Iaşi
675892	Huşi	Romania	Vaslui
675918	Hunedoara	Romania	Hunedoara
676527	Gura Humorului	Romania	Suceava
677106	Giurgiu	Romania	Giurgiu
677429	Gherla	Romania	Cluj
677458	Gheorgheni	Romania	Harghita
677697	Galaţi	Romania	Galaţi
677742	Găeşti	Romania	Dâmboviţa
678015	Focșani	Romania	Vrancea
678261	Filiaşi	Romania	Dolj
678301	Fetești-Gară	Romania	Ialomiţa
678306	Feteşti	Romania	Ialomiţa
678459	Fălticeni	Romania	Suceava
678817	Drobeta-Turnu Severin	Romania	Mehedinţi
678978	Drăgăşani	Romania	Vâlcea
679065	Dorohoi	Romania	Botoşani
679452	Deva	Romania	Hunedoara
679550	Dej	Romania	Cluj
679907	Curtea de Argeş	Romania	Argeş
679995	Cugir	Romania	Alba
680332	Craiova	Romania	Dolj
680897	Corabia	Romania	Olt
680963	Constanţa	Romania	Constanța
681017	Comăneşti	Romania	Bacău
681179	Codlea	Romania	Braşov
681290	Cluj-Napoca	Romania	Cluj
681502	Cisnădie	Romania	Sibiu
681862	Câmpina	Romania	Prahova
681865	Câmpia Turzii	Romania	Cluj
682321	Cernavodă	Romania	Constanța
682685	Carei	Romania	Satu Mare
682729	Caransebeş	Romania	Caraş-Severin
682747	Caracal	Romania	Olt
683034	Calafat	Romania	Dolj
683123	Buzău	Romania	Buzău
683365	Buhuşi	Romania	Bacău
683394	Buftea	Romania	Ilfov
683506	Bucharest	Romania	Bucureşti
683760	Breaza	Romania	Prahova
683844	Braşov	Romania	Braşov
683902	Brăila	Romania	Brăila
683974	Brad	Romania	Hunedoara
684039	Botoşani	Romania	Botoşani
684156	Borşa	Romania	Maramureş
684612	Blaj	Romania	Alba
684802	Bârlad	Romania	Vaslui
685586	Balş	Romania	Olt
685785	Băileşti	Romania	Dolj
685811	Băicoi	Romania	Prahova
685823	Baia Sprie	Romania	Maramureş
685826	Baia Mare	Romania	Maramureş
685948	Bacău	Romania	Bacău
686254	Arad	Romania	Arad
686502	Alexandria	Romania	Teleorman
686578	Alba Iulia	Romania	Alba
686590	Aiud	Romania	Alba
686669	Adjud	Romania	Vrancea
6697993	Baia Mare	Romania	Satu Mare
6945426	Paşcani	Romania	Iaşi
7733099	Mioveni	Romania	Argeş
8436351	Sighișoara	Romania	Mureş
8581467	Slobozia	Romania	Ialomiţa
11048317	Sector 1	Romania	Bucureşti
11048318	Sector 2	Romania	Bucureşti
11048320	Sector 4	Romania	Bucureşti
11048322	Sector 5	Romania	Bucureşti
11048323	Sector 6	Romania	Bucureşti
783814	Zrenjanin	Serbia	Vojvodina
783920	Zemun	Serbia	Central Serbia
784024	Zaječar	Serbia	Central Serbia
784136	Vršac	Serbia	Vojvodina
784227	Vranje	Serbia	Central Serbia
784873	Trstenik	Serbia	Central Serbia
785559	Stara Pazova	Serbia	Vojvodina
785615	Sremčica	Serbia	Central Serbia
785756	Smederevo	Serbia	Central Serbia
785965	Senta	Serbia	Vojvodina
786690	Prokuplje	Serbia	Central Serbia
786827	Požarevac	Serbia	Central Serbia
787050	Pirot	Serbia	Central Serbia
787237	Pančevo	Serbia	Vojvodina
787516	Obrenovac	Serbia	Central Serbia
787595	Novi Pazar	Serbia	Central Serbia
787615	Nova Pazova	Serbia	Vojvodina
787657	Niš	Serbia	Central Serbia
787718	Negotin	Serbia	Central Serbia
788709	Leskovac	Serbia	Central Serbia
788771	Lazarevac	Serbia	Central Serbia
788975	Kruševac	Serbia	Central Serbia
789107	Kraljevo	Serbia	Central Serbia
789128	Kragujevac	Serbia	Central Serbia
789518	Kikinda	Serbia	Vojvodina
789923	Jagodina	Serbia	Central Serbia
790015	Inđija	Serbia	Vojvodina
791678	Ćuprija	Serbia	Central Serbia
792456	Bor	Serbia	Central Serbia
792680	Belgrade	Serbia	Central Serbia
792814	Bečej	Serbia	Vojvodina
793111	Aranđelovac	Serbia	Central Serbia
3187297	Vrbas	Serbia	Vojvodina
3188402	Valjevo	Serbia	Central Serbia
3188434	Užice	Serbia	Central Serbia
3189595	Subotica	Serbia	Vojvodina
3190103	Sremska Mitrovica	Serbia	Vojvodina
3190342	Sombor	Serbia	Vojvodina
3191376	Šabac	Serbia	Central Serbia
3191429	Ruma	Serbia	Vojvodina
3194360	Novi Sad	Serbia	Vojvodina
3204672	Bačka Topola	Serbia	Vojvodina
3204674	Bačka Palanka	Serbia	Vojvodina
3204793	Apatin	Serbia	Vojvodina
452949	Udomlya	Russia	Tverskaya
461698	Sosnovka	Russia	St.-Petersburg
461699	Sasovo	Russia	Rjazan
461740	Zyuzino	Russia	Moscow
461835	Zyablikovo	Russia	Moscow
461910	Zverevo	Russia	Rostov
461920	Zvenigorod	Russia	MO
462444	Zlatoust	Russia	Chelyabinsk
462522	Zimovniki	Russia	Rostov
462745	Zhulebino	Russia	Moscow
462755	Zhukovskiy	Russia	MO
462822	Zhukovka	Russia	Brjansk
462984	Zhirnovsk	Russia	Volgograd
463082	Zhigulevsk	Russia	Samara
463217	Zherdevka	Russia	Tambov
463340	Zheleznovodsk	Russia	Stavropol'skiy
463343	Zheleznogorsk	Russia	Kursk
463355	Zheleznodorozhnyy	Russia	MO
463824	Zelenokumsk	Russia	Stavropol'skiy
463829	Zelenograd	Russia	Moscow
463835	Zelenodolsk	Russia	Tatarstan
463885	Zelenchukskaya	Russia	Karachayevo-Cherkesiya
464101	Zavolzh’ye	Russia	Nizjnij Novgorod
464625	Zarechnyy	Russia	Penza
464687	Zaraysk	Russia	MO
464790	Zapolyarnyy	Russia	Murmansk
465057	Zamoskvorech’ye	Russia	Moscow
465543	Zainsk	Russia	Tatarstan
466806	Yoshkar-Ola	Russia	Mariy-El
466885	Yeysk	Russia	Krasnodarskiy
466989	Yessentukskaya	Russia	Stavropol'skiy
466990	Yessentuki	Russia	Stavropol'skiy
467120	Yershov	Russia	Saratov
467525	Yemva	Russia	Komi Republic
467854	Yelizavetinskaya	Russia	Krasnodarskiy
467978	Yelets	Russia	Lipetsk
468063	Yelan’	Russia	Volgograd
468082	Yelabuga	Russia	Tatarstan
468250	Yegor’yevsk	Russia	MO
468307	Yegorlykskaya	Russia	Rostov
468390	Yefremov	Russia	Tula
468657	Yasnyy	Russia	Orenburg
468671	Yasnogorsk	Russia	Tula
468809	Yasenevo	Russia	Moscow
468866	Yartsevo	Russia	Smolensk
468902	Yaroslavl	Russia	Jaroslavl
469005	Yaransk	Russia	Kirov
469178	Yanaul	Russia	Bashkortostan
469707	Yagry	Russia	Arkhangelskaya
469844	Yablonovskiy	Russia	Adygeya
470338	Vyselki	Russia	Krasnodarskiy
470444	Vyksa	Russia	Nizjnij Novgorod
470546	Vyborg	Russia	Leningrad
470666	Vyazniki	Russia	Vladimir
470676	Vyaz’ma	Russia	Smolensk
471101	Vsevolozhsk	Russia	Leningrad
471430	Votkinsk	Russia	Udmurtiya
471456	Vostryakovo	Russia	MO
471457	Vostryakovo	Russia	MO
471656	Voskresensk	Russia	MO
472045	Voronezh	Russia	Voronezj
472072	Altuf’yevskiy	Russia	Moscow
472079	Vorob’yovo	Russia	Moscow
472231	Volzhskiy	Russia	Volgograd
472234	Volzhsk	Russia	Mariy-El
472278	Vol’sk	Russia	Saratov
472433	Volokolamsk	Russia	MO
472459	Vologda	Russia	Vologda
472722	Volkhov	Russia	Leningrad
472732	Nagornyy	Russia	Moscow
472757	Volgograd	Russia	Volgograd
472761	Volgodonsk	Russia	Rostov
473021	Vnukovo	Russia	Moscow
473127	Novovladykino	Russia	Moscow
473247	Vladimir	Russia	Vladimir
473249	Vladikavkaz	Russia	North Ossetia
473778	Vidnoye	Russia	MO
473788	Vichuga	Russia	Ivanovo
473972	Veshnyaki	Russia	Moscow
475777	Vereshchagino	Russia	Perm
475881	Venëv	Russia	Tula
475938	Vel’sk	Russia	Arkhangelskaya
476062	Velikiy Ustyug	Russia	Vologda
476077	Velikiye Luki	Russia	Pskov
476368	Vatutino	Russia	Moscow
477192	Valuyki	Russia	Belgorod
477301	Valday	Russia	Novgorod
477494	Uzlovaya	Russia	Tula
477626	Uvarovo	Russia	Tambov
477656	Uva	Russia	Udmurtiya
478044	Ust’-Labinsk	Russia	Krasnodarskiy
478071	Ust’-Katav	Russia	Chelyabinsk
478130	Ust’-Dzheguta	Russia	Karachayevo-Cherkesiya
478317	Usman’	Russia	Lipetsk
478544	Uryupinsk	Russia	Volgograd
478581	Urus-Martan	Russia	Chechnya
478724	Uritsk	Russia	St.-Petersburg
479028	Unecha	Russia	Brjansk
479123	Ulyanovsk	Russia	Ulyanovsk
479411	Ukhta	Russia	Komi Republic
479532	Uglich	Russia	Jaroslavl
479687	Uchkeken	Russia	Karachayevo-Cherkesiya
479703	Uchaly	Russia	Bashkortostan
479704	Uchaly	Russia	Bashkortostan
479933	Tyrnyauz	Russia	Kabardino-Balkariya
480060	Tver	Russia	Tverskaya
480089	Tuymazy	Russia	Bashkortostan
480122	Tutayev	Russia	Jaroslavl
480562	Tula	Russia	Tula
480685	Tuchkovo	Russia	MO
480716	Tuapse	Russia	Krasnodarskiy
480876	Tsimlyansk	Russia	Rostov
481350	Trubchevsk	Russia	Brjansk
481453	Troparëvo	Russia	Moscow
481608	Troitsk	Russia	Moscow
481964	Tosno	Russia	Leningrad
481985	Torzhok	Russia	Tverskaya
482260	Tomilino	Russia	MO
482283	Tol’yatti	Russia	Samara
482965	Timashëvsk	Russia	Krasnodarskiy
483019	Tikhvin	Russia	Leningrad
483029	Tikhoretsk	Russia	Krasnodarskiy
483137	Teykovo	Russia	Ivanovo
483495	Terek	Russia	Kabardino-Balkariya
483551	Tyoply Stan	Russia	Moscow
483661	Temryuk	Russia	Krasnodarskiy
483826	Tekstil’shchiki	Russia	Moscow
483883	Tbilisskaya	Russia	Krasnodarskiy
484646	Tambov	Russia	Tambov
484907	Taganrog	Russia	Rostov
484912	Taganskiy	Russia	Moscow
484972	Syzran’	Russia	Samara
485239	Syktyvkar	Russia	Komi Republic
485432	Svobody	Russia	Stavropol'skiy
485630	Sviblovo	Russia	Moscow
485639	Svetogorsk	Russia	Leningrad
485660	Svetlyy	Russia	Kaliningrad
485698	Svetlograd	Russia	Stavropol'skiy
485871	Suvorovskaya	Russia	Stavropol'skiy
485888	Suvorov	Russia	Tula
486071	Surovikino	Russia	Volgograd
486110	Surkhakhi	Russia	Ingushetiya
486665	Sukhinichi	Russia	Kaluga
486968	Stupino	Russia	MO
487095	Strunino	Russia	Vladimir
487147	Stroitel’	Russia	Belgorod
487150	Strogino	Russia	Moscow
487846	Stavropol’	Russia	Stavropol'skiy
487928	Staryy Oskol	Russia	Belgorod
488635	Staroshcherbinovskaya	Russia	Krasnodarskiy
488742	Starominskaya	Russia	Krasnodarskiy
488852	Starodub	Russia	Brjansk
489088	Staraya Russa	Russia	Novgorod
489162	Staraya Kupavna	Russia	MO
489226	Staraya Derevnya	Russia	St.-Petersburg
490067	Sovetsk	Russia	Kirov
490068	Sovetsk	Russia	Kaliningrad
490172	Sosnovyy Bor	Russia	Leningrad
490377	Sosnovaya Polyana	Russia	St.-Petersburg
490391	Sosnogorsk	Russia	Komi Republic
490554	Sorochinsk	Russia	Orenburg
490971	Solntsevo	Russia	Moscow
490996	Solnechnogorsk	Russia	MO
491019	Sol’-Iletsk	Russia	Orenburg
491023	Solikamsk	Russia	Perm
491250	Sokol’niki	Russia	Moscow
491280	Sokol	Russia	Moscow
491281	Sokol	Russia	Vologda
491352	Sofrino	Russia	MO
491422	Sochi	Russia	Krasnodarskiy
491480	Sobinka	Russia	Vladimir
491687	Smolensk	Russia	Smolensk
491882	Slobodskoy	Russia	Kirov
491895	Slobodka	Russia	Moscow
492162	Slantsy	Russia	Leningrad
492376	Skopin	Russia	Rjazan
492448	Skhodnya	Russia	MO
492944	Sim	Russia	Chelyabinsk
493160	Sibay	Russia	Bashkortostan
493231	Shuya	Russia	Ivanovo
493463	Shumerlya	Russia	Chuvashia
493702	Mikhaylovsk	Russia	Stavropol'skiy
494427	Shilovo	Russia	Rjazan
495062	Sheksna	Russia	Vologda
495112	Shebekino	Russia	Belgorod
495136	Shchukino	Russia	Moscow
495206	Shchigry	Russia	Kursk
495260	Shcherbinka	Russia	Moscow
495344	Shchelkovo	Russia	MO
495394	Shchëkino	Russia	Tula
495518	Shatura	Russia	MO
495619	Shar’ya	Russia	Kostroma
495957	Shali	Russia	Chechnya
496015	Shakhty	Russia	Rostov
496267	Severskaya	Russia	Krasnodarskiy
496269	Severo-Zadonsk	Russia	Tula
496275	Severoural’sk	Russia	Sverdlovsk
496278	Severomorsk	Russia	Murmansk
496285	Severodvinsk	Russia	Arkhangelskaya
496348	Severnyy	Russia	Moscow
496456	Setun’	Russia	Moscow
496478	Sestroretsk	Russia	St.-Petersburg
496519	Sertolovo	Russia	Leningrad
496527	Serpukhov	Russia	MO
496638	Sergiyev Posad	Russia	MO
496802	Sergach	Russia	Nizjnij Novgorod
496934	Serdobsk	Russia	Penza
497206	Semiluki	Russia	Voronezj
497218	Semikarakorsk	Russia	Rostov
497271	Semënovskoye	Russia	MO
497450	Semënov	Russia	Nizjnij Novgorod
497610	Sel’tso	Russia	Brjansk
498418	Satka	Russia	Chelyabinsk
498525	Sarov	Russia	Nizjnij Novgorod
498677	Saratov	Russia	Saratov
498687	Sarapul	Russia	Udmurtiya
498698	Saransk	Russia	Mordoviya
498708	Saraktash	Russia	Orenburg
499099	Samara	Russia	Samara
499161	Sal’sk	Russia	Rostov
499292	Salavat	Russia	Bashkortostan
499452	Safonovo	Russia	Smolensk
499717	Rzhev	Russia	Tverskaya
499975	Rybnoye	Russia	Rjazan
500004	Rybinsk	Russia	Jaroslavl
500019	Rybatskoye	Russia	Leningrad
500047	Ryazhsk	Russia	Rjazan
500096	Ryazan’	Russia	Rjazan
500299	Ruzayevka	Russia	Mordoviya
500886	Rtishchevo	Russia	Saratov
501175	Rostov-na-Donu	Russia	Rostov
501183	Rostov	Russia	Jaroslavl
501187	Rostokino	Russia	Moscow
501215	Rossosh’	Russia	Voronezj
501231	Rossosh’	Russia	Voronezj
501283	Roslavl’	Russia	Smolensk
501320	Roshal’	Russia	MO
501730	Rodniki	Russia	Ivanovo
502011	Revda	Russia	Sverdlovsk
502018	Reutov	Russia	MO
502400	Razumnoye	Russia	Belgorod
502793	Rasskazovo	Russia	Tambov
502971	Ramenki	Russia	Moscow
503550	Pyatigorsk	Russia	Stavropol'skiy
503977	Pushkino	Russia	MO
504003	Pushkin	Russia	St.-Petersburg
504042	Pushchino	Russia	MO
504250	Pugachev	Russia	Saratov
504341	Pskov	Russia	Pskov
504576	Protvino	Russia	MO
504831	Proletarsk	Russia	Rostov
504935	Prokhladnyy	Russia	Kabardino-Balkariya
505014	Priyutovo	Russia	Bashkortostan
505057	Privolzhskiy	Russia	Saratov
505060	Privolzhsk	Russia	Ivanovo
505230	Priozërsk	Russia	Leningrad
505421	Pridonskoy	Russia	Voronezj
505806	Povorino	Russia	Voronezj
506043	Kotlovka	Russia	Moscow
506117	Annino	Russia	Moscow
506762	Polyarnyye Zori	Russia	Murmansk
506763	Polyarnyy	Russia	Murmansk
507338	Pokrovskoye-Streshnëvo	Russia	Moscow
507599	Pokrov	Russia	Vladimir
507624	Pokhvistnevo	Russia	Samara
508034	Podporozh’ye	Russia	Leningrad
508101	Podol’sk	Russia	MO
508656	Pochep	Russia	Brjansk
508751	Ryazanskiy	Russia	Moscow
509052	Plavsk	Russia	Tula
509598	Pikalëvo	Russia	Leningrad
509697	Petushki	Russia	Vladimir
509820	Petrozavodsk	Russia	Republic of Karelia
509981	Petrovskaya	Russia	MO
509987	Petrovsk	Russia	Saratov
510291	Peterhof	Russia	St.-Petersburg
510364	Pestovo	Russia	Novgorod
510808	Pervoural’sk	Russia	Sverdlovsk
511153	Perovo	Russia	Moscow
511196	Perm	Russia	Perm
511359	Pereslavl’-Zalesskiy	Russia	Jaroslavl
511510	Novo-Peredelkino	Russia	Moscow
511565	Penza	Russia	Penza
511794	Pechora	Russia	Komi Republic
512023	Pavlovskiy Posad	Russia	MO
512051	Pavlovskaya	Russia	Krasnodarskiy
512052	Pavlovsk	Russia	St.-Petersburg
512053	Pavlovsk	Russia	Voronezj
512382	Pashkovskiy	Russia	Krasnodarskiy
513042	Pallasovka	Russia	Volgograd
513378	Ozëry	Russia	MO
513883	Otradnyy	Russia	Samara
513896	Otradnoye	Russia	Moscow
513898	Otradnoye	Russia	Leningrad
513911	Otradnaya	Russia	Krasnodarskiy
514171	Ostrov	Russia	Pskov
514259	Ostashkov	Russia	Tverskaya
514284	Ostankinskiy	Russia	Moscow
514706	Osa	Russia	Perm
514734	Orsk	Russia	Orenburg
514796	Orlovskiy	Russia	Rostov
515003	Orenburg	Russia	Orenburg
515012	Orël	Russia	Orjol
515024	Orekhovo-Zuyevo	Russia	MO
515083	Ordzhonikidzevskaya	Russia	Ingushetiya
515246	Onega	Russia	Arkhangelskaya
515267	Omutninsk	Russia	Kirov
515698	Olenegorsk	Russia	Murmansk
515804	Tsotsin-Yurt	Russia	Chechnya
515879	Oktyabr’skiy	Russia	Bashkortostan
516215	Odintsovo	Russia	MO
516256	Ochër	Russia	Perm
516264	Ochakovo-Matveyevskoye	Russia	Moscow
516436	Obninsk	Russia	Kaluga
516576	Nytva	Russia	Perm
516647	Nyandoma	Russia	Arkhangelskaya
516716	Nurlat	Russia	Tatarstan
516931	Novyy Oskol	Russia	Belgorod
517121	Novyye Kuz’minki	Russia	Moscow
517161	Novyye Cherëmushki	Russia	Moscow
517269	Novozybkov	Russia	Brjansk
517739	Novouzensk	Russia	Saratov
517766	Novoul’yanovsk	Russia	Ulyanovsk
517836	Novotroitsk	Russia	Orenburg
517842	Novotitarovskaya	Russia	Krasnodarskiy
517963	Novoshakhtinsk	Russia	Rostov
518325	Novopokrovskaya	Russia	Krasnodarskiy
518383	Novopavlovsk	Russia	Stavropol'skiy
518557	Novomoskovsk	Russia	Tula
518602	Novomichurinsk	Russia	Rjazan
518657	Novokuz’minki	Russia	Moscow
518659	Novokuybyshevsk	Russia	Samara
518682	Novokubansk	Russia	Krasnodarskiy
518740	Novokhovrino	Russia	Moscow
518879	Novogireyevo	Russia	MO
518970	Novocherkassk	Russia	Rostov
518976	Novocheboksarsk	Russia	Chuvashia
519062	Novoanninskiy	Russia	Volgograd
519106	Novoaleksandrovsk	Russia	Stavropol'skiy
519336	Velikiy Novgorod	Russia	Novgorod
519447	Novaya Usman’	Russia	Voronezj
519711	Novaya Derevnya	Russia	St.-Petersburg
520068	Noginsk	Russia	MO
520204	Nizhnyaya Tura	Russia	Sverdlovsk
520494	Nizhniy Tagil	Russia	Sverdlovsk
520555	Nizhniy Novgorod	Russia	Nizjnij Novgorod
520574	Nizhniy Lomov	Russia	Penza
521118	Nizhnekamsk	Russia	Tatarstan
521416	Nikulino	Russia	Moscow
521500	Nikol’skoye	Russia	Moscow
521509	Nikol’skoye	Russia	Leningrad
521776	Nikol’sk	Russia	Penza
522260	Nikel’	Russia	Murmansk
522301	Nezlobnaya	Russia	Stavropol'skiy
522377	Nevinnomyssk	Russia	Stavropol'skiy
522410	Nevel’	Russia	Pskov
522470	Nesterovskaya	Russia	Ingushetiya
522594	Nerekhta	Russia	Kostroma
522775	Nelidovo	Russia	Tverskaya
522942	Neftekamsk	Russia	Bashkortostan
522945	Neftegorsk	Russia	Samara
523064	Nazran’	Russia	Ingushetiya
523198	Navashino	Russia	Nizjnij Novgorod
523405	Nartkala	Russia	Kabardino-Balkariya
523426	Naro-Fominsk	Russia	MO
523523	Nal’chik	Russia	Kabardino-Balkariya
523553	Nakhabino	Russia	MO
523750	Naberezhnyye Chelny	Russia	Tatarstan
523812	Mytishchi	Russia	MO
524294	Murom	Russia	Vladimir
524305	Murmansk	Russia	Murmansk
524640	Mtsensk	Russia	Orjol
524699	Mozhga	Russia	Udmurtiya
524712	Mozhaysk	Russia	MO
524736	Mozdok	Russia	North Ossetia
524809	Mostovskoy	Russia	Krasnodarskiy
518255	Novorossiysk	Russia	Krasnodarskiy
525138	Morshansk	Russia	Tambov
525162	Morozovsk	Russia	Rostov
525396	Monino	Russia	MO
525404	Monchegorsk	Russia	Murmansk
526346	Mirnyy	Russia	Arkhangelskaya
526480	Mineralnye Vody	Russia	Stavropol'skiy
526558	Millerovo	Russia	Rostov
527012	Mikhaylovka	Russia	Volgograd
527057	Mikhalkovo	Russia	Moscow
527191	Michurinsk	Russia	Tambov
527529	Menzelinsk	Russia	Tatarstan
527579	Mendeleyevsk	Russia	Tatarstan
527717	Meleuz	Russia	Bashkortostan
527740	Melenki	Russia	Vladimir
527888	Medvezh’yegorsk	Russia	Republic of Karelia
527968	Medvedovskaya	Russia	Krasnodarskiy
528056	Medvedevo	Russia	Mariy-El
528109	Mednogorsk	Russia	Orenburg
528293	Maykop	Russia	Adygeya
528454	Matveyevskoye	Russia	Moscow
529073	Marks	Russia	Saratov
529237	Mar’ino	Russia	Moscow
529334	Mar’ina Roshcha	Russia	Moscow
529505	Manturovo	Russia	Kostroma
530088	Yaroslavskiy	Russia	Moscow
530849	Maloyaroslavets	Russia	Kaluga
531129	Malgobek	Russia	Ingushetiya
531820	Malakhovka	Russia	MO
532288	Magnitogorsk	Russia	Chelyabinsk
532459	Lyudinovo	Russia	Kaluga
532535	Lyublino	Russia	Moscow
532615	Lyubertsy	Russia	MO
532657	Lytkarino	Russia	MO
532675	Lys’va	Russia	Perm
532715	Lyskovo	Russia	Nizjnij Novgorod
533067	Luzhniki	Russia	Moscow
533543	Lukhovitsy	Russia	MO
533690	Luga	Russia	Leningrad
534341	Lomonosov	Russia	St.-Petersburg
534560	Lodeynoye Pole	Russia	Leningrad
534595	Lobnya	Russia	MO
534701	Livny	Russia	Orjol
534838	Liski	Russia	Voronezj
535121	Lipetsk	Russia	Lipetsk
535243	Likino-Dulevo	Russia	MO
535270	Likhobory	Russia	Moscow
535330	Lianozovo	Russia	Moscow
535334	L’govskiy	Russia	Kursk
535451	Levoberezhnaya	Russia	MO
535886	Lermontov	Russia	Stavropol'skiy
535966	Leonovo	Russia	Moscow
536098	Leninskiye Gory	Russia	MO
536156	Leninsk	Russia	Volgograd
536162	Leninogorsk	Russia	Tatarstan
536164	Tsaritsyno	Russia	Moscow
536200	Leningradskaya	Russia	Krasnodarskiy
536206	Yubileyny	Russia	MO
536398	Lefortovo	Russia	Moscow
536518	Lebedyan’	Russia	Lipetsk
536625	Lazarevskoye	Russia	Krasnodarskiy
537107	Lakinsk	Russia	Vladimir
537281	Labinsk	Russia	Krasnodarskiy
537345	Dugulubgey	Russia	Kabardino-Balkariya
537832	Kuz’minki	Russia	Moscow
538138	Kuvandyk	Russia	Orenburg
538321	Kuskovo	Russia	MO
538416	Kushchëvskaya	Russia	Krasnodarskiy
538442	Kusa	Russia	Chelyabinsk
538472	Kur’yanovo	Russia	MO
538560	Kursk	Russia	Kursk
538601	Kurovskoye	Russia	MO
538836	Kurganinsk	Russia	Krasnodarskiy
538908	Kurchatov	Russia	Kursk
538913	Kurchaloy	Russia	Chechnya
539061	Kupchino	Russia	St.-Petersburg
539147	Kungur	Russia	Perm
539283	Kumertau	Russia	Bashkortostan
539555	Kulebaki	Russia	Nizjnij Novgorod
539689	Kukmor	Russia	Tatarstan
539817	Kudymkar	Russia	Perm
540030	Kubinka	Russia	MO
540103	Kstovo	Russia	Nizjnij Novgorod
540251	Krymsk	Russia	Krasnodarskiy
540761	Kropotkin	Russia	Krasnodarskiy
540771	Kronshtadt	Russia	St.-Petersburg
541404	Krasnyy Sulin	Russia	Rostov
541406	Biryulëvo Zapadnoye	Russia	MO
542000	Krasnoye Selo	Russia	St.-Petersburg
542184	Krasnovishersk	Russia	Perm
542199	Krasnoufimsk	Russia	Sverdlovsk
542327	Krasnokamsk	Russia	Perm
542334	Krasnogvardeyskoye	Russia	Stavropol'skiy
542374	Krasnogorsk	Russia	MO
543460	Kovrov	Russia	Vladimir
542463	Krasnoarmeysk	Russia	MO
542464	Krasnoarmeysk	Russia	Saratov
542634	Presnenskiy	Russia	MO
543018	Koz’modem’yansk	Russia	Mariy-El
543254	Kozhukhovo	Russia	MO
543344	Kozeyevo	Russia	Moscow
543348	Kozel’sk	Russia	Kaluga
543436	Kovylkino	Russia	Mordoviya
543508	Kovdor	Russia	Murmansk
543605	Kotovsk	Russia	Tambov
543633	Kotovo	Russia	Volgograd
543704	Kotlas	Russia	Arkhangelskaya
543728	Kotel’nikovo	Russia	Volgograd
543731	Kotel’niki	Russia	MO
543737	Kotel’nich	Russia	Kirov
543878	Kostroma	Russia	Kostroma
544293	Kosaya Gora	Russia	Tula
544370	Koryazhma	Russia	Arkhangelskaya
544896	Korenovsk	Russia	Krasnodarskiy
545277	Konstantinovsk	Russia	Rostov
545575	Kondrovo	Russia	Kaluga
545626	Kondopoga	Russia	Republic of Karelia
545673	Konakovo	Russia	Tverskaya
545788	Kommunar	Russia	Leningrad
546105	Kolpino	Russia	St.-Petersburg
546225	Kolomyagi	Russia	St.-Petersburg
546230	Kolomna	Russia	MO
546244	Kolomenskoye	Russia	Moscow
546521	Kol’chugino	Russia	Vladimir
546672	Kokhma	Russia	Ivanovo
547475	Klintsy	Russia	Brjansk
547523	Klin	Russia	MO
547560	Klimovsk	Russia	MO
547840	Kizlyar	Russia	Dagestan
547849	Kizilyurt	Russia	Dagestan
547875	Kizel	Russia	Perm
548278	Kirzhach	Russia	Vladimir
548330	Kirsanov	Russia	Tambov
548391	Kirovsk	Russia	Murmansk
548392	Kirovsk	Russia	Leningrad
548395	Kirovo-Chepetsk	Russia	Kirov
548408	Kirov	Russia	Kirov
548410	Kirov	Russia	Kaluga
548442	Kirishi	Russia	Leningrad
548506	Kireyevsk	Russia	Tula
548602	Kingisepp	Russia	Leningrad
548605	Kineshma	Russia	Ivanovo
548622	Kinel’-Cherkassy	Russia	Samara
548625	Kinel’	Russia	Samara
548652	Kimry	Russia	Tverskaya
548658	Kimovsk	Russia	Tula
549373	Khot'kovo	Russia	MO
549424	Khosta	Russia	Krasnodarskiy
549741	Kholmskiy	Russia	Krasnodarskiy
550280	Khimki	Russia	Moscow
550478	Khasavyurt	Russia	Dagestan
550671	Kharabali	Russia	Astrakhan
550846	Khadyzhensk	Russia	Krasnodarskiy
551487	Kazan	Russia	Tatarstan
551794	Katav-Ivanovsk	Russia	Chelyabinsk
551835	Kastanayevo	Russia	MO
551847	Kaspiysk	Russia	Dagestan
551891	Kasimov	Russia	Rjazan
551964	Kashira	Russia	MO
551986	Kashin	Russia	Tverskaya
552951	Karabulak	Russia	Ingushetiya
552977	Karabanovo	Russia	Vladimir
553034	Kapotnya	Russia	Moscow
553092	Kantyshevo	Russia	Ingushetiya
553152	Kanevskaya	Russia	Krasnodarskiy
553190	Kandalaksha	Russia	Murmansk
553216	Kanash	Russia	Chuvashia
553248	Kamyzyak	Russia	Astrakhan
553287	Kamyshin	Russia	Volgograd
553399	Kamensk-Shakhtinskiy	Russia	Rostov
553915	Kaluga	Russia	Kaluga
554199	Kalininsk	Russia	Saratov
554233	Korolev	Russia	MO
554234	Kaliningrad	Russia	Kaliningrad
554397	Kalach-na-Donu	Russia	Volgograd
554410	Kalach	Russia	Voronezj
554599	Kachkanar	Russia	Sverdlovsk
554679	Kabanovo	Russia	MO
554787	Izmaylovo	Russia	MO
554840	Izhevsk	Russia	Udmurtiya
554894	Izberbash	Russia	Dagestan
555111	Ivanteyevka	Russia	MO
555129	Ivanovskoye	Russia	Moscow
555312	Ivanovo	Russia	Ivanovo
555746	Istra	Russia	MO
555980	Ishimbay	Russia	Bashkortostan
556230	Ipatovo	Russia	Stavropol'skiy
556283	Inza	Russia	Ulyanovsk
556320	Inozemtsevo	Russia	Stavropol'skiy
556951	Il’skiy	Russia	Krasnodarskiy
557469	Igra	Russia	Udmurtiya
557775	Gus’-Khrustal’nyy	Russia	Vladimir
557882	Gusev	Russia	Kaliningrad
558066	Gul’kevichi	Russia	Krasnodarskiy
558082	Gukovo	Russia	Rostov
558118	Gudermes	Russia	Chechnya
558209	Gubakha	Russia	Perm
558236	Gryazovets	Russia	Vologda
558312	Gryazi	Russia	Lipetsk
558418	Groznyy	Russia	Chechnya
558799	Gribanovskiy	Russia	Voronezj
559029	Grazhdanka	Russia	St.-Petersburg
559317	Goryachiy Klyuch	Russia	Krasnodarskiy
559320	Goryachevodskiy	Russia	Stavropol'skiy
559654	Gorodishche	Russia	Volgograd
559678	Gorodets	Russia	Nizjnij Novgorod
560142	Gorelovo	Russia	St.-Petersburg
560465	Gol’yanovo	Russia	Moscow
560756	Golitsyno	Russia	MO
561347	Glazov	Russia	Udmurtiya
561627	Georgiyevsk	Russia	Stavropol'skiy
561667	Gelendzhik	Russia	Krasnodarskiy
561731	Gay	Russia	Orenburg
561762	Gavrilov-Yam	Russia	Jaroslavl
561887	Gatchina	Russia	Leningrad
562161	Galich	Russia	Kostroma
562237	Gagarin	Russia	Smolensk
562309	Furmanov	Russia	Ivanovo
562319	Fryazino	Russia	MO
562321	Fryazevo	Russia	MO
562389	Frolovo	Russia	Volgograd
562820	Fili	Russia	MO
563379	Ezhva	Russia	Komi Republic
563464	Engel’s	Russia	Saratov
563472	Enem	Russia	Adygeya
563522	Elektrougli	Russia	MO
563523	Elektrostal’	Russia	MO
563524	Elektrogorsk	Russia	MO
563551	Ekazhevo	Russia	Ingushetiya
563705	Dzerzhinskiy	Russia	MO
563708	Dzerzhinsk	Russia	Nizjnij Novgorod
563719	Dyurtyuli	Russia	Bashkortostan
563822	Dyat’kovo	Russia	Brjansk
564654	Dubovka	Russia	Volgograd
564719	Dubna	Russia	MO
565197	Dorogomilovo	Russia	MO
565290	Donskoy	Russia	Tula
565348	Donetsk	Russia	Rostov
565381	Domodedovo	Russia	MO
565614	Dolgoprudnyy	Russia	MO
565778	Dobryanka	Russia	Perm
565955	Dmitrov	Russia	MO
566155	Divnoye	Russia	Stavropol'skiy
566181	Dinskaya	Russia	Krasnodarskiy
566199	Dimitrovgrad	Russia	Ulyanovsk
566384	Desnogorsk	Russia	Smolensk
566532	Derbent	Russia	Dagestan
566809	Zapadnoye Degunino	Russia	Moscow
566854	Dedovsk	Russia	MO
566976	Davydkovo	Russia	Moscow
567006	Davlekanovo	Russia	Bashkortostan
567109	Dankov	Russia	Lipetsk
567183	Danilov	Russia	Jaroslavl
567311	Dachnoye	Russia	St.-Petersburg
567434	Chusovoy	Russia	Perm
567774	Chudovo	Russia	Novgorod
567990	Chistopol’	Russia	Tatarstan
568012	Chishmy	Russia	Bashkortostan
568587	Chernyanka	Russia	Belgorod
568595	Chernyakhovsk	Russia	Kaliningrad
568608	Chernushka	Russia	Perm
568808	Chernogolovka	Russia	MO
569154	Cherkessk	Russia	Karachayevo-Cherkesiya
569223	Cherepovets	Russia	Vologda
569273	Cherëmushki	Russia	MO
569591	Chekhov	Russia	MO
569639	Chegem	Russia	Kabardino-Balkariya
569696	Cheboksary	Russia	Chuvashia
569742	Chaykovskiy	Russia	Perm
569955	Chapayevsk	Russia	Samara
570479	Buynaksk	Russia	Dagestan
570508	Buy	Russia	Kostroma
570563	Buturlinovka	Russia	Voronezj
570636	Businovo	Russia	Moscow
571155	Buinsk	Russia	Tatarstan
571159	Buguruslan	Russia	Orenburg
571170	Bugul’ma	Russia	Tatarstan
571306	Budënnovsk	Russia	Stavropol'skiy
571420	Bryukhovetskaya	Russia	Krasnodarskiy
571476	Bryansk	Russia	Brjansk
571557	Bronnitsy	Russia	MO
571741	Brateyevo	Russia	Moscow
572154	Borovichi	Russia	Novgorod
572665	Bor	Russia	Nizjnij Novgorod
574675	Bol’shaya Setun’	Russia	MO
575349	Bologoye	Russia	Tverskaya
575410	Boksitogorsk	Russia	Leningrad
575457	Boguchar	Russia	Voronezj
575505	Bogorodskoye	Russia	MO
575591	Bogoroditsk	Russia	Tula
575948	Bobrov	Russia	Voronezj
576116	Blagoveshchensk	Russia	Bashkortostan
576172	Blagodarnyy	Russia	Stavropol'skiy
576279	Biryulëvo	Russia	Moscow
576317	Birsk	Russia	Bashkortostan
576432	Bibirevo	Russia	Moscow
576566	Bezhetsk	Russia	Tverskaya
576590	Bezenchuk	Russia	Samara
576697	Beslan	Russia	North Ossetia
577206	Berezniki	Russia	Perm
577881	Beloretsk	Russia	Bashkortostan
577893	Belorechensk	Russia	Krasnodarskiy
577901	Beloozërskiy	Russia	MO
578072	Belgorod	Russia	Belgorod
578091	Belëv	Russia	Tula
578155	Belaya Kalitva	Russia	Rostov
578169	Belaya Glina	Russia	Krasnodarskiy
578534	Baymak	Russia	Bashkortostan
578638	Bavly	Russia	Tatarstan
578740	Bataysk	Russia	Rostov
578931	Barysh	Russia	Ulyanovsk
579432	Balezino	Russia	Udmurtiya
579460	Balashov	Russia	Saratov
579464	Balashikha	Russia	MO
579492	Balakovo	Russia	Saratov
579514	Novaya Balakhna	Russia	Nizjnij Novgorod
579529	Balabanovo	Russia	Kaluga
579574	Baksan	Russia	Kabardino-Balkariya
579738	Bakal	Russia	Chelyabinsk
579771	Bagayevskaya	Russia	Rostov
579870	Babushkin	Russia	Moscow
580054	Azov	Russia	Rostov
580218	Avtury	Russia	Chechnya
580420	Atkarsk	Russia	Saratov
580497	Astrakhan	Russia	Astrakhan
580660	Asha	Russia	Chelyabinsk
580716	Arzgir	Russia	Stavropol'skiy
580724	Arzamas	Russia	Nizjnij Novgorod
580850	Arsk	Russia	Tatarstan
580922	Armavir	Russia	Krasnodarskiy
581049	Arkhangel’sk	Russia	Arkhangelskaya
581126	Argun	Russia	Chechnya
581179	Ardon	Russia	North Ossetia
581313	Apsheronsk	Russia	Krasnodarskiy
581321	Aprelevka	Russia	MO
581357	Apatity	Russia	Murmansk
581671	Anna	Russia	Voronezj
581928	Andreyevskoye	Russia	MO
582432	Al’met’yevsk	Russia	Tatarstan
582750	Aleksin	Russia	Tula
582846	Alekseyevka	Russia	MO
582956	Alekseyevka	Russia	Belgorod
582993	Aleksandrovskoye	Russia	Stavropol'skiy
583041	Aleksandrovsk	Russia	Perm
583350	Aleksandrov	Russia	Vladimir
583437	Alatyr’	Russia	Chuvashia
583589	Levoberezhnyy	Russia	MO
583673	Aksay	Russia	Rostov
583785	Akhtyrskiy	Russia	Krasnodarskiy
583798	Akhtubinsk	Russia	Astrakhan
583983	Agryz	Russia	Tatarstan
584298	Achkhoy-Martan	Russia	Chechnya
584441	Abinsk	Russia	Krasnodarskiy
584471	Abdulino	Russia	Orenburg
611182	Vasil’yevo	Russia	Tatarstan
695019	Ryl’sk	Russia	Kursk
797781	Neftekumsk	Russia	Stavropol'skiy
802078	Alagir	Russia	North Ossetia
802714	Persianovka	Russia	Rostov
819552	Annino	Russia	MO
823674	Dagomys	Russia	Krasnodarskiy
827329	Pavlovo	Russia	Nizjnij Novgorod
828055	Belidzhi	Russia	Dagestan
829005	Lesnoy	Russia	Sverdlovsk
830844	Trëkhgornyy	Russia	Chelyabinsk
831130	Znamensk	Russia	Astrakhan
831165	Zarechnyy	Russia	Penza
841006	Kochubeyevskoye	Russia	Stavropol'skiy
857689	Vnukovo	Russia	MO
857690	Moskovskiy	Russia	Moscow
863061	Usinsk	Russia	Komi Republic
873901	Obukhovo	Russia	St.-Petersburg
874045	Staryy Malgobek	Russia	Ingushetiya
1485357	Zavodoukovsk	Russia	Tjumen
1485439	Zarinsk	Russia	Altai Krai
1485445	Zarechnyy	Russia	Sverdlovsk
1485627	Yuzhnyy	Russia	Altai Krai
1485634	Yuzhnoural’sk	Russia	Chelyabinsk
1485724	Yurga	Russia	Kemerovo
1485997	Yeniseysk	Russia	Krasnoyarskiy
1486039	Yemanzhelinsk	Russia	Chelyabinsk
1486298	Yashkino	Russia	Kemerovo
1486340	Yarovoye	Russia	Altai Krai
1486468	Yalutorovsk	Russia	Tjumen
1486910	Vorkuta	Russia	Komi Republic
1486913	Vorgashor	Russia	Komi Republic
1487277	Verkhnyaya Salda	Russia	Sverdlovsk
1487281	Verkhnyaya Pyshma	Russia	Sverdlovsk
1487394	Verkhniy Ufaley	Russia	Chelyabinsk
1487882	Uzhur	Russia	Krasnoyarskiy
1488253	Zelenogorsk	Russia	Krasnoyarskiy
1488429	Uray	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1488754	Tyumen	Russia	Tjumen
1488933	Turinsk	Russia	Sverdlovsk
1489246	Troitsk	Russia	Chelyabinsk
1489394	Topki	Russia	Kemerovo
1489425	Tomsk	Russia	Tomsk
1489508	Toguchin	Russia	Novosibirsk
1489530	Tobol’sk	Russia	Tjumen
1489907	Tayga	Russia	Kemerovo
1489962	Tavda	Russia	Sverdlovsk
1490003	Tatarsk	Russia	Novosibirsk
584243	Adler	Russia	Krasnodarskiy
1490140	Tara	Russia	Omsk
1490256	Talnakh	Russia	Krasnoyarskiy
1490266	Tal’menka	Russia	Altai Krai
1490277	Talitsa	Russia	Sverdlovsk
1490281	Talitsa	Russia	Sverdlovsk
1490402	Sysert’	Russia	Sverdlovsk
1490551	Suzun	Russia	Novosibirsk
1490624	Surgut	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1490686	Sukhoy Log	Russia	Sverdlovsk
1490796	Strezhevoy	Russia	Tomsk
1491159	Sredneuralsk	Russia	Sverdlovsk
1491230	Sovetskiy	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1491291	Sosnovoborsk	Russia	Krasnoyarskiy
1491706	Slavgorod	Russia	Altai Krai
1491953	Shushenskoye	Russia	Krasnoyarskiy
1491999	Shumikha	Russia	Kurgan
1492401	Sharypovo	Russia	Krasnoyarskiy
1492517	Shadrinsk	Russia	Kurgan
1492663	Serov	Russia	Sverdlovsk
1492893	Sayanogorsk	Russia	Khakasiya
1493467	Rubtsovsk	Russia	Altai Krai
1493648	Rezh	Russia	Sverdlovsk
1493687	Reftinskiy	Russia	Sverdlovsk
1494091	Promyshlennaya	Russia	Kemerovo
1494114	Prokop’yevsk	Russia	Kemerovo
1494276	Poykovskiy	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1494456	Polysayevo	Russia	Kemerovo
1494573	Polevskoy	Russia	Sverdlovsk
1494907	Plast	Russia	Chelyabinsk
1495974	Osinniki	Russia	Kemerovo
1496153	Omsk	Russia	Omsk
1496421	Ob’	Russia	Novosibirsk
1496476	Nyagan	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1496503	Noyabrsk	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1496511	Novyy Urengoy	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1496739	Novosilikatnyy	Russia	Altai Krai
1496747	Novosibirsk	Russia	Novosibirsk
1496990	Novokuznetsk	Russia	Kemerovo
1497173	Novoaltaysk	Russia	Altai Krai
1497337	Norilsk	Russia	Krasnoyarskiy
1497393	Nizhnyaya Salda	Russia	Sverdlovsk
1497549	Nizhneudinsk	Russia	Irkutsk
1497795	Nev’yansk	Russia	Sverdlovsk
1497917	Nefteyugansk	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1497951	Nazarovo	Russia	Krasnoyarskiy
1498087	Nadym	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1498129	Myski	Russia	Kemerovo
1498693	Minusinsk	Russia	Krasnoyarskiy
1498894	Miass	Russia	Chelyabinsk
1498920	Mezhdurechensk	Russia	Kemerovo
1499053	Megion	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1499163	Mayma	Russia	Altai Republic
1499350	Mariinsk	Russia	Kemerovo
1500532	Linëvo	Russia	Novosibirsk
1500607	Lesosibirsk	Russia	Krasnoyarskiy
1500665	Leninsk-Kuznetsky	Russia	Kemerovo
1500933	Labytnangi	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1500973	Kyzyl	Russia	Tyva
1500997	Kyshtym	Russia	Chelyabinsk
1501141	Kuybyshev	Russia	Novosibirsk
1501255	Kurtamysh	Russia	Kurgan
1501321	Kurgan	Russia	Kurgan
1501365	Kupino	Russia	Novosibirsk
1501460	Kulunda	Russia	Altai Krai
1502026	Krasnoyarsk	Russia	Krasnoyarskiy
1502061	Krasnotur’insk	Russia	Sverdlovsk
1502091	Krasnoobsk	Russia	Novosibirsk
1502536	Korkino	Russia	Chelyabinsk
1502603	Kopeysk	Russia	Chelyabinsk
1502725	Yugorsk	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1502862	Kolpashevo	Russia	Tomsk
1503037	Kodinsk	Russia	Krasnoyarskiy
1503082	Kochenëvo	Russia	Novosibirsk
1503277	Kiselëvsk	Russia	Kemerovo
1503335	Kirovgrad	Russia	Sverdlovsk
1503901	Kemerovo	Russia	Kemerovo
1503940	Kedrovka	Russia	Kemerovo
1504139	Kayyerkan	Russia	Krasnoyarskiy
1504212	Kataysk	Russia	Kurgan
1504251	Kasli	Russia	Chelyabinsk
1504317	Kartaly	Russia	Chelyabinsk
1504343	Karpinsk	Russia	Sverdlovsk
1504489	Karasuk	Russia	Novosibirsk
1504636	Karabash	Russia	Chelyabinsk
1504682	Kansk	Russia	Krasnoyarskiy
1504769	Kamyshlov	Russia	Sverdlovsk
1504826	Kamensk-Ural’skiy	Russia	Sverdlovsk
1504871	Kamen’-na-Obi	Russia	Altai Krai
1504972	Kaltan	Russia	Kemerovo
1505074	Kalachinsk	Russia	Omsk
1505260	Ivdel’	Russia	Sverdlovsk
1505429	Iskitim	Russia	Novosibirsk
1505453	Ishim	Russia	Tjumen
1505526	Irbit	Russia	Sverdlovsk
1505933	Ilanskiy	Russia	Krasnoyarskiy
1506073	Gur’yevsk	Russia	Kemerovo
1506260	Gornyak	Russia	Altai Krai
1506271	Gorno-Altaysk	Russia	Altai Republic
1507116	Dudinka	Russia	Krasnoyarskiy
1507379	Divnogorsk	Russia	Krasnoyarskiy
1507488	Degtyarsk	Russia	Sverdlovsk
1507636	Chunskiy	Russia	Irkutsk
1508054	Chernogorsk	Russia	Khakasiya
1508291	Chelyabinsk	Russia	Chelyabinsk
1508350	Chebarkul’	Russia	Chelyabinsk
1508879	Borovskiy	Russia	Tjumen
1508943	Borodino	Russia	Krasnoyarskiy
1509819	Bolotnoye	Russia	Novosibirsk
1509852	Bogotol	Russia	Krasnoyarskiy
1509888	Bogdanovich	Russia	Sverdlovsk
1510018	Biysk	Russia	Altai Krai
1510203	Beryozovsky	Russia	Sverdlovsk
1510205	Berëzovskiy	Russia	Kemerovo
1510255	Berëzovka	Russia	Krasnoyarskiy
1510350	Berdsk	Russia	Novosibirsk
379427	Al Hasaheisa	Sudan	Al Jazīrah
1510469	Belovo	Russia	Kemerovo
1510853	Barnaul	Russia	Altai Krai
1510916	Barabinsk	Russia	Novosibirsk
1511309	Asino	Russia	Tomsk
1511330	Asbest	Russia	Sverdlovsk
1511368	Artëmovskiy	Russia	Sverdlovsk
1511466	Aramil	Russia	Sverdlovsk
1511494	Anzhero-Sudzhensk	Russia	Kemerovo
1511783	Aleysk	Russia	Altai Krai
1512086	Akademgorodok	Russia	Novosibirsk
1512165	Achinsk	Russia	Krasnoyarskiy
1512205	Abaza	Russia	Khakasiya
1512236	Abakan	Russia	Khakasiya
1536289	Snezhinsk	Russia	Chelyabinsk
1538634	Ozersk	Russia	Chelyabinsk
1538635	Zheleznogorsk	Russia	Krasnoyarskiy
1538636	Novoural’sk	Russia	Sverdlovsk
1538637	Seversk	Russia	Tomsk
1539209	Gubkinskiy	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1540356	Raduzhny	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1540711	Muravlenko	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
2012484	Zima	Russia	Irkutsk
2012557	Zheleznogorsk-Ilimskiy	Russia	Irkutsk
2012593	Zeya	Russia	Amur
2013159	Yakutsk	Russia	Sakha
2013229	Vyazemskiy	Russia	Khabarovsk Krai
2013258	Vrangel’	Russia	Primorskiy
2013348	Vladivostok	Russia	Primorskiy
2013399	Vikhorevka	Russia	Irkutsk
2013923	Ust’-Kut	Russia	Irkutsk
2013952	Ust’-Ilimsk	Russia	Irkutsk
2014006	Ussuriysk	Russia	Primorskiy
2014022	Usol’ye-Sibirskoye	Russia	Irkutsk
2014407	Ulan-Ude	Russia	Respublika Buryatiya
2014624	Udachny	Russia	Sakha
2014718	Tynda	Russia	Amur
2014927	Tulun	Russia	Irkutsk
2015051	Trudovoye	Russia	Primorskiy
2015310	Fokino	Russia	Primorskiy
2015833	Svobodnyy	Russia	Amur
2016187	Spassk-Dal’niy	Russia	Primorskiy
2016422	Slyudyanka	Russia	Irkutsk
2016701	Shimanovsk	Russia	Amur
2016764	Shelekhov	Russia	Irkutsk
2017487	Raychikhinsk	Russia	Amur
2017945	Petrovsk-Zabaykal’skiy	Russia	Transbaikal Territory
2018116	Partizansk	Russia	Primorskiy
2019309	Neryungri	Russia	Sakha
2019326	Nerchinsk	Russia	Transbaikal Territory
2019528	Nakhodka	Russia	Primorskiy
2019951	Mirny	Russia	Sakha
2020689	Luchegorsk	Russia	Primorskiy
2020812	Lesozavodsk	Russia	Primorskiy
2020838	Lensk	Russia	Sakha
2021066	Kyakhta	Russia	Respublika Buryatiya
2021618	Krasnokamensk	Russia	Transbaikal Territory
2021851	Komsomolsk-on-Amur	Russia	Khabarovsk Krai
2022890	Khabarovsk	Russia	Khabarovsk Krai
2023058	Kavalerovo	Russia	Primorskiy
2023469	Irkutsk	Russia	Irkutsk
2023782	Gusinoozyorsk	Russia	Respublika Buryatiya
2025159	Dal’nerechensk	Russia	Primorskiy
2025339	Chita	Russia	Transbaikal Territory
2025527	Cheremkhovo	Russia	Irkutsk
2026126	Borzya	Russia	Transbaikal Territory
2026583	Bodaybo	Russia	Irkutsk
2026609	Blagoveshchensk	Russia	Amur
2026643	Birobidzhan	Russia	Jewish Autonomous Oblast
2026696	Bikin	Russia	Khabarovsk Krai
2026895	Belogorsk	Russia	Amur
2026979	Baykal’sk	Russia	Irkutsk
2027296	Aykhal	Russia	Sakha
2027456	Artëm	Russia	Primorskiy
2027468	Arsen’yev	Russia	Primorskiy
2027667	Angarsk	Russia	Irkutsk
2027749	Amursk	Russia	Khabarovsk Krai
2027968	Aldan	Russia	Sakha
2051471	Dal'negorsk	Russia	Primorskiy
2051523	Bratsk	Russia	Irkutsk
2055166	Sayansk	Russia	Irkutsk
2056752	Khabarovsk Vtoroy	Russia	Khabarovsk Krai
2056881	Markova	Russia	Irkutsk
2118647	Vilyuchinsk	Russia	Kamtsjatka
2119538	Yelizovo	Russia	Kamtsjatka
2119932	Vanino	Russia	Khabarovsk Krai
2121052	Sovetskaya Gavan’	Russia	Khabarovsk Krai
2121909	Poronaysk	Russia	Sakhalin
2122104	Petropavlovsk-Kamchatsky	Russia	Kamtsjatka
2122614	Okha	Russia	Sakhalin
2122850	Nikolayevsk-on-Amure	Russia	Khabarovsk Krai
2122894	Nevel’sk	Russia	Sakhalin
2123628	Magadan	Russia	Magadan
2124286	Korsakov	Russia	Sakhalin
2124615	Kholmsk	Russia	Sakhalin
2609906	Baltiysk	Russia	Kaliningrad
6315399	Isakogorka	Russia	Arkhangelskaya
6417459	Krasnoznamensk	Russia	MO
6418146	Chertanovo Yuzhnoye	Russia	Moscow
6418201	Zagor’ye	Russia	Moscow
6418787	Metrogorodok	Russia	Moscow
6695754	Kogalym	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
6696686	Pyt-Yakh	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
6696767	Langepas	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
6853140	Lesnoy	Russia	Sverdlovsk
7117880	Zarya	Russia	MO
7117885	Raduzhnyy	Russia	Vladimir
7287775	Nizhnesortymskiy	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
7289676	Pokachi	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
7290697	Izluchinsk	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
8436165	Kurortnyy	Russia	Leningrad
8504946	Chernaya Rechka	Russia	Leningrad
8504947	Untolovo	Russia	Leningrad
8504948	Petrogradka	Russia	St.-Petersburg
8504950	Parnas	Russia	Leningrad
8504951	Kalininskiy	Russia	Leningrad
8504953	Admiralteisky	Russia	St.-Petersburg
8504955	Krestovskiy ostrov	Russia	Leningrad
8504958	Akademicheskoe	Russia	Leningrad
8504959	Finlyandskiy	Russia	Leningrad
8504960	Centralniy	Russia	St.-Petersburg
8504964	Svetlanovskiy	Russia	Leningrad
8505053	Vostochnoe Degunino	Russia	MO
201463	Rwamagana	Rwanda	Eastern Province
201521	Musanze	Rwanda	Northern Province
201865	Nzega	Rwanda	Southern Province
202061	Kigali	Rwanda	Kigali
202065	Kibuye	Rwanda	Western Province
202068	Kibungo	Rwanda	Eastern Province
202217	Gitarama	Rwanda	Southern Province
202326	Cyangugu	Rwanda	Western Province
202905	Gisenyi	Rwanda	Western Province
203104	Byumba	Rwanda	Northern Province
203112	Butare	Rwanda	Southern Province
100926	Umm Lajj	Saudi Arabia	Minţaqat Tabūk
101312	Ţurayf	Saudi Arabia	Northern Borders
101322	Turabah	Saudi Arabia	Makkah
101554	Tārūt	Saudi Arabia	Eastern Province
101628	Tabuk	Saudi Arabia	Minţaqat Tabūk
101631	Ţubarjal	Saudi Arabia	Al Jawf
101760	Sulţānah	Saudi Arabia	Al Madīnah al Munawwarah
102318	Sayhāt	Saudi Arabia	Eastern Province
102451	Şāmitah	Saudi Arabia	Jizan
102527	Sakakah	Saudi Arabia	Al Jawf
102585	Şafwá	Saudi Arabia	Eastern Province
102651	Şabyā	Saudi Arabia	Jizan
102985	Raḩīmah	Saudi Arabia	Eastern Province
103035	Rābigh	Saudi Arabia	Makkah
103369	Qal‘at Bīshah	Saudi Arabia	Minţaqat ‘Asīr
103630	Najrān	Saudi Arabia	Najrān
104515	Mecca	Saudi Arabia	Makkah
105072	Khamis Mushait	Saudi Arabia	Minţaqat ‘Asīr
105299	Jizan	Saudi Arabia	Jizan
105343	Jeddah	Saudi Arabia	Makkah
106281	Ha'il	Saudi Arabia	Ḩāʼil
106909	Duba	Saudi Arabia	Minţaqat Tabūk
107304	Buraydah	Saudi Arabia	Al-Qassim
107744	Badr Ḩunayn	Saudi Arabia	Al Madīnah al Munawwarah
107781	Az Zulfi	Saudi Arabia	Ar Riyāḑ
107797	Dhahran	Saudi Arabia	Eastern Province
107959	Aţ Ţaraf	Saudi Arabia	Eastern Province
107968	Ta’if	Saudi Arabia	Makkah
108048	As Sulayyil	Saudi Arabia	Ar Riyāḑ
108410	Riyadh	Saudi Arabia	Ar Riyāḑ
108435	Ar Rass	Saudi Arabia	Al-Qassim
108512	‘Ar‘ar	Saudi Arabia	Northern Borders
108617	An Nimāş	Saudi Arabia	Minţaqat ‘Asīr
108648	Qurayyat	Saudi Arabia	Al Jawf
108773	Al Wajh	Saudi Arabia	Minţaqat Tabūk
108841	Al ‘Ulá	Saudi Arabia	Al Madīnah al Munawwarah
108918	Al Qayşūmah	Saudi Arabia	Eastern Province
108927	Al Qaţīf	Saudi Arabia	Eastern Province
109059	Al Munayzilah	Saudi Arabia	Eastern Province
109101	Al Mubarraz	Saudi Arabia	Eastern Province
109131	Al Mithnab	Saudi Arabia	Al-Qassim
109323	Khobar	Saudi Arabia	Eastern Province
109380	Al Khafjī	Saudi Arabia	Eastern Province
109417	Al Jumūm	Saudi Arabia	Makkah
109435	Al Jubayl	Saudi Arabia	Eastern Province
109571	Al Hufūf	Saudi Arabia	Eastern Province
109878	Al Bukayrīyah	Saudi Arabia	Al-Qassim
109915	Al Baţţālīyah	Saudi Arabia	Eastern Province
109953	Al Bāḩah	Saudi Arabia	Minţaqat al Bāḩah
110250	‘Afīf	Saudi Arabia	Ar Riyāḑ
110314	Ad Dilam	Saudi Arabia	Ar Riyāḑ
110325	Ad Dawādimī	Saudi Arabia	Ar Riyāḑ
110336	Dammam	Saudi Arabia	Eastern Province
110619	Abū ‘Arīsh	Saudi Arabia	Jizan
110690	Abha	Saudi Arabia	Minţaqat ‘Asīr
410096	Ash Shafā	Saudi Arabia	Makkah
8394316	Unaizah	Saudi Arabia	Al-Qassim
2108502	Honiara	Solomon Islands	Guadalcanal
241131	Victoria	Seychelles	English River
363533	Zalingei	Sudan	Central Darfur
364103	Wad Medani	Sudan	Al Jazīrah
364706	Umm Ruwaba	Sudan	Shamāl Kurdufān
365137	Omdurman	Sudan	Khartoum
366323	Tokār	Sudan	Red Sea
366847	Singa	Sudan	Sinnār
367308	Shendi	Sudan	River Nile
367544	Sawākin	Sudan	Red Sea
367644	Sinnar	Sudan	Sinnār
368277	Rabak	Sudan	White Nile
370838	Maiurno	Sudan	Sinnār
371760	Kosti	Sudan	White Nile
371870	Kuraymah	Sudan	Northern State
372386	Kināna	Sudan	Sinnār
372753	Kassala	Sudan	Kassala
373141	Kadugli	Sudan	Southern Kordofan
376332	Doka	Sudan	Al Qaḑārif
377039	Port Sudan	Sudan	Red Sea
377690	Berber	Sudan	River Nile
377724	Bārah	Sudan	Shamāl Kurdufān
378231	Atbara	Sudan	River Nile
378271	As Sūkī	Sudan	Sinnār
378459	Ar Ruseris	Sudan	Blue Nile
378493	Ar Rahad	Sudan	Shamāl Kurdufān
378699	An Nuhūd	Sudan	West Kordofan State
379003	El Obeid	Sudan	Shamāl Kurdufān
379014	Al Qiţena	Sudan	White Nile
379062	Al Qadarif	Sudan	Al Qaḑārif
379102	Al Mijlad	Sudan	West Kordofan State
379149	Al Manāqil	Sudan	Al Jazīrah
379252	Khartoum	Sudan	Khartoum
379303	Geneina	Sudan	Western Darfur
379406	Al Hilāliyya	Sudan	Al Jazīrah
379630	El Bauga	Sudan	River Nile
380129	Ad Douiem	Sudan	White Nile
380148	El Daein	Sudan	Eastern Darfur
380151	Ad Dindar	Sudan	Sinnār
380173	Ed Damer	Sudan	River Nile
380174	Ad-Damazin	Sudan	Blue Nile
380348	Abū Zabad	Sudan	West Kordofan State
380757	Abu Jibeha	Sudan	Southern Kordofan
602150	Umeå	Sweden	Västerbotten
602913	Skellefteå	Sweden	Västerbotten
603570	Piteå	Sweden	Norrbotten
604490	Luleå	Sweden	Norrbotten
605155	Kiruna	Sweden	Norrbotten
606531	Boden	Sweden	Norrbotten
2662149	Ystad	Sweden	Skåne
2663536	Växjö	Sweden	Kronoberg
2664203	Västervik	Sweden	Kalmar
2664454	Västerås	Sweden	Västmanland
2664855	Värnamo	Sweden	Jönköping
2664996	Varberg	Sweden	Halland
2665171	Vänersborg	Sweden	Västra Götaland
2665452	Vallentuna	Sweden	Stockholm
2666199	Uppsala	Sweden	Uppsala
2666238	Upplands Väsby	Sweden	Stockholm
2666670	Uddevalla	Sweden	Västra Götaland
2667094	Tumba	Sweden	Stockholm
2667109	Tullinge	Sweden	Stockholm
2667402	Trelleborg	Sweden	Skåne
2669772	Täby	Sweden	Stockholm
2670781	Sundsvall	Sweden	Västernorrland
2670879	Sundbyberg	Sweden	Stockholm
2673730	Stockholm	Sweden	Stockholm
2675397	Solna	Sweden	Stockholm
2675408	Sollentuna	Sweden	Stockholm
2676176	Södertälje	Sweden	Stockholm
2677234	Skövde	Sweden	Västra Götaland
2678210	Skara	Sweden	Västra Götaland
2680075	Sandviken	Sweden	Gävleborg
2683034	Råsunda	Sweden	Stockholm
2684395	Partille	Sweden	Västra Götaland
2685750	Östersund	Sweden	Jämtland
2685828	Östermalm	Sweden	Stockholm
2686162	Oskarshamn	Sweden	Kalmar
2686657	Örebro	Sweden	Örebro
2687700	Nyköping	Sweden	Södermanland
2688250	Norrtälje	Sweden	Stockholm
2688368	Norrköping	Sweden	Östergötland
2690170	Nässjö	Sweden	Jönköping
2690580	Nacka	Sweden	Stockholm
2690960	Motala	Sweden	Östergötland
2691459	Mölndal	Sweden	Västra Götaland
2692475	Märsta	Sweden	Stockholm
2692969	Malmö	Sweden	Skåne
2693678	Lund	Sweden	Skåne
2694762	Linköping	Sweden	Östergötland
2696329	Lidköping	Sweden	Västra Götaland
2696334	Lidingö	Sweden	Stockholm
2696503	Lerum	Sweden	Västra Götaland
2697720	Landskrona	Sweden	Skåne
2698729	Kungsbacka	Sweden	Halland
2698739	Kungälv	Sweden	Västra Götaland
2699282	Kristinehamn	Sweden	Värmland
2699310	Kristianstad	Sweden	Skåne
2699791	Köping	Sweden	Västmanland
2701680	Karlstad	Sweden	Värmland
2701713	Karlskrona	Sweden	Blekinge
2701715	Karlskoga	Sweden	Örebro
2701727	Karlshamn	Sweden	Blekinge
2702261	Kalmar	Sweden	Kalmar
2702979	Jönköping	Sweden	Jönköping
2703396	Jakobsberg	Sweden	Stockholm
2704136	Huskvarna	Sweden	Jönköping
2704620	Huddinge	Sweden	Stockholm
2706767	Helsingborg	Sweden	Skåne
2707399	Hässleholm	Sweden	Skåne
2707684	Härnösand	Sweden	Västernorrland
2707953	Haninge	Sweden	Stockholm
2708365	Halmstad	Sweden	Halland
2711537	Göteborg	Sweden	Västra Götaland
2712414	Gävle	Sweden	Gävleborg
2715459	Falun	Sweden	Dalarna
2715568	Falköping	Sweden	Västra Götaland
2715573	Falkenberg	Sweden	Halland
2715946	Eslöv	Sweden	Skåne
2715953	Eskilstuna	Sweden	Södermanland
2716166	Enköping	Sweden	Uppsala
2719111	Bromma	Sweden	Stockholm
2720383	Borlänge	Sweden	Dalarna
2720501	Borås	Sweden	Västra Götaland
2721259	Boo	Sweden	Stockholm
2725201	Årsta	Sweden	Stockholm
2725901	Ängelholm	Sweden	Skåne
2726756	Alingsås	Sweden	Västra Götaland
2727234	Åkersberga	Sweden	Stockholm
6619708	Majorna	Sweden	Västra Götaland
3370903	Jamestown	Saint Helena	Saint Helena
3188915	Trbovlje	Slovenia	Trbovlje
3189075	Velenje	Slovenia	Velenje
3192241	Ptuj	Slovenia	Ptuj
3194351	Novo Mesto	Slovenia	Novo Mesto
3195506	Maribor	Slovenia	Maribor
3196359	Ljubljana	Slovenia	Ljubljana
3197378	Kranj	Slovenia	Kranj
3197753	Koper	Slovenia	Koper-Capodistria
3202781	Celje	Slovenia	Celje
2729907	Longyearbyen	Svalbard and Jan Mayen	Svalbard
723195	Vranov nad Topľou	Slovakia	Prešovský
723358	Trebišov	Slovakia	Košický
723505	Stará Ľubovňa	Slovakia	Prešovský
723526	Spišská Nová Ves	Slovakia	Košický
723559	Snina	Slovakia	Prešovský
723713	Rožňava	Slovakia	Košický
723819	Prešov	Slovakia	Prešovský
723846	Poprad	Slovakia	Prešovský
724144	Michalovce	Slovakia	Košický
724443	Košice	Slovakia	Košický
724503	Kežmarok	Slovakia	Prešovský
724627	Humenné	Slovakia	Prešovský
725168	Bardejov	Slovakia	Prešovský
3056495	Zlaté Moravce	Slovakia	Nitriansky
3056508	Žilina	Slovakia	Žilinský
3057124	Trnava	Slovakia	Trnavský
3057140	Trenčín	Slovakia	Trenčiansky
3057630	Skalica	Slovakia	Trnavský
3057691	Senica	Slovakia	Trnavský
3057769	Sellye	Slovakia	Nitriansky
3057789	Ružomberok	Slovakia	Žilinský
3057963	Púchov	Slovakia	Nitriansky
3058000	Prievidza	Slovakia	Nitriansky
3058060	Považská Bystrica	Slovakia	Trenčiansky
3058202	Piešťany	Slovakia	Trnavský
3058210	Pezinok	Slovakia	Bratislavský
3058268	Partizánske	Slovakia	Nitriansky
3058472	Nové Zámky	Slovakia	Nitriansky
3058477	Nové Mesto nad Váhom	Slovakia	Trenčiansky
3058531	Nitra	Slovakia	Nitriansky
3058780	Martin	Slovakia	Žilinský
3058897	Malacky	Slovakia	Bratislavský
3058986	Lučenec	Slovakia	Banskobystrický
3059101	Levice	Slovakia	Nitriansky
3059179	Kysucké Nové Mesto	Slovakia	Žilinský
3059436	Komárno	Slovakia	Nitriansky
3060095	Hlohovec	Slovakia	Trnavský
3060139	Handlová	Slovakia	Nitriansky
3060219	Galanta	Slovakia	Trnavský
3060308	Dunajská Streda	Slovakia	Trnavský
3060346	Dubnica nad Váhom	Slovakia	Nitriansky
3060405	Dolný Kubín	Slovakia	Žilinský
3060589	Detva	Slovakia	Banskobystrický
3060835	Čadca	Slovakia	Žilinský
3060950	Brezno	Slovakia	Banskobystrický
3060972	Bratislava	Slovakia	Bratislavský
3061186	Banská Bystrica	Slovakia	Banskobystrický
3061188	Bánovce nad Bebravou	Slovakia	Trenčiansky
2403094	Waterloo	Sierra Leone	Western Area
2404433	Port Loko	Sierra Leone	Northern Province
2406407	Makeni	Sierra Leone	Northern Province
2406916	Lunsar	Sierra Leone	Northern Province
2407656	Koidu	Sierra Leone	Eastern Province
2407790	Kenema	Sierra Leone	Eastern Province
2408329	Kabala	Sierra Leone	Northern Province
2409306	Freetown	Sierra Leone	Western Area
2410048	Bo	Sierra Leone	Southern Province
3168070	San Marino	San Marino	San Marino
2243940	Ziguinchor	Senegal	Ziguinchor
2244177	Vélingara	Senegal	Kolda
2244322	Touba	Senegal	Diourbel
2244616	Tiébo	Senegal	Diourbel
2244799	Thiès Nones	Senegal	Thiès
2244991	Tambacounda	Senegal	Tambacounda
2245704	Sédhiou	Senegal	Sédhiou
2246452	Saint-Louis	Senegal	Saint-Louis
2246544	Richard-Toll	Senegal	Saint-Louis
2246606	Pout	Senegal	Thiès
2246608	Pourham	Senegal	Fatick
2246678	Pikine	Senegal	Dakar
2247381	Nguékhokh	Senegal	Thiès
2247813	Ndibène Dahra	Senegal	Louga
2248409	Mékhé	Senegal	Thiès
2248698	Mbaké	Senegal	Diourbel
2248752	Matam	Senegal	Matam
2249222	Louga	Senegal	Louga
2249782	Kolda	Senegal	Kolda
2250645	Kédougou	Senegal	Kédougou
2250677	Kayar	Senegal	Thiès
2250805	Kaolack	Senegal	Kaolack
2251007	Kaffrine	Senegal	Kaffrine
2251084	Joal-Fadiout	Senegal	Thiès
2251230	Guinguinéo	Senegal	Fatick
2253277	Dara	Senegal	Louga
2253354	Dakar	Senegal	Dakar
2253901	Bignona	Senegal	Ziguinchor
52867	Qoryooley	Somalia	Lower Shabeelle
53157	Qandala	Somalia	Bari
53654	Mogadishu	Somalia	Banaadir
54225	Marka	Somalia	Lower Shabeelle
54715	Luuq	Somalia	Gedo
55671	Kismayo	Somalia	Lower Juba
56166	Jilib	Somalia	Middle Juba
56335	Jawhar	Somalia	Middle Shabele
56399	Jamaame	Somalia	Lower Juba
57289	Hargeysa	Somalia	Woqooyi Galbeed
58933	Garoowe	Somalia	Nugaal
59611	Gaalkacyo	Somalia	Mudug
60019	Eyl	Somalia	Nugaal
62691	Ceerigaabo	Somalia	Sanaag
62788	Ceeldheer	Somalia	Galguduud
63571	Buurhakaba	Somalia	Bay
63689	Buulobarde	Somalia	Hiiraan
64013	Bosaso	Somalia	Bari
64435	Berbera	Somalia	Woqooyi Galbeed
64460	Beledweyne	Somalia	Hiiraan
64536	Baidoa	Somalia	Bay
65170	Baardheere	Somalia	Gedo
65785	Afgooye	Somalia	Lower Shabeelle
400769	Laascaanood	Somalia	Sool
8045596	Baki	Somalia	Awdal
3383330	Paramaribo	Suriname	Paramaribo
3383714	Lelydorp	Suriname	Wanica
363619	Yei	South Sudan	Central Equatoria
363885	Wau	South Sudan	Western Bahr al Ghazal
364367	Aweil	South Sudan	Northern Bahr al Ghazal
365742	Torit	South Sudan	Eastern Equatoria
365763	Tonj	South Sudan	Warrap
367927	Rumbek	South Sudan	Lakes
370737	Malakal	South Sudan	Upper Nile
373303	Juba	South Sudan	Central Equatoria
374739	Gogrial	South Sudan	Warrap
375495	Pajok	South Sudan	Eastern Equatoria
377241	Bor	South Sudan	Jonglei
2410763	São Tomé	Sao Tome and Principe	São Tomé Island
3582805	Zacatecoluca	El Salvador	La Paz
3582883	Usulután	El Salvador	Usulután
3583096	Soyapango	El Salvador	San Salvador
3583098	Sonzacate	El Salvador	Sonsonate
3583102	Sonsonate	El Salvador	Sonsonate
3583158	Sensuntepeque	El Salvador	Cabañas
3583199	Santiago de María	El Salvador	Usulután
3583334	Santa Ana	El Salvador	Santa Ana
3583361	San Salvador	El Salvador	San Salvador
3583379	San Rafael Oriente	El Salvador	San Miguel
3583446	San Miguel	El Salvador	San Miguel
3583471	San Martín	El Salvador	Cuscatlán
3583480	San Marcos	El Salvador	San Salvador
3583747	San Francisco	El Salvador	Morazán
3583981	Quezaltepeque	El Salvador	La Libertad
3584003	Puerto El Triunfo	El Salvador	Usulután
3584257	Santa Tecla	El Salvador	La Libertad
3584384	Metapán	El Salvador	Santa Ana
3584772	La Unión	El Salvador	La Unión
3585157	La Libertad	El Salvador	La Libertad
3585473	Izalco	El Salvador	Sonsonate
3585484	Ilopango	El Salvador	San Salvador
3586814	Delgado	El Salvador	San Salvador
3586833	Cuscatancingo	El Salvador	San Salvador
3586977	Cojutepeque	El Salvador	Cuscatlán
3587086	Chalchuapa	El Salvador	Santa Ana
3587091	Chalatenango	El Salvador	Chalatenango
3587308	Ayutuxtepeque	El Salvador	San Salvador
3587345	Apopa	El Salvador	San Salvador
3587362	Antiguo Cuscatlán	El Salvador	La Libertad
3587426	Ahuachapán	El Salvador	Ahuachapán
3587428	Aguilares	El Salvador	San Salvador
3587498	Acajutla	El Salvador	Sonsonate
3513392	Philipsburg	Sint Maarten	N/A
162627	Yabrūd	Syria	Rif-dimashq
163345	Tartouss	Syria	Tartus
163476	Tall Rif‘at	Syria	Aleppo
163533	Tallkalakh	Syria	Homs
163779	Tallbīsah	Syria	Homs
163806	Ţafas	Syria	Daraa
163808	Tadmur	Syria	Homs
163811	Tādif	Syria	Aleppo
163915	Souran	Syria	Hama
164025	Subaykhān	Syria	Deir ez-Zor
164328	Ash Shaykh Miskīn	Syria	Daraa
164816	Sarāqib	Syria	Idlib
164898	Salqīn	Syria	Idlib
164947	As Salamīyah	Syria	Hama
165060	Satita	Syria	Tartus
165929	Qaţanā	Syria	Rif-dimashq
165997	Jāsim	Syria	Daraa
166111	Qārah	Syria	Rif-dimashq
166331	Nubl	Syria	Aleppo
167046	Maşyāf	Syria	Hama
167605	Ma‘arratmişrīn	Syria	Idlib
168325	Khān Shaykhūn	Syria	Idlib
168620	Kafr Zaytā	Syria	Hama
168629	Kafr Takhārīm	Syria	Idlib
168661	Kafr Nubl	Syria	Idlib
168668	Kafr Lāhā	Syria	Homs
169023	Jisr ash Shughūr	Syria	Idlib
169113	Jayrūd	Syria	Rif-dimashq
169179	Jarābulus	Syria	Aleppo
169304	Jablah	Syria	Latakia
169375	Inkhil	Syria	Daraa
169389	Idlib	Syria	Idlib
169577	Homs	Syria	Homs
169897	Ḩarastā	Syria	Rif-dimashq
170017	Ḩamāh	Syria	Hama
170044	Ḩalfāyā	Syria	Hama
170063	Aleppo	Syria	Aleppo
170592	Douma	Syria	Rif-dimashq
170654	Damascus	Syria	Dimashq
170785	Dayr Ḩāfir	Syria	Aleppo
170794	Deir ez-Zor	Syria	Deir ez-Zor
170887	Ad Darbāsīyah	Syria	Al-Hasakah
170892	Dārayyā	Syria	Rif-dimashq
170905	Dar‘ā	Syria	Daraa
171451	Binnish	Syria	Idlib
172059	Az Zabadānī	Syria	Rif-dimashq
172082	I‘zāz	Syria	Aleppo
172256	‘Ayn al ‘Arab	Syria	Aleppo
172349	At Tall	Syria	Rif-dimashq
172374	Ath Thawrah	Syria	Ar-Raqqah
172408	As Suwaydā’	Syria	As-Suwayda
172469	Aş Şanamayn	Syria	Daraa
172503	As Safīrah	Syria	Aleppo
172946	Ar Rastan	Syria	Homs
172955	Ar Raqqah	Syria	Ar-Raqqah
173193	An Nabk	Syria	Rif-dimashq
173322	Al Quşayr	Syria	Homs
173334	Al Qunayţirah	Syria	Quneitra
173361	Al Qaryatayn	Syria	Homs
173480	Al Mayādīn	Syria	Deir ez-Zor
173576	Latakia	Syria	Latakia
173598	Al Kiswah	Syria	Rif-dimashq
173811	Al Ḩasakah	Syria	Al-Hasakah
173819	Al Ḩarāk	Syria	Daraa
174018	Al Bāb	Syria	Aleppo
174186	‘Afrīn	Syria	Aleppo
174259	Ad Dānā	Syria	Idlib
174448	Ālbū Kamāl	Syria	Deir ez-Zor
174506	Hajīn	Syria	Deir ez-Zor
934985	Mbabane	Swaziland	Hhohho
934995	Manzini	Swaziland	Manzini
935048	Lobamba	Swaziland	Hhohho
244128	Fada	Chad	Ennedi-Ouest
245338	Am Timan	Chad	Salamat
245785	Abéché	Chad	Ouaddaï
2425791	Sagh	Chad	Moyen-Chari
2426240	Pala	Chad	Mayo-Kebbi Ouest
2426370	Oum Hadjer	Chad	Batha
2427123	N'Djamena	Chad	Chari-Baguirmi
2427336	Moussoro	Chad	Barh el Gazel
2427455	Moundou	Chad	Logone Occidental
2427637	Mongo	Chad	Guéra
2428042	Mboursou Léré	Chad	Mayo-Kebbi Ouest
2428228	Massakory	Chad	Hadjer-Lamis
2428231	Massaguet	Chad	Hadjer-Lamis
2428394	Mao	Chad	Kanem
2429296	Laï	Chad	Tandjilé
2429344	Kyabé	Chad	Moyen-Chari
2429605	Koumra	Chad	Mandoul
2430506	Kelo	Chad	Tandjilé
2433437	Doba	Chad	Logone Oriental
2434910	Bongor	Chad	Mayo-Kebbi Est
2435124	Bitkine	Chad	Guéra
2436400	Ati	Chad	Batha
1546102	Port-aux-Français	French Southern Territories	Kerguelen
2363490	Vogan	Togo	Maritime
2363534	Tsévié	Togo	Maritime
2363908	Tchamba	Togo	Centrale
2364079	Sotouboua	Togo	Centrale
2364104	Sokodé	Togo	Centrale
2364752	Notsé	Togo	Plateaux
2364812	Niamtougou	Togo	Kara
2365190	Sansanné-Mango	Togo	Savanes
2365267	Lomé	Togo	Maritime
2365560	Kpalimé	Togo	Plateaux
2366152	Kara	Togo	Kara
2367164	Dapaong	Togo	Savanes
2367568	Bassar	Togo	Kara
2367656	Bafilo	Togo	Kara
2367660	Badou	Togo	Plateaux
2367990	Aného	Togo	Maritime
1117652	Ban Talat Yai	Thailand	Phuket
1117656	Ban Talat Nua	Thailand	Phuket
1117823	Sam Roi Yot	Thailand	Prachuap Khiri Khan
1149698	Phetchaburi	Thailand	Phetchaburi
1150007	Trang	Thailand	Trang
1150085	Thung Song	Thailand	Nakhon Si Thammarat
1150154	Thoen	Thailand	Lampang
1150210	Thap Than	Thailand	Uthai Thani
1150246	Tha Muang	Thailand	Kanchanaburi
1150275	Tha Maka	Thailand	Kanchanaburi
1150490	Tak	Thailand	Tak
1150533	Sukhothai	Thailand	Sukhothai
1150624	Si Satchanalai	Thailand	Sukhothai
1150681	Sawankhalok	Thailand	Sukhothai
1150728	San Pa Tong	Thailand	Chiang Mai
1150732	San Kamphaeng	Thailand	Chiang Mai
1150921	Ron Phibun	Thailand	Nakhon Si Thammarat
1150954	Ratchaburi	Thailand	Ratchaburi
1150965	Ranong	Thailand	Ranong
1151063	Pran Buri	Thailand	Prachuap Khiri Khan
1151074	Prachuap Khiri Khan	Thailand	Prachuap Khiri Khan
1151211	Phunphin	Thailand	Surat Thani
1151254	Phuket	Thailand	Phuket
1151340	Photharam	Thailand	Ratchaburi
1151426	Phayao	Thailand	Phayao
1151528	Pa Sang	Thailand	Lamphun
1152188	Mae Sot	Thailand	Tak
1152194	Mae Sai	Thailand	Chiang Rai
1152202	Mae Ramat	Thailand	Tak
1152227	Mae Chan	Thailand	Chiang Rai
1152377	Lat Yao	Thailand	Nakhon Sawan
1152432	Lang Suan	Thailand	Chumphon
1152468	Lamphun	Thailand	Lamphun
1152473	Lampang	Thailand	Lampang
1152562	Kui Buri	Thailand	Prachuap Khiri Khan
1152633	Krabi	Thailand	Krabi
1152919	Khao Yoi	Thailand	Phetchaburi
1152953	Khanu Woralaksaburi	Thailand	Kamphaeng Phet
1153035	Kathu	Thailand	Phuket
1153081	Kanchanaburi	Thailand	Kanchanaburi
1153090	Kamphaeng Phet	Thailand	Kamphaeng Phet
1153241	Huai Yot	Thailand	Trang
1153269	Hua Hin	Thailand	Prachuap Khiri Khan
1153386	Hang Dong	Thailand	Chiang Mai
1153464	Dok Kham Tai	Thailand	Phayao
1153513	Damnoen Saduak	Thailand	Ratchaburi
1153557	Chumphon	Thailand	Chumphon
1153669	Chiang Rai	Thailand	Chiang Rai
1153671	Chiang Mai	Thailand	Chiang Mai
1153807	Cha-am	Thailand	Phetchaburi
1153850	Bo Phloi	Thailand	Kanchanaburi
1154677	Ban Tak	Thailand	Tak
1154689	Ko Samui	Thailand	Surat Thani
1155139	Ban Pong	Thailand	Ratchaburi
1156046	Ban Na San	Thailand	Surat Thani
1156257	Ban Na	Thailand	Sukhothai
1157662	Bang Saphan	Thailand	Prachuap Khiri Khan
1157683	Bang Phae	Thailand	Ratchaburi
1595679	Nong Kung Si	Thailand	Kalasin
1601579	Ban Mai	Thailand	Songkhla
1603235	Ban Huai Thalaeng	Thailand	Nakhon Ratchasima
1604452	Ban Khlong Bang Sao Thong	Thailand	Samut Prakan
1604654	Na Klang	Thailand	Changwat Nong Bua Lamphu
1604769	Yasothon	Thailand	Yasothon
1604771	Yaring	Thailand	Pattani
1604870	Yala	Thailand	Yala
1605018	Wiset Chaichan	Thailand	Ang Thong
1605024	Wichian Buri	Thailand	Phetchabun
1605069	Warin Chamrap	Thailand	Changwat Ubon Ratchathani
1605102	Wang Saphung	Thailand	Loei
1605118	Wang Noi	Thailand	Phra Nakhon Si Ayutthaya
1605119	Wang Nam Yen	Thailand	Sa Kaeo
1605215	Uttaradit	Thailand	Uttaradit
1605221	Uthai Thani	Thailand	Uthai Thani
1605239	Udon Thani	Thailand	Changwat Udon Thani
1605245	Ubon Ratchathani	Thailand	Changwat Ubon Ratchathani
1605279	Trat	Thailand	Trat
1605467	Tha Yang	Thailand	Phetchaburi
1605509	Tha Ruea	Thailand	Phra Nakhon Si Ayutthaya
1605538	Thap Khlo	Thailand	Phichit
1605601	Tha Mai	Thailand	Chanthaburi
1605677	Tha Bo	Thailand	Nong Khai
1605754	Taphan Hin	Thailand	Phichit
1605957	Tak Bai	Thailand	Narathiwat
1606030	Surin	Thailand	Surin
1606050	Su-ngai Kolok	Thailand	Narathiwat
1606147	Songkhla	Thailand	Songkhla
1606239	Si Sa Ket	Thailand	Sisaket
1606250	Si Racha	Thailand	Chon Buri
1606270	Sing Buri	Thailand	Sing Buri
1606343	Seka	Thailand	Changwat Bueng Kan
1606350	Sawang Daen Din	Thailand	Sakon Nakhon
1606376	Satun	Thailand	Satun
1606386	Sattahip	Thailand	Chon Buri
1606418	Saraburi	Thailand	Sara Buri
1606586	Samut Songkhram	Thailand	Samut Songkhram
1606588	Samut Sakhon	Thailand	Samut Sakhon
1606590	Samut Prakan	Thailand	Samut Prakan
1606790	Sakon Nakhon	Thailand	Sakon Nakhon
1606807	Sa Kaeo	Thailand	Sa Kaeo
1606939	Sadao	Thailand	Songkhla
1607001	Roi Et	Thailand	Roi Et
1607017	Rayong	Thailand	Rayong
1607068	Ranot	Thailand	Songkhla
1607257	Prakhon Chai	Thailand	Buriram
1607280	Prachin Buri	Thailand	Prachin Buri
1607435	Phu Kradueng	Thailand	Loei
1607439	Phu Khiao	Thailand	Chaiyaphum
1607508	Phra Pradaeng	Thailand	Samut Prakan
1607512	Phra Phutthabat	Thailand	Sara Buri
1607552	Phrae	Thailand	Phrae
1607615	Phon Charoen	Thailand	Nong Khai
1607708	Phitsanulok	Thailand	Phitsanulok
1607725	Phichit	Thailand	Phichit
1607730	Phibun Mangsahan	Thailand	Changwat Ubon Ratchathani
1607737	Phetchabun	Thailand	Phetchabun
1607779	Phatthalung	Thailand	Phatthalung
1607793	Phan Thong	Thailand	Chon Buri
1607801	Phanom Sarakham	Thailand	Chachoengsao
1607838	Phanat Nikhom	Thailand	Chon Buri
1607865	Phak Hai	Thailand	Phra Nakhon Si Ayutthaya
1607978	Pattani	Thailand	Pattani
1607983	Pathum Thani	Thailand	Pathum Thani
1608033	Pak Phanang	Thailand	Nakhon Si Thammarat
1608048	Pak Kret	Thailand	Nonthaburi
1608057	Pak Chong	Thailand	Nakhon Ratchasima
1608133	Mueang Nonthaburi	Thailand	Nonthaburi
1608136	Non Sung	Thailand	Nakhon Ratchasima
1608191	Nong Phai	Thailand	Phetchabun
1608232	Nong Khai	Thailand	Nong Khai
1608239	Nong Khae	Thailand	Sara Buri
1608269	Nong Bua Lamphu	Thailand	Changwat Nong Bua Lamphu
1608409	Narathiwat	Thailand	Narathiwat
1608424	Nang Rong	Thailand	Buriram
1608452	Nan	Thailand	Nan
1608462	Nam Som	Thailand	Changwat Udon Thani
1608527	Nakhon Sawan	Thailand	Nakhon Sawan
1608531	Nakhon Phanom	Thailand	Nakhon Phanom
1608534	Nakhon Pathom	Thailand	Nakhon Pathom
1608539	Nakhon Nayok	Thailand	Nakhon Nayok
1608541	Nakhon Luang	Thailand	Phra Nakhon Si Ayutthaya
1608597	Mukdahan	Thailand	Mukdahan
1608900	Maha Sarakham	Thailand	Maha Sarakham
1609032	Lop Buri	Thailand	Lop Buri
1609043	Lom Sak	Thailand	Phetchabun
1609071	Loei	Thailand	Loei
1609278	Laem Sing	Thailand	Chanthaburi
1609324	Kut Chap	Thailand	Changwat Udon Thani
1609345	Kuchinarai	Thailand	Kalasin
1609350	Bangkok	Thailand	Bangkok
1609395	Krathum Baen	Thailand	Samut Sakhon
1609610	Klaeng	Thailand	Rayong
1609776	Khon Kaen	Thailand	Khon Kaen
1609795	Khon Buri	Thailand	Nakhon Ratchasima
1609899	Khlong Luang	Thailand	Pathum Thani
1609990	Khao Wong	Thailand	Kalasin
1610185	Kaset Wisai	Thailand	Roi Et
1610187	Kaset Sombun	Thailand	Chaiyaphum
1610459	Kamalasai	Thailand	Kalasin
1610469	Kalasin	Thailand	Kalasin
1610503	Kaeng Khoi	Thailand	Sara Buri
1610505	Kaeng Khro	Thailand	Chaiyaphum
1610538	Kabin Buri	Thailand	Prachin Buri
1610780	Hat Yai	Thailand	Songkhla
1610940	Det Udom	Thailand	Changwat Ubon Ratchathani
1610943	Den Chai	Thailand	Phrae
1610963	Dan Khun Thot	Thailand	Nakhon Ratchasima
1611026	Chum Phae	Thailand	Khon Kaen
1611106	Chon Daen	Thailand	Phetchabun
1611110	Chon Buri	Thailand	Chon Buri
1611135	Chok Chai	Thailand	Nakhon Ratchasima
1611269	Chanthaburi	Thailand	Chanthaburi
1611407	Chaiyaphum	Thailand	Chaiyaphum
1611416	Chai Nat	Thailand	Chai Nat
1611439	Chachoengsao	Thailand	Chachoengsao
1611453	Buriram	Thailand	Buriram
1611492	Bua Yai	Thailand	Nakhon Ratchasima
1611635	Betong	Thailand	Yala
1613284	Ban Selaphum	Thailand	Roi Et
1613769	Ban Rangsit	Thailand	Pathum Thani
1614295	Phatthaya	Thailand	Chon Buri
1614336	Ban Phan Don	Thailand	Changwat Udon Thani
1614455	Ban Phai	Thailand	Khon Kaen
1614465	Ban Phaeo	Thailand	Samut Sakhon
1616658	Ban Mo	Thailand	Sara Buri
1617111	Ban Lam Luk Ka	Thailand	Pathum Thani
1619276	Bang Rakam	Thailand	Phitsanulok
1619281	Bang Racham	Thailand	Sing Buri
1619363	Bang Pakong	Thailand	Chachoengsao
1619400	Bang Mun Nak	Thailand	Phichit
1619415	Bang Len	Thailand	Nakhon Pathom
1619423	Bang Lamung	Thailand	Chon Buri
1619434	Bang Kruai	Thailand	Nonthaburi
1619437	Bang Krathum	Thailand	Phitsanulok
1619602	Bang Bua Thong	Thailand	Nonthaburi
1619616	Bang Ban	Thailand	Phra Nakhon Si Ayutthaya
1619650	Ban Dung	Thailand	Changwat Udon Thani
1620254	Ban Chang	Thailand	Rayong
1620371	Ban Bueng	Thailand	Chon Buri
1620442	Ban Talat Bueng	Thailand	Chon Buri
1620875	Ban Bang Kadi Pathum Thani	Thailand	Phra Nakhon Si Ayutthaya
1620919	Bang Bo District	Thailand	Samut Prakan
1621020	Aranyaprathet	Thailand	Sa Kaeo
1621060	Amnat Charoen	Thailand	Amnat Charoen
1948015	Amphoe Sikhiu	Thailand	Nakhon Ratchasima
6696291	Wichit	Thailand	Phuket
7091861	Ban Chalong	Thailand	Phuket
7091912	Ban Ratsada	Thailand	Phuket
1220112	Yovon	Tajikistan	Khatlon
1220163	Vose’	Tajikistan	Khatlon
1220219	Vakhsh	Tajikistan	Khatlon
1220301	Tursunzoda	Tajikistan	Republican Subordination
1220747	Qŭrghonteppa	Tajikistan	Khatlon
1220798	Panjakent	Tajikistan	Viloyati Sughd
1220826	Farkhor	Tajikistan	Khatlon
1220905	Norak	Tajikistan	Khatlon
1221194	Kŭlob	Tajikistan	Khatlon
1221259	Kolkhozobod	Tajikistan	Khatlon
1221328	Khorugh	Tajikistan	Gorno-Badakhshan
1221614	Ishqoshim	Tajikistan	Gorno-Badakhshan
1221714	Hisor	Tajikistan	Republican Subordination
1221874	Dushanbe	Tajikistan	Dushanbe
1221965	Danghara	Tajikistan	Khatlon
1221997	Chubek	Tajikistan	Khatlon
1222107	Boshkengash	Tajikistan	Dushanbe
1514839	Proletar	Tajikistan	Viloyati Sughd
1514879	Khŭjand	Tajikistan	Viloyati Sughd
1514891	Konibodom	Tajikistan	Viloyati Sughd
1514896	Isfara	Tajikistan	Viloyati Sughd
1538311	Chkalov	Tajikistan	Viloyati Sughd
8416817	Moskovskiy	Tajikistan	Khatlon
1626459	Suai	East Timor	Cova Lima
1635826	Maubara	East Timor	Liquiçá
1636670	Maliana	East Timor	Bobonaro
1645457	Dili	East Timor	Díli
1649539	Baucau	East Timor	Baucau
1651816	Aileu	East Timor	Aileu
1937031	Same	East Timor	Manufahi
1937274	Lospalos	East Timor	Lautém
1943235	Venilale	East Timor	Baucau
161616	Balkanabat	Turkmenistan	Balkan
161901	Kaka	Turkmenistan	Ahal
161943	Gumdag	Turkmenistan	Balkan
161974	Gazanjyk	Turkmenistan	Balkan
162099	Abadan	Turkmenistan	Ahal
162158	Baharly	Turkmenistan	Ahal
162183	Ashgabat	Turkmenistan	Ahal
162199	Annau	Turkmenistan	Ahal
601432	Yylanly	Turkmenistan	Daşoguz
601475	Tagta	Turkmenistan	Daşoguz
601608	Köneürgench	Turkmenistan	Daşoguz
601661	Boldumsaz	Turkmenistan	Daşoguz
601734	Daşoguz	Turkmenistan	Daşoguz
1218021	Yolöten	Turkmenistan	Mary
1218239	Tejen	Turkmenistan	Ahal
1218420	Seydi	Turkmenistan	Mary
1218436	Saýat	Turkmenistan	Lebap
1218667	Mary	Turkmenistan	Mary
1219002	Atamyrat	Turkmenistan	Lebap
1219392	Gowurdak	Turkmenistan	Lebap
1219649	Türkmenabat	Turkmenistan	Lebap
1219762	Bayramaly	Turkmenistan	Mary
1514792	Gazojak	Turkmenistan	Lebap
2464041	Zaghouan	Tunisia	Zaghwān
2464168	Oued Lill	Tunisia	Tūnis
2464470	Tunis	Tunisia	Tūnis
2464648	Tozeur	Tunisia	Tawzar
2464701	Tataouine	Tunisia	Tataouine
2464804	Takelsa	Tunisia	Nābul
2464809	Tajerouine	Tunisia	Kef
2464915	Sousse	Tunisia	Sūsah
2465030	Siliana	Tunisia	Silyānah
2465840	Sidi Bouzid	Tunisia	Sīdī Bū Zayd
2467246	Skanes	Tunisia	Al Munastīr
2467454	Sfax	Tunisia	Şafāqis
2467521	La Sebala du Mornag	Tunisia	Tūnis
2467815	Radès	Tunisia	Tūnis
2467856	Ksour Essaf	Tunisia	Al Mahdīyah
2467920	Korba	Tunisia	Nābul
2467959	Kélibia	Tunisia	Nābul
2468018	Kebili	Tunisia	Qibilī
2468245	Carthage	Tunisia	Tūnis
2468285	El Fahs	Tunisia	Zaghwān
2468329	Galaat el Andeless	Tunisia	Ariana
2468353	Gafsa	Tunisia	Gafsa
2468369	Gabès	Tunisia	Qābis
2468561	Nefta	Tunisia	Tawzar
2468579	Nabeul	Tunisia	Nābul
2468925	Midoun	Tunisia	Madanīn
2469088	Mateur	Tunisia	Banzart
2469140	Msaken	Tunisia	Sūsah
2469256	Menzel Jemil	Tunisia	Banzart
2469262	Mennzel Bou Zelfa	Tunisia	Nābul
2469264	Menzel Bourguiba	Tunisia	Banzart
2469268	Menzel Abderhaman	Tunisia	Banzart
2469274	Manouba	Tunisia	Manouba
2469473	Medenine	Tunisia	Madanīn
2470088	Jendouba	Tunisia	Jundūbah
2470173	Zarzis	Tunisia	Madanīn
2470191	Djemmal	Tunisia	Al Munastīr
2470384	Houmt Souk	Tunisia	Madanīn
2470579	Hammam Sousse	Tunisia	Sūsah
2470588	Hammam-Lif	Tunisia	Tūnis
2470656	La Goulette	Tunisia	Tūnis
2471287	Douz	Tunisia	Qibilī
2471475	Douar Tindja	Tunisia	Banzart
2471637	Dar Chabanne	Tunisia	Nābul
2472479	Ben Arous	Tunisia	Bin ‘Arūs
2472706	Bizerte	Tunisia	Banzart
2472722	Beni Khiar	Tunisia	Nābul
2472774	Béja	Tunisia	Bājah
2472833	Zouila	Tunisia	Al Mahdīyah
2473229	Chebba	Tunisia	Al Mahdīyah
2473247	Ariana	Tunisia	Ariana
2473420	Ouardenine	Tunisia	Al Munastīr
2473449	Kairouan	Tunisia	Al Qayrawān
2473457	Kasserine	Tunisia	Al Qaşrayn
2473470	Gremda	Tunisia	Şafāqis
2473493	Monastir	Tunisia	Al Munastīr
2473499	La Mohammedia	Tunisia	Tūnis
2473517	Metlaoui	Tunisia	Gafsa
2473540	Al Marsá	Tunisia	Tūnis
2473572	Mahdia	Tunisia	Al Mahdīyah
2473634	El Kef	Tunisia	Kef
2473654	El Jem	Tunisia	Al Mahdīyah
2473744	Hammamet	Tunisia	Nābul
2473747	El Hamma	Tunisia	Qābis
2473876	El Alia	Tunisia	Banzart
2473913	Akouda	Tunisia	Sūsah
2581754	Douane	Tunisia	Nābul
4032402	Nuku‘alofa	Tonga	Tongatapu
296562	Yozgat	Turkey	Yozgat
296832	Yeşilli	Turkey	Mardin
296852	Erzin	Turkey	Hatay
296895	Yerköy	Turkey	Yozgat
297090	Didim	Turkey	Aydın
297789	Yalvaç	Turkey	Isparta
297917	Yahyalı	Turkey	Kayseri
298033	Viranşehir	Turkey	Şanlıurfa
298088	Varto	Turkey	Muş
298117	Van	Turkey	Van
298230	Cimin	Turkey	Erzincan
298299	Uşak	Turkey	Uşak
298316	Urla	Turkey	İzmir
298326	Ürgüp	Turkey	Nevşehir
298333	Şanlıurfa	Turkey	Şanlıurfa
298806	Turgutlu	Turkey	Manisa
298846	Tunceli	Turkey	Tunceli
298935	Torbalı	Turkey	İzmir
299137	Tire	Turkey	İzmir
299545	Tavşanlı	Turkey	Kütahya
299582	Tatvan	Turkey	Bitlis
299817	Tarsus	Turkey	Mersin
299900	Talas	Turkey	Kayseri
300058	Susurluk	Turkey	Balıkesir
300075	Suruç	Turkey	Şanlıurfa
300352	Sorgun	Turkey	Yozgat
300371	Soma	Turkey	Manisa
300377	Solhan	Turkey	Bingöl
300399	Söke	Turkey	Aydın
300614	Siverek	Turkey	Şanlıurfa
300619	Sivas	Turkey	Sivas
300640	Şırnak	Turkey	Şırnak
300791	Simav	Turkey	Kütahya
300797	Silopi	Turkey	Şırnak
300808	Silifke	Turkey	Mersin
300822	Siirt	Turkey	Siirt
301010	Seydişehir	Turkey	Konya
301089	Serinyol	Turkey	Hatay
301101	Serik	Turkey	Antalya
301116	Şereflikoçhisar	Turkey	Ankara
301172	Senirkent	Turkey	Isparta
301209	Şemdinli	Turkey	Hakkâri
301256	Selçuk	Turkey	İzmir
301350	Seferhisar	Turkey	İzmir
301537	Şarkışla	Turkey	Sivas
301827	Sarayköy	Turkey	Denizli
301911	Sandıklı	Turkey	Afyonkarahisar
302043	Salihli	Turkey	Manisa
302355	Reyhanlı	Turkey	Hatay
302525	Polatlı	Turkey	Ankara
302800	Pazarcık	Turkey	Kahramanmaraş
302819	Patnos	Turkey	Ağrı
302824	Pasinler	Turkey	Erzurum
303195	Osmaniye	Turkey	Osmaniye
303290	Ortaköy	Turkey	Aksaray
303354	Ortaca	Turkey	Muğla
303700	Ödemiş	Turkey	İzmir
303750	Nusaybin	Turkey	Mardin
303798	Nizip	Turkey	Gaziantep
303827	Niğde	Turkey	Niğde
303831	Nevşehir	Turkey	Nevşehir
303873	Nazilli	Turkey	Aydın
304013	Mut	Turkey	Mersin
304081	Muş	Turkey	Muş
304196	Mucur	Turkey	Kırşehir
304355	Milas	Turkey	Muğla
304382	Midyat	Turkey	Mardin
304531	Mercin	Turkey	Mersin
304612	Menemen	Turkey	İzmir
304782	Marmaris	Turkey	Muğla
304797	Mardin	Turkey	Mardin
304827	Manisa	Turkey	Manisa
304854	Manavgat	Turkey	Antalya
304916	Malazgirt	Turkey	Muş
304922	Malatya	Turkey	Malatya
304964	Mahmutlar	Turkey	Antalya
305089	Lice	Turkey	Diyarbakır
305359	Kuşadası	Turkey	Aydın
305532	Kurtalan	Turkey	Siirt
305680	Beykonak	Turkey	Antalya
305742	Kulu	Turkey	Konya
305750	Kulp	Turkey	Diyarbakır
305810	Kula	Turkey	Manisa
306041	Kozluk	Turkey	Batman
306112	Kozan	Turkey	Adana
306207	Kovancılar	Turkey	Elazığ
306474	Korkuteli	Turkey	Antalya
306571	Konya	Turkey	Konya
307084	Kızıltepe	Turkey	Mardin
307211	Serinhisar	Turkey	Denizli
307623	Kırkağaç	Turkey	Manisa
307654	Kırıkkale	Turkey	Kırıkkale
307657	Kırıkhan	Turkey	Hatay
307864	Kilis	Turkey	Kilis
308024	Keskin	Turkey	Kırıkkale
308220	Kemer	Turkey	Antalya
308224	Kemalpaşa	Turkey	İzmir
308464	Kayseri	Turkey	Kayseri
309415	Karapınar	Turkey	Konya
309527	Karaman	Turkey	Karaman
309647	Ağrı	Turkey	Ağrı
309663	Karakoçan	Turkey	Elazığ
310004	Karaçoban	Turkey	Erzurum
310641	Kaman	Turkey	Kırşehir
310855	Kâhta	Turkey	Adıyaman
310892	Kadirli	Turkey	Adana
310907	Kadınhanı	Turkey	Konya
311046	İzmir	Turkey	İzmir
311073	Isparta	Turkey	Iğdır
311704	İdil	Turkey	Şırnak
312024	Hizan	Turkey	Bitlis
312114	Hınıs	Turkey	Erzurum
312134	Hilvan	Turkey	Şanlıurfa
312899	Hadim	Turkey	Konya
313013	Hacılar	Turkey	Kayseri
313331	Güroymak	Turkey	Bitlis
314136	Gölbaşı	Turkey	Adıyaman
314188	Göksun	Turkey	Kahramanmaraş
314648	Genç	Turkey	Bingöl
314665	Gemerek	Turkey	Sivas
314716	Gediz	Turkey	Kütahya
314812	Gazipaşa	Turkey	Antalya
314830	Gaziantep	Turkey	Gaziantep
314903	Foça	Turkey	İzmir
314967	Fethiye	Turkey	Muğla
315202	Eskişehir	Turkey	Eskişehir
315368	Erzurum	Turkey	Erzurum
315401	Ermenek	Turkey	Karaman
315498	Ereğli	Turkey	Konya
315515	Erdemli	Turkey	Mersin
315530	Erciş	Turkey	Van
315621	Emirdağ	Turkey	Afyonkarahisar
315639	Emet	Turkey	Kütahya
315697	Elmalı	Turkey	Antalya
315720	Elmadağ	Turkey	Ankara
315758	Eleşkirt	Turkey	Ağrı
315795	Elbistan	Turkey	Kahramanmaraş
315808	Elazığ	Turkey	Elazığ
315905	Eğirdir	Turkey	Isparta
315985	Edremit	Turkey	Balıkesir
316102	Dursunbey	Turkey	Balıkesir
316284	Dörtyol	Turkey	Hatay
316541	Diyarbakır	Turkey	Diyarbakır
316542	Diyadin	Turkey	Ağrı
316634	Dinar	Turkey	Afyonkarahisar
316795	Develi	Turkey	Kayseri
317109	Denizli	Turkey	Denizli
317241	Demirci	Turkey	Manisa
317587	Dargeçit	Turkey	Mardin
317588	Darende	Turkey	Malatya
317844	Çumra	Turkey	Konya
317851	Menderes	Turkey	İzmir
318137	Hakkari	Turkey	Hakkâri
318253	Cizre	Turkey	Şırnak
318372	Çine	Turkey	Aydın
318675	Ceyhan	Turkey	Adana
318755	Çeşme	Turkey	İzmir
318766	Çermik	Turkey	Diyarbakır
319104	Çay	Turkey	Afyonkarahisar
320004	Çağlayancerit	Turkey	Kahramanmaraş
320369	Burhaniye	Turkey	Balıkesir
320392	Burdur	Turkey	Burdur
320448	Bulanık	Turkey	Muş
320533	Bucak	Turkey	Burdur
320552	Bozyazı	Turkey	Mersin
320557	Bozüyük	Turkey	Bilecik
320581	Bozova	Turkey	Şanlıurfa
320871	Bor	Turkey	Niğde
320879	Bolvadin	Turkey	Afyonkarahisar
320995	Bodrum	Turkey	Muğla
321025	Bitlis	Turkey	Bitlis
321031	Bismil	Turkey	Diyarbakır
321082	Bingöl	Turkey	Bingöl
321136	Bigadiç	Turkey	Balıkesir
321191	Beyşehir	Turkey	Konya
321337	Besni	Turkey	Adıyaman
321426	Bergama	Turkey	İzmir
321572	Belen	Turkey	Hatay
321580	Belek	Turkey	Antalya
321786	Bayındır	Turkey	İzmir
321836	Batman	Turkey	Batman
321929	Baskil	Turkey	Elazığ
322051	Banaz	Turkey	Uşak
322165	Balıkesir	Turkey	Balıkesir
322391	Bahçe	Turkey	Adana
322673	Ayvalık	Turkey	Balıkesir
323094	Aşkale	Turkey	Erzurum
323777	Antalya	Turkey	Antalya
323779	Antakya	Turkey	Hatay
323786	Ankara	Turkey	Ankara
323828	Anamur	Turkey	Mersin
324106	Aliağa	Turkey	İzmir
324172	Alaşehir	Turkey	Manisa
324190	Alanya	Turkey	Antalya
324490	Akşehir	Turkey	Konya
324496	Aksaray	Turkey	Aksaray
324698	Akhisar	Turkey	Manisa
324768	Akdağmadeni	Turkey	Yozgat
325103	Ahlat	Turkey	Bitlis
325303	Afyonkarahisar	Turkey	Afyonkarahisar
325304	Afşin	Turkey	Kahramanmaraş
325330	Adıyaman	Turkey	Adıyaman
325336	Adilcevaz	Turkey	Bitlis
325363	Adana	Turkey	Adana
438400	Denizciler	Turkey	Hatay
442301	Batikent	Turkey	Ankara
447273	Dalaman	Turkey	Muğla
737022	Zonguldak	Turkey	Zonguldak
737054	Zile	Turkey	Tokat
737071	Zeytinburnu	Turkey	Istanbul
737421	Yomra	Turkey	Trabzon
737611	Yenişehir	Turkey	Bursa
737961	Körfez	Turkey	Kocaeli
738025	Yalova	Turkey	Yalova
738064	Yakuplu	Turkey	Istanbul
738167	Vezirköprü	Turkey	Samsun
738251	Uzunköprü	Turkey	Edirne
738329	Üsküdar	Turkey	Istanbul
738349	Ünye	Turkey	Ordu
738377	Umraniye	Turkey	Istanbul
738618	Turhal	Turkey	Tokat
738648	Trabzon	Turkey	Trabzon
738662	Tosya	Turkey	Kastamonu
738743	Tokat	Turkey	Tokat
738753	Tirebolu	Turkey	Giresun
738803	Terme	Turkey	Samsun
738858	Tepecik	Turkey	Istanbul
738907	Tekkeköy	Turkey	Samsun
738927	Tekirdağ	Turkey	Tekirdağ
739015	Taşova	Turkey	Amasya
739209	Suşehri	Turkey	Sivas
739215	Sürmene	Turkey	Trabzon
739236	Sungurlu	Turkey	Çorum
739251	Suluova	Turkey	Amasya
739549	Şişli	Turkey	Istanbul
739600	Sinop	Turkey	Sinop
739634	Silivri	Turkey	Istanbul
739914	Şebin Karahisar	Turkey	Giresun
740088	Sarıkamış	Turkey	Kars
740230	Sapanca	Turkey	Sakarya
740264	Samsun	Turkey	Samsun
740430	Safranbolu	Turkey	Karabük
740483	Rize	Turkey	Rize
740881	Osmaneli	Turkey	Bilecik
740883	Osmancık	Turkey	Çorum
741045	Orhangazi	Turkey	Bursa
741100	Ordu	Turkey	Ordu
741160	Oltu	Turkey	Erzurum
741304	Niksar	Turkey	Tokat
741347	Nallıhan	Turkey	Ankara
741385	Mustafakemalpaşa	Turkey	Bursa
741487	Mudanya	Turkey	Bursa
741529	Mimarsinan	Turkey	Istanbul
741609	Merzifon	Turkey	Amasya
741771	Malkara	Turkey	Tekirdağ
741855	Lüleburgaz	Turkey	Kırklareli
742238	Kumru	Turkey	Ordu
742658	Korgan	Turkey	Ordu
742902	Kocaali	Turkey	Sakarya
743051	Kızılcahamam	Turkey	Ankara
743166	Kırklareli	Turkey	Kırklareli
743404	Kestel	Turkey	Bursa
743439	Keşan	Turkey	Edirne
743537	Kelkit	Turkey	Gümüşhane
743615	Kazan	Turkey	Ankara
743882	Kastamonu	Turkey	Kastamonu
743952	Kars	Turkey	Kars
744093	Karasu	Turkey	Sakarya
744168	Karamürsel	Turkey	Kocaeli
744537	Karacabey	Turkey	Bursa
744562	Karabük	Turkey	Karabük
744873	Kağızman	Turkey	Kars
745026	İznik	Turkey	Bursa
745028	İzmit	Turkey	Kocaeli
745044	İstanbul	Turkey	Istanbul
745076	İskilip	Turkey	Çorum
745169	İnegol	Turkey	Bursa
745527	Horasan	Turkey	Erzurum
745530	Hopa	Turkey	Artvin
745697	Hayrabolu	Turkey	Tekirdağ
745714	Havza	Turkey	Samsun
746232	Gürsu	Turkey	Bursa
746234	Gürpınar	Turkey	Istanbul
746252	Gürgentepe	Turkey	Ordu
746425	Gumushkhane	Turkey	Gümüşhane
746565	Görele	Turkey	Giresun
746574	Gönen	Turkey	Balıkesir
746666	Gölcük	Turkey	Kocaeli
746881	Giresun	Turkey	Giresun
746898	Geyve	Turkey	Sakarya
746940	Gerede	Turkey	Bolu
746958	Gemlik	Turkey	Bursa
747014	Gebze	Turkey	Kocaeli
747135	Ferizli	Turkey	Sakarya
747155	Fatsa	Turkey	Ordu
747323	Esenyurt	Turkey	Istanbul
747340	Esenler	Turkey	Istanbul
747471	Ereğli	Turkey	Zonguldak
747482	Erdek	Turkey	Balıkesir
747489	Erbaa	Turkey	Tokat
747538	Eminönü	Turkey	Istanbul
747712	Edirne	Turkey	Edirne
747764	Düzce	Turkey	Düzce
748167	Devrek	Turkey	Zonguldak
748870	Çubuk	Turkey	Ankara
748879	Çorum	Turkey	Çorum
748893	Çorlu	Turkey	Tekirdağ
749279	Çerkeş	Turkey	Çankırı
749502	Çayeli	Turkey	Rize
749508	Çaycuma	Turkey	Zonguldak
749644	Çatalca	Turkey	Istanbul
749704	Çarşamba	Turkey	Samsun
749748	Khanjarah	Turkey	Çankırı
749780	Çanakkale	Turkey	Çanakkale Province
749795	Çan	Turkey	Çanakkale Province
750269	Bursa	Turkey	Bursa
750317	Bulancak	Turkey	Giresun
750468	Boyabat	Turkey	Sinop
750516	Bolu	Turkey	Bolu
750598	Bilecik	Turkey	Bilecik
750605	Biga	Turkey	Çanakkale Province
750637	Beypazarı	Turkey	Ankara
750735	Beşikdüzü	Turkey	Trabzon
750938	Bayburt	Turkey	Bayburt
751057	Bartın	Turkey	Bartın
751324	Bağcılar	Turkey	Istanbul
751335	Bafra	Turkey	Samsun
751371	Babaeski	Turkey	Kırklareli
751817	Artvin	Turkey	Artvin
751838	Arsin	Turkey	Trabzon
751931	Arhavi	Turkey	Artvin
751949	Ardeşen	Turkey	Rize
751952	Ardahan	Turkey	Ardahan
751971	Araklı	Turkey	Trabzon
752015	Amasya	Turkey	Amasya
752184	Alaplı	Turkey	Zonguldak
752278	Alaca	Turkey	Çorum
752288	Akyazı	Turkey	Sakarya
752584	Akçakoca	Turkey	Düzce
752850	Adapazarı	Turkey	Sakarya
831432	Espiye	Turkey	Giresun
6354984	merter keresteciler	Turkey	Istanbul
6354985	güngören merter	Turkey	Istanbul
6620290	Turgutreis	Turkey	Muğla
6692524	Sarigerme	Turkey	Muğla
6947637	Ataşehir	Turkey	Istanbul
6947639	Başakşehir	Turkey	Istanbul
6947640	Beylikdüzü	Turkey	Istanbul
6947641	Büyükçekmece	Turkey	Istanbul
6955677	Çankaya	Turkey	Ankara
7627067	Bahçelievler	Turkey	Istanbul
7628416	Sultangazi	Turkey	Istanbul
7628419	Sultanbeyli	Turkey	Istanbul
7701384	Karabağlar	Turkey	İzmir
8074174	Muratpaşa	Turkey	Antalya
3573576	Tunapuna	Trinidad and Tobago	Tunapuna/Piarco
3573703	Scarborough	Trinidad and Tobago	Tobago
3573732	Sangre Grande	Trinidad and Tobago	Sangre Grande
3573738	San Fernando	Trinidad and Tobago	City of San Fernando
3573840	Rio Claro	Trinidad and Tobago	Mayaro
3573899	Point Fortin	Trinidad and Tobago	Point Fortin
3573989	Paradise	Trinidad and Tobago	Tunapuna/Piarco
3574116	Mon Repos	Trinidad and Tobago	City of San Fernando
3574194	Marabella	Trinidad and Tobago	City of San Fernando
3574309	Laventille	Trinidad and Tobago	San Juan/Laventille
3574810	Chaguanas	Trinidad and Tobago	Chaguanas
3575051	Arima	Trinidad and Tobago	Borough of Arima
2110394	Funafuti	Tuvalu	Funafuti
1665196	Douliu	Taiwan	Taiwan
1665357	Yujing	Taiwan	Taiwan
1668341	Taipei	Taiwan	Taipei
1668355	Tainan	Taiwan	Taiwan
1668399	Taichung	Taiwan	Taiwan
1668467	Daxi	Taiwan	Taiwan
1670029	Banqiao	Taiwan	Taipei
1670310	Puli	Taiwan	Taiwan
1672228	Magong	Taiwan	Taiwan
1672551	Lugu	Taiwan	Taiwan
1674199	Yilan	Taiwan	Taiwan
1674504	Hualien City	Taiwan	Taiwan
1675151	Hsinchu	Taiwan	Taiwan
1676242	Hengchun	Taiwan	Taiwan
1678008	Jincheng	Taiwan	Fukien
1678228	Keelung	Taiwan	Taiwan
6696918	Taoyuan City	Taiwan	Taiwan
6949678	Taitung City	Taiwan	Taiwan
7601921	Zhongxing New Village	Taiwan	Taiwan
148842	Wete	Tanzania	Pemba North
148942	Vwawa	Tanzania	Mbeya
148987	Vikindu	Tanzania	Pwani
149027	Uyovu	Tanzania	Geita
149050	Uvinza	Tanzania	Kigoma
149129	Ushirombo	Tanzania	Geita
149132	Usevia	Tanzania	Katavi
149151	Usagara	Tanzania	Mwanza
149155	Usa River	Tanzania	Arusha
149172	Urambo	Tanzania	Tabora
149402	Tunduma	Tanzania	Mbeya
149418	Tumbi	Tanzania	Tabora
149437	Tukuyu	Tanzania	Mbeya
149512	Tinde	Tanzania	Shinyanga
149581	Tarime	Tanzania	Mara
149606	Tanga	Tanzania	Tanga
149658	Tabora	Tanzania	Tabora
149703	Sumbawanga	Tanzania	Rukwa
149775	Songwa	Tanzania	Shinyanga
149792	Somanda	Tanzania	Simiyu
149854	Sirari	Tanzania	Mara
149879	Singida	Tanzania	Singida
149929	Sikonge	Tanzania	Tabora
150006	Shinyanga	Tanzania	Shinyanga
150037	Shelui	Tanzania	Singida
150099	Sepuka	Tanzania	Singida
150276	Same	Tanzania	Kilimanjaro
150436	Rulenge	Tanzania	Kagera
150453	Rujewa	Tanzania	Mbeya
150634	Puma	Tanzania	Singida
150885	Old Shinyanga	Tanzania	Shinyanga
150930	Nzega	Tanzania	Tabora
151108	Nyamuswa	Tanzania	Mara
151211	Nyalikungu	Tanzania	Simiyu
151266	Nyakabindi	Tanzania	Simiyu
151363	Nsunga	Tanzania	Kagera
151373	Nshamba	Tanzania	Kagera
151479	Njombe	Tanzania	Njombe
151567	Nguruka	Tanzania	Kigoma
151599	Ngudu	Tanzania	Mwanza
151711	Ngara	Tanzania	Kagera
151929	Nangwa	Tanzania	Manyara
151986	Namanyere	Tanzania	Rukwa
152224	Mwanza	Tanzania	Mwanza
152376	Mwadui	Tanzania	Shinyanga
152403	Mvomero	Tanzania	Pwani
152451	Musoma	Tanzania	Mara
152497	Muriti	Tanzania	Mara
152546	Mungaa	Tanzania	Singida
152632	Muheza	Tanzania	Tanga
152663	Mugumu	Tanzania	Mara
152718	Mtwango	Tanzania	Njombe
152743	Mto wa Mbu	Tanzania	Arusha
152781	Mtinko	Tanzania	Singida
152933	Msowero	Tanzania	Morogoro
153094	Mpwapwa	Tanzania	Dodoma
153209	Moshi	Tanzania	Kilimanjaro
153220	Morogoro	Tanzania	Morogoro
153352	Mlowo	Tanzania	Mbeya
153384	Mlimba	Tanzania	Morogoro
153408	Mlangali	Tanzania	Njombe
153412	Mlandizi	Tanzania	Pwani
153423	Mlalo	Tanzania	Tanga
153482	Mkuranga	Tanzania	Pwani
153709	Mwandiga	Tanzania	Kigoma
153759	Misungwi	Tanzania	Mwanza
153871	Mikumi	Tanzania	Morogoro
154002	Mhango	Tanzania	Shinyanga
154097	Mgandu	Tanzania	Singida
154321	Mbuguni	Tanzania	Arusha
154470	Mazinde	Tanzania	Tanga
154566	Matui	Tanzania	Tanga
154638	Matai	Tanzania	Rukwa
154648	Maswa	Tanzania	Simiyu
154654	Masumbwe	Tanzania	Geita
154780	Maramba	Tanzania	Tanga
155016	Malinyi	Tanzania	Morogoro
155056	Malampaka	Tanzania	Simiyu
155076	Makuyuni	Tanzania	Tanga
155101	Makumbako	Tanzania	Njombe
155285	Mahanje	Tanzania	Ruvuma
155307	Kihangara	Tanzania	Mwanza
155310	Magugu	Tanzania	Manyara
155334	Magole	Tanzania	Morogoro
155405	Mafinga	Tanzania	Iringa
155515	Mabama	Tanzania	Tabora
155569	Lushoto	Tanzania	Tanga
155743	Lugoba	Tanzania	Pwani
155921	Liwale	Tanzania	Lindi
156025	Lembeni	Tanzania	Kilimanjaro
156080	Lalago	Tanzania	Simiyu
156098	Laela	Tanzania	Rukwa
156111	Kyela	Tanzania	Mbeya
156510	Kondoa	Tanzania	Dodoma
156627	Kiwira	Tanzania	Mbeya
156963	Kishapu	Tanzania	Shinyanga
156974	Kisesa	Tanzania	Simiyu
157107	Kirando	Tanzania	Rukwa
157198	Kiomboi	Tanzania	Singida
157268	Kingori	Tanzania	Arusha
157738	Kigoma	Tanzania	Kigoma
157826	Kidodi	Tanzania	Morogoro
157863	Kidatu	Tanzania	Morogoro
157960	Kibondo	Tanzania	Kigoma
157977	Kibiti	Tanzania	Pwani
158016	Kibara	Tanzania	Mara
158024	Kibakwe	Tanzania	Dodoma
158027	Kibaha	Tanzania	Pwani
158151	Katumba	Tanzania	Mbeya
158160	Katoro	Tanzania	Geita
158179	Katerero	Tanzania	Kagera
158214	Kasulu	Tanzania	Kigoma
158289	Kasamwa	Tanzania	Geita
158324	Kiratu	Tanzania	Arusha
158597	Kahama	Tanzania	Shinyanga
158684	Kabanga	Tanzania	Kagera
158825	Izazi	Tanzania	Iringa
158904	Itigi	Tanzania	Singida
159045	Isaka	Tanzania	Shinyanga
159071	Iringa	Tanzania	Iringa
159107	Ipinda	Tanzania	Mbeya
159179	Ilula	Tanzania	Iringa
159186	Ilongero	Tanzania	Singida
159218	Ilembula	Tanzania	Njombe
159380	Igurusi	Tanzania	Mbeya
159386	Igunga	Tanzania	Tabora
159398	Igugunu	Tanzania	Singida
159492	Ifakara	Tanzania	Morogoro
159647	Hedaru	Tanzania	Kilimanjaro
159908	Geita	Tanzania	Geita
159909	Geiro	Tanzania	Morogoro
159951	Galappo	Tanzania	Manyara
160172	Dongobesh	Tanzania	Manyara
160196	Dodoma	Tanzania	Dodoma
160266	Dareda	Tanzania	Manyara
160464	Chimala	Tanzania	Mbeya
160552	Chato	Tanzania	Geita
160592	Chanika	Tanzania	Tanga
160660	Chalinze	Tanzania	Pwani
160670	Chala	Tanzania	Rukwa
160677	Chake Chake	Tanzania	Pemba South
160798	Butiama	Tanzania	Mara
160833	Buseresere	Tanzania	Geita
160877	Bungu	Tanzania	Pwani
160892	Bunda	Tanzania	Mara
160961	Bukoba	Tanzania	Kagera
161023	Bugarama	Tanzania	Kagera
161154	Biharamulo	Tanzania	Kagera
161197	Basotu	Tanzania	Manyara
161204	Bashanet	Tanzania	Manyara
161218	Bariadi	Tanzania	Simiyu
161290	Bagamoyo	Tanzania	Pwani
161312	Babati	Tanzania	Manyara
161325	Arusha	Tanzania	Arusha
877384	Tingi	Tanzania	Ruvuma
877391	Tandahimba	Tanzania	Mtwara
877471	Nyangao	Tanzania	Lindi
877532	Newala Kisimani	Tanzania	Mtwara
877581	Nanyamba	Tanzania	Mtwara
877597	Nangomba	Tanzania	Mtwara
877605	Nanganga	Tanzania	Mtwara
877702	Nachingwea	Tanzania	Lindi
877747	Mtwara	Tanzania	Mtwara
877998	Mbinga	Tanzania	Ruvuma
878041	Matiri	Tanzania	Ruvuma
878058	Masasi	Tanzania	Mtwara
878073	Maposeni	Tanzania	Ruvuma
878195	Lukuledi	Tanzania	Mtwara
878223	Luchingu	Tanzania	Mtwara
878281	Lindi	Tanzania	Lindi
878400	Kigonsera	Tanzania	Ruvuma
6640202	Merelani	Tanzania	Arusha
613273	Lebedyn	Ukraine	Sumy
616743	Druzhkivka	Ukraine	Donetsk
686729	Vasylivka	Ukraine	Zaporizhia
686803	Zvenyhorodka	Ukraine	Cherkasy
686818	Zuhres	Ukraine	Donetsk
686875	Zolotonosha	Ukraine	Cherkasy
686896	Zolochiv	Ukraine	Lviv
686919	Znomenka	Ukraine	Kirovohrad
686928	Zmiyiv	Ukraine	Kharkiv
686967	Zhytomyr	Ukraine	Zhytomyr
687196	Zhovti Vody	Ukraine	Dnipropetrovsk
687245	Zhashkiv	Ukraine	Cherkasy
687432	Zdolbuniv	Ukraine	Rivne
687700	Zaporizhzhya	Ukraine	Zaporizhia
687997	Yuzhne	Ukraine	Odessa
688105	Yevpatoriya	Ukraine	Crimea
688148	Yenakiyeve	Ukraine	Donetsk
688373	Yasynuvata	Ukraine	Donetsk
688533	Yalta	Ukraine	Crimea
688587	Yahotyn	Ukraine	Kiev
688723	Vyshhorod	Ukraine	Kiev
688746	Vynohradiv	Ukraine	Zakarpattia
688860	Voznesensk	Ukraine	Mykolaiv
689198	Volnovakha	Ukraine	Donetsk
689304	Vovchans’k	Ukraine	Kharkiv
689487	Vyshneve	Ukraine	Kiev
689558	Vinnytsya	Ukraine	Vinnyts'ka
690312	Vatutine	Ukraine	Cherkasy
690412	Vasylkiv	Ukraine	Kiev
690548	Uzhhorod	Ukraine	Zakarpattia
690688	Uman’	Ukraine	Cherkasy
691016	Tul’chyn	Ukraine	Vinnyts'ka
691037	Tsyurupyns’k	Ukraine	Kherson
691179	Truskavets	Ukraine	Lviv
691374	Torez	Ukraine	Donetsk
691469	Tokmak	Ukraine	Zaporizhia
691650	Ternopil’	Ukraine	Ternopil
691936	Tal’ne	Ukraine	Cherkasy
691999	Syevyerodonets’k	Ukraine	Luhansk
692087	Svitlovods’k	Ukraine	Kirovohrad
692105	Sverdlovs’k	Ukraine	Luhansk
692118	Svatove	Ukraine	Luhansk
692129	Svalyava	Ukraine	Zakarpattia
692194	Sumy	Ukraine	Sumy
692372	Stryi	Ukraine	Lviv
692632	Stebnyk	Ukraine	Lviv
692832	Starobil’s’k	Ukraine	Luhansk
692975	Stakhanov	Ukraine	Luhansk
693301	Sokal’	Ukraine	Lviv
693381	Snizhne	Ukraine	Donetsk
693457	Smila	Ukraine	Cherkasy
693468	Sloviansk	Ukraine	Donetsk
693581	Slavuta	Ukraine	Khmelnytskyi
693615	Skvyra	Ukraine	Kiev
693709	Skadovs’k	Ukraine	Kherson
693796	Synel’nykove	Ukraine	Dnipropetrovsk
693805	Simferopol	Ukraine	Crimea
693920	Shpola	Ukraine	Cherkasy
693942	Shostka	Ukraine	Sumy
694216	Shepetivka	Ukraine	Khmelnytskyi
694382	Shakhtars’k	Ukraine	Donetsk
694677	Selydove	Ukraine	Donetsk
694792	Sarny	Ukraine	Rivne
694864	Sambir	Ukraine	Lviv
694910	Saky	Ukraine	Crimea
695344	Rozdil’na	Ukraine	Odessa
695379	Roven’ky	Ukraine	Luhansk
695464	Romny	Ukraine	Sumy
695594	Rivne	Ukraine	Rivne
695670	Reni	Ukraine	Odessa
695965	Piatykhatky	Ukraine	Dnipropetrovsk
696008	Putyvl’	Ukraine	Sumy
696108	Pryluky	Ukraine	Chernihiv
696566	Popasna	Ukraine	Luhansk
696643	Poltava	Ukraine	Poltava
696660	Polonne	Ukraine	Khmelnytskyi
696677	Polohy	Ukraine	Zaporizhia
696943	Pidhorodne	Ukraine	Dnipropetrovsk
697183	Pyryatyn	Ukraine	Poltava
697592	Pervomays’k	Ukraine	Luhansk
697593	Pervomays’k	Ukraine	Mykolaiv
697650	Pereval’s’k	Ukraine	Luhansk
697889	Pavlohrad	Ukraine	Dnipropetrovsk
698131	Ovruch	Ukraine	Zhytomyr
698428	Orikhiv	Ukraine	Zaporizhia
698625	Oleksandriya	Ukraine	Kirovohrad
698740	Odessa	Ukraine	Odessa
698770	Ochakiv	Ukraine	Mykolaiv
698782	Obukhiv	Ukraine	Kiev
698953	Novyy Buh	Ukraine	Mykolaiv
699035	Novovolyns’k	Ukraine	Volyn
699078	Novoukrayinka	Ukraine	Kirovohrad
699445	Novomoskovs’k	Ukraine	Dnipropetrovsk
699553	Novohrad-Volyns’kyy	Ukraine	Zhytomyr
699839	Nova Kakhovka	Ukraine	Kherson
699917	Nosivka	Ukraine	Chernihiv
699942	Nizhyn	Ukraine	Chernihiv
700019	Nyzhn’ohirs’kyy	Ukraine	Crimea
700051	Nikopol’	Ukraine	Dnipropetrovsk
700261	Netishyn	Ukraine	Khmelnytskyi
700507	Nadvirna	Ukraine	Ivano-Frankivsk
700569	Mykolayiv	Ukraine	Mykolaiv
700829	Molodohvardiys’k	Ukraine	Luhansk
700918	Mohyliv-Podil’s’kyy	Ukraine	Vinnyts'ka
700997	Miskhor	Ukraine	Crimea
701075	Myrhorod	Ukraine	Poltava
701347	Merefa	Ukraine	Kharkiv
701404	Melitopol’	Ukraine	Zaporizhia
701822	Mariupol	Ukraine	Donetsk
701855	Marhanets’	Ukraine	Dnipropetrovsk
702116	Malyn	Ukraine	Zhytomyr
702320	Makiyivka	Ukraine	Donetsk
702417	Lyubotyn	Ukraine	Kharkiv
702550	Lviv	Ukraine	Lviv
702563	Lutuhyne	Ukraine	Luhansk
702569	Luts’k	Ukraine	Volyn
702658	Luhansk	Ukraine	Luhansk
702723	Lubny	Ukraine	Poltava
702760	Lozova	Ukraine	Kharkiv
703428	Ladyzhyn	Ukraine	Vinnyts'ka
703464	Kuznetsovs’k	Ukraine	Rivne
703646	Kurakhovo	Ukraine	Donetsk
703656	Kupjansk	Ukraine	Kharkiv
703845	Kryvyi Rih	Ukraine	Dnipropetrovsk
704000	Krolevets’	Ukraine	Sumy
704138	Kreminna	Ukraine	Luhansk
704143	Kremenets’	Ukraine	Ternopil
704147	Kremenchuk	Ukraine	Poltava
704202	Krasnyy Luch	Ukraine	Luhansk
704204	Krasnyy Lyman	Ukraine	Donetsk
704362	Krasnoperekops’k	Ukraine	Crimea
704388	Krasnohrad	Ukraine	Kharkiv
704403	Krasnodon	Ukraine	Luhansk
704492	Krasyliv	Ukraine	Khmelnytskyi
704508	Kramators’k	Ukraine	Donetsk
704608	Kivsharivka	Ukraine	Kharkiv
704617	Kovel’	Ukraine	Volyn
704679	Kotovs’k	Ukraine	Odessa
704737	Kostopil’	Ukraine	Rivne
704858	Korsun’-Shevchenkivs’kyy	Ukraine	Cherkasy
704885	Korostyshiv	Ukraine	Zhytomyr
704901	Korosten’	Ukraine	Zhytomyr
705104	Kostyantynivka	Ukraine	Donetsk
705135	Konotop	Ukraine	Sumy
705183	Komsomol’s’ke	Ukraine	Kharkiv
705392	Kolomyya	Ukraine	Ivano-Frankivsk
705730	Kivertsi	Ukraine	Volyn
705809	Kirovs’k	Ukraine	Luhansk
705883	Kiliya	Ukraine	Odessa
706165	Khust	Ukraine	Zakarpattia
706369	Khmel’nyts’kyy	Ukraine	Khmelnytskyi
706380	Khmil’nyk	Ukraine	Vinnyts'ka
706448	Kherson	Ukraine	Kherson
706466	Khartsyz’k	Ukraine	Donetsk
706483	Kharkiv	Ukraine	Kharkiv
706524	Kerch	Ukraine	Crimea
706571	Kozyatyn	Ukraine	Vinnyts'ka
706749	Karlivka	Ukraine	Poltava
706900	Kaniv	Ukraine	Cherkasy
706950	Kamieniec Podolski	Ukraine	Khmelnytskyi
707099	Kalush	Ukraine	Ivano-Frankivsk
707155	Kalynivka	Ukraine	Vinnyts'ka
707244	Kakhovka	Ukraine	Kherson
707292	Izyum	Ukraine	Kharkiv
707308	Izmayil	Ukraine	Odessa
707471	Ivano-Frankivs’k	Ukraine	Ivano-Frankivsk
707565	Irpin	Ukraine	Kiev
707679	Ilovays’k	Ukraine	Donetsk
707688	Illichivs’k	Ukraine	Odessa
707752	Horodok	Ukraine	Khmelnytskyi
707753	Horlivka	Ukraine	Donetsk
707758	Hlukhiv	Ukraine	Sumy
707898	Hulyaypole	Ukraine	Zaporizhia
708313	Horodok	Ukraine	Lviv
708366	Horodyshche	Ukraine	Cherkasy
708632	Hola Prystan’	Ukraine	Kherson
708878	Heniches’k	Ukraine	Kherson
708898	Hayvoron	Ukraine	Kirovohrad
708901	Haysyn	Ukraine	Vinnyts'ka
709054	Hadyach	Ukraine	Poltava
709161	Feodosiya	Ukraine	Crimea
709248	Fastiv	Ukraine	Kiev
709334	Dzhankoy	Ukraine	Crimea
709429	Dunaivtsi	Ukraine	Khmelnytskyi
709540	Dubno	Ukraine	Rivne
709611	Drohobych	Ukraine	Lviv
709717	Donetsk	Ukraine	Donetsk
709755	Dolyna	Ukraine	Ivano-Frankivsk
709782	Dolyns'ka	Ukraine	Kirovohrad
709835	Dokuchayevs’k	Ukraine	Donetsk
709900	Dobropillya	Ukraine	Donetsk
709932	Dniprodzerzhyns’k	Ukraine	Dnipropetrovsk
709960	Dniprorudne	Ukraine	Zaporizhia
710035	Dymytrov	Ukraine	Donetsk
710098	Derhachi	Ukraine	Kharkiv
710229	Debal’tseve	Ukraine	Donetsk
710374	Chuhuyiv	Ukraine	Kharkiv
710400	Chortkiv	Ukraine	Ternopil
710548	Chervonopartyzans’k	Ukraine	Luhansk
710554	Chervonohrad	Ukraine	Lviv
710719	Chernivtsi	Ukraine	Chernivtsi
710735	Chernihiv	Ukraine	Chernihiv
710791	Cherkasy	Ukraine	Cherkasy
711350	Bucha	Ukraine	Kiev
711369	Bryanka	Ukraine	Luhansk
711390	Brovary	Ukraine	Kiev
711416	Brody	Ukraine	Lviv
711515	Boyarka	Ukraine	Kiev
711660	Boryspil’	Ukraine	Kiev
711669	Boryslav	Ukraine	Lviv
711841	Bolhrad	Ukraine	Odessa
711867	Bohuslav	Ukraine	Kiev
712160	Bilhorod-Dnistrovs’kyy	Ukraine	Odessa
712165	Bila Tserkva	Ukraine	Kiev
712374	Бережани	Ukraine	Ternopil
712423	Berehove	Ukraine	Zakarpattia
712441	Berdychiv	Ukraine	Zhytomyr
712451	Berdyans’k	Ukraine	Zaporizhia
712559	Bilopillya	Ukraine	Sumy
712587	Bilohirs’k	Ukraine	Crimea
712861	Bar	Ukraine	Vinnyts'ka
712886	Balta	Ukraine	Odessa
712926	Balakliya	Ukraine	Kharkiv
712967	Bakhmach	Ukraine	Chernihiv
712969	Bakhchysaray	Ukraine	Crimea
713122	Avdiyivka	Ukraine	Donetsk
713163	Artsyz	Ukraine	Odessa
713174	Artemivs’k	Ukraine	Donetsk
713203	Armyans’k	Ukraine	Crimea
713245	Apostolove	Ukraine	Dnipropetrovsk
713259	Antratsyt	Ukraine	Luhansk
713504	Amvrosiyivka	Ukraine	Donetsk
713513	Alushta	Ukraine	Crimea
713716	Alchevs’k	Ukraine	Luhansk
713749	Okhtyrka	Ukraine	Sumy
6559559	Komsomolsk	Ukraine	Poltava
6930327	Славутич	Ukraine	Kiev
7525990	Yuzhnoukrains'k	Ukraine	Mykolaiv
8468760	Novoyavorivs'k	Ukraine	Lviv
225835	Yumbe	Uganda	Northern Region
225858	Wobulenzi	Uganda	Central Region
225964	Wakiso	Uganda	Central Region
226234	Soroti	Uganda	Eastern Region
226823	Pallisa	Uganda	Eastern Region
226853	Paidha	Uganda	Northern Region
227528	Nyachera	Uganda	Western Region
227592	Ntungamo	Uganda	Western Region
227593	Ntungamo	Uganda	Western Region
227812	Njeru	Uganda	Central Region
227904	Nebbi	Uganda	Northern Region
228227	Namasuba	Uganda	Central Region
228853	Mukono	Uganda	Central Region
228971	Mubende	Uganda	Central Region
229059	Moyo	Uganda	Northern Region
229139	Mityana	Uganda	Central Region
229268	Mbarara	Uganda	Western Region
229278	Mbale	Uganda	Eastern Region
229362	Masindi	Uganda	Western Region
229746	Luwero	Uganda	Central Region
229911	Lugazi	Uganda	Central Region
230166	Lira	Uganda	Northern Region
230299	Kyenjojo	Uganda	Western Region
230617	Kotido	Uganda	Northern Region
230893	Kitgum	Uganda	Northern Region
231139	Kireka	Uganda	Central Region
231696	Kayunga	Uganda	Central Region
232066	Kasese	Uganda	Western Region
232371	Kamwenge	Uganda	Western Region
232422	Kampala	Uganda	Central Region
233070	Kabale	Uganda	Western Region
233114	Jinja	Uganda	Eastern Region
233275	Iganga	Uganda	Eastern Region
233312	Hoima	Uganda	Western Region
233346	Gulu	Uganda	Northern Region
233508	Entebbe	Uganda	Central Region
233730	Bwizibwera	Uganda	Western Region
233886	Buwenge	Uganda	Eastern Region
234077	Busia	Uganda	Eastern Region
234092	Busembatia	Uganda	Eastern Region
234178	Bundibugyo	Uganda	Western Region
234565	Bugiri	Uganda	Eastern Region
235039	Arua	Uganda	Northern Region
235489	Adjumani	Uganda	Northern Region
4046704	Fort Hunt	United States	Virginia
4048023	Bessemer	United States	Alabama
4048662	Paducah	United States	Kentucky
4049979	Birmingham	United States	Alabama
4054378	Center Point	United States	Alabama
4058219	Daphne	United States	Alabama
4058553	Decatur	United States	Alabama
4059870	East Florence	United States	Alabama
4060791	Enterprise	United States	Alabama
4061234	Fairhope	United States	Alabama
4062577	Florence	United States	Alabama
4063619	Gadsden	United States	Alabama
4066811	Helena	United States	Alabama
4067927	Homewood	United States	Alabama
4067994	Hoover	United States	Alabama
4068446	Hueytown	United States	Alabama
4068590	Huntsville	United States	Alabama
4076598	Mobile	United States	Alabama
4076784	Montgomery	United States	Alabama
4078646	Mountain Brook	United States	Alabama
4080555	Northport	United States	Alabama
4081644	Opelika	United States	Alabama
4081914	Oxford	United States	Alabama
4082569	Pelham	United States	Alabama
4082866	Phenix City	United States	Alabama
4084796	Prattville	United States	Alabama
4084888	Prichard	United States	Alabama
4089114	Selma	United States	Alabama
4092788	Talladega	United States	Alabama
4094163	Troy	United States	Alabama
4094212	Trussville	United States	Alabama
4094455	Tuscaloosa	United States	Alabama
4095415	Vestavia Hills	United States	Alabama
4101114	Bella Vista	United States	Arkansas
4101241	Benton	United States	Arkansas
4101260	Bentonville	United States	Arkansas
4102412	Blytheville	United States	Arkansas
4103448	Bryant	United States	Arkansas
4103957	Cabot	United States	Arkansas
4106458	Conway	United States	Arkansas
4109785	El Dorado	United States	Arkansas
4110486	Fayetteville	United States	Arkansas
4111382	Forrest City	United States	Arkansas
4111410	Fort Smith	United States	Arkansas
4115412	Hot Springs	United States	Arkansas
4116315	Jacksonville	United States	Arkansas
4116834	Jonesboro	United States	Arkansas
4120792	Maumelle	United States	Arkansas
4124112	North Little Rock	United States	Arkansas
4125388	Paragould	United States	Arkansas
4126226	Pine Bluff	United States	Arkansas
4128894	Rogers	United States	Arkansas
4129397	Russellville	United States	Arkansas
4130430	Searcy	United States	Arkansas
4131116	Siloam Springs	United States	Arkansas
4132093	Springdale	United States	Arkansas
4133367	Texarkana	United States	Arkansas
4134716	Van Buren	United States	Arkansas
4135865	West Memphis	United States	Arkansas
4141363	Bear	United States	Delaware
4142290	Dover	United States	Delaware
4143637	Middletown	United States	Delaware
4143861	Newark	United States	Delaware
4145381	Wilmington	United States	Delaware
4145805	Allapattah	United States	Florida
4145941	Altamonte Springs	United States	Florida
4146166	Apopka	United States	Florida
4146429	Aventura	United States	Florida
4146723	Bartow	United States	Florida
4146901	Bayonet Point	United States	Florida
4146934	Bayshore Gardens	United States	Florida
4147241	Belle Glade	United States	Florida
4147290	Bellview	United States	Florida
4148207	Bloomingdale	United States	Florida
4148399	Boca Del Mar	United States	Florida
4148411	Boca Raton	United States	Florida
4148533	Bonita Springs	United States	Florida
4148677	Boynton Beach	United States	Florida
4148708	Bradenton	United States	Florida
4148757	Brandon	United States	Florida
4148803	Brent	United States	Florida
4149077	Brownsville	United States	Florida
4149956	Cantonment	United States	Florida
4149962	Cape Coral	United States	Florida
4150066	Carol City	United States	Florida
4150115	Carrollwood	United States	Florida
4150118	Carrollwood Village	United States	Florida
4150190	Casselberry	United States	Florida
4151157	Citrus Park	United States	Florida
4151316	Clearwater	United States	Florida
4151352	Clermont	United States	Florida
4151440	Cocoa	United States	Florida
4151455	Coconut Creek	United States	Florida
4151460	Coconut Grove	United States	Florida
4151824	Cooper City	United States	Florida
4151871	Coral Gables	United States	Florida
4151909	Coral Springs	United States	Florida
4151921	Coral Terrace	United States	Florida
4152064	Country Walk	United States	Florida
4152093	Country Club	United States	Florida
4152311	Crestview	United States	Florida
4152574	Cutler Ridge	United States	Florida
4152772	Dania Beach	United States	Florida
4152820	Davie	United States	Florida
4152872	Daytona Beach	United States	Florida
4152890	DeLand	United States	Florida
4152926	DeBary	United States	Florida
4153071	Deerfield Beach	United States	Florida
4153132	Delray Beach	United States	Florida
4153146	Deltona	United States	Florida
4153471	Doral	United States	Florida
4153759	Dunedin	United States	Florida
4154008	East Lake	United States	Florida
4154205	Edgewater	United States	Florida
4154280	Egypt Lake-Leto	United States	Florida
4154489	Ensley	United States	Florida
4154568	Estero	United States	Florida
4154606	Eustis	United States	Florida
4155017	Ferry Pass	United States	Florida
4155529	Flagami	United States	Florida
4155726	Florida Ridge	United States	Florida
4155966	Fort Lauderdale	United States	Florida
4155995	Fort Myers	United States	Florida
4156018	Fort Pierce	United States	Florida
4156042	Fort Walton Beach	United States	Florida
4156091	Fountainebleau	United States	Florida
4156331	Fruit Cove	United States	Florida
4156404	Gainesville	United States	Florida
4156920	Golden Gate	United States	Florida
4156931	Golden Glades	United States	Florida
4157467	Greenacres City	United States	Florida
4157827	Haines City	United States	Florida
4157898	Hallandale Beach	United States	Florida
4158476	Hialeah	United States	Florida
4158482	Hialeah Gardens	United States	Florida
4158865	Holiday	United States	Florida
4158928	Hollywood	United States	Florida
4159050	Homestead	United States	Florida
4159553	Immokalee	United States	Florida
4159805	Iona	United States	Florida
4159896	Ives Estates	United States	Florida
4160021	Jacksonville	United States	Florida
4160023	Jacksonville Beach	United States	Florida
4160610	Jupiter	United States	Florida
4160705	Kendale Lakes	United States	Florida
4160711	Kendall	United States	Florida
4160812	Key West	United States	Florida
4160822	Keystone	United States	Florida
4160983	Kissimmee	United States	Florida
4161178	Lake Butler	United States	Florida
4161313	Lake Magdalene	United States	Florida
4161422	Lake Worth	United States	Florida
4161424	Lake Worth Corridor	United States	Florida
4161438	Lakeland	United States	Florida
4161461	Lakeside	United States	Florida
4161534	Land O' Lakes	United States	Florida
4161580	Largo	United States	Florida
4161616	Lauderdale Lakes	United States	Florida
4161625	Lauderhill	United States	Florida
4161705	Lealman	United States	Florida
4161771	Leesburg	United States	Florida
4161785	Lehigh Acres	United States	Florida
4161797	Leisure City	United States	Florida
4163033	Lutz	United States	Florida
4163220	Maitland	United States	Florida
4163407	Margate	United States	Florida
4163918	Meadow Woods	United States	Florida
4163971	Melbourne	United States	Florida
4164092	Merritt Island	United States	Florida
4164138	Miami	United States	Florida
4164143	Miami Beach	United States	Florida
4164167	Miami Gardens	United States	Florida
4164186	Miami Lakes	United States	Florida
4164601	Miramar	United States	Florida
4165519	Myrtle Grove	United States	Florida
4165565	Naples	United States	Florida
4165637	Navarre	United States	Florida
4166066	Norland	United States	Florida
4166195	North Fort Myers	United States	Florida
4166222	North Lauderdale	United States	Florida
4166232	North Miami	United States	Florida
4166233	North Miami Beach	United States	Florida
4166274	North Port	United States	Florida
4166583	Oak Ridge	United States	Florida
4166638	Oakland Park	United States	Florida
4166673	Ocala	United States	Florida
4166776	Ocoee	United States	Florida
4166805	Ojus	United States	Florida
4167003	Opa-locka	United States	Florida
4167147	Orlando	United States	Florida
4167178	Ormond Beach	United States	Florida
4167348	Oviedo	United States	Florida
4167424	Pace	United States	Florida
4167499	Palm Bay	United States	Florida
4167519	Palm Beach Gardens	United States	Florida
4167536	Palm City	United States	Florida
4167538	Palm Coast	United States	Florida
4167583	Palm Springs	United States	Florida
4167601	Palm Valley	United States	Florida
4167634	Palmetto Bay	United States	Florida
4167694	Panama City	United States	Florida
4167829	Parkland	United States	Florida
4168139	Pembroke Pines	United States	Florida
4168228	Pensacola	United States	Florida
4168459	Pine Hills	United States	Florida
4168590	Pinecrest	United States	Florida
4168630	Pinellas Park	United States	Florida
4168659	Pinewood	United States	Florida
4168773	Plant City	United States	Florida
4168782	Plantation	United States	Florida
4168930	Poinciana	United States	Florida
4169014	Pompano Beach	United States	Florida
4169130	Port Charlotte	United States	Florida
4169156	Port Orange	United States	Florida
4169171	Port Saint Lucie	United States	Florida
4169345	Princeton	United States	Florida
4169452	Punta Gorda	United States	Florida
4169455	Punta Gorda Isles	United States	Florida
4170005	Richmond West	United States	Florida
4170156	Riverview	United States	Florida
4170174	Riviera Beach	United States	Florida
4170358	Rockledge	United States	Florida
4170617	Royal Palm Beach	United States	Florida
4170688	Ruskin	United States	Florida
4170797	Safety Harbor	United States	Florida
4170965	Saint Cloud	United States	Florida
4171563	Saint Petersburg	United States	Florida
4171782	San Carlos Park	United States	Florida
4172086	Sanford	United States	Florida
4172131	Sarasota	United States	Florida
4172372	Sebastian	United States	Florida
4173392	South Bradenton	United States	Florida
4173497	South Miami Heights	United States	Florida
4173600	Southchase	United States	Florida
4173838	Spring Hill	United States	Florida
4174201	Stuart	United States	Florida
4174317	Sun City Center	United States	Florida
4174383	Sunny Isles Beach	United States	Florida
4174425	Sunset	United States	Florida
4174715	Tallahassee	United States	Florida
4174738	Tamarac	United States	Florida
4174744	Tamiami	United States	Florida
4174757	Tampa	United States	Florida
4174855	Tarpon Springs	United States	Florida
4174969	Temple Terrace	United States	Florida
4175091	The Crossings	United States	Florida
4175117	The Hammocks	United States	Florida
4175179	The Villages	United States	Florida
4175437	Titusville	United States	Florida
4175538	Town 'n' Country	United States	Florida
4176217	University Park	United States	Florida
4176318	Valrico	United States	Florida
4176380	Venice	United States	Florida
4176409	Vero Beach	United States	Florida
4177671	Wekiwa Springs	United States	Florida
4177703	Wellington	United States	Florida
4177727	Wesley Chapel	United States	Florida
4177779	Westchase	United States	Florida
4177865	West Little River	United States	Florida
4177872	West Melbourne	United States	Florida
4177887	West Palm Beach	United States	Florida
4177908	West Pensacola	United States	Florida
4177965	Westchester	United States	Florida
4178003	Weston	United States	Florida
4178550	Winter Garden	United States	Florida
4178552	Winter Haven	United States	Florida
4178560	Winter Park	United States	Florida
4178573	Winter Springs	United States	Florida
4178775	Wright	United States	Florida
4179074	Acworth	United States	Georgia
4179320	Albany	United States	Georgia
4179574	Alpharetta	United States	Georgia
4179667	Americus	United States	Georgia
4180386	Athens	United States	Georgia
4180439	Atlanta	United States	Georgia
4180531	Augusta	United States	Georgia
4181936	Belvedere Park	United States	Georgia
4184530	Brookhaven	United States	Georgia
4184845	Brunswick	United States	Georgia
4185657	Calhoun	United States	Georgia
4186213	Canton	United States	Georgia
4186416	Carrollton	United States	Georgia
4188985	Columbus	United States	Georgia
4189213	Conyers	United States	Georgia
4190581	Dalton	United States	Georgia
4191124	Decatur	United States	Georgia
4191955	Douglasville	United States	Georgia
4192205	Dublin	United States	Georgia
4192289	Duluth	United States	Georgia
4192375	Dunwoody	United States	Georgia
4192674	East Point	United States	Georgia
4193699	Evans	United States	Georgia
4194474	Fayetteville	United States	Georgia
4195701	Forest Park	United States	Georgia
4196586	Gainesville	United States	Georgia
4198322	Griffin	United States	Georgia
4200671	Hinesville	United States	Georgia
4203696	Kennesaw	United States	Georgia
4204230	La Grange	United States	Georgia
4205196	Lawrenceville	United States	Georgia
4205885	Lithia Springs	United States	Georgia
4207226	Mableton	United States	Georgia
4207400	Macon	United States	Georgia
4207783	Marietta	United States	Georgia
4207981	Martinez	United States	Georgia
4208442	McDonough	United States	Georgia
4209448	Milledgeville	United States	Georgia
4212684	Newnan	United States	Georgia
4212992	North Decatur	United States	Georgia
4212995	North Druid Hills	United States	Georgia
4215110	Peachtree City	United States	Georgia
4216948	Pooler	United States	Georgia
4218165	Redan	United States	Georgia
4219001	Riverdale	United States	Georgia
4219762	Rome	United States	Georgia
4220629	St. Marys	United States	Georgia
4221333	Sandy Springs	United States	Georgia
4221552	Savannah	United States	Georgia
4223379	Smyrna	United States	Georgia
4223413	Snellville	United States	Georgia
4224413	Statesboro	United States	Georgia
4224681	Stockbridge	United States	Georgia
4225039	Sugar Hill	United States	Georgia
4225309	Suwanee	United States	Georgia
4226348	Thomasville	United States	Georgia
4226552	Tifton	United States	Georgia
4227213	Tucker	United States	Georgia
4227777	Union City	United States	Georgia
4228147	Valdosta	United States	Georgia
4229476	Warner Robins	United States	Georgia
4231874	Woodstock	United States	Georgia
4232679	Alton	United States	Illinois
4233813	Belleville	United States	Illinois
4234969	Cahokia	United States	Illinois
4235193	Carbondale	United States	Illinois
4235668	Charleston	United States	Illinois
4236191	Collinsville	United States	Illinois
4236895	Decatur	United States	Illinois
4237579	East Saint Louis	United States	Illinois
4237717	Edwardsville	United States	Illinois
4238132	Fairview Heights	United States	Illinois
4239509	Godfrey	United States	Illinois
4239714	Granite City	United States	Illinois
4241704	Jacksonville	United States	Illinois
4243899	Marion	United States	Illinois
4244099	Mattoon	United States	Illinois
4245152	Mount Vernon	United States	Illinois
4245926	O'Fallon	United States	Illinois
4251841	Upper Alton	United States	Illinois
4254957	Broad Ripple	United States	Indiana
4255056	Brownsburg	United States	Indiana
4255466	Carmel	United States	Indiana
4255836	Clarksville	United States	Indiana
4256038	Columbus	United States	Indiana
4257227	Evansville	United States	Indiana
4257494	Fishers	United States	Indiana
4258285	Greenfield	United States	Indiana
4258313	Greenwood	United States	Indiana
4259418	Indianapolis	United States	Indiana
4259640	Jasper	United States	Indiana
4259671	Jeffersonville	United States	Indiana
4260210	Lawrence	United States	Indiana
4262045	New Albany	United States	Indiana
4262072	New Castle	United States	Indiana
4263108	Plainfield	United States	Indiana
4264617	Seymour	United States	Indiana
4264688	Shelbyville	United States	Indiana
4265737	Terre Haute	United States	Indiana
4266307	Vincennes	United States	Indiana
4270356	Derby	United States	Kansas
4271086	Emporia	United States	Kansas
4271935	Gardner	United States	Kansas
4272340	Great Bend	United States	Kansas
4272782	Hays	United States	Kansas
4273299	Hutchinson	United States	Kansas
4273680	Junction City	United States	Kansas
4273837	Kansas City	United States	Kansas
4274277	Lawrence	United States	Kansas
4274305	Leavenworth	United States	Kansas
4274317	Leawood	United States	Kansas
4274356	Lenexa	United States	Kansas
4276248	Newton	United States	Kansas
4276614	Olathe	United States	Kansas
4276873	Overland Park	United States	Kansas
4277241	Pittsburg	United States	Kansas
4277718	Prairie Village	United States	Kansas
4278890	Salina	United States	Kansas
4279247	Shawnee	United States	Kansas
4280539	Topeka	United States	Kansas
4281730	Wichita	United States	Kansas
4282757	Ashland	United States	Kentucky
4285268	Bowling Green	United States	Kentucky
4286281	Burlington	United States	Kentucky
4288809	Covington	United States	Kentucky
4289445	Danville	United States	Kentucky
4291255	Erlanger	United States	Kentucky
4291620	Fern Creek	United States	Kentucky
4291945	Florence	United States	Kentucky
4292071	Fort Thomas	United States	Kentucky
4292188	Frankfort	United States	Kentucky
4292686	Georgetown	United States	Kentucky
4294494	Henderson	United States	Kentucky
4294799	Highview	United States	Kentucky
4295251	Hopkinsville	United States	Kentucky
4295776	Independence	United States	Kentucky
4295940	Ironville	United States	Kentucky
4296218	Jeffersontown	United States	Kentucky
4297983	Lexington	United States	Kentucky
4297999	Lexington-Fayette	United States	Kentucky
4299276	Louisville	United States	Kentucky
4299670	Madisonville	United States	Kentucky
4300488	Meads	United States	Kentucky
4302035	Murray	United States	Kentucky
4302504	Newburg	United States	Kentucky
4302529	Newport	United States	Kentucky
4303012	Okolona	United States	Kentucky
4303436	Owensboro	United States	Kentucky
4304713	Pleasure Ridge Park	United States	Kentucky
4305504	Radcliff	United States	Kentucky
4305974	Richmond	United States	Kentucky
4307238	Saint Matthews	United States	Kentucky
4308225	Shively	United States	Kentucky
4311963	Valley Station	United States	Kentucky
4313697	Winchester	United States	Kentucky
4314550	Alexandria	United States	Louisiana
4315588	Baton Rouge	United States	Louisiana
4315768	Bayou Cane	United States	Louisiana
4317639	Bossier City	United States	Louisiana
4319435	Central	United States	Louisiana
4319518	Chalmette	United States	Louisiana
4323873	Estelle	United States	Louisiana
4326575	Gretna	United States	Louisiana
4326868	Hammond	United States	Louisiana
4328010	Houma	United States	Louisiana
4329753	Kenner	United States	Louisiana
4330145	Lafayette	United States	Louisiana
4330236	Lake Charles	United States	Louisiana
4330525	Laplace	United States	Louisiana
4332628	Marrero	United States	Louisiana
4333177	Metairie	United States	Louisiana
4333190	Metairie Terrace	United States	Louisiana
4333669	Monroe	United States	Louisiana
4334720	Natchitoches	United States	Louisiana
4334971	New Iberia	United States	Louisiana
4335045	New Orleans	United States	Louisiana
4336153	Opelousas	United States	Louisiana
4338012	Prairieville	United States	Louisiana
4339348	Ruston	United States	Louisiana
4341378	Shenandoah	United States	Louisiana
4341727	Slidell	United States	Louisiana
4342816	Sulphur	United States	Louisiana
4343327	Terrytown	United States	Louisiana
4346991	Adelphi	United States	Maryland
4347242	Annapolis	United States	Maryland
4347371	Arbutus	United States	Maryland
4347426	Arnold	United States	Maryland
4347553	Aspen Hill	United States	Maryland
4347778	Baltimore	United States	Maryland
4347839	Ballenger Creek	United States	Maryland
4348599	Bethesda	United States	Maryland
4349159	Bowie	United States	Maryland
4350160	Calverton	United States	Maryland
4350288	Camp Springs	United States	Maryland
4350635	Catonsville	United States	Maryland
4351383	Chillum	United States	Maryland
4351851	Cloverly	United States	Maryland
4351871	Clinton	United States	Maryland
4351887	Cockeysville	United States	Maryland
4351977	College Park	United States	Maryland
4352053	Columbia	United States	Maryland
4352539	Crofton	United States	Maryland
4352681	Cumberland	United States	Maryland
4352728	Damascus	United States	Maryland
4353765	Dundalk	United States	Maryland
4353925	East Riverdale	United States	Maryland
4353962	Easton	United States	Maryland
4354087	Edgewood	United States	Maryland
4354163	Eldersburg	United States	Maryland
4354234	Elkton	United States	Maryland
4354265	Ellicott City	United States	Maryland
4354428	Essex	United States	Maryland
4354573	Fairland	United States	Maryland
4354821	Ferndale	United States	Maryland
4355355	Fort Washington	United States	Maryland
4355585	Frederick	United States	Maryland
4355843	Gaithersburg	United States	Maryland
4356050	Germantown	United States	Maryland
4356165	Glassmanor	United States	Maryland
4356188	Glen Burnie	United States	Maryland
4356783	Green Haven	United States	Maryland
4356847	Greenbelt	United States	Maryland
4357141	Hagerstown	United States	Maryland
4357340	Hanover	United States	Maryland
4358701	Hunt Valley	United States	Maryland
4358821	Hyattsville	United States	Maryland
4358864	Ilchester	United States	Maryland
4360201	Lake Shore	United States	Maryland
4360287	Landover	United States	Maryland
4360314	Langley Park	United States	Maryland
4360369	Laurel	United States	Maryland
4360954	Lochearn	United States	Maryland
4361831	Maryland City	United States	Maryland
4362344	Middle River	United States	Maryland
4362438	Milford Mill	United States	Maryland
4362743	Montgomery Village	United States	Maryland
4363836	North Bel Air	United States	Maryland
4363843	North Bethesda	United States	Maryland
4363990	North Potomac	United States	Maryland
4364362	Odenton	United States	Maryland
4364537	Olney	United States	Maryland
4364727	Owings Mills	United States	Maryland
4364759	Oxon Hill	United States	Maryland
4364946	Parkville	United States	Maryland
4364990	Pasadena	United States	Maryland
4365227	Perry Hall	United States	Maryland
4365387	Pikesville	United States	Maryland
4366001	Potomac	United States	Maryland
4366476	Randallstown	United States	Maryland
4366593	Redland	United States	Maryland
4366647	Reisterstown	United States	Maryland
4367175	Rockville	United States	Maryland
4367372	Rosedale	United States	Maryland
4367419	Rossville	United States	Maryland
4367734	Saint Charles	United States	Maryland
4368711	Salisbury	United States	Maryland
4369076	Seabrook	United States	Maryland
4369190	Severn	United States	Maryland
4369224	Severna Park	United States	Maryland
4369928	South Bel Air	United States	Maryland
4369964	South Gate	United States	Maryland
4369978	South Laurel	United States	Maryland
4370616	Suitland	United States	Maryland
4370890	Takoma Park	United States	Maryland
4371582	Towson	United States	Maryland
4372599	Waldorf	United States	Maryland
4373104	West Elkridge	United States	Maryland
4373238	Westminster	United States	Maryland
4373349	Wheaton	United States	Maryland
4373449	White Oak	United States	Maryland
4374054	Woodlawn	United States	Maryland
4374513	Affton	United States	Missouri
4375087	Arnold	United States	Missouri
4375663	Ballwin	United States	Missouri
4376482	Belton	United States	Missouri
4377664	Blue Springs	United States	Missouri
4381072	Chesterfield	United States	Missouri
4381478	Clayton	United States	Missouri
4381982	Columbia	United States	Missouri
4382072	Concord	United States	Missouri
4382837	Creve Coeur	United States	Missouri
4385018	East Independence	United States	Missouri
4386289	Farmington	United States	Missouri
4386387	Ferguson	United States	Missouri
4386802	Florissant	United States	Missouri
4387990	Gladstone	United States	Missouri
4388460	Grandview	United States	Missouri
4389967	Hazelwood	United States	Missouri
4391812	Independence	United States	Missouri
4392388	Jefferson City	United States	Missouri
4392768	Joplin	United States	Missouri
4393217	Kansas City	United States	Missouri
4393739	Kirkwood	United States	Missouri
4394870	Lee's Summit	United States	Missouri
4394905	Lemay	United States	Missouri
4396915	Manchester	United States	Missouri
4397340	Maryland Heights	United States	Missouri
4397962	Mehlville	United States	Missouri
4400648	Nixa	United States	Missouri
4401618	Oakville	United States	Missouri
4402178	Overland	United States	Missouri
4402245	Ozark	United States	Missouri
4404233	Poplar Bluff	United States	Missouri
4405180	Raymore	United States	Missouri
4405188	Raytown	United States	Missouri
4406282	Rolla	United States	Missouri
4406831	Saint Charles	United States	Missouri
4407010	Saint Joseph	United States	Missouri
4407066	St. Louis	United States	Missouri
4407237	Saint Peters	United States	Missouri
4408000	Sedalia	United States	Missouri
4409591	Spanish Lake	United States	Missouri
4409896	Springfield	United States	Missouri
4412697	University City	United States	Missouri
4413595	Warrensburg	United States	Missouri
4413872	Webster Groves	United States	Missouri
4414001	Wentzville	United States	Missouri
4414749	Wildwood	United States	Missouri
4418478	Biloxi	United States	Mississippi
4419290	Brandon	United States	Mississippi
4421935	Clarksdale	United States	Mississippi
4422133	Clinton	United States	Mississippi
4422442	Columbus	United States	Mississippi
4427569	Gautier	United States	Mississippi
4428475	Greenville	United States	Mississippi
4428495	Greenwood	United States	Mississippi
4428667	Gulfport	United States	Mississippi
4430400	Horn Lake	United States	Mississippi
4431410	Jackson	United States	Mississippi
4433039	Laurel	United States	Mississippi
4434663	Madison	United States	Mississippi
4435764	Meridian	United States	Mississippi
4437982	Natchez	United States	Mississippi
4439506	Ocean Springs	United States	Mississippi
4439869	Olive Branch	United States	Mississippi
4440076	Oxford	United States	Mississippi
4440397	Pascagoula	United States	Mississippi
4440559	Pearl	United States	Mississippi
4443296	Ridgeland	United States	Mississippi
4446675	Southaven	United States	Mississippi
4447161	Starkville	United States	Mississippi
4448903	Tupelo	United States	Mississippi
4449620	Vicksburg	United States	Mississippi
4452303	Albemarle	United States	North Carolina
4452808	Apex	United States	North Carolina
4453035	Asheboro	United States	North Carolina
4453066	Asheville	United States	North Carolina
4456703	Boone	United States	North Carolina
4458228	Burlington	United States	North Carolina
4459343	Carrboro	United States	North Carolina
4459467	Cary	United States	North Carolina
4460162	Chapel Hill	United States	North Carolina
4460243	Charlotte	United States	North Carolina
4460943	Clayton	United States	North Carolina
4461015	Clemmons	United States	North Carolina
4461574	Concord	United States	North Carolina
4461941	Cornelius	United States	North Carolina
4464368	Durham	United States	North Carolina
4464873	Eden	United States	North Carolina
4465088	Elizabeth City	United States	North Carolina
4466033	Fayetteville	United States	North Carolina
4467657	Garner	United States	North Carolina
4467732	Gastonia	United States	North Carolina
4468261	Goldsboro	United States	North Carolina
4469146	Greensboro	United States	North Carolina
4469160	Greenville	United States	North Carolina
4470244	Havelock	United States	North Carolina
4470566	Henderson	United States	North Carolina
4470778	Hickory	United States	North Carolina
4471025	High Point	United States	North Carolina
4471641	Holly Springs	United States	North Carolina
4471851	Hope Mills	United States	North Carolina
4472370	Huntersville	United States	North Carolina
4472687	Indian Trail	United States	North Carolina
4473083	Jacksonville	United States	North Carolina
4474040	Kannapolis	United States	North Carolina
4474221	Kernersville	United States	North Carolina
4474436	Kinston	United States	North Carolina
4475347	Laurinburg	United States	North Carolina
4475640	Lenoir	United States	North Carolina
4477525	Lumberton	United States	North Carolina
4478334	Matthews	United States	North Carolina
4479759	Mint Hill	United States	North Carolina
4479946	Monroe	United States	North Carolina
4480125	Mooresville	United States	North Carolina
4480219	Morganton	United States	North Carolina
4480285	Morrisville	United States	North Carolina
4481682	New Bern	United States	North Carolina
4487042	Raleigh	United States	North Carolina
4488232	Roanoke Rapids	United States	North Carolina
4488762	Rocky Mount	United States	North Carolina
4489985	Salisbury	United States	North Carolina
4490329	Sanford	United States	North Carolina
4491180	Shelby	United States	North Carolina
4493316	Statesville	United States	North Carolina
4494942	Thomasville	United States	North Carolina
4497290	Wake Forest	United States	North Carolina
4499379	Wilmington	United States	North Carolina
4499389	Wilson	United States	North Carolina
4499612	Winston-Salem	United States	North Carolina
4500546	Atlantic City	United States	New Jersey
4500942	Bridgeton	United States	New Jersey
4501018	Camden	United States	New Jersey
4501198	Cherry Hill	United States	New Jersey
4502434	Jackson	United States	New Jersey
4502687	Lindenwold	United States	New Jersey
4503078	Millville	United States	New Jersey
4503136	Mount Laurel	United States	New Jersey
4503346	Ocean Acres	United States	New Jersey
4503548	Pennsauken	United States	New Jersey
4503646	Pleasantville	United States	New Jersey
4504118	Sicklerville	United States	New Jersey
4504225	South Vineland	United States	New Jersey
4504476	Toms River	United States	New Jersey
4504621	Vineland	United States	New Jersey
4504871	Williamstown	United States	New Jersey
4505542	Athens	United States	Ohio
4506008	Beavercreek	United States	Ohio
4508204	Centerville	United States	Ohio
4508722	Cincinnati	United States	Ohio
4509177	Columbus	United States	Ohio
4509884	Dayton	United States	Ohio
4511263	Fairborn	United States	Ohio
4511283	Fairfield	United States	Ohio
4512060	Forest Park	United States	Ohio
4513575	Hamilton	United States	Ohio
4514746	Huber Heights	United States	Ohio
4515843	Kettering	United States	Ohio
4516233	Lancaster	United States	Ohio
4516412	Lebanon	United States	Ohio
4517698	Mason	United States	Ohio
4518188	Miamisburg	United States	Ohio
4518264	Middletown	United States	Ohio
4519995	Norwood	United States	Ohio
4520760	Oxford	United States	Ohio
4521209	Pickerington	United States	Ohio
4521816	Portsmouth	United States	Ohio
4522411	Reynoldsburg	United States	Ohio
4522586	Riverside	United States	Ohio
4525304	Springboro	United States	Ohio
4525353	Springfield	United States	Ohio
4526576	Trotwood	United States	Ohio
4527124	Vandalia	United States	Ohio
4528259	White Oak	United States	Ohio
4528291	Whitehall	United States	Ohio
4528810	Xenia	United States	Ohio
4528923	Zanesville	United States	Ohio
4529096	Ada	United States	Oklahoma
4529292	Altus	United States	Oklahoma
4529469	Ardmore	United States	Oklahoma
4529987	Bartlesville	United States	Oklahoma
4530372	Bethany	United States	Oklahoma
4530801	Bixby	United States	Oklahoma
4531405	Broken Arrow	United States	Oklahoma
4533029	Chickasha	United States	Oklahoma
4533580	Claremore	United States	Oklahoma
4534934	Del City	United States	Oklahoma
4535414	Durant	United States	Oklahoma
4535740	Edmond	United States	Oklahoma
4535783	El Reno	United States	Oklahoma
4535961	Enid	United States	Oklahoma
4539615	Jenks	United States	Oklahoma
4540737	Lawton	United States	Oklahoma
4542367	McAlester	United States	Oklahoma
4542765	Midwest City	United States	Oklahoma
4542975	Moore	United States	Oklahoma
4543338	Muskogee	United States	Oklahoma
4543352	Mustang	United States	Oklahoma
4543762	Norman	United States	Oklahoma
4547407	Owasso	United States	Oklahoma
4548267	Ponca City	United States	Oklahoma
4550659	Sand Springs	United States	Oklahoma
4551177	Shawnee	United States	Oklahoma
4552215	Stillwater	United States	Oklahoma
4552707	Tahlequah	United States	Oklahoma
4553433	Tulsa	United States	Oklahoma
4556165	Yukon	United States	Oklahoma
4557109	Chambersburg	United States	Pennsylvania
4557137	Chester	United States	Pennsylvania
4557606	Drexel Hill	United States	Pennsylvania
4558475	Hanover	United States	Pennsylvania
4560349	Philadelphia	United States	Pennsylvania
4561407	Springfield	United States	Pennsylvania
4562144	West Chester	United States	Pennsylvania
4562407	York	United States	Pennsylvania
4569067	Aiken	United States	South Carolina
4574324	Charleston	United States	South Carolina
4575352	Columbia	United States	South Carolina
4575461	Conway	United States	South Carolina
4577263	Easley	United States	South Carolina
4578737	Florence	United States	South Carolina
4580098	Goose Creek	United States	South Carolina
4580543	Greenville	United States	South Carolina
4580569	Greenwood	United States	South Carolina
4580599	Greer	United States	South Carolina
4581023	Hanahan	United States	South Carolina
4581833	Hilton Head Island	United States	South Carolina
4585000	Lexington	United States	South Carolina
4586523	Mauldin	United States	South Carolina
4588165	Mount Pleasant	United States	South Carolina
4588718	Myrtle Beach	United States	South Carolina
4589368	North Augusta	United States	South Carolina
4593142	Rock Hill	United States	South Carolina
4593724	Saint Andrews	United States	South Carolina
4595374	Seven Oaks	United States	South Carolina
4595864	Simpsonville	United States	South Carolina
4596208	Socastee	United States	South Carolina
4597200	Spartanburg	United States	South Carolina
4597919	Summerville	United States	South Carolina
4597948	Sumter	United States	South Carolina
4598353	Taylors	United States	South Carolina
4599937	Wade Hampton	United States	South Carolina
4544349	Oklahoma City	United States	Oklahoma
4608418	Brentwood Estates	United States	Tennessee
4608657	Bristol	United States	Tennessee
4612862	Chattanooga	United States	Tennessee
4613868	Clarksville	United States	Tennessee
4614088	Cleveland	United States	Tennessee
4614748	Collierville	United States	Tennessee
4614867	Columbia	United States	Tennessee
4615145	Cookeville	United States	Tennessee
4619800	Dyersburg	United States	Tennessee
4619943	East Brainerd	United States	Tennessee
4619947	East Chattanooga	United States	Tennessee
4620131	East Ridge	United States	Tennessee
4621846	Farragut	United States	Tennessee
4623560	Franklin	United States	Tennessee
4624180	Gallatin	United States	Tennessee
4624601	Germantown	United States	Tennessee
4626334	Greeneville	United States	Tennessee
4628735	Hendersonville	United States	Tennessee
4632595	Jackson	United States	Tennessee
4633419	Johnson City	United States	Tennessee
4634662	Kingsport	United States	Tennessee
4634946	Knoxville	United States	Tennessee
4635031	La Vergne	United States	Tennessee
4636045	Lebanon	United States	Tennessee
4639848	Maryville	United States	Tennessee
4641239	Memphis	United States	Tennessee
4642938	Morristown	United States	Tennessee
4643336	Mount Juliet	United States	Tennessee
4885156	Bloomingdale	United States	Illinois
4644312	Murfreesboro	United States	Tennessee
4644585	Nashville	United States	Tennessee
4645421	New South Memphis	United States	Tennessee
4646571	Oak Ridge	United States	Tennessee
4657077	Shelbyville	United States	Tennessee
4658590	Smyrna	United States	Tennessee
4659557	Springfield	United States	Tennessee
4663494	Tullahoma	United States	Tennessee
4669635	Abilene	United States	Texas
4670074	Alamo	United States	Texas
4670146	Aldine	United States	Texas
4670234	Alice	United States	Texas
4670300	Allen	United States	Texas
4670592	Alvin	United States	Texas
4670866	Angleton	United States	Texas
4671240	Arlington	United States	Texas
4671524	Atascocita	United States	Texas
4671654	Austin	United States	Texas
4672059	Balch Springs	United States	Texas
4672731	Baytown	United States	Texas
4672989	Beaumont	United States	Texas
4673094	Bedford	United States	Texas
4673425	Belton	United States	Texas
4673482	Benbrook	United States	Texas
4676206	Brenham	United States	Texas
4676740	Brownsville	United States	Texas
4676798	Brownwood	United States	Texas
4676920	Brushy Creek	United States	Texas
4677008	Bryan	United States	Texas
4677551	Burleson	United States	Texas
4678901	Canyon Lake	United States	Texas
4679195	Carrollton	United States	Texas
4679803	Cedar Hill	United States	Texas
4679867	Cedar Park	United States	Texas
4680388	Channelview	United States	Texas
4681462	Cibolo	United States	Texas
4681485	Cinco Ranch	United States	Texas
4681976	Cleburne	United States	Texas
4682464	College Station	United States	Texas
4682478	Colleyville	United States	Texas
4682991	Conroe	United States	Texas
4683021	Converse	United States	Texas
4683217	Coppell	United States	Texas
4683244	Copperas Cove	United States	Texas
4683317	Corinth	United States	Texas
4683416	Corpus Christi	United States	Texas
4683462	Corsicana	United States	Texas
4684724	Cypress	United States	Texas
4684888	Dallas	United States	Texas
4685524	DeSoto	United States	Texas
4685737	Deer Park	United States	Texas
4685892	Denison	United States	Texas
4685907	Denton	United States	Texas
4686163	Dickinson	United States	Texas
4686593	Donna	United States	Texas
4688275	Edinburg	United States	Texas
4689311	Ennis	United States	Texas
4689550	Euless	United States	Texas
4690198	Farmers Branch	United States	Texas
4691585	Flower Mound	United States	Texas
4691930	Fort Worth	United States	Texas
4692400	Fresno	United States	Texas
4692521	Friendswood	United States	Texas
4692559	Frisco	United States	Texas
4692746	Gainesville	United States	Texas
4692883	Galveston	United States	Texas
4693003	Garland	United States	Texas
4693150	Gatesville	United States	Texas
4693342	Georgetown	United States	Texas
4694482	Grand Prairie	United States	Texas
4695066	Greenville	United States	Texas
4695317	Groves	United States	Texas
4695912	Haltom City	United States	Texas
4696202	Harker Heights	United States	Texas
4696233	Harlingen	United States	Texas
4697645	Highland Village	United States	Texas
4699066	Houston	United States	Texas
4699442	Humble	United States	Texas
4699540	Huntsville	United States	Texas
4699575	Hurst	United States	Texas
4700168	Irving	United States	Connecticut
4845411	West Hartford	United States	Connecticut
4845419	West Haven	United States	Connecticut
4845519	West Torrington	United States	Connecticut
4845585	Westport	United States	Connecticut
4845871	Wilton	United States	Connecticut
4845898	Windham	United States	Connecticut
4845920	Windsor	United States	Connecticut
4845984	Wolcott	United States	Connecticut
4846834	Ames	United States	Iowa
4846960	Ankeny	United States	Iowa
4848489	Bettendorf	United States	Iowa
4849826	Burlington	United States	Iowa
4850699	Cedar Falls	United States	Iowa
4850751	Cedar Rapids	United States	Iowa
4852022	Clinton	United States	Iowa
4852065	Clive	United States	Iowa
4852640	Coralville	United States	Iowa
4853423	Davenport	United States	Iowa
4853828	Des Moines	United States	Iowa
4854529	Dubuque	United States	Iowa
4857486	Fort Dodge	United States	Iowa
4862034	Iowa City	United States	Iowa
4862760	Johnston	United States	Iowa
4866263	Marion	United States	Iowa
4866371	Marshalltown	United States	Iowa
4866445	Mason City	United States	Iowa
4868404	Muscatine	United States	Iowa
4868907	Newton	United States	Iowa
4870380	Ottumwa	United States	Iowa
4876523	Sioux City	United States	Iowa
4879890	Urbandale	United States	Iowa
4880889	Waterloo	United States	Iowa
4881346	West Des Moines	United States	Iowa
4883078	Algonquin	United States	Illinois
4883207	Alsip	United States	Illinois
4883555	Arlington Heights	United States	Illinois
4883817	Aurora	United States	Illinois
4884141	Bartlett	United States	Illinois
4884192	Batavia	United States	Illinois
4884434	Bellwood	United States	Illinois
4884453	Belvidere	United States	Illinois
4884509	Bensenville	United States	Illinois
4884597	Berwyn	United States	Illinois
4885164	Bloomington	United States	Illinois
4885186	Blue Island	United States	Illinois
4885265	Bolingbrook	United States	Illinois
4885342	Bourbonnais	United States	Illinois
4885418	Bradley	United States	Illinois
4885689	Brookfield	United States	Illinois
4885955	Buffalo Grove	United States	Illinois
4885983	Burbank	United States	Illinois
4886255	Calumet City	United States	Illinois
4886662	Carol Stream	United States	Illinois
4886676	Carpentersville	United States	Illinois
4886738	Cary	United States	Illinois
4887158	Champaign	United States	Illinois
4887398	Chicago	United States	Illinois
4887442	Chicago Heights	United States	Illinois
4888015	Cicero	United States	Illinois
4888892	Country Club Hills	United States	Illinois
4889107	Crest Hill	United States	Illinois
4889229	Crystal Lake	United States	Illinois
4889426	Danville	United States	Illinois
4889447	Darien	United States	Illinois
4889668	Deerfield	United States	Illinois
4889772	Des Plaines	United States	Illinois
4889959	Dixon	United States	Illinois
4890009	Dolton	United States	Illinois
4890119	Downers Grove	United States	Illinois
4890536	East Moline	United States	Illinois
4890549	East Peoria	United States	Illinois
4890864	Elgin	United States	Illinois
4890925	Elk Grove Village	United States	Illinois
4891010	Elmhurst	United States	Illinois
4891051	Elmwood Park	United States	Illinois
4891382	Evanston	United States	Illinois
4891431	Evergreen Park	United States	Illinois
4893037	Frankfort	United States	Illinois
4893171	Freeport	United States	Illinois
4893392	Galesburg	United States	Illinois
4893591	Geneva	United States	Illinois
4893811	Glen Ellyn	United States	Illinois
4893886	Glenview	United States	Illinois
4894061	Goodings Grove	United States	Illinois
4894465	Grayslake	United States	Illinois
4894861	Gurnee	United States	Illinois
4895066	Hanover Park	United States	Illinois
4895298	Harvey	United States	Illinois
4895876	Highland Park	United States	Illinois
4896012	Hinsdale	United States	Illinois
4896075	Hoffman Estates	United States	Illinois
4896336	Homer Glen	United States	Illinois
4896353	Homewood	United States	Illinois
4896691	Huntley	United States	Illinois
4898015	Joliet	United States	Illinois
4898182	Kankakee	United States	Illinois
4898846	La Grange	United States	Illinois
4899012	Lake Forest	United States	Illinois
4899184	Lake in the Hills	United States	Illinois
4899340	Lansing	United States	Illinois
4899581	Lemont	United States	Illinois
4899739	Libertyville	United States	Illinois
4900080	Lisle	United States	Illinois
4900292	Lockport	United States	Illinois
4900373	Lombard	United States	Illinois
4900579	Loves Park	United States	Illinois
4900801	Machesney Park	United States	Illinois
4900817	Macomb	United States	Illinois
4901445	Matteson	United States	Illinois
4901514	Maywood	United States	Illinois
4901663	McHenry	United States	Illinois
4901868	Melrose Park	United States	Illinois
4902475	Mokena	United States	Illinois
4902476	Moline	United States	Illinois
4902763	Morton Grove	United States	Illinois
4903024	Mount Prospect	United States	Illinois
4903184	Mundelein	United States	Illinois
4903279	Naperville	United States	Illinois
4903535	New Lenox	United States	Illinois
4903730	Niles	United States	Illinois
4903780	Normal	United States	Illinois
4903818	North Aurora	United States	Illinois
4903862	North Chicago	United States	Illinois
4903976	North Peoria	United States	Illinois
4904056	Northbrook	United States	Illinois
4904365	Oak Lawn	United States	Illinois
4904381	Oak Park	United States	Illinois
4904937	Orland Park	United States	Illinois
4904996	Oswego	United States	Illinois
4905006	Ottawa	United States	Illinois
4905211	Palatine	United States	Illinois
4905263	Palos Hills	United States	Illinois
4905337	Park Forest	United States	Illinois
4905367	Park Ridge	United States	Illinois
4905599	Pekin	United States	Illinois
4905687	Peoria	United States	Illinois
4906125	Plainfield	United States	Illinois
4906882	Prospect Heights	United States	Illinois
4907907	Rock Island	United States	Illinois
4907959	Rockford	United States	Illinois
4908068	Romeoville	United States	Illinois
4908173	Roselle	United States	Illinois
4908236	Round Lake	United States	Illinois
4908237	Round Lake Beach	United States	Illinois
4908737	Saint Charles	United States	Illinois
4910713	Schaumburg	United States	Illinois
4911418	Shorewood	United States	Illinois
4911600	Skokie	United States	Illinois
4911893	South Elgin	United States	Illinois
4911934	South Holland	United States	Illinois
4912499	Sterling	United States	Illinois
4912691	Streamwood	United States	Illinois
4913110	Sycamore	United States	Illinois
4913723	Tinley Park	United States	Illinois
4914570	Urbana	United States	Illinois
4914738	Vernon Hills	United States	Illinois
4914830	Villa Park	United States	Illinois
4915539	Wasco	United States	Illinois
4915545	Washington	United States	Illinois
4915963	West Chicago	United States	Illinois
4916140	Westchester	United States	Illinois
4916207	Westmont	United States	Illinois
4916288	Wheaton	United States	Illinois
4916311	Wheeling	United States	Illinois
4916732	Wilmette	United States	Illinois
4917089	Woodridge	United States	Illinois
4917123	Woodstock	United States	Illinois
4917298	Yorkville	United States	Illinois
4917358	Zion	United States	Illinois
4917592	Anderson	United States	Indiana
4919381	Crawfordsville	United States	Indiana
4919451	Crown Point	United States	Indiana
4919820	Dyer	United States	Indiana
4919857	East Chicago	United States	Indiana
4919987	Elkhart	United States	Indiana
4920473	Frankfort	United States	Indiana
4920607	Gary	United States	Indiana
4920808	Goshen	United States	Indiana
4920869	Granger	United States	Indiana
4920986	Griffith	United States	Indiana
4921100	Hammond	United States	Indiana
4921402	Highland	United States	Indiana
4921476	Hobart	United States	Indiana
4921725	Huntington	United States	Indiana
4922388	Kokomo	United States	Indiana
4922459	LaPorte	United States	Indiana
4922462	Lafayette	United States	Indiana
4922673	Lebanon	United States	Indiana
4922968	Logansport	United States	Indiana
4923210	Marion	United States	Indiana
4923482	Merrillville	United States	Indiana
4923670	Mishawaka	United States	Indiana
4924006	Muncie	United States	Indiana
4924014	Munster	United States	Indiana
4924198	Noblesville	United States	Indiana
4925006	Portage	United States	Indiana
4926170	Schererville	United States	Indiana
4926563	South Bend	United States	Indiana
4927537	Valparaiso	United States	Indiana
4928096	West Lafayette	United States	Indiana
4928118	Westfield	United States	Indiana
4928662	Abington	United States	Massachusetts
4928703	Acton	United States	Massachusetts
4928788	Agawam	United States	Massachusetts
4929004	Amesbury	United States	Massachusetts
4929180	Arlington	United States	Massachusetts
4929283	Ashland	United States	Massachusetts
4929399	Attleboro	United States	Massachusetts
4929417	Auburn	United States	Massachusetts
4929771	Barnstable	United States	Massachusetts
4930282	Belmont	United States	Massachusetts
4930505	Beverly	United States	Massachusetts
4930511	Beverly Cove	United States	Massachusetts
4930577	Billerica	United States	Massachusetts
4930956	Boston	United States	Massachusetts
4931181	Braintree	United States	Massachusetts
4931429	Brockton	United States	Massachusetts
4931482	Brookline	United States	Massachusetts
4931737	Burlington	United States	Massachusetts
4931972	Cambridge	United States	Massachusetts
4932214	Canton	United States	Massachusetts
4932869	Chelmsford	United States	Massachusetts
4932879	Chelsea	United States	Massachusetts
4934500	Danvers	United States	Massachusetts
4934664	Dedham	United States	Massachusetts
4935038	Dracut	United States	Massachusetts
4935582	Easthampton	United States	Massachusetts
4935623	Easton	United States	Massachusetts
4936008	Everett	United States	Massachusetts
4936087	Fairhaven	United States	Massachusetts
4936159	Fall River	United States	Massachusetts
4936812	Fitchburg	United States	Massachusetts
4937230	Framingham	United States	Massachusetts
4937232	Framingham Center	United States	Massachusetts
4937276	Franklin	United States	Massachusetts
4937557	Gardner	United States	Massachusetts
4937829	Gloucester	United States	Massachusetts
4938048	Grafton	United States	Massachusetts
4938378	Greenfield	United States	Massachusetts
4938836	Hanover	United States	Massachusetts
4939085	Haverhill	United States	Massachusetts
4939647	Holden	United States	Massachusetts
4939783	Holyoke	United States	Massachusetts
4941720	Lawrence	United States	Massachusetts
4941873	Leominster	United States	Massachusetts
4941935	Lexington	United States	Massachusetts
4942508	Longmeadow	United States	Massachusetts
4942618	Lowell	United States	Massachusetts
4942744	Ludlow	United States	Massachusetts
4942807	Lynn	United States	Massachusetts
4942939	Malden	United States	Massachusetts
4943021	Mansfield	United States	Massachusetts
4943097	Marblehead	United States	Massachusetts
4943170	Marlborough	United States	Massachusetts
4943629	Medford	United States	Massachusetts
4943677	Melrose	United States	Massachusetts
4943828	Methuen	United States	Massachusetts
4943958	Milford	United States	Massachusetts
4944193	Milton	United States	Massachusetts
4944994	Natick	United States	Massachusetts
4945055	Needham	United States	Massachusetts
4945256	Newburyport	United States	Massachusetts
4945283	Newton	United States	Massachusetts
4945588	North Chicopee	United States	Massachusetts
4945819	Northampton	United States	Massachusetts
4945911	Norton	United States	Massachusetts
4945952	Norwood	United States	Massachusetts
4946620	Palmer	United States	Massachusetts
4946863	Peabody	United States	Massachusetts
4947459	Pittsfield	United States	Massachusetts
4948247	Quincy	United States	Massachusetts
4948403	Randolph	United States	Massachusetts
4948462	Reading	United States	Massachusetts
4948924	Rockland	United States	Massachusetts
4950065	Salem	United States	Massachusetts
4950267	Saugus	United States	Massachusetts
4950898	Shrewsbury	United States	Massachusetts
4951248	Somerset	United States	Massachusetts
4951257	Somerville	United States	Massachusetts
4951397	South Hadley	United States	Massachusetts
4951473	South Peabody	United States	Massachusetts
4951594	Southbridge	United States	Massachusetts
4951788	Springfield	United States	Massachusetts
4952121	Stoneham	United States	Massachusetts
4952206	Stoughton	United States	Massachusetts
4952320	Sudbury	United States	Massachusetts
4952487	Swansea	United States	Massachusetts
4952629	Taunton	United States	Massachusetts
4952762	Tewksbury	United States	Massachusetts
4954265	Wakefield	United States	Massachusetts
4954380	Waltham	United States	Massachusetts
4954611	Watertown	United States	Massachusetts
4954738	Wellesley	United States	Massachusetts
4955089	West Springfield	United States	Massachusetts
4955190	Westfield	United States	Massachusetts
4955219	Westford	United States	Massachusetts
4955336	Weymouth	United States	Massachusetts
4955884	Winchester	United States	Massachusetts
4955993	Winthrop	United States	Massachusetts
4956032	Woburn	United States	Massachusetts
4956184	Worcester	United States	Massachusetts
4956335	Yarmouth	United States	Massachusetts
4956976	Auburn	United States	Maine
4957003	Augusta	United States	Maine
4957280	Bangor	United States	Maine
4958141	Biddeford	United States	Maine
4959473	Brunswick	United States	Maine
4969398	Lewiston	United States	Maine
4975802	Portland	United States	Maine
4977222	Saco	United States	Maine
4979244	South Portland	United States	Maine
4979245	South Portland Gardens	United States	Maine
4982236	Waterville	United States	Maine
4982720	West Scarborough	United States	Maine
4982753	Westbrook	United States	Maine
4983811	Adrian	United States	Michigan
4984016	Allen Park	United States	Michigan
4984247	Ann Arbor	United States	Michigan
4984565	Auburn Hills	United States	Michigan
4985153	Battle Creek	United States	Michigan
4985180	Bay City	United States	Michigan
4986172	Birmingham	United States	Michigan
4987482	Burton	United States	Michigan
4987990	Canton	United States	Michigan
4989133	Clinton	United States	Michigan
4990510	Dearborn	United States	Michigan
4990512	Dearborn Heights	United States	Michigan
4990729	Detroit	United States	Michigan
4991640	East Lansing	United States	Michigan
4991735	Eastpointe	United States	Michigan
1130490	Pul-e Khumrī	Afghanistan	Wilāyat-e Baghlān
1142170	Fayzabad	Afghanistan	Badakhshan
1469706	Markaz-e Woluswalī-ye Āchīn	Afghanistan	Nangarhār
174979	Artashat	Armenia	Ararat Province
2239076	N’dalatando	Angola	Cuanza Norte
3350372	Catabola	Angola	Bié
3351500	Caála	Angola	Huambo
3428708	San Luis del Palmar	Argentina	Corrientes
3430545	Morón	Argentina	Buenos Aires
3832778	Villa Constitución	Argentina	Santa Fe
3835869	Santiago del Estero	Argentina	Santiago del Estero
3837702	San Fernando del Valle de Catamarca	Argentina	Catamarca
3838797	Río Segundo	Argentina	Cordoba
3838874	Río Cuarto	Argentina	Cordoba
3842881	Nueve de Julio	Argentina	Buenos Aires
3855075	General Pico	Argentina	La Pampa
3860164	Coronel Suárez	Argentina	Buenos Aires
3862981	Cañada de Gómez	Argentina	Santa Fe
2761353	Wiener Neustadt	Austria	Lower Austria
2773549	Krems an der Donau	Austria	Lower Austria
2782555	Amstetten	Austria	Lower Austria
2068823	Kalgoorlie	Australia	Western Australia
2145110	Wagga Wagga	Australia	New South Wales
2151437	Rockhampton	Australia	Queensland
2155787	Narangba	Australia	Queensland
2159851	Liverpool	Australia	New South Wales
2164691	Granville	Australia	New South Wales
2168305	Dubbo	Australia	New South Wales
2168605	Doncaster East	Australia	Victoria
2171085	Coffs Harbour	Australia	New South Wales
2173911	Broken Hill	Australia	New South Wales
6301965	Palmerston	Australia	Northern Territory
8347847	Taylors Lakes	Australia	Victoria
9972964	West Pennant	Australia	New South Wales
584596	Zaqatala	Azerbaijan	Zaqatala
585221	Quba	Azerbaijan	Quba
4992523	Farmington Hills	United States	Michigan
4992635	Ferndale	United States	Michigan
4992982	Flint	United States	Michigan
4993125	Forest Hills	United States	Michigan
4993659	Garden City	United States	Michigan
4994358	Grand Rapids	United States	Michigan
4994391	Grandville	United States	Michigan
4994871	Grosse Pointe Woods	United States	Michigan
4995197	Hamtramck	United States	Michigan
4995514	Haslett	United States	Michigan
4995664	Hazel Park	United States	Michigan
4996248	Holland	United States	Michigan
4996306	Holt	United States	Michigan
4997238	Iron River	United States	Michigan
4997384	Jackson	United States	Michigan
4997500	Jenison	United States	Michigan
4997787	Kalamazoo	United States	Michigan
4998018	Kentwood	United States	Michigan
4998830	Lansing	United States	Michigan
4999311	Lincoln Park	United States	Michigan
4999837	Livonia	United States	Michigan
5000947	Marquette	United States	Michigan
5001929	Midland	United States	Michigan
5002344	Monroe	United States	Michigan
5002656	Mount Clemens	United States	Michigan
5002714	Mount Pleasant	United States	Michigan
5003132	Muskegon	United States	Michigan
5004005	Norton Shores	United States	Michigan
5004062	Novi	United States	Michigan
5004188	Oak Park	United States	Michigan
5004359	Okemos	United States	Michigan
5004792	Owosso	United States	Michigan
5006166	Pontiac	United States	Michigan
5006233	Port Huron	United States	Michigan
5006250	Portage	United States	Michigan
5006917	Redford	United States	Michigan
5007402	Rochester Hills	United States	Michigan
5007531	Romulus	United States	Michigan
5007655	Roseville	United States	Michigan
5007989	Saginaw	United States	Michigan
5009586	Shelby	United States	Michigan
5010636	Southfield	United States	Michigan
5010646	Southgate	United States	Michigan
5010978	Saint Clair Shores	United States	Michigan
5011148	Sterling Heights	United States	Michigan
5011908	Taylor	United States	Michigan
5012521	Trenton	United States	Michigan
5012639	Troy	United States	Michigan
5013924	Walker	United States	Michigan
5014051	Warren	United States	Michigan
5014130	Waterford	United States	Michigan
5014208	Waverly	United States	Michigan
5014224	Wayne	United States	Michigan
5014681	Westland	United States	Michigan
5015599	Wyandotte	United States	Michigan
5015688	Ypsilanti	United States	Michigan
5016024	Albert Lea	United States	Minnesota
5016374	Andover	United States	Minnesota
5016450	Anoka	United States	Minnesota
5016494	Apple Valley	United States	Minnesota
5016884	Austin	United States	Minnesota
5018651	Blaine	United States	Minnesota
5018739	Bloomington	United States	Minnesota
5019330	Brooklyn Center	United States	Minnesota
5019335	Brooklyn Park	United States	Minnesota
5019588	Buffalo	United States	Minnesota
5019767	Burnsville	United States	Minnesota
5020859	Champlin	United States	Minnesota
5020881	Chanhassen	United States	Minnesota
5020938	Chaska	United States	Minnesota
5022025	Coon Rapids	United States	Minnesota
5022134	Cottage Grove	United States	Minnesota
2792567	Lessines	Belgium	Wallonia
2793508	La Louvière	Belgium	Wallonia
2794166	Koksijde	Belgium	Flanders
2796009	Herentals	Belgium	Flanders
2798023	Frameries	Belgium	Wallonia
2799496	Destelbergen	Belgium	Flanders
2801154	Braine-l'Alleud	Belgium	Wallonia
2803443	Aalter	Belgium	Flanders
2357163	Nouna	Burkina Faso	Boucle du Mouhoun
2362344	Bobo-Dioulasso	Burkina Faso	High-Basins
726872	Dupnitsa	Bulgaria	Kyustendil
727696	Razgrad	Bulgaria	Razgrad
3385122	Viana	Brazil	Maranhão
3386279	Tomé Açu	Brazil	Pará
3387604	Sirinhaém	Brazil	Pernambuco
3388443	São José de Mipibu	Brazil	Rio Grande do Norte
3390907	Quixadá	Brazil	Ceará
3392251	Pesqueira	Brazil	Pernambuco
3393264	Palmares	Brazil	Pernambuco
3394500	Morada Nova	Brazil	Ceará
3395981	Maceió	Brazil	Alagoas
3396016	Macapá	Brazil	Amapá
3396601	Lago da Pedra	Brazil	Maranhão
3398076	Ipueiras	Brazil	Ceará
3398706	Granja	Brazil	Ceará
3400969	Dom Pedro	Brazil	Maranhão
3401845	Conceição do Araguaia	Brazil	Pará
3403362	Canguaretama	Brazil	Rio Grande do Norte
3405812	Belo Jardim	Brazil	Pernambuco
3407194	Areia Branca	Brazil	Rio Grande do Norte
3407407	Aquiraz	Brazil	Ceará
3407440	Apodi	Brazil	Rio Grande do Norte
3444848	Xanxerê	Brazil	Santa Catarina
3445299	Veranópolis	Brazil	Rio Grande do Sul
3445782	Umuarama	Brazil	Paraná
3446065	Três Rios	Brazil	Rio de Janeiro
3446606	Teresópolis	Brazil	Rio de Janeiro
3447399	Sorocaba	Brazil	São Paulo
3447785	Seropédica	Brazil	Rio de Janeiro
3447998	Sarandi	Brazil	Paraná
3448219	São Sebastião do Passé	Brazil	Bahia
3448632	São José dos Pinhais	Brazil	Paraná
3449319	São Carlos	Brazil	São Paulo
3449711	Santo Amaro da Imperatriz	Brazil	Santa Catarina
3450269	Santa Cruz do Sul	Brazil	Rio Grande do Sul
3451051	Rio Verde de Mato Grosso	Brazil	Mato Grosso do Sul
3451261	Rio Bonito	Brazil	Rio de Janeiro
3451353	Ribeirão das Neves	Brazil	Minas Gerais
3452324	Presidente Prudente	Brazil	São Paulo
3453245	Pomerode	Brazil	Santa Catarina
3453622	Piraí do Sul	Brazil	Paraná
3454139	Perdões	Brazil	Minas Gerais
3454857	Passo Fundo	Brazil	Rio Grande do Sul
3455580	Padre Bernardo	Brazil	Goiás
3456068	Novo Hamburgo	Brazil	Rio Grande do Sul
3456240	Nossa Senhora da Glória	Brazil	Sergipe
3456848	Monte Carmelo	Brazil	Minas Gerais
3457393	Matozinhos	Brazil	Minas Gerais
3457859	Maracaju	Brazil	Mato Grosso do Sul
3458481	Livramento do Brumado	Brazil	Bahia
3040051	les Escaldes	Andorra	Escaldes-Engordany
3433753	Gobernador Ingeniero Valentín Virasoro	Argentina	Corrientes
2168943	Devonport	Australia	Tasmania
585379	Hacı Zeynalabdin	Azerbaijan	Sumqayit
585915	Khirdalan	Azerbaijan	Abşeron
3186573	Zenica	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
3203653	Bosanska Krupa	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina
1185181	Lalmanirhat	Bangladesh	Rangpur Division
1185260	Bhātpāra Abhaynagar	Bangladesh	Khulna
1193823	Nabīnagar	Bangladesh	Chittagong
1336134	Cox’s Bāzār	Bangladesh	Chittagong
2783188	Zonhoven	Belgium	Flanders
2784189	Walcourt	Belgium	Wallonia
2786229	Stabroek	Belgium	Flanders
2787356	Saint-Nicolas	Belgium	Wallonia
2789786	Ostend	Belgium	Flanders
2791537	Mechelen	Belgium	Flanders
729730	Kyustendil	Bulgaria	Kyustendil
733618	Asenovgrad	Bulgaria	Plovdiv
430952	Kayanza	Burundi	Kayanza
2392837	Malanville	Benin	Atakora
2395635	Allada	Benin	Atlantique
3902377	Trinidad	Bolivia	El Beni
3914839	Huanuni	Bolivia	Oruro
727011	Sofia	Bulgaria	Sofia-Capital
3460071	Jardinópolis	Brazil	São Paulo
3460132	Japeri	Brazil	Rio de Janeiro
3460200	Jaguariúna	Brazil	São Paulo
3460542	Itororó	Brazil	Bahia
3460733	Itaperuna	Brazil	Rio de Janeiro
3460899	Itaguaí	Brazil	Rio de Janeiro
3461144	Ipatinga	Brazil	Minas Gerais
3461859	Guaratinguetá	Brazil	São Paulo
3462315	Governador Valadares	Brazil	Minas Gerais
3462377	Goiânia	Brazil	Goiás
3463066	Forquilhinha	Brazil	Santa Catarina
3464073	Erechim	Brazil	Rio Grande do Sul
3464974	Curitibanos	Brazil	Santa Catarina
3465459	Coronel Vivida	Brazil	Paraná
3465764	Conceição das Alagoas	Brazil	Minas Gerais
3466723	Castelo	Brazil	Espírito Santo
3467305	Capelinha	Brazil	Minas Gerais
3467452	Canoinhas	Brazil	Santa Catarina
3467673	Campo Verde	Brazil	Mato Grosso do Sul
3468158	Cajamar	Brazil	São Paulo
3468615	Cabo Frio	Brazil	Rio de Janeiro
3469425	Bom Jesus do Itabapoana	Brazil	Rio de Janeiro
3470470	Barreiro do Jaíba	Brazil	Minas Gerais
3471039	Balneário Camboriú	Brazil	Santa Catarina
3471830	Araguari	Brazil	Minas Gerais
3471896	Aquidauana	Brazil	Mato Grosso do Sul
3472520	Almenara	Brazil	Minas Gerais
3662342	São Gabriel da Cachoeira	Brazil	Amazonas
3924877	Pôsto Fiscal Rolim de Moura	Brazil	Rondônia
1252484	Phuntsholing	Bhutan	Chukha District
933773	Gaborone	Botswana	South East
623760	Pastavy	Belarus	Vitebsk
625743	Lyepyel’	Belarus	Vitebsk
628634	Dzyarzhynsk	Belarus	Minsk
5881791	Abbotsford	Canada	British Columbia
5909294	Brockville	Canada	Ontario
5923101	Clarence-Rockland	Canada	Ontario
5943865	Duncan	Canada	British Columbia
5989045	Kamloops	Canada	British Columbia
6065686	Maple Ridge	Canada	British Columbia
6082231	Mount Pearl	Canada	Newfoundland and Labrador
6087892	Niagara Falls	Canada	Ontario
6089404	North Battleford	Canada	Saskatchewan
6138121	Sainte-Thérèse	Canada	Quebec
6146279	Sherwood Park	Canada	Alberta
6173331	Vancouver	Canada	British Columbia
6185377	Yellowknife	Canada	Northwest Territories
7302647	Bellechasse Regional County Municipality	Canada	Quebec
205970	Sake	Democratic Republic of the Congo	Nord Kivu
212730	Kisangani	Democratic Republic of the Congo	Eastern Province
218253	Bondo	Democratic Republic of the Congo	Eastern Province
2316259	Bulungu	Democratic Republic of the Congo	Bandundu
2389086	Berbérati	Central African Republic	Mambéré-Kadéï
2658011	Wettingen	Switzerland	Aargau
2658494	Steffisburg	Switzerland	Bern
2659310	Zürich (Kreis 11) / Oerlikon	Switzerland	Zurich
2660727	Frauenfeld	Switzerland	Thurgau
6295475	Zürich (Kreis 10) / Wipkingen	Switzerland	Zurich
2279755	Yamoussoukro	Ivory Coast	Lacs
2287298	Katiola	Ivory Coast	Vallée du Bandama
2290956	Bouaké	Ivory Coast	Vallée du Bandama
2292179	Bangolo	Ivory Coast	Dix-Huit Montagnes
3869716	Tocopilla	Chile	Antofagasta
3872348	San Bernardo	Chile	Santiago Metropolitan
3878456	Nueva Imperial	Chile	Araucanía
3885273	Lampa	Chile	Santiago Metropolitan
3894177	Collipulli	Chile	Araucanía
3899361	Arica	Chile	Arica y Parinacota
2223763	Nkongsamba	Cameroon	Littoral
2225728	Mutengene	Cameroon	South-West Province
2229411	Limbe	Cameroon	South-West Province
2232997	Dizangué	Cameroon	Littoral
2594800	Idenao	Cameroon	South-West Province
1529114	Laochenglu	China	Xinjiang Uygur Zizhiqu
1784130	Zhoukou	China	Henan Sheng
1784953	Luofeng	China	Shandong Sheng
1785738	Yuncheng	China	Shanxi Sheng
1786546	Zhongxiang	China	Hubei
1786760	Yicheng	China	Jiangsu
1787746	Yancheng	China	Jiangsu
1788508	Xinyu	China	Jiangxi Sheng
1790379	Xianshuigu	China	Tianjin Shi
1791249	Wuhai	China	Inner Mongolia
1792359	Huangshan	China	Anhui Sheng
1793364	Tangping	China	Guangdong
1794035	Songjiang	China	Shanghai Shi
1794140	Sishui	China	Shandong Sheng
1794971	Shitanjing	China	Ningxia Huizu Zizhiqu
1796663	Sanming	China	Fujian
1797551	Qinzhou	China	Guangxi Zhuangzu Zizhiqu
1798654	Pingxiang	China	Jiangxi Sheng
1799574	Nanzhang Chengguanzhen	China	Hubei
1800627	Mianyang	China	Sichuan
1801850	Luorong	China	Guangxi Zhuangzu Zizhiqu
1803331	Linxia Chengguanzhen	China	Gansu Sheng
1803367	Qingnian	China	Shandong Sheng
1804609	Laibin	China	Guangxi Zhuangzu Zizhiqu
1805618	Jingling	China	Hubei
1805953	Jiaxing	China	Zhejiang Sheng
1806882	Xinhui	China	Guangdong
1807645	Huaiyuan Chengguanzhen	China	Anhui Sheng
1808977	Hanchuan	China	Hubei
1809486	Guiping	China	Guangxi Zhuangzu Zizhiqu
1809879	Guangshui	China	Hubei
1810845	Fuyang	China	Anhui Sheng
1811764	Duyun	China	Guizhou Sheng
1812754	Dingtao	China	Shandong Sheng
1813892	Xincheng	China	Henan Sheng
1815395	Chaozhou	China	Guangdong
1816265	Boshan	China	Shandong Sheng
290594	Umm al Qaywayn	United Arab Emirates	Umm al Qaywayn
3455416	Palmeira das Missões	Brazil	Rio Grande do Sul
3459126	Lagoa Vermelha	Brazil	Rio Grande do Sul
3461501	Igaraçu do Tietê	Brazil	São Paulo
3471849	Araçoiaba da Serra	Brazil	São Paulo
3471859	Araçatuba	Brazil	São Paulo
6111632	Port Alberni	Canada	British Columbia
207596	Mweka	Democratic Republic of the Congo	Kasaï-Occidental
2291666	Biankouma	Ivory Coast	Dix-Huit Montagnes
2231482	Fundong	Cameroon	North-West Province
1789176	Feicheng	China	Shandong Sheng
1803842	Lianzhou	China	Guangxi Zhuangzu Zizhiqu
1817240	Baiyin	China	Gansu Sheng
1886762	Zhoushan	China	Zhejiang Sheng
2033301	Youhao	China	Heilongjiang Sheng
2033423	Yebaishou	China	Liaoning
2033536	Yakeshi	China	Inner Mongolia
2034400	Tongliao	China	Inner Mongolia
2034786	Shuangyashan	China	Heilongjiang Sheng
2035669	Lianhe	China	Heilongjiang Sheng
2036081	Lingdong	China	Heilongjiang Sheng
2036519	Jidong	China	Heilongjiang Sheng
2036920	Fendou	China	Heilongjiang Sheng
2037346	Fuxin	China	Liaoning
2037370	Fuli	China	Heilongjiang Sheng
2037930	Dalai	China	Jilin Sheng
2038365	Bei’an	China	Heilongjiang Sheng
7290013	Shixing	China	Guangdong
3665895	Villeta	Colombia	Cundinamarca
3667478	Tame	Colombia	Arauca
3668332	Santo Tomás	Colombia	Atlántico
3670218	San Andrés	Colombia	Archipiélago de San Andrés, Providencia y Santa Catalina
3671325	Puerto Santander	Colombia	Norte de Santander
3673045	Pamplona	Colombia	Norte de Santander
3675657	Maicao	Colombia	La Guajira
3678405	La Mesa	Colombia	Cundinamarca
3682292	Fundación	Colombia	Magdalena
3684666	El Carmen de Bolívar	Colombia	Bolívar
3687230	Cartago	Colombia	Valle del Cauca
3688452	Buenaventura	Colombia	Valle del Cauca
3689169	Barrancabermeja	Colombia	Santander
3690465	Aguachica	Colombia	Cesar
3621655	San Rafael Arriba	Costa Rica	San José
3622716	Nicoya	Costa Rica	Guanacaste
6612154	San Vicente de Moravia	Costa Rica	San José
3538803	San Miguel del Padrón	Cuba	La Habana
3545064	Palma Soriano	Cuba	Santiago de Cuba
3551184	La Sierpe	Cuba	Sancti Spíritus
3556078	Jobabo	Cuba	Las Tunas
3556437	Jagüey Grande	Cuba	Matanzas
3563145	Cruces	Cuba	Cienfuegos
3565951	Campechuela	Cuba	Granma
3568312	Artemisa	Cuba	Artemisa
6956648	Diez de Octubre	Cuba	La Habana
3374707	Cova Figueira	Cape Verde	Santa Catarina do Fogo
3065067	Strakonice	Czech Republic	Jihočeský
3068873	Orlová	Czech Republic	Moravskoslezský
3069011	Olomouc	Czech Republic	Olomoucký
3069305	Nový Jičín	Czech Republic	Moravskoslezský
3073668	Klášterec nad Ohří	Czech Republic	Ústecký
3077882	Český Těšín	Czech Republic	Moravskoslezský
2804748	Zerbst	Germany	Saxony-Anhalt
2807201	Wittstock	Germany	Brandenburg
2809138	Wiesloch	Germany	Baden-Württemberg
2810969	Werdau	Germany	Saxony
2811204	Wendlingen am Neckar	Germany	Baden-Württemberg
2813786	Wassenberg	Germany	North Rhine-Westphalia
2815678	Wachtberg	Germany	North Rhine-Westphalia
2817927	Vaihingen an der Enz	Germany	Baden-Württemberg
2823590	Telgte	Germany	North Rhine-Westphalia
2828050	Steinhagen	Germany	North Rhine-Westphalia
2831250	Sonneberg	Germany	Thuringia
2831580	Solingen	Germany	North Rhine-Westphalia
2834240	Schwetzingen	Germany	Baden-Württemberg
2836320	Schorndorf	Germany	Baden-Württemberg
2841648	Sankt Augustin	Germany	North Rhine-Westphalia
2846843	Rietberg	Germany	North Rhine-Westphalia
2849647	Recklinghausen	Germany	North Rhine-Westphalia
2851584	Püttlingen	Germany	Saarland
2853928	Pfullingen	Germany	Baden-Württemberg
2857185	Opladen	Germany	North Rhine-Westphalia
2860080	Oberkirch	Germany	Baden-Württemberg
2863199	Niederkrüchten	Germany	North Rhine-Westphalia
2866070	Neuburg an der Donau	Germany	Bavaria
2867993	Stuttgart Mühlhausen	Germany	Baden-Württemberg
2869120	Mosbach	Germany	Baden-Württemberg
2871983	Menden	Germany	North Rhine-Westphalia
2873759	Marburg an der Lahn	Germany	Hesse
2875417	Lüdinghausen	Germany	North Rhine-Westphalia
2878234	Leverkusen	Germany	North Rhine-Westphalia
2881062	Langenhagen	Germany	Lower Saxony
2884050	Kreuztal	Germany	North Rhine-Westphalia
2885408	Kornwestheim	Germany	Baden-Württemberg
2885732	Königs Wusterhausen	Germany	Brandenburg
2891643	Kempen	Germany	North Rhine-Westphalia
2894375	Kaarst	Germany	North Rhine-Westphalia
2897732	Humboldtkolonie	Germany	North Rhine-Westphalia
2904725	Hille	Germany	North Rhine-Westphalia
2906376	Hennef	Germany	North Rhine-Westphalia
2908032	Heide	Germany	Schleswig-Holstein
2911051	Hamminkeln	Germany	North Rhine-Westphalia
2912621	Hagen	Germany	North Rhine-Westphalia
2917788	Greifswald	Germany	Mecklenburg-Vorpommern
2920834	Geseke	Germany	North Rhine-Westphalia
2923588	Fürstenwalde	Germany	Brandenburg
1639094	Kuningan	Indonesia	West Java
2924894	Freudenstadt	Germany	Baden-Württemberg
2926670	Finsterwalde	Germany	Brandenburg
2927043	Stuttgart Feuerbach	Germany	Baden-Württemberg
2930182	Enger	Germany	North Rhine-Westphalia
2933101	Eggenstein-Leopoldshafen	Germany	Baden-Württemberg
2936974	Dillingen an der Donau	Germany	Bavaria
2939797	Crailsheim	Germany	Baden-Württemberg
2941501	Burg bei Magdeburg	Germany	Saxony-Anhalt
2943560	Bruchsal	Germany	Baden-Württemberg
2945358	Brandenburg an der Havel	Germany	Brandenburg
2949012	Bietigheim-Bissingen	Germany	Baden-Württemberg
2953089	Balingen	Germany	Baden-Württemberg
2953374	Bad Rappenau	Germany	Baden-Württemberg
2953504	Baden-Baden	Germany	Baden-Württemberg
2956005	Annaberg-Buchholz	Germany	Saxony
2957185	Altglienicke	Germany	Berlin
2959083	Ahrensburg	Germany	Schleswig-Holstein
6558039	Rheinstetten	Germany	Baden-Württemberg
8334622	Neu-Hohenschönhausen	Germany	Berlin
2612045	Svendborg	Denmark	South Denmark
2618425	Copenhagen	Denmark	Capital Region
2621927	Frederikshavn	Denmark	North Denmark
3491948	Villa Bisonó	Dominican Republic	Santiago
3491952	Villa Altagracia	Dominican Republic	San Cristóbal
3493032	San Pedro de Macorís	Dominican Republic	San Pedro de Macorís
3509382	Concepción de La Vega	Dominican Republic	La Vega
2476403	Timimoun	Algeria	Adrar
2479215	Souk Ahras	Algeria	Souk Ahras
2482159	Seddouk	Algeria	Bejaïa
2483936	Râs el Oued	Algeria	Bordj Bou Arréridj
2486690	M’Sila	Algeria	Mʼsila
2488202	Melouza	Algeria	Bordj Bou Arréridj
2491323	Ksar el Boukhari	Algeria	Médéa
2494554	Hammam Bou Hadjar	Algeria	Aïn Temouchent
2498667	El Aouinet	Algeria	Oum el Bouaghi
2500904	Dar Chioukh	Algeria	Djelfa
2502686	Boumahra Ahmed	Algeria	Guelma
2503701	Bordj Bou Arreridj	Algeria	Bordj Bou Arréridj
2505629	Barika	Algeria	Batna
2507646	Akbou	Algeria	Bejaïa
2508152	’Aïn el Hammam	Algeria	Tizi Ouzou
3650273	Velasco Ibarra	Ecuador	Guayas
3652743	Puerto Francisco de Orellana	Ecuador	Orellana
3655185	Nueva Loja	Ecuador	Sucumbios
3660401	Bahía de Caráquez	Ecuador	Manabí
346030	Ziftá	Egypt	Muḩāfaz̧at al Gharbīyah
349114	Shirbīn	Egypt	Muḩāfaz̧at ad Daqahlīyah
350789	Qalyūb	Egypt	Muḩāfaz̧at al Qalyūbīyah
355648	Ibshawāy	Egypt	Muḩāfaz̧at al Fayyūm
358619	Port Said	Egypt	Muḩāfaz̧at Būr Sa‘īd
360615	Al Qanāţir al Khayrīyah	Egypt	Muḩāfaz̧at al Qalyūbīyah
361702	Ajā	Egypt	Muḩāfaz̧at ad Daqahlīyah
343300	Asmara	Eritrea	Maʼākel
343386	Assab	Eritrea	Debubawī Kʼeyih Bahrī
2510279	Torrent	Spain	Valencia
2510693	Talavera de la Reina	Spain	Castille-La Mancha
2511401	La Laguna	Spain	Canary Islands
2512177	Puertollano	Spain	Castille-La Mancha
2513324	Navalmoral de la Mata	Spain	Extremadura
2514042	Maspalomas	Spain	Canary Islands
2514553	Los Palacios y Villafranca	Spain	Andalusia
2515096	Lebrija	Spain	Andalusia
2515812	La Línea de la Concepción	Spain	Andalusia
2517111	Granadilla de Abona	Spain	Canary Islands
2519068	Quart de Poblet	Spain	Valencia
2520121	Carlet	Spain	Valencia
2520712	Burjassot	Spain	Valencia
2521486	Atamaría	Spain	Murcia
2521893	Almendralejo	Spain	Extremadura
2521923	Almansa	Spain	Castille-La Mancha
2522091	Alcúdia	Spain	Balearic Islands
2567529	Groa de Murviedro	Spain	Valencia
3105600	Vilafranca del Penedès	Spain	Catalonia
3108118	Tetuán de las Victorias	Spain	Madrid
3109642	Santiago de Compostela	Spain	Galicia
3110821	Sant Carles de la Ràpita	Spain	Catalonia
3112866	Premià de Mar	Spain	Catalonia
3113236	Ponferrada	Spain	Castille and León
3115739	Narón	Spain	Galicia
3116689	Miranda de Ebro	Spain	Castille and León
3118848	Las Rozas de Madrid	Spain	Madrid
3121070	Guadalajara	Spain	Castille-La Mancha
3123329	El Prat de Llobregat	Spain	Catalonia
3125915	Castellar del Vallès	Spain	Catalonia
3128291	Benavente	Spain	Castille and León
3128382	Béjar	Spain	Castille and León
3129046	Azuqueca de Henares	Spain	Castille-La Mancha
6544102	Sarrià-Sant Gervasi	Spain	Catalonia
6615444	Oliver-Valdefierro	Spain	Aragon
325780	Yirga ‘Alem	Ethiopia	Southern Nations, Nationalities, and People's Region
332880	K’olīto	Ethiopia	Southern Nations, Nationalities, and People's Region
341297	Butajīra	Ethiopia	Southern Nations, Nationalities, and People's Region
342559	Bedēsa	Ethiopia	Oromiya
342641	Batī	Ethiopia	Amhara
343137	Hawassa	Ethiopia	Southern Nations, Nationalities, and People's Region
643492	Oulu	Finland	Northern Ostrobothnia
651299	Korsholm	Finland	Ostrobothnia
657530	Hollola	Finland	Päijänne Tavastia
2081986	Palikir - National Government Center	Micronesia	Pohnpei
2968368	Villers-lès-Nancy	France	Alsace-Champagne-Ardenne-Lorraine
2968705	Villejuif	France	Île-de-France
2969562	Vesoul	France	Bourgogne-Franche-Comté
2970797	Vandœuvre-lès-Nancy	France	Alsace-Champagne-Ardenne-Lorraine
2974188	Sorgues	France	Provence-Alpes-Côte d'Azur
2975964	Sarreguemines	France	Alsace-Champagne-Ardenne-Lorraine
2978072	Saint-Médard-en-Jalles	France	Aquitaine-Limousin-Poitou-Charentes
2980236	Saint-Étienne-du-Rouvray	France	Normandy
2980827	Saint-Dié-des-Vosges	France	Alsace-Champagne-Ardenne-Lorraine
1261110	Nūzvīd	India	Andhra Pradesh
2986025	Port-de-Bouc	France	Provence-Alpes-Côte d'Azur
2988670	Pamiers	France	Languedoc-Roussillon-Midi-Pyrénées
2990363	Nîmes	France	Languedoc-Roussillon-Midi-Pyrénées
2992166	Montpellier	France	Languedoc-Roussillon-Midi-Pyrénées
2992703	Montélimar	France	Auvergne-Rhône-Alpes
2992938	Montbéliard	France	Bourgogne-Franche-Comté
2995387	Martigues	France	Provence-Alpes-Côte d'Azur
2997626	Lons-le-Saunier	France	Bourgogne-Franche-Comté
3000047	Les Pennes-Mirabeau	France	Provence-Alpes-Côte d'Azur
3005066	Le Bouscat	France	Aquitaine-Limousin-Poitou-Charentes
3009223	La Garde	France	Provence-Alpes-Côte d'Azur
3010025	La Ciotat	France	Provence-Alpes-Côte d'Azur
3013701	Yutz	France	Alsace-Champagne-Ardenne-Lorraine
3016702	Gap	France	Provence-Alpes-Côte d'Azur
3019153	Faches-Thumesnil	France	Nord-Pas-de-Calais-Picardie
3020850	Draguignan	France	Provence-Alpes-Côte d'Azur
3022988	Cournon-d’Auvergne	France	Auvergne-Rhône-Alpes
3023240	Coulommiers	France	Île-de-France
3023924	Conflans-Sainte-Honorine	France	Île-de-France
3025892	Chaumont	France	Alsace-Champagne-Ardenne-Lorraine
3027487	Châlons-en-Champagne	France	Alsace-Champagne-Ardenne-Lorraine
3029974	Brive-la-Gaillarde	France	Aquitaine-Limousin-Poitou-Charentes
3032833	Béziers	France	Languedoc-Roussillon-Midi-Pyrénées
3034126	Beaune	France	Bourgogne-Franche-Comté
3035396	Bagnols-sur-Cèze	France	Languedoc-Roussillon-Midi-Pyrénées
3037540	Annecy-le-Vieux	France	Auvergne-Rhône-Alpes
6543862	Villeneuve-d'Ascq	France	Nord-Pas-de-Calais-Picardie
2399959	Koulamoutou	Gabon	Ogooué-Lolo
2633749	Witham	United Kingdom	England
2634032	Whitley Bay	United Kingdom	England
2634155	Whickham	United Kingdom	England
2634686	Waterlooville	United Kingdom	England
2636841	Stoke-on-Trent	United Kingdom	England
2637546	Solihull	United Kingdom	England
2638568	Sandown	United Kingdom	England
2638978	Rugby	United Kingdom	England
2639557	Redditch	United Kingdom	England
2639866	Pudsey	United Kingdom	England
2640132	Pontefract	United Kingdom	England
2640869	Ossett	United Kingdom	England
2641519	Newtownards	United Kingdom	Northern Ireland
2641913	Nailsea	United Kingdom	England
2643027	Market Harborough	United Kingdom	England
2643734	Londonderry County Borough	United Kingdom	Northern Ireland
2644386	Litherland	United Kingdom	England
2644652	Leighton Buzzard	United Kingdom	England
2645722	Kidlington	United Kingdom	England
2652730	Clydebank	United Kingdom	Scotland
2653229	Chessington	United Kingdom	England
2653680	Carrickfergus	United Kingdom	Northern Ireland
2654635	Broadstairs	United Kingdom	England
2655138	Boston	United Kingdom	England
2655186	Borehamwood	United Kingdom	England
2655459	Blackpool	United Kingdom	England
2655777	Bexhill-on-Sea	United Kingdom	England
2656241	Barrow in Furness	United Kingdom	England
2656918	Ashton in Makerfield	United Kingdom	England
2657832	Aberdeen	United Kingdom	Scotland
6690862	South Croydon	United Kingdom	England
6947168	Kempston Hardwick	United Kingdom	England
7302130	Bartley Green	United Kingdom	England
8299615	Thornton-Cleveleys	United Kingdom	England
612053	Senak’i	Georgia	Samegrelo and Zemo Svaneti
2294665	Teshi Old Town	Ghana	Greater Accra
2296969	Nungua	Ghana	Greater Accra
2301190	Elmina	Ghana	Central
2415703	Siguiri	Guinea	Kankan
3578447	Sainte-Rose	Guadeloupe	Guadeloupe
3578682	Petit-Bourg	Guadeloupe	Guadeloupe
252664	Tríkala	Greece	Thessaly
256598	Néa Mákri	Greece	Attica
259251	Koropí	Greece	Attica
261604	Kalamáta	Greece	Peloponnese
264888	Áno Liósia	Greece	Attica
734077	Thessaloníki	Greece	Central Macedonia
1255646	Karanpur	India	Rajasthan
736364	Dráma	Greece	East Macedonia and Thrace
3588653	Sumpango	Guatemala	Sacatepéquez
3589852	San Lucas Sacatepéquez	Guatemala	Sacatepéquez
3592105	Nuevo San Carlos	Guatemala	Retalhuleu
3596644	El Palmar	Guatemala	Quetzaltenango
3599582	Barberena	Guatemala	Santa Rosa
1818223	Yuen Long Kau Hui	Hong Kong	Yuen Long
3608248	La Ceiba	Honduras	Atlántida
3186886	Zagreb	Croatia	Grad Zagreb
3187047	Vukovar	Croatia	Vukovarsko-Srijemska
3197728	Koprivnica	Croatia	Koprivničko-Križevačka
3725276	Fond Parisien	Haiti	Ouest
714697	Tiszaújváros	Hungary	Borsod-Abaúj-Zemplén
721472	Debrecen	Hungary	Hajdú-Bihar
3044774	Székesfehérvár	Hungary	Fejér
3047896	Mosonmagyaróvár	Hungary	Győr-Moson-Sopron
3052236	Gödöllő	Hungary	Pest
3055601	Balassagyarmat	Hungary	Nógrád
7284834	Budapest X. kerület	Hungary	Budapest
1214073	Rantauprapat	Indonesia	North Sumatra
1215412	Belawan	Indonesia	North Sumatra
1622318	Waingapu	Indonesia	East Nusa Tenggara
1624863	Tanjungpinang	Indonesia	Riau Islands
1626185	Sumbawa Besar	Indonesia	West Nusa Tenggara
1626493	Srandakan	Indonesia	Daerah Istimewa Yogyakarta
1627357	Sewon	Indonesia	Daerah Istimewa Yogyakarta
1630341	Purwakarta	Indonesia	West Java
1631766	Pekalongan	Indonesia	Central Java
1632654	Pangkalpinang	Indonesia	Bangka–Belitung Islands
1634678	Muntok	Indonesia	Bangka–Belitung Islands
1636426	Manggar	Indonesia	Bangka–Belitung Islands
1636722	Malang	Indonesia	East Java
1636816	Majalengka	Indonesia	West Java
1640576	Kefamenanu	Indonesia	East Nusa Tenggara
1642628	Jekulo	Indonesia	Central Java
1644522	Gampengrejo	Indonesia	East Java
1645976	Comal	Indonesia	Central Java
1647834	Bulakamba	Indonesia	Central Java
1649593	Baturaja	Indonesia	South Sumatra
1649881	Batang	Indonesia	Central Java
1650815	Baekrajan	Indonesia	Central Java
2002872	Wonosari	Indonesia	Daerah Istimewa Yogyakarta
2962943	Luimneach	Ireland	Munster
2966110	Blanchardstown	Ireland	Leinster
293420	maalot Tarshīhā	Israel	Northern District
294068	Netivot	Israel	Southern District
294610	Kafr Kannā	Israel	Northern District
294981	Giv‘at Shemu’él	Israel	Tel Aviv
1167718	Pūnch	India	Kashmir
1252840	Wokha	India	Nagaland
1253013	Wai	India	Maharashtra
1253132	Vīrarājendrapet	India	Karnataka
1253330	Vedaraniyam	India	Tamil Nadu
1253573	Vadodara	India	Gujarat
1253698	Uravakonda	India	Andhra Pradesh
1253782	Una	India	Himachal Pradesh
1253785	Ūn	India	Uttar Pradesh
1253944	Udumalaippettai	India	Tamil Nadu
1254102	Tulsīpur	India	Uttar Pradesh
1254327	Tiruvannāmalai	India	Tamil Nadu
1254436	Tinnanūr	India	Tamil Nadu
1254695	Thakurdwara	India	Uttar Pradesh
1254808	Tehri	India	Uttarakhand
1254813	Teghra	India	Bihar
1254858	Tāsgaon	India	Maharashtra
1254908	Tārānagar	India	Rajasthan
1254909	Tarāna	India	Madhya Pradesh
1254910	Tāramangalam	India	Tamil Nadu
1254912	Tarakeswar	India	West Bengal
1254948	Tāoru	India	Haryana
1254953	Tanuku	India	Andhra Pradesh
1255004	Tāndūr	India	Telangana
1255023	Tānda	India	Uttar Pradesh
1255024	Tāndā	India	Uttar Pradesh
1255027	Tanakpur	India	Uttarakhand
1255046	Tamlūk	India	West Bengal
1255076	Talwāra	India	Punjab
1255082	Talwandi Bhai	India	Punjab
1255104	Taloda	India	Maharashtra
1255121	Talipparamba	India	Kerala
1255122	Tālīkota	India	Karnataka
1255134	Talegaon Dābhāde	India	Maharashtra
1255143	Tālcher	India	Odisha
1255175	Talāja	India	Gujarat
1255211	Tāki	India	West Bengal
1255212	Takhatpur	India	Chhattisgarh
1255213	Takhatgarh	India	Rajasthan
1255224	Tājpur	India	Uttar Pradesh
1255254	Tādpatri	India	Andhra Pradesh
1255264	Tādepallegūdem	India	Andhra Pradesh
1255265	Tādepalle	India	Andhra Pradesh
1255344	Suriāpet	India	Telangana
1255346	Suriānwān	India	Uttar Pradesh
1255349	Surendranagar	India	Gujarat
1255361	Sūratgarh	India	Rajasthan
1255364	Sūrat	India	Gujarat
1255372	Sūrandai	India	Tamil Nadu
1255383	Sūrajgarh	India	Rajasthan
1255396	Supaul	India	Bihar
1255425	Sunel	India	Rajasthan
1255434	Sundarnagar	India	Himachal Pradesh
1255437	Sundargarh	India	Odisha
1255449	Sunām	India	Punjab
1255482	Sulya	India	Karnataka
1255483	Sūlūru	India	Andhra Pradesh
1255484	Sulur	India	Tamil Nadu
1255488	Sultanpur	India	Punjab
1255491	Sultānpur	India	Uttar Pradesh
1255551	Suket	India	Rajasthan
1255560	Sūjāngarh	India	Rajasthan
1255597	Suār	India	Uttar Pradesh
1255616	Srivilliputhur	India	Tamil Nadu
1255619	Srīvardhan	India	Maharashtra
1255620	Srivaikuntam	India	Tamil Nadu
1255621	Srīsailain	India	Andhra Pradesh
1255625	Srīrāmnagar	India	Telangana
1255630	Srīperumbūdūr	India	Tamil Nadu
1255631	Srīnivāspur	India	Karnataka
1255634	Srinagar	India	Kashmir
1255635	Srīnagar	India	Uttarakhand
1255643	Sri Mādhopur	India	Rajasthan
1255647	Chicacole	India	Andhra Pradesh
1255654	Sri Dūngargarh	India	Rajasthan
1255667	Soygaon	India	Maharashtra
1255704	Soron	India	Uttar Pradesh
1255705	Soro	India	Odisha
1255712	Sorada	India	Odisha
1255714	Sopur	India	Kashmir
1255744	Sonīpat	India	Haryana
1255762	Songadh	India	Gujarat
1255763	Sonepur	India	Odisha
1255788	Sonāri	India	Assam
1255792	Sonāmukhi	India	West Bengal
1256706	Shāhpura	India	Rajasthan
1256728	Shāhjānpur	India	Uttar Pradesh
1256922	Secunderabad	India	Telangana
1257196	Sardhana	India	Uttar Pradesh
1257456	Sandūr	India	Karnataka
1257551	Samāstipur	India	Bihar
1257799	Sahāwar	India	Uttar Pradesh
1258012	Rūdarpur	India	Uttar Pradesh
1258201	Repalle	India	Andhra Pradesh
1258295	Rāwatsār	India	Rajasthan
1258449	Rānīpur	India	Uttar Pradesh
1258642	Rāmnagar	India	Uttar Pradesh
1258831	Rāj-Nāndgaon	India	Chhattisgarh
1258950	Rāisinghnagar	India	Rajasthan
1259110	Qādiān	India	Punjab
1259222	Punjai Puliyampatti	India	Tamil Nadu
1259385	Port Blair	India	Andaman and Nicobar Islands
1259552	Pīpri	India	Maharashtra
1259701	Pihānī	India	Uttar Pradesh
1259878	Periyanayakkanpalaiyam	India	Tamil Nadu
1260040	Pattukkottai	India	Tamil Nadu
1260222	Pārvatipuram	India	Andhra Pradesh
1260421	Pāonta Sāhib	India	Himachal Pradesh
1260692	Pallāvaram	India	Tamil Nadu
1260909	Padrauna	India	Uttar Pradesh
1261045	Ongole	India	Andhra Pradesh
1261396	Nilanga	India	Maharashtra
1261567	Nāyudupeta	India	Andhra Pradesh
1261721	Nasrullāhganj	India	Madhya Pradesh
1261848	Narasaraopet	India	Andhra Pradesh
1261998	Nanauta	India	Uttar Pradesh
1262116	Nainpur	India	Madhya Pradesh
1262302	Nādāpuram	India	Kerala
1262382	Mushābani	India	Jharkhand
1262485	Mungaoli	India	Madhya Pradesh
1262625	Muhammadābād	India	Uttar Pradesh
1262863	Moirāng	India	Manipur
1263103	Mettupalayam	India	Tamil Nadu
1263300	Mauganj	India	Madhya Pradesh
1263567	Mārahra	India	Uttar Pradesh
1263744	Mangrūl Pīr	India	Maharashtra
1263917	Māndal	India	Rajasthan
1263949	Manāsa	India	Madhya Pradesh
1264010	Mālūr	India	Karnataka
1264292	Mainpuri	India	Uttar Pradesh
1264407	Mahbūbnagar	India	Telangana
1264555	Madhubani	India	Bihar
1264773	Loni	India	Uttar Pradesh
1265150	Lālpur	India	Gujarat
1265331	Lādnūn	India	Rajasthan
1265605	Kundla	India	Gujarat
1265767	Kūkatpalli	India	Telangana
1265811	Kudachi	India	Karnataka
1265859	Krishnanagar	India	West Bengal
1266073	Kosi	India	Uttar Pradesh
1266216	Kondagaon	India	Chhattisgarh
1266425	Kodaikānāl	India	Tamil Nadu
1266631	Khuldābād	India	Maharashtra
1266928	Khargone	India	Madhya Pradesh
1267097	Khamaria	India	Madhya Pradesh
1267336	Kekri	India	Rajasthan
1267456	Kātpādi	India	Tamil Nadu
1267588	Kāsganj	India	Uttar Pradesh
1267862	Karamsad	India	Gujarat
1268008	Kanniyākumāri	India	Tamil Nadu
1268257	Kāmārhāti	India	West Bengal
1268383	Kāliyāganj	India	West Bengal
1268624	Kailāras	India	Madhya Pradesh
1268823	Jora	India	Madhya Pradesh
1268990	Jhārgrām	India	West Bengal
1269026	Jhalida	India	West Bengal
1269093	Jaynagar	India	Bihar
1269227	Jānsath	India	Uttar Pradesh
1269388	Jalpāiguri	India	West Bengal
1269502	Jaisingpur	India	Maharashtra
1269633	Jabalpur	India	Madhya Pradesh
1269819	Idappadi	India	Tamil Nadu
1269939	Hoshangābād	India	Madhya Pradesh
1270077	Hinganghāt	India	Maharashtra
1270216	Hāthras	India	Uttar Pradesh
1270271	Harsūd	India	Madhya Pradesh
1270482	Haliyal	India	Karnataka
1270612	Guru Har Sahāi	India	Punjab
1270787	Gūduvāncheri	India	Tamil Nadu
1271049	Gola Gokarannāth	India	Uttar Pradesh
1271306	Ghazīpur	India	Uttar Pradesh
1271563	Garhākota	India	Madhya Pradesh
1271789	Gajendragarh	India	Karnataka
1271871	Fort Gloster	India	West Bengal
1271900	Fatehpur Sīkri	India	Uttar Pradesh
1272008	Erraguntla	India	Andhra Pradesh
1272237	Dumka	India	Jharkhand
1272532	Dīnhāta	India	West Bengal
1272657	Diamond Harbour	India	West Bengal
1272822	Dhāruhera	India	Haryana
1272979	Dhanbād	India	Jharkhand
1273136	Deūlgaon Rāja	India	Maharashtra
1273313	Dehra Dūn	India	Uttarakhand
1273397	Dattāpur	India	Maharashtra
1273628	Dalsingh Sarai	India	Bihar
1273800	Cuddapah	India	Andhra Pradesh
1274021	Rampachodavaram	India	Andhra Pradesh
1274243	Chik Ballāpur	India	Karnataka
1274389	Chettipālaiyam	India	Tamil Nadu
1274673	Chāndor	India	Maharashtra
1274821	Chamrajnagar	India	Karnataka
1275004	Kolkata	India	West Bengal
1275152	Budhāna	India	Uttar Pradesh
1275462	Bishnupur	India	West Bengal
1275618	Bilgrām	India	Uttar Pradesh
1275768	Bhuvanagiri	India	Tamil Nadu
1275925	Bhindār	India	Rajasthan
1276054	Bhattiprolu	India	Andhra Pradesh
1276249	Bhaisa	India	Telangana
1276389	Betūl	India	Madhya Pradesh
1276478	Bemetāra	India	Chhattisgarh
1276642	Bāzpur	India	Uttarakhand
1276782	Basavana Bāgevādi	India	Karnataka
1276982	Bargi	India	Madhya Pradesh
1277091	Bārāmati	India	Maharashtra
1277324	Bangaon	India	West Bengal
1277525	Balrāmpur	India	Uttar Pradesh
1277780	Baidyabāti	India	West Bengal
1277949	Badvel	India	Andhra Pradesh
1278023	Badagara	India	Kerala
1278122	Avanigadda	India	Andhra Pradesh
1278282	Asifābād	India	Telangana
1278448	Arantāngi	India	Tamil Nadu
1278540	Annigeri	India	Karnataka
1278688	Anakāpalle	India	Andhra Pradesh
1278827	Ambikāpur	India	Chhattisgarh
1278994	Allahābād	India	Uttar Pradesh
1279135	Akbarpur	India	Uttar Pradesh
1279227	Ahmadpur	India	Maharashtra
1279306	Afzalpur	India	Karnataka
1348562	Srirāmpur	India	West Bengal
1465825	Madipakkam	India	Tamil Nadu
7279739	Perumbavoor	India	Kerala
7302826	Lal Bahadur Nagar	India	Telangana
7302855	Naharlagun	India	Arunachal Pradesh
8948694	V.S.K.Valasai (Dindigul-Dist.)	India	Tamil Nadu
94824	Karbala	Iraq	Karbalāʼ
97990	Baqubah	Iraq	Diyālá
98012	Baynjiwayn	Iraq	As Sulaymānīyah
98885	‘Anat al Qadīmah	Iraq	Anbar
99439	Nāḩiyat al Fuhūd	Iraq	Dhi Qar
32723	Īstgāh-e Rāh Āhan-e Garmsār	Iran	Semnān
114930	Shīrvān	Iran	Khorāsān-e Shomālī
119115	Qūchān	Iran	Razavi Khorasan
121795	Oshnavīyeh	Iran	Āz̄ārbāyjān-e Gharbī
125446	Mahābād	Iran	Āz̄ārbāyjān-e Gharbī
126409	Kūhdasht	Iran	Lorestān
128008	Khalkhāl	Iran	Ardabīl
132892	Gorgān	Iran	Golestān
134762	Fārsān	Iran	Chahār Maḩāll va Bakhtīārī
141665	Bandar-e Lengeh	Iran	Hormozgan
143534	Āmol	Iran	Māzandarān
406993	Eqbālīyeh	Iran	Tehrān
1159362	Torbat-e Jām	Iran	Razavi Khorasan
2522960	Termini Imerese	Italy	Sicily
2523461	San Giovanni in Fiore	Italy	Calabria
2523630	Reggio Calabria	Italy	Calabria
2524013	Nicastro-Sambiase	Italy	Calabria
2524881	Crotone	Italy	Calabria
2525473	Cagliari	Italy	Sardinia
2525792	Aci Castello	Italy	Sicily
3164565	Vercelli	Italy	Piedmont
3165198	Trezzano sul Naviglio	Italy	Lombardy
3165803	Teramo	Italy	Abruzzo
3166598	Sesto San Giovanni	Italy	Lombardy
3166711	Seregno	Italy	Lombardy
3166988	Scandicci	Italy	Tuscany
3167509	Sant'Anastasia	Italy	Campania
3168239	San Giovanni in Persiceto	Italy	Emilia-Romagna
3169424	Riccione	Italy	Emilia-Romagna
3170147	Pordenone	Italy	Friuli Venezia Giulia
3171562	Palo del Colle	Italy	Apulia
3172184	Novate Milanese	Italy	Lombardy
3172718	Montevarchi	Italy	Tuscany
3172979	Montecchio Maggiore-Alte Ceccato	Italy	Veneto
3173314	Mogliano Veneto	Italy	Veneto
3173841	Martina Franca	Italy	Apulia
3174494	Lugo	Italy	Emilia-Romagna
3175121	L'Aquila	Italy	Abruzzo
3175773	Grottaglie	Italy	Apulia
3176203	Genzano di Roma	Italy	Latium
3176748	Forio	Italy	Campania
3177250	Falconara Marittima	Italy	The Marches
3178019	Correggio	Italy	Emilia-Romagna
3178631	Cisterna di Latina	Italy	Latium
3179066	Cernusco sul Naviglio	Italy	Lombardy
3180208	Casale Monferrato	Italy	Piedmont
3181495	Brugherio	Italy	Lombardy
3182164	Bergamo	Italy	Lombardy
3182749	Ascoli Piceno	Italy	The Marches
3183299	Alessandria	Italy	Piedmont
3183539	Acilia-Castel Fusano-Ostia Antica	Italy	Latium
3183587	Abano Terme	Italy	Veneto
6534228	Guidonia Montecelio	Italy	Latium
8224092	Bellaria-Igea Marina	Italy	Emilia-Romagna
3490165	Half Way Tree	Jamaica	Saint Andrew
250461	Al Quwaysimah	Jordan	Amman
1848087	Yukuhashi	Japan	Fukuoka
1848382	Youkaichi	Japan	Shiga Prefecture
1849154	Ushibuka	Japan	Kumamoto
1849563	Tsuruoka	Japan	Yamagata
1849850	Toyohama	Japan	Aichi
1849876	Toyama	Japan	Toyama
1850034	Tondabayashichō	Japan	Ōsaka
1850498	Tatsuno	Japan	Nagano
1850818	Taketoyo	Japan	Aichi
1851170	Bungo-Takada-shi	Japan	Oita
1851542	Sueyoshichō-ninokata	Japan	Kagoshima
1852385	Nishishinminato	Japan	Toyama
1853140	Sakata	Japan	Yamagata
1853371	Ryōtsu-minato	Japan	Niigata
1854177	Ōmamachō-ōmama	Japan	Gunma
1854383	Okayama	Japan	Okayama
1854807	Obita	Japan	Nagasaki
1855207	Nishinomiya-hama	Japan	Hyōgo
1855907	Nakama	Japan	Fukuoka
1856476	Muikamachi	Japan	Niigata
1856977	Mishima	Japan	Shizuoka
1857560	Matsubase	Japan	Kumamoto
1858067	Kusatsu	Japan	Shiga Prefecture
1858902	Komatsushimachō	Japan	Tokushima
1859335	Kitahama	Japan	Shiga Prefecture
1859400	Kisai	Japan	Saitama
1859642	Kawasaki	Japan	Kanagawa
1859964	Kaseda-shirakame	Japan	Kagoshima
1860321	Kamojimachō-jōgejima	Japan	Tokushima
1861164	Iwatsuki	Japan	Saitama
1861416	Ishigaki	Japan	Okinawa
1861799	Ikedachō	Japan	Tokushima
1862389	Hisai-motomachi	Japan	Mie
1863018	Hatsukaichi	Japan	Hiroshima
1863426	Katsuren-haebaru	Japan	Okinawa
1863611	Gōdo	Japan	Gifu
1863973	Fukumitsu	Japan	Toyama
1864416	Daitōchō	Japan	Ōsaka
1865309	Anan	Japan	Tokushima
1907146	Sayama	Japan	Saitama
2110480	Yotsukaidō	Japan	Chiba
2110729	Toride	Japan	Ibaraki
2111220	Sakura	Japan	Chiba
2111530	Ōfunato	Japan	Iwate
2111859	Mizusawa	Japan	Iwate
2112227	Kitakami	Japan	Iwate
2112527	Iwanuma	Japan	Miyagi
2112903	Funehikimachi-funehiki	Japan	Fukushima
2127955	Sunagawa	Japan	Hokkaido
2129005	Namioka	Japan	Aomori
2130054	Kitahiroshima	Japan	Hokkaido
6697563	Neyagawa	Japan	Ōsaka
178202	Webuye	Kenya	Bungoma
186180	Moyale	Kenya	Marsabit
191220	Kitale	Kenya	Trans Nzoia
196742	Homa Bay	Kenya	Homa Bay
1527260	Tash-Kumyr	Kyrgyzstan	Jalal-Abad
1538648	Toktogul	Kyrgyzstan	Jalal-Abad
1830194	Paôy Pêt	Cambodia	Banteay Meanchey
3575551	Basseterre	Saint Kitts and Nevis	Saint George Basseterre
1877449	Hamhŭng	North Korea	Hamgyŏng-namdo
2042503	Namyang-dong	North Korea	Hamgyŏng-bukto
2043531	Kapsan-ŭp	North Korea	Yanggang-do
2043677	Iwŏn-ŭp	North Korea	Hamgyŏng-namdo
1833466	Wanju	South Korea	Jeollabuk-do
1836208	Seonghwan	South Korea	Chungcheongnam-do
1841149	Miryang	South Korea	Gyeongsangnam-do
1842943	Kimhae	South Korea	Gyeongsangnam-do
1845136	Chuncheon	South Korea	Gangwon-do
1882056	Sinhyeon	South Korea	Gyeongsangnam-do
1897007	Hanam	South Korea	Gyeonggi-do
6903078	Changnyeong	South Korea	Gyeongsangnam-do
412800	Şabāḩ as Sālim	Kuwait	Mubārak al Kabīr
1517060	Zaysan	Kazakhstan	East Kazakhstan
1519244	Shchūchīnsk	Kazakhstan	Soltüstik Qazaqstan
1522751	Kentau	Kazakhstan	Ongtüstik Qazaqstan
1537939	Stepnogorsk	Kazakhstan	Aqmola
1904391	Ban Houakhoua	Laos	Bokeo Province
277130	Baalbek	Lebanon	Baalbek-Hermel
1229989	Point Pedro	Sri Lanka	Northern Province
1242833	Jaffna	Sri Lanka	Northern Province
1250161	Batticaloa	Sri Lanka	Eastern Province
932438	Mohale’s Hoek	Lesotho	Mohaleʼs Hoek
596238	Palanga	Lithuania	Klaipėdos apskritis
10062606	Vilkpėdė	Lithuania	Vilnius County
10062607	Naujamiestis	Lithuania	Vilnius County
456202	Rēzekne	Latvia	Rēzekne
88380	Az Zuwaytīnah	Libya	Sha‘bīyat al Wāḩāt
2214433	Nālūt	Libya	Sha‘bīyat Nālūt
2219235	Awbārī	Libya	Sha‘bīyat Wādī al Ḩayāt
2532822	Sidi Yahia El Gharb	Morocco	Gharb-Chrarda-Beni Hssen
2545985	Imzoûrene	Morocco	Taza-Al Hoceima-Taounate
2556464	Azrou	Morocco	Meknès-Tafilalet
617076	Edineţ	Moldova	Raionul Edineţ
618605	Bălţi	Moldova	Bălţi
1053507	Vondrozo	Madagascar	Atsimo-Atsinanana
1058532	Moramanga	Madagascar	Alaotra Mangoro
1064890	Fianarantsoa	Madagascar	Upper Matsiatra
1072849	Ankazobe	Madagascar	Analamanga
1082639	Ambatondrazaka	Madagascar	Alaotra Mangoro
1083239	Ambatofinandrahana	Madagascar	Amoron'i Mania
785345	Студеничани	Macedonia	Studeničani
792501	Bogovinje	Macedonia	Bogovinje
2454530	Koulikoro	Mali	Koulikoro
1290374	Twante	Myanmar	Yangon
1298824	Yangon	Myanmar	Yangon
1308464	Mawlamyinegyunn	Myanmar	Ayeyarwady
1317397	Kyaiklat	Myanmar	Ayeyarwady
1515436	Ölgiy	Mongolia	Bayan-Ölgiy
1516393	Altai	Mongolia	Govĭ-Altay
2029945	Murun-kuren	Mongolia	Hövsgöl
7828758	Saipan	Northern Mariana Islands	Saipan
3578069	Plymouth	Montserrat	Saint Anthony
934750	Bel Air Rivière Sèche	Mauritius	Flacq
3482969	Gustavo A. Madero	Mexico	Tamaulipas
3514519	San Miguel Xico Viejo	Mexico	México
3515463	Tlahuac	Mexico	Mexico City
3515807	Cuautitlán Izcalli	Mexico	México
3515887	Tepeji de Ocampo	Mexico	Hidalgo
3516385	Tamazunchale	Mexico	San Luis Potosí
3518407	San Martin Texmelucan de Labastida	Mexico	Puebla
3521168	Poza Rica de Hidalgo	Mexico	Veracruz
3522732	Nicolás Romero	Mexico	México
3523450	Matías Romero	Mexico	Oaxaca
3526603	Jalpa de Méndez	Mexico	Tabasco
3526838	Hunucmá	Mexico	Yucatán
3527596	Fortín de las Flores	Mexico	Veracruz
3530177	Cosamaloapan de Carpio	Mexico	Veracruz
3530617	Cintalapa de Figueroa	Mexico	Chiapas
3531784	Calpulalpan	Mexico	Hidalgo
3532964	Heroica Alvarado	Mexico	Veracruz
3815415	Tlaxcala de Xicohtencatl	Mexico	Tlaxcala
3827596	Santiago Teyahualco	Mexico	México
3976775	Leyva Solano	Mexico	Sinaloa
3979855	Yuriria	Mexico	Guanajuato
3981467	Tlajomulco de Zúñiga	Mexico	Jalisco
3982912	Soledad Díez Gutiérrez	Mexico	San Luis Potosí
3986088	San José Iturbide	Mexico	Guanajuato
3991347	Puerto Peñasco	Mexico	Sonora
3995402	Morelia	Mexico	Michoacán
3996737	Rodolfo Sánchez Taboada	Mexico	Baja California
4000821	La Piedad Cavadas	Mexico	Michoacán
4004024	Jerez de García Salinas	Mexico	Zacatecas
4005775	Gomez Palacio	Mexico	Durango
4013094	Comonfort	Mexico	Guanajuato
4014875	Celaya	Mexico	Guanajuato
4018400	Apatzingán	Mexico	Michoacán
4023117	Dolores Hidalgo Cuna de la Independencia Nacional	Mexico	Guanajuato
8858101	Licenciado Benito Juárez (Campo Gobierno)	Mexico	Sinaloa
8858103	Jesús del Monte	Mexico	México
8858117	La Providencia Siglo XXI	Mexico	Hidalgo
1732752	Johor Bahru	Malaysia	Johor
1733023	Kuala Lipis	Malaysia	Pahang
1734316	Kertih	Malaysia	Terengganu
1734753	Kampung Ayer Keroh	Malaysia	Melaka
1735086	Nibong Tebal	Malaysia	Penang
1735498	Sungai Petani	Malaysia	Kedah
1737185	Kapit	Malaysia	Sarawak
1750974	Ladang Seri Kundang	Malaysia	Selangor
7302815	Bandar Labuan	Malaysia	Sabah
1037390	Ilha de Moçambique	Mozambique	Nampula
3354898	Okahandja	Namibia	Otjozondjupa
2440921	Mirriah	Niger	Zinder
2161314	Kingston	Norfolk Island	N/A
2322263	Tegina	Nigeria	Niger
2324774	Port Harcourt	Nigeria	Rivers
2324960	Patigi	Nigeria	Kwara
2325437	Otukpa	Nigeria	Benue
2327513	Ogwashi-Uku	Nigeria	Delta
2329562	Nafada	Nigeria	Gombe
2332459	Lagos	Nigeria	Lagos
2333604	Kuje	Nigeria	Abuja Federal Capital Territory
2337207	Ise-Ekiti	Nigeria	Ekiti
2338287	Ikere-Ekiti	Nigeria	Ekiti
2339287	Ibi	Nigeria	Taraba
2340446	Gombi	Nigeria	Adamawa
2343270	Enugu-Ukwu	Nigeria	Anambra
2343983	Effon Alaiye	Nigeria	Osun
2346317	Burutu	Nigeria	Delta
2348395	Badagry	Nigeria	Lagos
2351470	Ajaokuta	Nigeria	Kogi
3616234	Somotillo	Nicaragua	Chinandega
3618411	La Paz Centro	Nicaragua	León
3620680	Bluefields	Nicaragua	Atlántico Sur
2744257	Woensdrecht	Netherlands	North Brabant
2745096	Waddinxveen	Netherlands	South Holland
2745673	Velsen-Zuid	Netherlands	North Holland
2746804	Steenbergen	Netherlands	North Brabant
2747930	Roosendaal	Netherlands	North Brabant
2749811	Noordwijkerhout	Netherlands	South Holland
2751456	Loon op Zand	Netherlands	North Brabant
2753638	Hoorn	Netherlands	North Holland
2754064	Hilversum	Netherlands	North Holland
2754659	Heerhugowaard	Netherlands	North Holland
2755599	Gendringen	Netherlands	Gelderland
2756539	Druten	Netherlands	Gelderland
2757874	Cuijk	Netherlands	North Brabant
2758765	Bodegraven	Netherlands	South Holland
3139075	Skien	Norway	Telemark
3149312	Kristiansund	Norway	Møre og Romsdal
1282770	Sirāhā	Nepal	Eastern Region
1283460	Dharān Bāzār	Nepal	Eastern Region
2179537	Wellington	New Zealand	Wellington
2190224	Hastings	New Zealand	Hawke's Bay
6246634	Taradale	New Zealand	Hawke's Bay
287832	Ibrā’	Oman	Ash Sharqiyah North Governorate
288967	Seeb	Oman	Muḩāfaz̧at Masqaţ
289011	Rustaq	Oman	Al Batinah South Governorate
3712455	Chilibre	Panama	Panamá
3691954	Sechura	Peru	Piura
3694119	Paiján	Peru	La Libertad
3696509	Huamachuco	Peru	La Libertad
3814568	La Breita	Peru	Piura
3931470	Puerto Maldonado	Peru	Madre de Dios
3939023	Huaura	Peru	Lima region
3945985	Camaná	Peru	Arequipa
4033779	Punaauia	French Polynesia	Îles du Vent
1679432	Zamboanga	Philippines	Zamboanga Peninsula
1682812	Tarlac City	Philippines	Central Luzon
1684379	Tagoloan	Philippines	Northern Mindanao
1687409	San Vicente	Philippines	Central Luzon
1688912	San Narciso	Philippines	Central Luzon
1690039	San Fernando	Philippines	Central Luzon
1690321	San Antonio	Philippines	Central Luzon
1692192	Quezon City	Philippines	Metro Manila
1694075	Peñaranda	Philippines	Central Luzon
1696683	Pagaluñgan	Philippines	Autonomous Region in Muslim Mindanao
1699388	Molave	Philippines	Zamboanga Peninsula
1701053	Marawi City	Philippines	Autonomous Region in Muslim Mindanao
1702649	Malita	Philippines	Davao
1702934	Malaybalay	Philippines	Northern Mindanao
1705771	Loma de Gato	Philippines	Central Luzon
1708217	La Castellana	Philippines	Western Visayas
1710519	City of Isabela	Philippines	Autonomous Region in Muslim Mindanao
1713022	General Santos	Philippines	Soccsksargen
1716771	Cotabato	Philippines	Autonomous Region in Muslim Mindanao
1718078	Castillejos	Philippines	Central Luzon
1720402	Calbayog City	Philippines	Eastern Visayas
1722356	Boroon	Philippines	Northern Mindanao
1725094	Binangonan	Philippines	Calabarzon
1727043	Bantayan	Philippines	Central Visayas
1730225	Arayat	Philippines	Central Luzon
1966336	Bagong Pagasa	Philippines	Calabarzon
1162572	Warburton	Pakistan	Punjab
1163054	Turbat	Pakistan	Balochistān
1164076	Tāl	Pakistan	Khyber Pakhtunkhwa
1165486	Shahr Sultān	Pakistan	Punjab
1166652	Sādiqābād	Pakistan	Punjab
1168021	Pindi Bhattiān	Pakistan	Punjab
1169145	Naushahra Virkān	Pakistan	Punjab
1170395	Mingora	Pakistan	Khyber Pakhtunkhwa
1171757	Mach	Pakistan	Balochistān
1172339	Lakki Marwat	Pakistan	Khyber Pakhtunkhwa
1173692	Khurriānwāla	Pakistan	Punjab
1175082	Kāmra	Pakistan	Punjab
1175712	Jīwani	Pakistan	Balochistān
1176615	Islamabad	Pakistan	Islāmābād
1177662	Gujrānwāla	Pakistan	Punjab
1179757	Dīr	Pakistan	Khyber Pakhtunkhwa
1180825	Dādhar	Pakistan	Balochistān
1180942	Chūniān	Pakistan	Punjab
1182577	Bhopālwāla	Pakistan	Punjab
1184370	Ārifwāla	Pakistan	Punjab
1448637	Risālpur	Pakistan	Khyber Pakhtunkhwa
756867	Tomaszów Mazowiecki	Poland	Łódź Voivodeship
759734	Rzeszów	Poland	Subcarpathian Voivodeship
762850	Ostrów Mazowiecka	Poland	Masovian Voivodeship
764749	Milanówek	Poland	Masovian Voivodeship
766042	Łomianki	Poland	Masovian Voivodeship
769274	Kętrzyn	Poland	Warmian-Masurian Voivodeship
776029	Bielany	Poland	Masovian Voivodeship
3080526	Zawiercie	Poland	Silesian Voivodeship
3082998	Turek	Poland	Greater Poland Voivodeship
3084440	Strzegom	Poland	Lower Silesian Voivodeship
3085807	Skawina	Poland	Lesser Poland Voivodeship
3086800	Ruda Śląska	Poland	Silesian Voivodeship
3089125	Piekary Śląskie	Poland	Silesian Voivodeship
3091831	Mikołów	Poland	Silesian Voivodeship
3094625	Krotoszyn	Poland	Greater Poland Voivodeship
3096779	Kamienna Góra	Poland	Lower Silesian Voivodeship
3099424	Gdynia	Poland	Pomeranian Voivodeship
3099434	Gdańsk	Poland	Pomeranian Voivodeship
3099828	Dzierżoniów	Poland	Lower Silesian Voivodeship
3103034	Boguszów-Gorce	Poland	Lower Silesian Voivodeship
4565119	Guaynabo	Puerto Rico	Guaynabo
281109	An Nuşayrāt	Palestinian Territory	Gaza Strip
284324	Bayt Jālā	Palestinian Territory	West Bank
2263326	São João da Talha	Portugal	Lisbon
2263523	Santa Iria da Azóia	Portugal	Lisbon
2264718	Pinhal Novo	Portugal	Setúbal
2267827	Funchal	Portugal	Madeira
2270380	Câmara de Lobos	Portugal	Madeira
2732544	Vila Nova de Gaia	Portugal	Porto
2738347	Leça do Bailio	Portugal	Porto
2742027	Bragança	Portugal	Bragança
3437444	Presidente Franco	Paraguay	Alto Paraná
3439389	Asunción	Paraguay	Asunción
935248	Sainte-Suzanne	Reunion	Réunion
664437	Turnu Măgurele	Romania	Teleorman
667227	Sighetu Marmaţiei	Romania	Maramureş
671768	Oradea	Romania	Bihor
674541	Luduş	Romania	Mureş
678499	Făgăraș	Romania	Braşov
681845	Câmpulung Moldovenesc	Romania	Suceava
684490	Bocşa	Romania	Caraş-Severin
684657	Bistriţa	Romania	Bistriţa-Năsăud
11048319	Sector 3	Romania	Bucureşti
785753	Smederevska Palanka	Serbia	Central Serbia
790367	Gornji Milanovac	Serbia	Central Serbia
6619277	Knjazevac	Serbia	Central Serbia
463637	Zernograd	Russia	Rostov
466215	Yur’yev-Pol’skiy	Russia	Vladimir
470252	Vyshniy Volochëk	Russia	Tverskaya
470451	Vykhino-Zhulebino	Russia	Moscow
470734	Vyatskiye Polyany	Russia	Kirov
472750	Volgorechensk	Russia	Kostroma
477377	Vagonoremont	Russia	Moscow
479561	Ufa	Russia	Bashkortostan
481605	Troitskaya	Russia	Ingushetiya
484856	Agidel’	Russia	Bashkortostan
487495	Sterlitamak	Russia	Bashkortostan
490466	Sortavala	Russia	Republic of Karelia
492094	Slavyansk-na-Kubani	Russia	Krasnodarskiy
493316	Shushary	Russia	St.-Petersburg
496012	Shakhun’ya	Russia	Nizjnij Novgorod
497927	Segezha	Russia	Republic of Karelia
500843	Rublëvo	Russia	Moscow
502540	Rayevskiy	Russia	Bashkortostan
505259	Primorsko-Akhtarsk	Russia	Krasnodarskiy
510225	Petrodvorets	Russia	St.-Petersburg
513471	Ozerki	Russia	St.-Petersburg
514198	Ostrogozhsk	Russia	Voronezj
515027	Orekhovo-Borisovo Severnoye	Russia	Moscow
517716	Novovoronezh	Russia	Voronezj
518909	Novodvinsk	Russia	Arkhangelskaya
521874	Nikolayevsk	Russia	Volgograd
523392	Nar'yan-Mar	Russia	Nenetskiy Avtonomnyy Okrug
527361	Metallostroy	Russia	St.-Petersburg
532096	Makhachkala	Russia	Dagestan
534015	Losino-Petrovskiy	Russia	MO
535729	Komendantsky aerodrom	Russia	St.-Petersburg
538340	Kushva	Russia	Sverdlovsk
539907	Kudepsta	Russia	Krasnodarskiy
542461	Krasnoarmeyskaya	Russia	Krasnodarskiy
543899	Kostomuksha	Russia	Republic of Karelia
548114	Kislovodsk	Russia	Stavropol'skiy
549479	Khoroshëvo-Mnevniki	Russia	MO
552920	Karachev	Russia	Brjansk
552924	Karachayevsk	Russia	Karachayevo-Cherkesiya
554770	Izobil’nyy	Russia	Stavropol'skiy
558146	Gubkin	Russia	Belgorod
561515	Giaginskaya	Russia	Adygeya
563514	Elista	Russia	Kalmykiya
565289	Donskoye	Russia	Stavropol'skiy
567290	Dagestanskiye Ogni	Russia	Dagestan
570427	Buzuluk	Russia	Orenburg
572525	Borisoglebsk	Russia	Voronezj
575560	Bogorodsk	Russia	Nizjnij Novgorod
578120	Belebey	Russia	Bashkortostan
580222	Avtovo	Russia	St.-Petersburg
582266	Amin’yevo	Russia	Moscow
584126	Afipskiy	Russia	Krasnodarskiy
831129	Mirnyy	Russia	Arkhangelskaya
1486209	Yekaterinburg	Russia	Sverdlovsk
1489870	Tayshet	Russia	Irkutsk
1490042	Tashtagol	Russia	Kemerovo
1490085	Tarko-Sale	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1493197	Salekhard	Russia	Yamalo-Nenetskiy Avtonomnyy Okrug
1497543	Nizhnevartovsk	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1502060	Krasnoural’sk	Russia	Sverdlovsk
1503772	Khanty-Mansiysk	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1508161	Cherepanovo	Russia	Novosibirsk
1510450	Beloyarskiy	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
1511954	Alapayevsk	Russia	Sverdlovsk
1541359	Lyantor	Russia	Khanty-Mansiyskiy Avtonomnyy Okrug
2016910	Severobaykal’sk	Russia	Respublika Buryatiya
2026303	Bol’shoy Kamen’	Russia	Primorskiy
2119441	Yuzhno-Sakhalinsk	Russia	Sakhalin
6418220	Orekhovo-Borisovo	Russia	Moscow
8504949	Vasyl'evsky Ostrov	Russia	St.-Petersburg
4059102	Dothan	United States	Alabama
8504952	Krasnogvargeisky	Russia	St.-Petersburg
8504965	Sampsonievskiy	Russia	Leningrad
100425	Yanbu	Saudi Arabia	Al Madīnah al Munawwarah
107312	Abqaiq	Saudi Arabia	Eastern Province
109223	Medina	Saudi Arabia	Al Madīnah al Munawwarah
366426	Tandaltī	Sudan	White Nile
376450	Dilling	Sudan	Southern Kordofan
379416	Al Ḩawātah	Sudan	Al Qaḑārif
379555	El Fasher	Sudan	Northern Darfur
2662689	Visby	Sweden	Gotland
2667303	Trollhättan	Sweden	Västra Götaland
2686469	Örnsköldsvik	Sweden	Västernorrland
2701223	Katrineholm	Sweden	Södermanland
2712993	Gamla Uppsala	Sweden	Uppsala
1880252	Singapore	Singapore	Central Singapore
723736	Rimavská Sobota	Slovakia	Banskobystrický
3056459	Zvolen	Slovakia	Banskobystrický
3056523	Žiar nad Hronom	Slovakia	Banskobystrický
3059050	Liptovský Mikuláš	Slovakia	Žilinský
2404041	Segbwema	Sierra Leone	Eastern Province
2247157	Nioro du Rip	Senegal	Kaolack
50672	Wanlaweyn	Somalia	Lower Shabeelle
63795	Burao	Somalia	Togdheer
363656	Yambio	South Sudan	Western Equatoria
3583178	San Vicente	El Salvador	San Vicente
3584399	Mejicanos	El Salvador	San Salvador
163270	Ţayyibat al Imām	Syria	Hama
167357	Manbij	Syria	Aleppo
169372	‘Irbīn	Syria	Rif-dimashq
171830	Bāniyās	Syria	Tartus
173312	Al Quţayfah	Syria	Rif-dimashq
3576994	Cockburn Town	Turks and Caicos Islands	N/A
2433055	Dourbali	Chad	Chari-Baguirmi
2435508	Benoy	Chad	Logone Occidental
2367886	Atakpamé	Togo	Plateaux
1150515	Surat Thani	Thailand	Surat Thani
1151933	Nakhon Si Thammarat	Thailand	Nakhon Si Thammarat
1153646	Chom Bueng	Thailand	Ratchaburi
1599640	Ban Nong Wua So	Thailand	Changwat Udon Thani
1606033	Suphan Buri	Thailand	Suphan Buri
1606638	Sam Phran	Thailand	Nakhon Pathom
1607083	Ra-ngae	Thailand	Narathiwat
1607532	Phra Nakhon Si Ayutthaya	Thailand	Phra Nakhon Si Ayutthaya
1608529	Nakhon Ratchasima	Thailand	Nakhon Ratchasima
1610227	Kantharalak	Thailand	Sisaket
1611424	Chai Badan	Thailand	Lop Buri
1619369	Bang Pa-in	Thailand	Phra Nakhon Si Ayutthaya
1220253	Istaravshan	Tajikistan	Viloyati Sughd
1220855	Vahdat	Tajikistan	Republican Subordination
1637730	Liquica	East Timor	Liquiçá
601594	Türkmenbaşy	Turkmenistan	Balkan
2464795	Thala	Tunisia	Al Qaşrayn
2468106	Ksar Hellal	Tunisia	Al Munastīr
2469386	Medjez el Bab	Tunisia	Bājah
2473257	Ar Rudayyif	Tunisia	Gafsa
2473826	Bekalta	Tunisia	Al Munastīr
296173	Yüksekova	Turkey	Hakkâri
297564	Yatağan	Turkey	Muğla
299445	Tekirova	Turkey	Antalya
300796	Silvan	Turkey	Diyarbakır
301539	Şarkîkaraağaç	Turkey	Isparta
304184	Muğla	Turkey	Muğla
305268	Kütahya	Turkey	Kütahya
307515	Kırşehir	Turkey	Kırşehir
310859	Kahramanmaraş	Turkey	Kahramanmaraş
315061	Ezine	Turkey	Çanakkale Province
315373	Erzincan	Turkey	Erzincan
315468	Ergani	Turkey	Diyarbakır
316411	Doğubayazıt	Turkey	Ağrı
318668	Ceylanpınar	Turkey	Şanlıurfa
321062	Birecik	Turkey	Şanlıurfa
322830	Aydın	Turkey	Aydın
324944	Akçakale	Turkey	Şanlıurfa
738228	Vakfıkebir	Turkey	Trabzon
739061	Taşköprü	Turkey	Kastamonu
741240	Of	Turkey	Trabzon
741763	Maltepe	Turkey	Istanbul
743818	Kavaklı	Turkey	Istanbul
745664	Hendek	Turkey	Sakarya
746983	Gelibolu	Turkey	Çanakkale Province
749274	Çerkezköy	Turkey	Tekirdağ
751077	Bandırma	Turkey	Balıkesir
752627	Akçaabat	Turkey	Trabzon
7628420	Sancaktepe	Turkey	Istanbul
3573890	Port of Spain	Trinidad and Tobago	City of Port of Spain
1671566	Nantou	Taiwan	Taiwan
1673820	Kaohsiung	Taiwan	Kaohsiung
148730	Zanzibar	Tanzania	Zanzibar Urban/West
149812	Sokoni	Tanzania	Zanzibar Central/South
151678	Ngerengere	Tanzania	Morogoro
153176	Mpanda	Tanzania	Katavi
154380	Mbeya	Tanzania	Mbeya
155321	Magomeni	Tanzania	Dar es Salaam
157403	Kilosa	Tanzania	Morogoro
158492	Kamachumu	Tanzania	Kagera
158563	Kakonko	Tanzania	Kigoma
159267	Ikungi	Tanzania	Singida
160263	Dar es Salaam	Tanzania	Dar es Salaam
877401	Songea	Tanzania	Ruvuma
878367	Kitama	Tanzania	Mtwara
687116	Zhmerynka	Ukraine	Vinnyts'ka
689378	Volodymyr-Volyns’kyy	Ukraine	Volyn
692818	Starokostyantyniv	Ukraine	Khmelnytskyi
694423	Sevastopol	Ukraine	Misto Sevastopol’
695274	Rubizhne	Ukraine	Luhansk
695912	Radomyshl’	Ukraine	Zhytomyr
697637	Pereyaslav-Khmel’nyts’kyy	Ukraine	Kiev
700646	Mukacheve	Ukraine	Zakarpattia
702972	Lysychans’k	Ukraine	Luhansk
704422	Krasnoarmiys’k	Ukraine	Donetsk
705812	Kirovohrad	Ukraine	Kirovohrad
707296	Izyaslav	Ukraine	Khmelnytskyi
709276	Energodar	Ukraine	Zaporizhia
709354	Dzerzhyns’k	Ukraine	Donetsk
709930	Dnipropetrovsk	Ukraine	Dnipropetrovsk
711894	Bohodukhiv	Ukraine	Kharkiv
712930	Balaklava	Ukraine	Misto Sevastopol’
226110	Tororo	Uganda	Eastern Region
229380	Masaka	Uganda	Central Region
233476	Fort Portal	Uganda	Western Region
4074267	Madison	United States	Alabama
4093753	Tillmans Corner	United States	Alabama
4119403	Little Rock	United States	Arkansas
4140963	Washington, D.C.	United States	Washington, D.C.
4149269	Buenaventura Lakes	United States	Florida
4152564	Cutler	United States	Florida
4154047	East Pensacola Heights	United States	Florida
4156857	Glenvar Heights	United States	Florida
4160100	Jasmine Estates	United States	Florida
4163049	Lynn Haven	United States	Florida
4165913	New Smyrna Beach	United States	Florida
4167545	Palm Harbor	United States	Florida
4169060	Ponte Vedra Beach	United States	Florida
4172434	Seminole	United States	Florida
4174402	Sunrise	United States	Florida
4175296	Three Lakes	United States	Florida
4177960	West and East Lealman	United States	Florida
4186531	Cartersville	United States	Georgia
4204007	Kingsland	United States	Georgia
4219934	Roswell	United States	Georgia
4231354	Wilmington Island	United States	Georgia
4247703	Quincy	United States	Illinois
4250542	Springfield	United States	Illinois
4254679	Bloomington	United States	Indiana
4263681	Richmond	United States	Indiana
4274994	Manhattan	United States	Kansas
4290988	Elizabethtown	United States	Kentucky
4302561	Nicholasville	United States	Kentucky
4327047	Harvey	United States	Louisiana
4341513	Shreveport	United States	Louisiana
4348353	Beltsville	United States	Maryland
4350413	Carney	United States	Maryland
4354256	Elkridge	United States	Maryland
4358082	Hillcrest Heights	United States	Maryland
4364964	Parole	United States	Maryland
4369596	Silver Spring	United States	Maryland
4379966	Cape Girardeau	United States	Missouri
4395052	Liberty	United States	Missouri
4401242	O'Fallon	United States	Missouri
4408672	Sikeston	United States	Missouri
4429295	Hattiesburg	United States	Mississippi
4450687	West Gulfport	United States	Mississippi
4467485	Fuquay-Varina	United States	North Carolina
4475773	Lexington	United States	North Carolina
4498303	West Raleigh	United States	North Carolina
4501931	Glassboro	United States	New Jersey
4502901	Maple Shade	United States	New Jersey
4513409	Grove City	United States	Ohio
4526993	Upper Arlington	United States	Ohio
4535389	Duncan	United States	Oklahoma
4550881	Sapulpa	United States	Oklahoma
4569298	Anderson	United States	South Carolina
4589387	North Charleston	United States	South Carolina
4604183	Bartlett	United States	Tennessee
4608408	Brentwood	United States	Tennessee
4625282	Goodlettsville	United States	Tennessee
4659446	Spring Hill	United States	Tennessee
4673353	Bellaire	United States	Texas
4682127	Cloverleaf	United States	Texas
4687331	Duncanville	United States	Texas
4694568	Grapevine	United States	Texas
4845612	Wethersfield	United States	Connecticut
4845823	Willimantic	United States	Connecticut
4852832	Council Bluffs	United States	Iowa
4882920	Addison	United States	Illinois
4885573	Bridgeview	United States	Illinois
4889553	DeKalb	United States	Illinois
4893070	Franklin Park	United States	Illinois
4899170	Lake Zurich	United States	Illinois
4902559	Montgomery	United States	Illinois
4902754	Morton	United States	Illinois
4904286	Oak Forest	United States	Illinois
4908052	Rolling Meadows	United States	Illinois
4915734	Waukegan	United States	Illinois
4920423	Fort Wayne	United States	Indiana
4923531	Michigan City	United States	Indiana
4929023	Amherst Center	United States	Massachusetts
4933002	Chicopee	United States	Massachusetts
4933743	Concord	United States	Massachusetts
4935434	East Longmeadow	United States	Massachusetts
4940764	Jamaica Plain	United States	Massachusetts
4945121	New Bedford	United States	Massachusetts
4951305	South Boston	United States	Massachusetts
4955840	Wilmington	United States	Massachusetts
4984029	Allendale	United States	Michigan
5000500	Madison Heights	United States	Michigan
5007804	Royal Oak	United States	Michigan
5015618	Wyoming	United States	Michigan
5021828	Columbia Heights	United States	Minnesota
5023571	Crystal	United States	Minnesota
5024719	Duluth	United States	Minnesota
5024825	Eagan	United States	Minnesota
5025219	Eden Prairie	United States	Minnesota
5025264	Edina	United States	Minnesota
5025471	Elk River	United States	Minnesota
5026291	Faribault	United States	Minnesota
5026321	Farmington	United States	Minnesota
5027117	Forest Lake	United States	Minnesota
5027482	Fridley	United States	Minnesota
5028163	Golden Valley	United States	Minnesota
5029181	Ham Lake	United States	Minnesota
5029500	Hastings	United States	Minnesota
5030005	Hibbing	United States	Minnesota
5030670	Hopkins	United States	Minnesota
5031412	Inver Grove Heights	United States	Minnesota
5034059	Lakeville	United States	Minnesota
5034767	Lino Lakes	United States	Minnesota
5036420	Mankato	United States	Minnesota
5036493	Maple Grove	United States	Minnesota
5036588	Maplewood	United States	Minnesota
5037649	Minneapolis	United States	Minnesota
5037784	Minnetonka	United States	Minnesota
5037790	Minnetonka Mills	United States	Minnesota
5038108	Moorhead	United States	Minnesota
5039080	New Brighton	United States	Minnesota
5039094	New Hope	United States	Minnesota
5039675	Northfield	United States	Minnesota
5039978	Oakdale	United States	Minnesota
5040647	Owatonna	United States	Minnesota
5041926	Plymouth	United States	Minnesota
5042373	Prior Lake	United States	Minnesota
5042561	Ramsey	United States	Minnesota
5042773	Red Wing	United States	Minnesota
5043193	Richfield	United States	Minnesota
5043473	Rochester	United States	Minnesota
5043779	Rosemount	United States	Minnesota
5043799	Roseville	United States	Minnesota
5044407	Saint Cloud	United States	Minnesota
5045021	Saint Louis Park	United States	Minnesota
5045258	Saint Michael	United States	Minnesota
5045360	Saint Paul	United States	Minnesota
5046001	Sartell	United States	Minnesota
5046063	Savage	United States	Minnesota
5046997	Shakopee	United States	Minnesota
5047234	Shoreview	United States	Minnesota
5048033	South Saint Paul	United States	Minnesota
5048814	Stillwater	United States	Minnesota
5052361	West Coon Rapids	United States	Minnesota
5052467	West Saint Paul	United States	Minnesota
5052658	White Bear Lake	United States	Minnesota
5052916	Willmar	United States	Minnesota
5053156	Winona	United States	Minnesota
5053358	Woodbury	United States	Minnesota
5055787	Kirksville	United States	Missouri
5059163	Fargo	United States	North Dakota
5059429	Grand Forks	United States	North Dakota
5059836	Jamestown	United States	North Dakota
5062458	West Fargo	United States	North Dakota
5063805	Bellevue	United States	Nebraska
5066001	Columbus	United States	Nebraska
5068725	Fremont	United States	Nebraska
5069297	Grand Island	United States	Nebraska
5069802	Hastings	United States	Nebraska
5071348	Kearney	United States	Nebraska
5071665	La Vista	United States	Nebraska
5072006	Lincoln	United States	Nebraska
5073965	Norfolk	United States	Nebraska
5074472	Omaha	United States	Nebraska
5074792	Papillion	United States	Nebraska
5083221	Bedford	United States	New Hampshire
5084868	Concord	United States	New Hampshire
5085374	Derry	United States	New Hampshire
5085382	Derry Village	United States	New Hampshire
5085520	Dover	United States	New Hampshire
5085688	East Concord	United States	New Hampshire
5088262	Keene	United States	New Hampshire
5088438	Laconia	United States	New Hampshire
5089178	Manchester	United States	New Hampshire
5089478	Merrimack	United States	New Hampshire
5090046	Nashua	United States	New Hampshire
5091383	Portsmouth	United States	New Hampshire
5091872	Rochester	United States	New Hampshire
5092268	Salem	United States	New Hampshire
5095281	Asbury Park	United States	New Jersey
5095325	Avenel	United States	New Jersey
5095445	Bayonne	United States	New Jersey
5095549	Belleville	United States	New Jersey
5095611	Bergenfield	United States	New Jersey
5095779	Bloomfield	United States	New Jersey
5096316	Carteret	United States	New Jersey
5096686	Cliffside Park	United States	New Jersey
5096699	Clifton	United States	New Jersey
5096798	Colonia	United States	New Jersey
5097017	Cranford	United States	New Jersey
5097315	Dover	United States	New Jersey
5097357	Dumont	United States	New Jersey
5097402	East Brunswick	United States	New Jersey
5097441	East Orange	United States	New Jersey
5097529	Edison	United States	New Jersey
5097598	Elizabeth	United States	New Jersey
5097627	Elmwood Park	United States	New Jersey
5097672	Englewood	United States	New Jersey
5097751	Ewing	United States	New Jersey
5097773	Fair Lawn	United States	New Jersey
5098109	Fords	United States	New Jersey
5098135	Fort Lee	United States	New Jersey
5098343	Garfield	United States	New Jersey
5098706	Hackensack	United States	New Jersey
5098909	Hawthorne	United States	New Jersey
5099093	Hillside	United States	New Jersey
5099133	Hoboken	United States	New Jersey
5099289	Hopatcong	United States	New Jersey
5099292	Hopatcong Hills	United States	New Jersey
5099724	Irvington	United States	New Jersey
5099738	Iselin	United States	New Jersey
5099836	Jersey City	United States	New Jersey
5099967	Kearny	United States	New Jersey
5100280	Lakewood	United States	New Jersey
5100506	Linden	United States	New Jersey
5100572	Livingston	United States	New Jersey
5100604	Lodi	United States	New Jersey
5100619	Long Branch	United States	New Jersey
5100706	Lyndhurst	United States	New Jersey
5100748	Madison	United States	New Jersey
5100776	Mahwah	United States	New Jersey
5100854	Maplewood	United States	New Jersey
5100886	Marlboro	United States	New Jersey
5101334	Montclair	United States	New Jersey
5101427	Morristown	United States	New Jersey
5101717	New Brunswick	United States	New Jersey
5101766	New Milford	United States	New Jersey
5101798	Newark	United States	New Jersey
5101873	North Arlington	United States	New Jersey
5101879	North Bergen	United States	New Jersey
5101938	North Plainfield	United States	New Jersey
5102076	Nutley	United States	New Jersey
5102162	Old Bridge	United States	New Jersey
5102213	Orange	United States	New Jersey
5102369	Palisades Park	United States	New Jersey
5102387	Paramus	United States	New Jersey
5102427	Parsippany	United States	New Jersey
5102443	Passaic	United States	New Jersey
5102466	Paterson	United States	New Jersey
5102578	Perth Amboy	United States	New Jersey
5102713	Piscataway	United States	New Jersey
5102720	Plainfield	United States	New Jersey
5102796	Point Pleasant	United States	New Jersey
5103055	Rahway	United States	New Jersey
5103269	Ridgewood	United States	New Jersey
5103500	Roselle	United States	New Jersey
5103580	Rutherford	United States	New Jersey
5104404	Sayreville	United States	New Jersey
5104405	Sayreville Junction	United States	New Jersey
5104473	Scotch Plains	United States	New Jersey
5104504	Secaucus	United States	New Jersey
5104755	Somerset	United States	New Jersey
5104835	South Old Bridge	United States	New Jersey
5104836	South Orange	United States	New Jersey
5104844	South Plainfield	United States	New Jersey
5104853	South River	United States	New Jersey
5105127	Summit	United States	New Jersey
5105262	Teaneck	United States	New Jersey
5105433	Tinton Falls	United States	New Jersey
5105496	Trenton	United States	New Jersey
5105608	Union	United States	New Jersey
5105634	Union City	United States	New Jersey
5106160	Wayne	United States	New Jersey
5106279	West Milford	United States	New Jersey
5106292	West New York	United States	New Jersey
5106298	West Orange	United States	New Jersey
5106331	Westfield	United States	New Jersey
5106453	Willingboro	United States	New Jersey
5106529	Woodbridge	United States	New Jersey
5106615	Wyckoff	United States	New Jersey
5106834	Albany	United States	New York
5107129	Amherst	United States	New York
5107152	Amsterdam	United States	New York
5107505	Auburn	United States	New York
5107760	Baldwin	United States	New York
5108093	Batavia	United States	New York
5108169	Bay Shore	United States	New York
5108219	Beacon	United States	New York
5108707	Bellmore	United States	New York
5108815	Bensonhurst	United States	New York
5108955	Bethpage	United States	New York
5109177	Binghamton	United States	New York
5110077	Brentwood	United States	New York
5110159	Brighton	United States	New York
5110266	The Bronx	United States	New York
5110302	Brooklyn	United States	New York
5110629	Buffalo	United States	New York
5112035	Centereach	United States	New York
5112078	Central Islip	United States	New York
5112375	Cheektowaga	United States	New York
5113142	Cohoes	United States	New York
5113412	Commack	United States	New York
5113481	Coney Island	United States	New York
5113683	Copiague	United States	New York
5113694	Coram	United States	New York
5113790	Cortland	United States	New York
5114731	Deer Park	United States	New York
5114900	Depew	United States	New York
5115107	Dix Hills	United States	New York
5115960	East Meadow	United States	New York
5115962	East Massapequa	United States	New York
5115985	East New York	United States	New York
5115989	East Northport	United States	New York
5116004	East Patchogue	United States	New York
5116060	East Setauket	United States	New York
5116119	Eastchester	United States	New York
5116303	Eggertsville	United States	New York
5116497	Elmira	United States	New York
5116508	Elmont	United States	New York
5116937	Farmingville	United States	New York
5117438	Floral Park	United States	New York
5117891	Franklin Square	United States	New York
5117949	Freeport	United States	New York
5118226	Garden City	United States	New York
5118626	Glen Cove	United States	New York
5118743	Gloversville	United States	New York
5119347	Greenburgh	United States	New York
5120095	Harrison	United States	New York
5120228	Hauppauge	United States	New York
5120478	Hempstead	United States	New York
5120656	Hicksville	United States	New York
5120987	Holbrook	United States	New York
5121163	Holtsville	United States	New York
5121636	Huntington	United States	New York
5121650	Huntington Station	United States	New York
5122331	Irondequoit	United States	New York
5122413	Islip	United States	New York
5122432	Ithaca	United States	New York
5122520	Jamaica	United States	New York
5122534	Jamestown	United States	New York
5122794	Johnson City	United States	New York
5123247	Kenmore	United States	New York
5123456	Kings Park	United States	New York
5123477	Kingston	United States	New York
5123533	Kiryas Joel	United States	New York
5123718	Lackawanna	United States	New York
5123840	Lake Ronkonkoma	United States	New York
5124276	Levittown	United States	New York
5124497	Lindenhurst	United States	New York
5125011	Lockport	United States	New York
5125086	Long Beach	United States	New York
5125125	Long Island City	United States	New York
5125523	Lynbrook	United States	New York
5125738	Mamaroneck	United States	New York
5125771	Manhattan	United States	New York
5126183	Massapequa	United States	New York
5126187	Massapequa Park	United States	New York
5126208	Mastic	United States	New York
5126518	Medford	United States	New York
5126555	Melville	United States	New York
5126630	Merrick	United States	New York
5126842	Middletown	United States	New York
5127134	Mineola	United States	New York
5127315	Monsey	United States	New York
5127835	Mount Vernon	United States	New York
5128266	Nanuet	United States	New York
5128481	New City	United States	New York
5128549	New Rochelle	United States	New York
5128581	New York City	United States	New York
5128654	Newburgh	United States	New York
5128723	Niagara Falls	United States	New York
5128884	North Amityville	United States	New York
5128886	North Babylon	United States	New York
5128898	North Bay Shore	United States	New York
5128904	North Bellmore	United States	New York
5129134	North Massapequa	United States	New York
5129245	North Tonawanda	United States	New York
5129248	North Valley Stream	United States	New York
5129603	Oceanside	United States	New York
5130045	Ossining	United States	New York
5130081	Oswego	United States	New York
5130780	Pearl River	United States	New York
5130831	Peekskill	United States	New York
5131638	Plainview	United States	New York
5131692	Plattsburgh	United States	New York
5132002	Port Chester	United States	New York
5132029	Port Washington	United States	New York
5132143	Poughkeepsie	United States	New York
5133273	Borough of Queens	United States	New York
5134086	Rochester	United States	New York
5134203	Rockville Centre	United States	New York
5134295	Rome	United States	New York
5134316	Ronkonkoma	United States	New York
5134323	Roosevelt	United States	New York
5134453	Rotterdam	United States	New York
5134693	Rye	United States	New York
5136334	Saratoga Springs	United States	New York
5136421	Sayville	United States	New York
5136433	Scarsdale	United States	New York
5136454	Schenectady	United States	New York
5137507	Seaford	United States	New York
5137600	Selden	United States	New York
5138022	Shirley	United States	New York
5138539	Smithtown	United States	New York
5139301	Spring Valley	United States	New York
5139568	Staten Island	United States	New York
5140402	Syosset	United States	New York
5140405	Syracuse	United States	New York
5141175	Tonawanda	United States	New York
5141502	Troy	United States	New York
5141927	Uniondale	United States	New York
5142056	Utica	United States	New York
5142109	Valley Stream	United States	New York
5143198	Wantagh	United States	New York
5143396	Watertown	United States	New York
5143620	West Albany	United States	New York
5143630	West Babylon	United States	New York
5143832	West Hempstead	United States	New York
5143866	West Islip	United States	New York
5143992	West Seneca	United States	New York
5144040	Westbury	United States	New York
5144336	White Plains	United States	New York
5145028	Woodmere	United States	New York
5145215	Yonkers	United States	New York
5145476	Akron	United States	Ohio
5145607	Alliance	United States	Ohio
5146055	Ashland	United States	Ohio
5146089	Ashtabula	United States	Ohio
5146233	Aurora	United States	Ohio
5146256	Austintown	United States	Ohio
5146277	Avon	United States	Ohio
5146282	Avon Center	United States	Ohio
5146286	Avon Lake	United States	Ohio
5146491	Barberton	United States	Ohio
5146675	Bay Village	United States	Ohio
5147097	Berea	United States	Ohio
5147784	Boardman	United States	Ohio
5147968	Bowling Green	United States	Ohio
5148273	Broadview Heights	United States	Ohio
5148326	Brook Park	United States	Ohio
5148480	Brunswick	United States	Ohio
5149222	Canton	United States	Ohio
5150529	Cleveland	United States	Ohio
5151613	Cuyahoga Falls	United States	Ohio
5151861	Defiance	United States	Ohio
5151891	Delaware	United States	Ohio
5152333	Dublin	United States	Ohio
5152599	East Cleveland	United States	Ohio
5152833	Eastlake	United States	Ohio
5153207	Elyria	United States	Ohio
5153420	Euclid	United States	Ohio
5153680	Fairview Park	United States	Ohio
5153924	Findlay	United States	Ohio
5155207	Fremont	United States	Ohio
5155393	Gahanna	United States	Ohio
5155499	Garfield Heights	United States	Ohio
5156371	Green	United States	Ohio
5157588	Hilliard	United States	Ohio
5158164	Hudson	United States	Ohio
5159537	Kent	United States	Ohio
5160315	Lakewood	United States	Ohio
5160783	Lima	United States	Ohio
5161262	Lorain	United States	Ohio
5161723	Mansfield	United States	Ohio
5161803	Maple Heights	United States	Ohio
5161902	Marion	United States	Ohio
5162077	Marysville	United States	Ohio
5162097	Massillon	United States	Ohio
5162188	Mayfield Heights	United States	Ohio
5162512	Medina	United States	Ohio
5162645	Mentor	United States	Ohio
5162851	Middleburg Heights	United States	Ohio
5163799	Mount Vernon	United States	Ohio
5164390	New Philadelphia	United States	Ohio
5164466	Newark	United States	Ohio
5164582	Niles	United States	Ohio
5164706	North Canton	United States	Ohio
5164862	North Olmsted	United States	Ohio
5164903	North Ridgeville	United States	Ohio
5164916	North Royalton	United States	Ohio
5165101	Norwalk	United States	Ohio
5165734	Oregon	United States	Ohio
5166009	Painesville	United States	Ohio
5166177	Parma	United States	Ohio
5166184	Parma Heights	United States	Ohio
5166516	Perrysburg	United States	Ohio
5166819	Piqua	United States	Ohio
5168491	Rocky River	United States	Ohio
5170691	Sandusky	United States	Ohio
5171728	Shaker Heights	United States	Ohio
5172078	Sidney	United States	Ohio
5172387	Solon	United States	Ohio
5172485	South Euclid	United States	Ohio
5173048	Steubenville	United States	Ohio
5173171	Stow	United States	Ohio
5173210	Streetsboro	United States	Ohio
5173237	Strongsville	United States	Ohio
5173572	Sylvania	United States	Ohio
5173623	Tallmadge	United States	Ohio
5173930	Tiffin	United States	Ohio
5174035	Toledo	United States	Ohio
5174358	Troy	United States	Ohio
5174550	Twinsburg	United States	Ohio
5175496	Wadsworth	United States	Ohio
5176472	Westerville	United States	Ohio
5176517	Westlake	United States	Ohio
5176937	Willoughby	United States	Ohio
5177358	Wooster	United States	Ohio
5177568	Youngstown	United States	Ohio
5178127	Allentown	United States	Pennsylvania
5178165	Allison Park	United States	Pennsylvania
5178195	Altoona	United States	Pennsylvania
5178800	Back Mountain	United States	Pennsylvania
5178940	Baldwin	United States	Pennsylvania
5180199	Bethel Park	United States	Pennsylvania
5180225	Bethlehem	United States	Pennsylvania
5183234	Carlisle	United States	Pennsylvania
5188140	Easton	United States	Pennsylvania
5188843	Erie	United States	Pennsylvania
5192726	Harrisburg	United States	Pennsylvania
5193011	Hazleton	United States	Pennsylvania
5193309	Hermitage	United States	Pennsylvania
5195561	Johnstown	United States	Pennsylvania
5196220	King of Prussia	United States	Pennsylvania
5197079	Lancaster	United States	Pennsylvania
5197159	Lansdale	United States	Pennsylvania
5197517	Lebanon	United States	Pennsylvania
5197796	Levittown	United States	Pennsylvania
5198034	Limerick	United States	Pennsylvania
5200499	McKeesport	United States	Pennsylvania
5201734	Monroeville	United States	Pennsylvania
5202215	Mount Lebanon	United States	Pennsylvania
5202534	Mountain Top	United States	Pennsylvania
5202765	Murrysville	United States	Pennsylvania
5203127	New Castle	United States	Pennsylvania
5203506	Norristown	United States	Pennsylvania
5205377	Penn Hills	United States	Pennsylvania
5205849	Phoenixville	United States	Pennsylvania
5206379	Pittsburgh	United States	Pennsylvania
5206606	Plum	United States	Pennsylvania
5207069	Pottstown	United States	Pennsylvania
5207490	Radnor	United States	Pennsylvania
5207728	Reading	United States	Pennsylvania
5211303	Scranton	United States	Pennsylvania
5213681	State College	United States	Pennsylvania
5216895	Upper Saint Clair	United States	Pennsylvania
5218270	Wayne	United States	Pennsylvania
5218802	West Mifflin	United States	Pennsylvania
5219287	Whitehall Township	United States	Pennsylvania
5219488	Wilkes-Barre	United States	Pennsylvania
5219501	Wilkinsburg	United States	Pennsylvania
5219585	Williamsport	United States	Pennsylvania
5219619	Willow Grove	United States	Pennsylvania
5220798	Barrington	United States	Rhode Island
5221077	Bristol	United States	Rhode Island
5221341	Central Falls	United States	Rhode Island
5221637	Coventry	United States	Rhode Island
5221659	Cranston	United States	Rhode Island
5221703	Cumberland	United States	Rhode Island
5221931	East Providence	United States	Rhode Island
5223358	Middletown	United States	Rhode Island
5223593	Newport	United States	Rhode Island
5223672	North Kingstown	United States	Rhode Island
5223681	North Providence	United States	Rhode Island
5223869	Pawtucket	United States	Rhode Island
5224082	Portsmouth	United States	Rhode Island
5224151	Providence	United States	Rhode Island
5224949	Smithfield	United States	Rhode Island
5225507	Warwick	United States	Rhode Island
5225627	West Warwick	United States	Rhode Island
5225631	Westerly	United States	Rhode Island
5225809	Woonsocket	United States	Rhode Island
5225857	Aberdeen	United States	South Dakota
5226534	Brookings	United States	South Dakota
5229794	Mitchell	United States	South Dakota
5231851	Sioux Falls	United States	South Dakota
5232741	Watertown	United States	South Dakota
5234372	Burlington	United States	Vermont
5235024	Colchester	United States	Vermont
5240509	Rutland	United States	Vermont
5241248	South Burlington	United States	Vermont
5244080	Appleton	United States	Wisconsin
5244267	Ashwaubenon	United States	Wisconsin
5245193	Beaver Dam	United States	Wisconsin
5245387	Beloit	United States	Wisconsin
5246835	Brookfield	United States	Wisconsin
5247415	Caledonia	United States	Wisconsin
5249871	Cudahy	United States	Wisconsin
5250201	De Pere	United States	Wisconsin
5251436	Eau Claire	United States	Wisconsin
5253219	Fitchburg	United States	Wisconsin
5253352	Fond du Lac	United States	Wisconsin
5253710	Franklin	United States	Wisconsin
5254218	Germantown	United States	Wisconsin
5254962	Green Bay	United States	Wisconsin
5255068	Greenfield	United States	Wisconsin
5257029	Howard	United States	Wisconsin
5257754	Janesville	United States	Wisconsin
5258296	Kaukauna	United States	Wisconsin
5258393	Kenosha	United States	Wisconsin
5258957	La Crosse	United States	Wisconsin
5261457	Madison	United States	Wisconsin
5261585	Manitowoc	United States	Wisconsin
5261969	Marshfield	United States	Wisconsin
5262596	Menasha	United States	Wisconsin
5262630	Menomonee Falls	United States	Wisconsin
5262634	Menomonie	United States	Wisconsin
5262649	Mequon	United States	Wisconsin
5262838	Middleton	United States	Wisconsin
5263045	Milwaukee	United States	Wisconsin
5264049	Muskego	United States	Wisconsin
5264223	Neenah	United States	Wisconsin
5264381	New Berlin	United States	Wisconsin
5264870	North La Crosse	United States	Wisconsin
5265228	Oak Creek	United States	Wisconsin
5265499	Oconomowoc	United States	Wisconsin
5265702	Onalaska	United States	Wisconsin
5265838	Oshkosh	United States	Wisconsin
5267403	Pleasant Prairie	United States	Wisconsin
5268249	Racine	United States	Wisconsin
5272893	Sheboygan	United States	Wisconsin
5273812	South Milwaukee	United States	Wisconsin
5274644	Stevens Point	United States	Wisconsin
5275020	Sun Prairie	United States	Wisconsin
5275191	Superior	United States	Wisconsin
5278005	Watertown	United States	Wisconsin
5278052	Waukesha	United States	Wisconsin
5278120	Wausau	United States	Wisconsin
5278159	Wauwatosa	United States	Wisconsin
5278420	West Allis	United States	Wisconsin
5278422	West Bend	United States	Wisconsin
5279436	Wisconsin Rapids	United States	Wisconsin
5280814	Weirton	United States	West Virginia
5280822	Weirton Heights	United States	West Virginia
5280854	Wheeling	United States	West Virginia
5281551	Ansonia	United States	Connecticut
5282804	Bridgeport	United States	Connecticut
5282835	Bristol	United States	Connecticut
5283054	Branford	United States	Connecticut
5283837	Cheshire	United States	Connecticut
5284756	Fillmore	United States	California
5287262	Buckeye	United States	Arizona
5287565	Bullhead City	United States	Arizona
5288636	Casa Grande	United States	Arizona
5288661	Casas Adobes	United States	Arizona
5288786	Catalina Foothills	United States	Arizona
5289282	Chandler	United States	Arizona
5293083	Douglas	United States	Arizona
5293183	Drexel Heights	United States	Arizona
5293996	El Mirage	United States	Arizona
5294167	Eloy	United States	Arizona
5294810	Flagstaff	United States	Arizona
5294902	Florence	United States	Arizona
5294937	Flowing Wells	United States	Arizona
5295143	Fortuna Foothills	United States	Arizona
5295177	Fountain Hills	United States	Arizona
5295903	Gilbert	United States	Arizona
5295985	Glendale	United States	Arizona
5296266	Goodyear	United States	Arizona
5296802	Green Valley	United States	Arizona
5301067	Kingman	United States	Arizona
5301388	Lake Havasu City	United States	Arizona
5303705	Marana	United States	Arizona
5303752	Maricopa	United States	Arizona
5304391	Mesa	United States	Arizona
5306611	Nogales	United States	Arizona
5307540	Oro Valley	United States	Arizona
5308305	Payson	United States	Arizona
5308480	Peoria	United States	Arizona
5308655	Phoenix	United States	Arizona
5309842	Prescott	United States	Arizona
5309858	Prescott Valley	United States	Arizona
5310193	Queen Creek	United States	Arizona
5311433	Rio Rico	United States	Arizona
5312544	Sahuarita	United States	Arizona
5312913	San Luis	United States	Arizona
5313457	Scottsdale	United States	Arizona
5314328	Sierra Vista	United States	Arizona
5316201	Sun City	United States	Arizona
5316205	Sun City West	United States	Arizona
5316428	Surprise	United States	Arizona
5316890	Tanque Verde	United States	Arizona
5317058	Tempe	United States	Arizona
5317071	Tempe Junction	United States	Arizona
5318313	Tucson	United States	Arizona
5322053	Yuma	United States	Arizona
5322400	Adelanto	United States	California
5322551	Agoura	United States	California
5322553	Agoura Hills	United States	California
5322737	Alameda	United States	California
5322850	Albany	United States	California
5323060	Alhambra	United States	California
5323163	Aliso Viejo	United States	California
5323525	Altadena	United States	California
5323566	Alum Rock	United States	California
5323694	American Canyon	United States	California
5323810	Anaheim	United States	California
5324105	Antelope	United States	California
5324200	Antioch	United States	California
5324363	Apple Valley	United States	California
5324477	Arcadia	United States	California
5324802	Arroyo Grande	United States	California
5324862	Artesia	United States	California
5324903	Arvin	United States	California
5325011	Ashland	United States	California
5325111	Atascadero	United States	California
5325187	Atwater	United States	California
5325327	Avenal	United States	California
5325372	Avocado Heights	United States	California
5325423	Azusa	United States	California
5325738	Bakersfield	United States	California
5325866	Baldwin Park	United States	California
5326032	Banning	United States	California
5326297	Barstow	United States	California
5326305	Barstow Heights	United States	California
5326561	Bay Point	United States	California
5327098	Beaumont	United States	California
5327298	Bell	United States	California
5327319	Bell Gardens	United States	California
5327422	Bellflower	United States	California
5327455	Belmont	United States	California
5327550	Benicia	United States	California
5327684	Berkeley	United States	California
5328041	Beverly Hills	United States	California
5329408	Bloomington	United States	California
5329649	Blythe	United States	California
5330167	Bostonia	United States	California
5330413	Boyle Heights	United States	California
5330567	Brawley	United States	California
5330582	Brea	United States	California
5330642	Brentwood	United States	California
5331575	Buena Park	United States	California
5331835	Burbank	United States	California
5331920	Burlingame	United States	California
5332593	Calabasas	United States	California
5332698	Calexico	United States	California
5333180	Camarillo	United States	California
5333282	Cameron Park	United States	California
5333913	Canoga Park	United States	California
5334223	Carlsbad	United States	California
5334336	Carmichael	United States	California
5334519	Carson	United States	California
5334799	Castaic	United States	California
5334928	Castro Valley	United States	California
5335006	Cathedral City	United States	California
5335650	Ceres	United States	California
5335663	Cerritos	United States	California
5336054	Chatsworth	United States	California
5336269	Chico	United States	California
5336537	Chino	United States	California
5336545	Chino Hills	United States	California
5336667	Chowchilla	United States	California
5336899	Chula Vista	United States	California
5337561	Citrus Heights	United States	California
5337696	Claremont	United States	California
5337908	Clearlake	United States	California
5338122	Clovis	United States	California
5338166	Coachella	United States	California
5338783	Colton	United States	California
5339066	Compton	United States	California
5339111	Concord	United States	California
5339539	Corcoran	United States	California
5339631	Corona	United States	California
5339663	Coronado	United States	California
5339840	Costa Mesa	United States	California
5340175	Covina	United States	California
5341051	Cudahy	United States	California
5341114	Culver City	United States	California
5341145	Cupertino	United States	California
5341256	Cypress	United States	California
5341430	Daly City	United States	California
5341483	Dana Point	United States	California
5341531	Danville	United States	California
5341704	Davis	United States	California
5342485	Delano	United States	California
5342710	Desert Hot Springs	United States	California
5342992	Diamond Bar	United States	California
5343171	Dinuba	United States	California
5343303	Dixon	United States	California
5343858	Downey	United States	California
5344147	Duarte	United States	California
5344157	Dublin	United States	California
5344817	East Rancho Dominguez	United States	California
5344942	East Hemet	United States	California
5344994	East Los Angeles	United States	California
5345032	East Palo Alto	United States	California
5345529	El Cajon	United States	California
5345609	El Centro	United States	California
5345623	El Cerrito	United States	California
5345679	El Dorado Hills	United States	California
5345743	El Monte	United States	California
5345860	El Segundo	United States	California
5346111	Elk Grove	United States	California
5346646	Encinitas	United States	California
5346827	Escondido	United States	California
5347287	Fair Oaks	United States	California
5347335	Fairfield	United States	California
5347578	Fallbrook	United States	California
5349613	Florin	United States	California
5349705	Folsom	United States	California
5349755	Fontana	United States	California
5349803	Foothill Farms	United States	California
5350159	Foster City	United States	California
5350207	Fountain Valley	United States	California
5350734	Fremont	United States	California
5350937	Fresno	United States	California
5351247	Fullerton	United States	California
5351428	Galt	United States	California
5351515	Garden Grove	United States	California
5351549	Gardena	United States	California
5352214	Gilroy	United States	California
5352350	Glen Avon	United States	California
5352423	Glendale	United States	California
5352439	Glendora	United States	California
5352963	Goleta	United States	California
5353530	Granite Bay	United States	California
5354172	Greenfield	United States	California
5354819	Hacienda Heights	United States	California
5355180	Hanford	United States	California
5355828	Hawthorne	United States	California
5355933	Hayward	United States	California
5356277	Hemet	United States	California
5356451	Hercules	United States	California
5356521	Hermosa Beach	United States	California
5356576	Hesperia	United States	California
5356868	Highland	United States	California
5357499	Hollister	United States	California
5357527	Hollywood	United States	California
5358705	Huntington Beach	United States	California
5358736	Huntington Park	United States	California
5359054	Imperial Beach	United States	California
5359446	Indio	United States	California
5359488	Inglewood	United States	California
5359777	Irvine	United States	California
5367565	Lodi	United States	California
5367696	Loma Linda	United States	California
5367767	Lomita	United States	California
5367788	Lompoc	United States	California
5367929	Long Beach	United States	California
5368335	Los Altos	United States	California
5368453	Los Banos	United States	California
5368518	Los Gatos	United States	California
5369367	Lynwood	United States	California
5369568	Madera	United States	California
5370082	Manhattan Beach	United States	California
5370164	Manteca	United States	California
5370493	Marina	United States	California
5370868	Martinez	United States	California
5371261	Maywood	United States	California
5371858	Mead Valley	United States	California
5372205	Menifee	United States	California
5372223	Menlo Park	United States	California
5372253	Merced	United States	California
5373129	Millbrae	United States	California
5373327	Milpitas	United States	California
5373492	Mira Loma	United States	California
5373763	Mission Viejo	United States	California
5373900	Modesto	United States	California
5374175	Monrovia	United States	California
5374232	Montclair	United States	California
5374322	Montebello	United States	California
5374361	Monterey	United States	California
5374406	Monterey Park	United States	California
5374648	Moorpark	United States	California
5374671	Moraga	United States	California
5374732	Moreno Valley	United States	California
5374764	Morgan Hill	United States	California
5375480	Mountain View	United States	California
5375911	Murrieta	United States	California
5376095	Napa	United States	California
5376200	National City	United States	California
5376803	Newark	United States	California
5376890	Newport Beach	United States	California
5377100	Nipomo	United States	California
5377199	Norco	United States	California
5377613	North Glendale	United States	California
5377640	North Highlands	United States	California
5377654	North Hollywood	United States	California
5377985	Northridge	United States	California
5377995	Norwalk	United States	California
5378044	Novato	United States	California
5378500	Oakdale	United States	California
5378538	Oakland	United States	California
5378566	Oakley	United States	California
5378771	Oceanside	United States	California
5378870	Oildale	United States	California
5379439	Ontario	United States	California
5379513	Orange	United States	California
5379566	Orangevale	United States	California
5379609	Orcutt	United States	California
5379678	Orinda	United States	California
5379759	Oroville	United States	California
5380184	Oxnard	United States	California
5380202	Oxnard Shores	United States	California
5380420	Pacifica	United States	California
5380437	Pacific Grove	United States	California
5380626	Palm Desert	United States	California
5380668	Palm Springs	United States	California
5380698	Palmdale	United States	California
5380748	Palo Alto	United States	California
5381002	Paradise	United States	California
5381110	Paramount	United States	California
5381396	Pasadena	United States	California
5381438	Paso Robles	United States	California
5381515	Patterson	United States	California
5382146	Perris	United States	California
5382232	Petaluma	United States	California
5382496	Pico Rivera	United States	California
5383187	Pinole	United States	California
5383465	Pittsburg	United States	California
5383527	Placentia	United States	California
5383720	Pleasant Hill	United States	California
5383777	Pleasanton	United States	California
5384170	Pomona	United States	California
5384339	Port Hueneme	United States	California
5384471	Porterville	United States	California
5384690	Poway	United States	California
5385082	Prunedale	United States	California
5385793	Ramona	United States	California
5385941	Rancho Cordova	United States	California
5385955	Rancho Cucamonga	United States	California
5386015	Rancho Mirage	United States	California
5386035	Rancho Palos Verdes	United States	California
5386053	Rancho San Diego	United States	California
5386082	Rancho Santa Margarita	United States	California
5386754	Redlands	United States	California
5386785	Redondo Beach	United States	California
5386834	Redwood City	United States	California
5386984	Reedley	United States	California
5387288	Rialto	United States	California
5387428	Richmond	United States	California
5387494	Ridgecrest	United States	California
5387687	Rio Linda	United States	California
5387844	Riverbank	United States	California
5387877	Riverside	United States	California
5388319	Rocklin	United States	California
5388564	Rohnert Park	United States	California
5388735	Rosamond	United States	California
5388867	Rosemead	United States	California
5388873	Rosemont	United States	California
5388881	Roseville	United States	California
5389126	Rowland Heights	United States	California
5389213	Rubidoux	United States	California
5389489	Sacramento	United States	California
5391295	Salinas	United States	California
5391710	San Bernardino	United States	California
5391749	San Bruno	United States	California
5391760	San Carlos	United States	California
5391791	San Clemente	United States	California
5391811	San Diego	United States	California
5391891	San Dimas	United States	California
5391945	San Fernando	United States	California
5391959	San Francisco	United States	California
5392034	San Gabriel	United States	California
5392090	San Jacinto	United States	California
5392171	San Jose	United States	California
5392229	San Juan Capistrano	United States	California
5392263	San Leandro	United States	California
5392281	San Lorenzo	United States	California
5392323	San Luis Obispo	United States	California
5392368	San Marcos	United States	California
5392423	San Mateo	United States	California
5392508	San Pablo	United States	California
5392528	San Pedro	United States	California
5392567	San Rafael	United States	California
5392593	San Ramon	United States	California
5392868	Sanger	United States	California
5392900	Santa Ana	United States	California
5392952	Santa Barbara	United States	California
5393015	Santa Clara	United States	California
5393049	Santa Clarita	United States	California
5393052	Santa Cruz	United States	California
5393128	Santa Fe Springs	United States	California
5393180	Santa Maria	United States	California
5393212	Santa Monica	United States	California
5393245	Santa Paula	United States	California
5393287	Santa Rosa	United States	California
5393429	Santee	United States	California
5393485	Saratoga	United States	California
5394086	Seal Beach	United States	California
5394136	Seaside	United States	California
5394329	Selma	United States	California
5394842	Shafter	United States	California
5395244	Sherman Oaks	United States	California
5396003	Simi Valley	United States	California
5397018	Soledad	United States	California
5397376	South El Monte	United States	California
5397603	South Gate	United States	California
5397664	South Lake Tahoe	United States	California
5397717	South Pasadena	United States	California
5397765	South San Francisco	United States	California
5397777	South San Jose Hills	United States	California
5397841	South Whittier	United States	California
5397851	South Yuba City	United States	California
5398277	Spring Valley	United States	California
5398630	Stanton	United States	California
5399020	Stockton	United States	California
5399629	Suisun	United States	California
5399901	Sun City	United States	California
5400075	Sunnyvale	United States	California
5401395	Temecula	United States	California
5401469	Temple City	United States	California
5402405	Thousand Oaks	United States	California
5403022	Torrance	United States	California
5403191	Tracy	United States	California
5403676	Truckee	United States	California
5403783	Tulare	United States	California
5404024	Turlock	United States	California
5404119	Tustin	United States	California
5404122	North Tustin	United States	California
5404198	Twentynine Palms	United States	California
5404476	Ukiah	United States	California
5404555	Union City	United States	California
5404794	Universal City	United States	California
5404915	Upland	United States	California
5407030	Walnut Park	United States	California
5407529	Watsonville	United States	California
5407908	West Carson	United States	California
5407933	West Covina	United States	California
5408076	West Hollywood	United States	California
5408191	West Puente Valley	United States	California
5408211	West Sacramento	United States	California
5408406	Westminster	United States	California
5408431	Westmont	United States	California
5409059	Whittier	United States	California
5409260	Wildomar	United States	California
5409768	Willowbrook	United States	California
5410004	Windsor	United States	California
5410129	Winter Gardens	United States	California
5410430	Woodland	United States	California
5410438	Woodland Hills	United States	California
5410902	Yorba Linda	United States	California
5411015	Yuba City	United States	California
5411046	Yucaipa	United States	California
5411079	Yucca Valley	United States	California
5412199	Arvada	United States	Colorado
5412347	Aurora	United States	Colorado
5414941	Brighton	United States	Colorado
5415035	Broomfield	United States	Colorado
5416005	Cañon City	United States	Colorado
5416329	Castle Rock	United States	Colorado
5416357	Castlewood	United States	Colorado
5416541	Centennial	United States	Colorado
5417041	Cimarron Hills	United States	Colorado
5417258	Clifton	United States	Colorado
5417657	Columbine	United States	Colorado
5417737	Commerce City	United States	Colorado
5420241	Durango	United States	Colorado
5421250	Englewood	United States	Colorado
5422191	Fountain	United States	Colorado
5423294	Golden	United States	Colorado
5423573	Grand Junction	United States	Colorado
5425043	Highlands Ranch	United States	Colorado
5427207	Ken Caryl	United States	Colorado
5427771	Lafayette	United States	Colorado
5427946	Lakewood	United States	Colorado
5429032	Littleton	United States	Colorado
5429522	Louisville	United States	Colorado
5431710	Montrose	United States	Colorado
5433124	Northglenn	United States	Colorado
5434006	Parker	United States	Colorado
5435464	Pueblo	United States	Colorado
5435477	Pueblo West	United States	Colorado
5438567	Sherrelwood	United States	Colorado
5439752	Southglenn	United States	Colorado
5441492	Thornton	United States	Colorado
5443910	Westminster	United States	Colorado
5443948	Wheat Ridge	United States	Colorado
5445298	Dodge City	United States	Kansas
5445439	Garden City	United States	Kansas
5445820	Liberal	United States	Kansas
5454627	Alamogordo	United States	New Mexico
5454711	Albuquerque	United States	New Mexico
5460459	Carlsbad	United States	New Mexico
5462393	Clovis	United States	New Mexico
5467328	Farmington	United States	New Mexico
5468773	Gallup	United States	New Mexico
5471578	Hobbs	United States	New Mexico
5475352	Las Cruces	United States	New Mexico
5487811	Rio Rancho	United States	New Mexico
5488441	Roswell	United States	New Mexico
5490263	Santa Fe	United States	New Mexico
5492450	South Valley	United States	New Mexico
5500539	Boulder City	United States	Nevada
5501344	Carson City	United States	Nevada
5503766	Enterprise	United States	Nevada
5504003	Fernley	United States	Nevada
5505411	Henderson	United States	Nevada
5508180	Mesquite	United States	Nevada
5509403	North Las Vegas	United States	Nevada
5509851	Pahrump	United States	Nevada
5509952	Paradise	United States	Nevada
5511077	Reno	United States	Nevada
5512827	Spanish Springs	United States	Nevada
5512862	Sparks	United States	Nevada
5512909	Spring Valley	United States	Nevada
5513307	Sun Valley	United States	Nevada
5513343	Sunrise Manor	United States	Nevada
5515110	Whitney	United States	Nevada
5515345	Winchester	United States	Nevada
5516233	Amarillo	United States	Texas
5517061	Big Spring	United States	Texas
5520076	Del Rio	United States	Texas
5520677	Eagle Pass	United States	Texas
5520993	El Paso	United States	Texas
5523074	Hereford	United States	Texas
5523369	Horizon City	United States	Texas
5525577	Lubbock	United States	Texas
5526337	Midland	United States	Texas
5527554	Odessa	United States	Texas
5527953	Pampa	United States	Texas
5528450	Plainview	United States	Texas
5530022	San Angelo	United States	Texas
5530932	Socorro	United States	Texas
5530937	Socorro Mission Number 1 Colonia	United States	Texas
5533366	West Odessa	United States	Texas
5536630	Cedar City	United States	Utah
5546220	Saint George	United States	Utah
5549222	Washington	United States	Utah
5550368	Wasco	United States	California
5551498	Anthem	United States	Arizona
5551535	Apache Junction	United States	Arizona
5552301	Avondale	United States	Arizona
5554072	Juneau	United States	Alaska
5558953	Arcata	United States	California
5559320	Bayside	United States	California
5563397	Eureka	United States	California
5567770	McKinleyville	United States	California
5570160	Redding	United States	California
5572400	Susanville	United States	California
5574991	Boulder	United States	Colorado
5576859	Erie	United States	Colorado
5576909	Evans	United States	Colorado
5577147	Fort Collins	United States	Colorado
5577592	Greeley	United States	Colorado
5579276	Longmont	United States	Colorado
5579368	Loveland	United States	Colorado
5583509	Windsor	United States	Colorado
5586437	Boise	United States	Idaho
5587698	Caldwell	United States	Idaho
5589173	Coeur d'Alene	United States	Idaho
5591778	Eagle	United States	Idaho
5596475	Idaho Falls	United States	Idaho
5597955	Kuna	United States	Idaho
5598538	Lewiston	United States	Idaho
5598542	Lewiston Orchards	United States	Idaho
5600685	Meridian	United States	Idaho
5601538	Moscow	United States	Idaho
5601933	Nampa	United States	Idaho
5604045	Pocatello	United States	Idaho
5604353	Post Falls	United States	Idaho
5605242	Rexburg	United States	Idaho
5610810	Twin Falls	United States	Idaho
5640350	Billings	United States	Montana
5641727	Bozeman	United States	Montana
5642934	Butte	United States	Montana
5655240	Great Falls	United States	Montana
5656882	Helena	United States	Montana
5660340	Kalispell	United States	Montana
5666639	Missoula	United States	Montana
5688025	Bismarck	United States	North Dakota
5688789	Dickinson	United States	North Dakota
5690366	Mandan	United States	North Dakota
5690532	Minot	United States	North Dakota
5697939	North Platte	United States	Nebraska
5699404	Scottsbluff	United States	Nebraska
5703670	Elko	United States	Nevada
5710756	Albany	United States	Oregon
5711099	Aloha	United States	Oregon
5711149	Altamont	United States	Oregon
5711789	Ashland	United States	Oregon
5713376	Beaverton	United States	Oregon
5713587	Bend	United States	Oregon
5713759	Bethany	United States	Oregon
5717758	Canby	United States	Oregon
5718601	Central Point	United States	Oregon
5720495	Coos Bay	United States	Oregon
5720727	Corvallis	United States	Oregon
5725846	Eugene	United States	Oregon
5727190	Forest Grove	United States	Oregon
5727382	Four Corners	United States	Oregon
5729080	Grants Pass	United States	Oregon
5729485	Gresham	United States	Oregon
5730675	Hayesville	United States	Oregon
5731070	Hermiston	United States	Oregon
5731371	Hillsboro	United States	Oregon
5734711	Keizer	United States	Oregon
5735238	Klamath Falls	United States	Oregon
5735724	Lake Oswego	United States	Oregon
5736218	Lebanon	United States	Oregon
5736378	Lents	United States	Oregon
5739936	McMinnville	United States	Oregon
5740099	Medford	United States	Oregon
5740900	Milwaukie	United States	Oregon
5742726	Newberg	United States	Oregon
5743731	Oak Grove	United States	Oregon
5744253	Oregon City	United States	Oregon
5745380	Pendleton	United States	Oregon
5746545	Portland	United States	Oregon
5747882	Redmond	United States	Oregon
5749352	Roseburg	United States	Oregon
5750162	Salem	United States	Oregon
5751632	Sherwood	United States	Oregon
5754005	Springfield	United States	Oregon
5756758	Tigard	United States	Oregon
5757477	Troutdale	United States	Oregon
5757506	Tualatin	United States	Oregon
5760009	West Linn	United States	Oregon
5761287	Wilsonville	United States	Oregon
5761708	Woodburn	United States	Oregon
5768233	Rapid City	United States	South Dakota
5771826	Bountiful	United States	Utah
5771960	Brigham City	United States	Utah
5772654	Centerville	United States	Utah
5772959	Clearfield	United States	Utah
5773001	Clinton	United States	Utah
5773304	Cottonwood Heights	United States	Utah
5774001	Draper	United States	Utah
5774215	Eagle Mountain	United States	Utah
5774301	East Millcreek	United States	Utah
5774662	Farmington	United States	Utah
5775782	Herriman	United States	Utah
5775863	Highland	United States	Utah
5776008	Holladay	United States	Utah
5776715	Kaysville	United States	Utah
5776727	Kearns	United States	Utah
5777107	Layton	United States	Utah
5777224	Lehi	United States	Utah
5777544	Logan	United States	Utah
5777793	Magna	United States	Utah
5778244	Midvale	United States	Utah
5778352	Millcreek	United States	Utah
5778755	Murray	United States	Utah
5779036	North Ogden	United States	Utah
5779068	North Salt Lake	United States	Utah
5779206	Ogden	United States	Utah
5779334	Orem	United States	Utah
5779548	Payson	United States	Utah
5779816	Pleasant Grove	United States	Utah
5780026	Provo	United States	Utah
5780557	Riverton	United States	Utah
5780802	Roy	United States	Utah
5780993	Salt Lake City	United States	Utah
5781061	Sandy City	United States	Utah
5781070	Sandy Hills	United States	Utah
5781087	Saratoga Springs	United States	Utah
5781765	South Jordan Heights	United States	Utah
5781770	South Jordan	United States	Utah
5781783	South Ogden	United States	Utah
5781794	South Salt Lake	United States	Utah
5781860	Spanish Fork	United States	Utah
5781993	Springville	United States	Utah
5782391	Syracuse	United States	Utah
5782476	Taylorsville	United States	Utah
5783695	Tooele	United States	Utah
5784549	West Jordan	United States	Utah
5784607	West Valley City	United States	Utah
5785657	Anacortes	United States	Washington
5785868	Arlington	United States	Washington
5785965	Auburn	United States	Washington
5786485	Battle Ground	United States	Washington
5786882	Bellevue	United States	Washington
5786899	Bellingham	United States	Washington
5787776	Bonney Lake	United States	Washington
5787829	Bothell	United States	Washington
5788054	Bremerton	United States	Washington
5788516	Burien	United States	Washington
5788822	Camas	United States	Washington
5789683	Centralia	United States	Washington
5790971	Cottage Lake	United States	Washington
5791159	Covington	United States	Washington
5792244	Des Moines	United States	Washington
5793427	Edmonds	United States	Washington
5793639	Ellensburg	United States	Washington
5793933	Everett	United States	Washington
5794097	Fairwood	United States	Washington
5794245	Federal Way	United States	Washington
5794559	Five Corners	United States	Washington
5795011	Frederickson	United States	Washington
5795906	Graham	United States	Washington
5796984	Hazel Dell	United States	Washington
5798487	Issaquah	United States	Washington
5799587	Kenmore	United States	Washington
5799610	Kennewick	United States	Washington
5799625	Kent	United States	Washington
5799841	Kirkland	United States	Washington
5800112	Lacey	United States	Washington
5800317	Lake Stevens	United States	Washington
5800420	Lakewood	United States	Washington
5801617	Longview	United States	Washington
5802049	Lynnwood	United States	Washington
5802340	Maple Valley	United States	Washington
5802493	Martha Lake	United States	Washington
5802570	Marysville	United States	Washington
5803139	Mercer Island	United States	Washington
5803457	Mill Creek	United States	Washington
5803786	Monroe	United States	Washington
5803990	Moses Lake	United States	Washington
5804127	Mount Vernon	United States	Washington
5804191	Mountlake Terrace	United States	Washington
5804306	Mukilteo	United States	Washington
5804953	North Creek	United States	Washington
5805441	Oak Harbor	United States	Washington
5805687	Olympia	United States	Washington
5805782	Opportunity	United States	Washington
5805815	Orchards	United States	Washington
5806253	Parkland	United States	Washington
5806298	Pasco	United States	Washington
5807212	Port Angeles	United States	Washington
5807540	Pullman	United States	Washington
5807575	Puyallup	United States	Washington
5808079	Redmond	United States	Washington
5808189	Renton	United States	Washington
5808276	Richland	United States	Washington
5809333	Salmon Creek	United States	Washington
5809402	Sammamish	United States	Washington
5809805	SeaTac	United States	Washington
5809844	Seattle	United States	Washington
5810301	Shoreline	United States	Washington
5810490	Silverdale	United States	Washington
5811456	South Hill	United States	Washington
5811581	Spanaway	United States	Washington
5811696	Spokane	United States	Washington
5811729	Spokane Valley	United States	Washington
5812604	Sunnyside	United States	Washington
5812944	Tacoma	United States	Washington
5814043	Tukwila	United States	Washington
5814095	Tumwater	United States	Washington
5814450	University Place	United States	Washington
5814616	Vancouver	United States	Washington
5814916	Walla Walla	United States	Washington
5815342	Wenatchee	United States	Washington
5815538	West Lake Sammamish	United States	Washington
5815539	West Lake Stevens	United States	Washington
5816320	Bainbridge Island	United States	Washington
5816605	Yakima	United States	Washington
5820705	Casper	United States	Wyoming
5821086	Cheyenne	United States	Wyoming
5826027	Gillette	United States	Wyoming
5830062	Laramie	United States	Wyoming
5836898	Rock Springs	United States	Wyoming
5838198	Sheridan	United States	Wyoming
5844096	American Fork	United States	Utah
5847411	Kahului	United States	Hawaii
5847486	Kailua	United States	Hawaii
5848189	Kāne‘ohe	United States	Hawaii
5849297	Kīhei	United States	Hawaii
5850554	Makakilo City	United States	Hawaii
5851030	Mililani Town	United States	Hawaii
5852275	Pearl City	United States	Hawaii
5853992	Wahiawā	United States	Hawaii
5854496	Wailuku	United States	Hawaii
5854686	Waipahu	United States	Hawaii
5855070	‘Ewa Gentry	United States	Hawaii
5855927	Hilo	United States	Hawaii
5856195	Honolulu	United States	Hawaii
5861187	Eagle River	United States	Alaska
5861897	Fairbanks	United States	Alaska
5879400	Anchorage	United States	Alaska
5879898	Badger	United States	Alaska
6331908	Milton	United States	Georgia
6331909	Johns Creek	United States	Georgia
6332309	Cutler Bay	United States	Florida
6332439	Alafaya	United States	Florida
6941080	Fort Bragg	United States	North Carolina
7160204	City of Milford (balance)	United States	Connecticut
7172886	Butte-Silver Bow (Balance)	United States	Montana
7174365	City of Sammamish	United States	Washington
7176035	Silver Firs	United States	Washington
7176039	Vineyard	United States	California
7257422	Wallingford Center	United States	Connecticut
7257991	Bel Air North	United States	Maryland
7257992	Bel Air South	United States	Maryland
7258965	Setauket-East Setauket	United States	New York
7259084	Tonawanda	United States	New York
7259265	Fort Leonard Wood	United States	Missouri
7259621	West Bloomfield Township	United States	Michigan
7259705	East Lake-Orient Park	United States	Florida
7259780	Four Corners	United States	Florida
7259823	Greater Northdale	United States	Florida
7260019	Candler-McAfee	United States	Georgia
7260219	University	United States	Florida
7260233	Vero Beach South	United States	Florida
7260327	Kendall West	United States	Florida
7260548	Palm River-Clair Mel	United States	Florida
7260806	Arden-Arcade	United States	California
7260966	Bryn Mawr-Skyway	United States	Washington
7261029	Casa de Oro-Mount Helix	United States	California
7261268	Florence-Graham	United States	California
7261291	Fort Hood	United States	Texas
7261476	Inglewood-Finn Hill	United States	Washington
7261553	La Crescenta-Montrose	United States	California
7261759	East Hill-Meridian	United States	Washington
7262349	Security-Widefield	United States	Colorado
7262428	Union Hill-Novelty Hill	United States	Washington
7262518	West Whittier-Los Nietos	United States	California
7262622	Summerlin South	United States	Nevada
7262761	Makakilo	United States	Hawaii
7262790	Schofield Barracks	United States	Hawaii
7310164	San Tan Valley	United States	Arizona
7839240	Enchanted Hills	United States	New Mexico
8030162	West Hills	United States	California
8299576	Bridgewater	United States	New Jersey
8299577	Warren Township	United States	New Jersey
8347326	Fairfield Heights	United States	Indiana
8469295	Randolph	United States	New Jersey
8605040	Hot Springs National Park	United States	Arkansas
8605041	Dixiana	United States	Alabama
8643098	Cranberry Township	United States	Pennsylvania
10104153	Silver Lake	United States	California
10104154	Echo Park	United States	California
3439525	Young	Uruguay	Río Negro
3439748	Trinidad	Uruguay	Flores
3439749	Trinidad	Uruguay	Flores
3439781	Treinta y Tres	Uruguay	Treinta y Tres
3440034	Tacuarembó	Uruguay	Tacuarembó
3440571	Santa Lucía	Uruguay	Canelones
3440639	San José de Mayo	Uruguay	San José
3440696	San Carlos	Uruguay	Maldonado
3440714	Salto	Uruguay	Salto
3440777	Rocha	Uruguay	Rocha
3440781	Rivera	Uruguay	Rivera
3440963	Progreso	Uruguay	Canelones
3441243	Paysandú	Uruguay	Paysandú
3441292	Paso de Carrasco	Uruguay	Canelones
3441354	Pando	Uruguay	Canelones
3441575	Montevideo	Uruguay	Montevideo
3441665	Minas	Uruguay	Lavalleja
3441684	Mercedes	Uruguay	Soriano
3441702	Melo	Uruguay	Cerro Largo
3441894	Maldonado	Uruguay	Maldonado
3442057	Las Piedras	Uruguay	Canelones
3442098	La Paz	Uruguay	Canelones
3442568	Fray Bentos	Uruguay	Río Negro
3442585	Florida	Uruguay	Florida
3442727	Durazno	Uruguay	Durazno
3442750	Dolores	Uruguay	Soriano
3442778	Delta del Tigre	Uruguay	San José
3443013	Colonia del Sacramento	Uruguay	Colonia
3443341	Carmelo	Uruguay	Colonia
3443413	Canelones	Uruguay	Canelones
3443758	Artigas	Uruguay	Artigas
601294	Nukus	Uzbekistan	Karakalpakstan
601339	Khŭjayli	Uzbekistan	Karakalpakstan
601417	Oltinko’l	Uzbekistan	Karakalpakstan
1215694	Zomin	Uzbekistan	Jizzax
1215839	Urgut	Uzbekistan	Samarqand
1215957	Tirmiz	Uzbekistan	Surxondaryo
1216115	Sho’rchi	Uzbekistan	Surxondaryo
1216187	Shahrisabz	Uzbekistan	Qashqadaryo
1216265	Samarqand	Uzbekistan	Samarqand
1216311	Qarshi	Uzbekistan	Qashqadaryo
1216475	Muborak	Uzbekistan	Qashqadaryo
1216787	Kitob	Uzbekistan	Qashqadaryo
1216982	Kattaqo’rg’on	Uzbekistan	Samarqand
1217007	Koson	Uzbekistan	Qashqadaryo
1217084	Karakul’	Uzbekistan	Bukhara
1217180	Kogon	Uzbekistan	Bukhara
1217262	G’uzor	Uzbekistan	Qashqadaryo
1217340	Galaosiyo	Uzbekistan	Bukhara
1217362	Juma	Uzbekistan	Samarqand
1217474	Denov	Uzbekistan	Surxondaryo
1217540	Chiroqchi	Uzbekistan	Qashqadaryo
1217569	Chelak	Uzbekistan	Samarqand
1217658	Bulung’ur	Uzbekistan	Samarqand
1217662	Bukhara	Uzbekistan	Bukhara
1217703	Beshkent	Uzbekistan	Qashqadaryo
1217734	Boysun	Uzbekistan	Surxondaryo
1217926	Oqtosh	Uzbekistan	Samarqand
1512287	Zafar	Uzbekistan	Toshkent
1512320	Yaypan	Uzbekistan	Fergana
1512339	Yangiyŭl	Uzbekistan	Toshkent
1512342	Yangiyer	Uzbekistan	Sirdaryo
1512348	Yangirabot	Uzbekistan	Navoiy
1512350	Yangiqo‘rg‘on	Uzbekistan	Namangan
1512372	Yangiobod	Uzbekistan	Toshkent
1512423	Wobkent	Uzbekistan	Bukhara
1512449	Uychi	Uzbekistan	Namangan
1512473	Urganch	Uzbekistan	Xorazm
1512480	Dashtobod	Uzbekistan	Jizzax
1512501	Uchqŭrghon Shahri	Uzbekistan	Namangan
1512524	Tŭytepa	Uzbekistan	Toshkent
1512549	Tŭragŭrghon	Uzbekistan	Namangan
1512568	Toshloq	Uzbekistan	Fergana
1512569	Tashkent	Uzbekistan	Toshkent Shahri
1512658	Toshbuloq	Uzbekistan	Namangan
1512770	Sirdaryo	Uzbekistan	Sirdaryo
1512790	Showot	Uzbekistan	Xorazm
1512838	Shofirkon	Uzbekistan	Bukhara
1512934	Salor	Uzbekistan	Toshkent
1512978	Qŭshkŭpir	Uzbekistan	Xorazm
1512979	Qo‘qon	Uzbekistan	Fergana
1512986	Piskent	Uzbekistan	Toshkent
1513011	Payshanba	Uzbekistan	Samarqand
1513017	Parkent	Uzbekistan	Toshkent
1513023	Pop	Uzbekistan	Namangan
1513038	Paxtakor	Uzbekistan	Jizzax
1513064	Olmaliq	Uzbekistan	Toshkent
1513072	Ohangaron	Uzbekistan	Toshkent
1513087	Nurota	Uzbekistan	Navoiy
1513092	Novyy Turtkul’	Uzbekistan	Karakalpakstan
1513131	Navoiy	Uzbekistan	Navoiy
1513157	Namangan	Uzbekistan	Namangan
1513243	Marg‘ilon	Uzbekistan	Fergana
1513245	Manghit	Uzbekistan	Karakalpakstan
1513271	Asaka	Uzbekistan	Andijon
1513331	Quvasoy	Uzbekistan	Fergana
1513364	Qŭrghontepa	Uzbekistan	Andijon
1513555	Kirguli	Uzbekistan	Fergana
1513567	Qibray	Uzbekistan	Toshkent
1513600	Khŭjaobod	Uzbekistan	Andijon
1513604	Khiwa	Uzbekistan	Xorazm
1513655	Haqqulobod	Uzbekistan	Namangan
1513714	Kosonsoy	Uzbekistan	Namangan
1513886	Jizzax	Uzbekistan	Jizzax
1513900	Iskandar	Uzbekistan	Toshkent
1513957	Hazorasp	Uzbekistan	Xorazm
1513962	Gurlan	Uzbekistan	Xorazm
1513966	Guliston	Uzbekistan	Sirdaryo
1513983	Ghijduwon	Uzbekistan	Bukhara
1513996	G‘azalkent	Uzbekistan	Toshkent
1514011	Gagarin	Uzbekistan	Jizzax
1514019	Fergana	Uzbekistan	Fergana
1514125	Dŭstlik	Uzbekistan	Jizzax
1514192	Chust Shahri	Uzbekistan	Namangan
1514210	Chirchiq	Uzbekistan	Toshkent
1514215	Chinoz	Uzbekistan	Toshkent
1514258	Chortoq	Uzbekistan	Namangan
1514330	Bŭka	Uzbekistan	Toshkent
1514382	Beshariq	Uzbekistan	Fergana
1514387	Beruniy	Uzbekistan	Karakalpakstan
1514396	Bektemir	Uzbekistan	Toshkent Shahri
1514402	Bekobod	Uzbekistan	Toshkent
1514581	Angren	Uzbekistan	Toshkent
1514588	Andijon	Uzbekistan	Andijon
1514615	Oltiariq	Uzbekistan	Fergana
1526979	Quva	Uzbekistan	Fergana
1538229	Navoiy	Uzbekistan	Navoiy
6691831	Vatican City	Vatican	N/A
3577887	Kingstown	Saint Vincent and the Grenadines	Saint George
3748726	Kingstown Park	Saint Vincent and the Grenadines	Saint George
3480908	La Asunción	Venezuela	Nueva Esparta
3486270	Anaco	Venezuela	Anzoátegui
3487903	Alto Barinas	Venezuela	Barinas
3625066	Zaraza	Venezuela	Guárico
3625207	Yaritagua	Venezuela	Yaracuy
3625341	Villa de Cura	Venezuela	Aragua
3625346	Villa Bruzual	Venezuela	Portuguesa
3625515	Valle de La Pascua	Venezuela	Guárico
3625542	Valera	Venezuela	Trujillo
3625549	Valencia	Venezuela	Carabobo
3625710	Upata	Venezuela	Bolívar
3625829	Turmero	Venezuela	Aragua
3625929	Tucupita	Venezuela	Delta Amacuro
3625979	Trujillo	Venezuela	Trujillo
3626219	Tinaquillo	Venezuela	Cojedes
3626402	Táriba	Venezuela	Táchira
3627047	Santa Teresa	Venezuela	Miranda
3627186	Santa Rita	Venezuela	Zulia
3627382	Santa Elena de Uairén	Venezuela	Bolívar
3627968	San Mateo	Venezuela	Aragua
3628053	San Juan de los Morros	Venezuela	Guárico
3628060	San Juan de Colón	Venezuela	Táchira
3628142	San José de Guanipa	Venezuela	Anzoátegui
3628267	San Joaquín	Venezuela	Carabobo
3628423	San Felipe	Venezuela	Yaracuy
3628473	San Cristóbal	Venezuela	Táchira
3628489	San Carlos del Zulia	Venezuela	Zulia
3628503	San Carlos	Venezuela	Cojedes
3628549	San Antonio del Táchira	Venezuela	Táchira
3628550	San Antonio de Los Altos	Venezuela	Miranda
3628952	Rubio	Venezuela	Táchira
3628966	La Villa del Rosario	Venezuela	Zulia
3629419	Quíbor	Venezuela	Lara
3629576	Punto Fijo	Venezuela	Falcón
3629614	Punta Cardón	Venezuela	Falcón
3629672	Puerto La Cruz	Venezuela	Anzoátegui
3629706	Puerto Cabello	Venezuela	Carabobo
3629710	Puerto Ayacucho	Venezuela	Amazonas
3629965	Porlamar	Venezuela	Nueva Esparta
3630297	Petare	Venezuela	Miranda
3630932	Palo Negro	Venezuela	Aragua
3631412	Ocumare del Tuy	Venezuela	Miranda
3631507	Nirgua	Venezuela	Yaracuy
3631741	Mucumpiz	Venezuela	Mérida
3631878	Morón	Venezuela	Carabobo
3632308	Mérida	Venezuela	Mérida
3632929	Mariara	Venezuela	Carabobo
3632998	Maracay	Venezuela	Aragua
3633009	Maracaibo	Venezuela	Zulia
3633341	Maiquetía	Venezuela	Vargas
3633444	Machiques	Venezuela	Zulia
3633622	Los Teques	Venezuela	Miranda
3633677	Los Rastrojos	Venezuela	Lara
3634184	Los Dos Caminos	Venezuela	Miranda
3634922	La Victoria	Venezuela	Aragua
3635325	Las Tejerías	Venezuela	Aragua
3637623	Lagunillas	Venezuela	Zulia
3637721	La Guaira	Venezuela	Vargas
3639107	Juan Griego	Venezuela	Nueva Esparta
3639725	Güiria	Venezuela	Sucre
3639747	Güigüe	Venezuela	Carabobo
3639898	Guatire	Venezuela	Miranda
3640049	Guarenas	Venezuela	Miranda
3640226	Guanare	Venezuela	Portuguesa
3640465	Guacara	Venezuela	Carabobo
3641099	El Vigía	Venezuela	Mérida
3641275	El Tocuyo	Venezuela	Lara
3641351	El Tigre	Venezuela	Anzoátegui
3642833	El Limón	Venezuela	Aragua
3643031	El Hatillo	Venezuela	Miranda
3644417	Ejido	Venezuela	Mérida
3644768	Cumaná	Venezuela	Sucre
3644918	Cúa	Venezuela	Miranda
3645213	Coro	Venezuela	Falcón
3645528	Ciudad Guayana	Venezuela	Bolívar
3645532	Ciudad Bolívar	Venezuela	Bolívar
3645671	Chivacoa	Venezuela	Yaracuy
3645854	Charallave	Venezuela	Miranda
3645981	Chacao	Venezuela	Miranda
3646062	Tacarigua	Venezuela	Carabobo
3646169	Caucagüito	Venezuela	Miranda
3646190	Catia La Mar	Venezuela	Vargas
3646382	Carúpano	Venezuela	Sucre
3646451	Carrizal	Venezuela	Miranda
3646487	Carora	Venezuela	Lara
3646738	Caracas	Venezuela	Capital
3646767	Caraballeda	Venezuela	Vargas
3646869	Cantaura	Venezuela	Anzoátegui
3647444	Calabozo	Venezuela	Guárico
3647549	Cagua	Venezuela	Aragua
3647651	Cabimas	Venezuela	Zulia
3648439	Baruta	Venezuela	Miranda
3648522	Barquisimeto	Venezuela	Lara
3648540	Barinitas	Venezuela	Barinas
3648546	Barinas	Venezuela	Barinas
3648559	Barcelona	Venezuela	Anzoátegui
3649017	Araure	Venezuela	Portuguesa
3649408	Altagracia de Orituco	Venezuela	Guárico
3649833	Acarigua	Venezuela	Portuguesa
3778045	Maturín	Venezuela	Monagas
3795152	La Fría	Venezuela	Táchira
3803449	El Cafetal	Venezuela	Miranda
3803515	Caucaguita	Venezuela	Miranda
3803651	La Dolorita	Venezuela	Miranda
3804949	Guasdualito	Venezuela	Apure
3805673	San Fernando de Apure	Venezuela	Apure
3577430	Road Town	British Virgin Islands	N/A
8533874	Tortola	British Virgin Islands	N/A
4795467	Charlotte Amalie	U.S. Virgin Islands	Saint Thomas Island
4796512	Saint Croix	U.S. Virgin Islands	Saint Croix Island
1560037	Yên Vinh	Vietnam	Nghệ An
1560349	Yên Bái	Vietnam	Yên Bái
1562414	Vũng Tàu	Vietnam	Bà Rịa-Vũng Tàu
1562538	Vị Thanh	Vietnam	Hau Giang
1562548	Vĩnh Yên	Vietnam	Vĩnh Phúc
1562693	Vĩnh Long	Vietnam	Vĩnh Long
1562798	Vinh	Vietnam	Nghệ An
1562820	Việt Trì	Vietnam	Phú Thọ
1563241	Thành Phố Uông Bí	Vietnam	Quảng Ninh
1563281	Tuy Hòa	Vietnam	Phú Yên
1563287	Thành Phố Tuyên Quang	Vietnam	Tuyên Quang
1563926	Trà Vinh	Vietnam	Trà Vinh
1565022	Thủ Dầu Một	Vietnam	Bình Dương
1566083	Ho Chi Minh City	Vietnam	Ho Chi Minh City
1566166	Thanh Hóa	Vietnam	Thanh Hóa
1566319	Thành Phố Thái Nguyên	Vietnam	Thái Nguyên
1566346	Thành Phố Thái Bình	Vietnam	Thái Bình
1566559	Tây Ninh	Vietnam	Tây Ninh
1567069	Tân An	Vietnam	Long An
1567148	Tam Kỳ	Vietnam	Quảng Nam
1567621	Sơn Tây	Vietnam	Ha Nội
1567681	Sơn La	Vietnam	Sơn La
1567723	Sông Cầu	Vietnam	Phú Yên
1567788	Sóc Trăng	Vietnam	Sóc Trăng
1568043	Sa Pá	Vietnam	Lào Cai
1568212	Sadek	Vietnam	Đồng Tháp
1568510	Rạch Giá	Vietnam	Kiến Giang
1568574	Qui Nhon	Vietnam	Bình Định
1568770	Quảng Ngãi	Vietnam	Quảng Ngãi
1569684	Pleiku	Vietnam	Gia Lai
1570449	Thành Phố Phủ Lý	Vietnam	Hà Nam
1570549	Phú Khương	Vietnam	Tây Ninh
1571058	Phan Thiết	Vietnam	Bình Thuận
1571067	Phan Rang-Tháp Chàm	Vietnam	Ninh Thuận
1571968	Thành Phố Ninh Bình	Vietnam	Ninh Bình
1572151	Nha Trang	Vietnam	Khánh Hòa
1573517	Thành Phố Nam Định	Vietnam	Nam Định
1574023	Mỹ Tho	Vietnam	Tiền Giang
1574507	Móng Cái	Vietnam	Quảng Ninh
1575627	Long Xuyên	Vietnam	An Giang
1576303	Lào Cai	Vietnam	Lào Cai
1576633	Thành Phố Lạng Sơn	Vietnam	Lạng Sơn
1577995	La Gi	Vietnam	Bình Thuận
1578500	Kon Tum	Vietnam	Kon Tum
1580142	Hưng Yên	Vietnam	Hưng Yên
1580240	Huế	Vietnam	Thừa Thiên-Huế
1580410	Thành Phố Hạ Long	Vietnam	Quảng Ninh
1580541	Hội An	Vietnam	Quảng Nam
1580830	Thành Phố Hòa Bình	Vietnam	Hòa Bình
1581047	Hà Tĩnh	Vietnam	Hà Tĩnh
1581052	Hà Tiên	Vietnam	Kiến Giang
1581130	Hanoi	Vietnam	Ha Nội
1581298	Haiphong	Vietnam	Hải Phòng
1581326	Thành Phố Hải Dương	Vietnam	Hải Dương
1581349	Thành Phố Hà Giang	Vietnam	Hà Giang
1581364	Hà Đông	Vietnam	Ha Nội
1582436	Don Luan	Vietnam	Bình Phước
1582886	Kwang Binh	Vietnam	Quảng Bình
1582926	Ðông Hà	Vietnam	Quảng Trị
1583477	Dien Bien Phu	Vietnam	Tỉnh Ðiện Biên
1583992	Da Nang	Vietnam	Đà Nẵng
1584071	Ðà Lạt	Vietnam	Lâm Đồng
1584661	Củ Chi	Vietnam	Ho Chi Minh City
1585660	Cho Dok	Vietnam	An Giang
1586052	Cát Bà	Vietnam	Hải Phòng
1586151	Cao Lãnh	Vietnam	Đồng Tháp
1586185	Thành Phố Cao Bằng	Vietnam	Cao Bằng
1586203	Cần Thơ	Vietnam	Cần Thơ
1586288	Cần Giờ	Vietnam	Ho Chi Minh City
1586296	Cần Giuộc	Vietnam	Long An
1586350	Cam Ranh	Vietnam	Khánh Hòa
1586357	Cẩm Phả Mines	Vietnam	Quảng Ninh
1586443	Cà Mau	Vietnam	Cà Mau
1586896	Buôn Ma Thuột	Vietnam	Ðắc Lắk
1587919	Bỉm Sơn	Vietnam	Thanh Hóa
1587923	Biên Hòa	Vietnam	Đồng Nai
1587976	Bến Tre	Vietnam	Bến Tre
1588275	Bảo Lộc	Vietnam	Lâm Đồng
1591449	Bắc Ninh	Vietnam	Bắc Ninh
1591474	Thành phố Bạc Liêu	Vietnam	Bạc Liêu
1591527	Bắc Giang	Vietnam	Bắc Giang
1591538	Bắc Kạn	Vietnam	Bắc Kạn
8991407	Đinh Văn	Vietnam	Lâm Đồng
2135171	Port-Vila	Vanuatu	Shefa
4034821	Mata-Utu	Wallis and Futuna	Circonscription d'Uvéa
4035413	Apia	Samoa	Tuamasaga
783770	Zvečan	Kosovo	Mitrovica
784097	Vushtrri	Kosovo	Mitrovica
784372	Vitina	Kosovo	Gjilan
784759	Ferizaj	Kosovo	Ferizaj
785238	Suva Reka	Kosovo	Prizren
785485	Shtime	Kosovo	Ferizaj
786712	Prizren	Kosovo	Prizren
786714	Pristina	Kosovo	Pristina
786950	Podujeva	Kosovo	Pristina
787157	Pejë	Kosovo	Pec
787456	Orahovac	Kosovo	Gjakova
788470	Llazicë	Kosovo	Prizren
788731	Leposaviq	Kosovo	Mitrovica
789225	Mitrovicë	Kosovo	Mitrovica
789228	Kosovo Polje	Kosovo	Pristina
789996	Istok	Kosovo	Pec
790674	Gjilan	Kosovo	Gjilan
790701	Glogovac	Kosovo	Pristina
791122	Dragash	Kosovo	Prizren
791580	Deçan	Kosovo	Gjakova
791646	Gjakovë	Kosovo	Gjakova
69426	Zinjibār	Yemen	Abyan
69500	Zabīd	Yemen	Muḩāfaz̧at al Ḩudaydah
69559	Yarīm	Yemen	Ibb
70225	Ta‘izz	Yemen	Ta‘izz
70979	Sayyān	Yemen	Sanaa
71137	Sanaa	Yemen	Sanaa
71273	Saḩar	Yemen	Sanaa
71334	Sa'dah	Yemen	Şa‘dah
72968	Ma'rib	Yemen	Ma’rib
73560	Laḩij	Yemen	Laḩij
74477	Ibb	Yemen	Ibb
75337	Ḩajjah	Yemen	Ḩajjah
76154	Dhī as Sufāl	Yemen	Ibb
76184	Dhamār	Yemen	Dhamār
76991	Bayt al Faqīh	Yemen	Muḩāfaz̧at al Ḩudaydah
77408	Bājil	Yemen	Muḩāfaz̧at al Ḩudaydah
77726	Ataq	Yemen	Shabwah
78428	‘Amrān	Yemen	Omran
78754	Al Mukallā	Yemen	Muḩāfaz̧at Ḩaḑramawt
79415	Al Ḩudaydah	Yemen	Muḩāfaz̧at al Ḩudaydah
79455	Al Ḩazm	Yemen	Al Jawf
79836	Al Bayḑā’	Yemen	Al Bayḑāʼ
415189	Aden	Yemen	Aden
921815	Mamoudzou	Mayotte	Mamoudzou
921900	Dzaoudzi	Mayotte	Dzaoudzi
1090225	Koungou	Mayotte	Koungou
936374	Roodepoort	South Africa	Gauteng
937136	Zeerust	South Africa	North-West
938457	Wolmaransstad	South Africa	North-West
938694	White River	South Africa	Mpumalanga
939270	Witbank	South Africa	Mpumalanga
940316	Westonaria	South Africa	Gauteng
940424	Wesselsbron	South Africa	Orange Free State
940909	Welkom	South Africa	Orange Free State
941931	Warrenton	South Africa	Northern Cape
941966	Warmbaths	South Africa	Limpopo
942470	Vryheid	South Africa	KwaZulu-Natal
942511	Vryburg	South Africa	North-West
943032	Volksrust	South Africa	Mpumalanga
943882	Virginia	South Africa	Orange Free State
943960	Viljoenskroon	South Africa	Orange Free State
944385	Vereeniging	South Africa	Gauteng
944986	Vanderbijlpark	South Africa	Gauteng
945945	Upington	South Africa	Northern Cape
946058	Mthatha	South Africa	Eastern Cape
946128	Umkomaas	South Africa	KwaZulu-Natal
946257	Ulundi	South Africa	KwaZulu-Natal
946877	Uitenhage	South Africa	Eastern Cape
946973	Tzaneen	South Africa	Limpopo
949224	Thohoyandou	South Africa	Limpopo
949282	Theunissen	South Africa	Orange Free State
949703	Thaba Nchu	South Africa	Orange Free State
949880	Tembisa	South Africa	Gauteng
951650	Stutterheim	South Africa	Eastern Cape
952192	Stilfontein	South Africa	North-West
952734	Stanger	South Africa	KwaZulu-Natal
952747	Standerton	South Africa	Mpumalanga
952865	Springs	South Africa	Gauteng
953781	Soweto	South Africa	Gauteng
954161	Somerset East	South Africa	Eastern Cape
955313	Siyabuswa	South Africa	Mpumalanga
956507	Senekal	South Africa	Orange Free State
956767	Secunda	South Africa	Mpumalanga
956878	Scottburgh	South Africa	KwaZulu-Natal
956907	Schweizer-Reneke	South Africa	North-West
957487	Sasolburg	South Africa	Orange Free State
958724	Rustenburg	South Africa	North-West
962330	Richmond	South Africa	KwaZulu-Natal
962367	Richards Bay	South Africa	KwaZulu-Natal
962847	Reitz	South Africa	Orange Free State
963230	Randfontein	South Africa	Gauteng
963516	Queenstown	South Africa	Eastern Cape
963525	Queensdale	South Africa	Eastern Cape
964137	Pretoria	South Africa	Gauteng
964315	Mokopane	South Africa	Limpopo
964349	Potchefstroom	South Africa	North-West
964406	Port Shepstone	South Africa	KwaZulu-Natal
964420	Port Elizabeth	South Africa	Eastern Cape
964432	Port Alfred	South Africa	Eastern Cape
964712	Plettenberg Bay	South Africa	Western Cape
965241	Piet Retief	South Africa	Mpumalanga
965289	Polokwane	South Africa	Limpopo
965301	Pietermaritzburg	South Africa	KwaZulu-Natal
965401	Phuthaditjhaba	South Africa	Orange Free State
965528	Phalaborwa	South Africa	Limpopo
966166	Parys	South Africa	Orange Free State
966380	Pampierstad	South Africa	North-West
967106	Oudtshoorn	South Africa	Western Cape
967476	Orkney	South Africa	North-West
968665	Modimolle	South Africa	Limpopo
970341	Nkowakowa	South Africa	Limpopo
970566	Nigel	South Africa	Gauteng
971421	Newcastle	South Africa	KwaZulu-Natal
971534	Nelspruit	South Africa	Mpumalanga
973111	Mpumalanga	South Africa	KwaZulu-Natal
973139	Mpophomeni	South Africa	KwaZulu-Natal
973709	Mossel Bay	South Africa	Western Cape
974670	Mondlo	South Africa	KwaZulu-Natal
975436	Mmabatho	South Africa	North-West
976358	Middelburg	South Africa	Eastern Cape
976361	Middelburg	South Africa	Mpumalanga
976885	Messina	South Africa	Limpopo
978895	Margate	South Africa	KwaZulu-Natal
980921	Mabopane	South Africa	Gauteng
981158	Lydenburg	South Africa	Mpumalanga
981827	Louis Trichardt	South Africa	Limpopo
982899	Lichtenburg	South Africa	North-West
984087	Lebowakgomo	South Africa	Limpopo
985011	Lady Frere	South Africa	Eastern Cape
985015	Ladybrand	South Africa	Orange Free State
986083	Kutloanong	South Africa	Orange Free State
986717	Kruisfontein	South Africa	Eastern Cape
986822	Krugersdorp	South Africa	Gauteng
986846	Kroonstad	South Africa	Orange Free State
987202	Kriel	South Africa	Mpumalanga
988290	Komatipoort	South Africa	Mpumalanga
988356	Kokstad	South Africa	KwaZulu-Natal
988698	Knysna	South Africa	Western Cape
989921	Klerksdorp	South Africa	North-West
990930	Kimberley	South Africa	Northern Cape
995202	Howick	South Africa	KwaZulu-Natal
996918	Hennenman	South Africa	Orange Free State
996930	Hendrina	South Africa	Mpumalanga
997140	Heilbron	South Africa	Orange Free State
997151	Heidelberg	South Africa	Gauteng
997751	Harrismith	South Africa	Orange Free State
1000501	Grahamstown	South Africa	Eastern Cape
1000543	Graaff-Reinet	South Africa	Eastern Cape
1001860	Giyani	South Africa	Limpopo
1002145	George	South Africa	Western Cape
1002851	Ga-Rankuwa	South Africa	North-West
1003953	Fort Beaufort	South Africa	Eastern Cape
1004109	Fochville	South Africa	North-West
1005029	eSikhawini	South Africa	KwaZulu-Natal
1005125	Ermelo	South Africa	Mpumalanga
1005544	Empangeni	South Africa	KwaZulu-Natal
1005646	eMbalenhle	South Africa	Mpumalanga
1006984	East London	South Africa	Eastern Cape
1007311	Durban	South Africa	KwaZulu-Natal
1007400	Dundee	South Africa	KwaZulu-Natal
1007514	Duiwelskloof	South Africa	Limpopo
1008261	Driefontein	South Africa	Mpumalanga
1011031	Delmas	South Africa	Mpumalanga
1011632	De Aar	South Africa	Northern Cape
1012413	Cullinan	South Africa	Gauteng
1012600	Cradock	South Africa	Eastern Cape
1013550	Christiana	South Africa	North-West
1014073	Carletonville	South Africa	Gauteng
1014489	Butterworth	South Africa	Eastern Cape
1015504	Bronkhorstspruit	South Africa	Gauteng
1015621	Brits	South Africa	North-West
1016181	Brakpan	South Africa	Gauteng
1016670	Botshabelo	South Africa	Orange Free State
1016698	Bothaville	South Africa	Orange Free State
1017780	Boksburg	South Africa	Gauteng
1018673	Bloemhof	South Africa	North-West
1018725	Bloemfontein	South Africa	Orange Free State
1019330	Bhisho	South Africa	Eastern Cape
1019704	Bethlehem	South Africa	Orange Free State
1019760	Bethal	South Africa	Mpumalanga
1020098	Benoni	South Africa	Gauteng
1020641	Beaufort West	South Africa	Western Cape
1021086	Barberton	South Africa	Mpumalanga
1021360	Ballitoville	South Africa	KwaZulu-Natal
1021396	Balfour	South Africa	Mpumalanga
1023287	Allanridge	South Africa	Orange Free State
1023309	Aliwal North	South Africa	Eastern Cape
1105726	Ekangala	South Africa	Gauteng
1105776	Midrand	South Africa	Gauteng
1105777	Centurion	South Africa	Gauteng
3359041	Worcester	South Africa	Western Cape
3361025	Stellenbosch	South Africa	Western Cape
3361934	Saldanha	South Africa	Western Cape
3363094	Paarl	South Africa	Western Cape
3364346	Malmesbury	South Africa	Western Cape
3364682	Lansdowne	South Africa	Western Cape
3365083	Kraaifontein	South Africa	Western Cape
3366880	Hermanus	South Africa	Western Cape
3367513	Grabouw	South Africa	Western Cape
3369129	Ceres	South Africa	Western Cape
3369157	Cape Town	South Africa	Western Cape
3370352	Atlantis	South Africa	Western Cape
7302802	Rondebosch	South Africa	Western Cape
8604596	Retreat	South Africa	Western Cape
8764562	Diepsloot	South Africa	Gauteng
175499	Nchelenge	Zambia	Luapula
176146	Mbala	Zambia	Northern
176555	Kawambwa	Zambia	Luapula
898188	Siavonga	Zambia	Southern
898905	Sesheke	Zambia	Western
899274	Samfya	Zambia	Luapula
899825	Petauke	Zambia	Eastern
901344	Ndola	Zambia	Copperbelt
904422	Mumbwa	Zambia	Central
905395	Mufulira	Zambia	Copperbelt
905846	Mpika	Zambia	Northern
906044	Monze	Zambia	Southern
906054	Mongu	Zambia	Western
907111	Mazabuka	Zambia	Southern
907770	Mansa	Zambia	Luapula
909137	Lusaka	Zambia	Lusaka
909863	Luanshya	Zambia	Copperbelt
910111	Livingstone	Zambia	Southern
911148	Kitwe	Zambia	Copperbelt
912764	Kasama	Zambia	Northern
913029	Kapiri Mposhi	Zambia	Central
913613	Kansanshi	Zambia	North-Western
914959	Kalulushi	Zambia	Copperbelt
915883	Kafue	Zambia	Lusaka
916095	Kabwe	Zambia	Central
917748	Choma	Zambia	Southern
918702	Chipata	Zambia	Eastern
919009	Chingola	Zambia	Copperbelt
919544	Chililabombwe	Zambia	Copperbelt
878549	Zvishavane	Zimbabwe	Masvingo
879431	Victoria Falls	Zimbabwe	Matabeleland North
881164	Shurugwi	Zimbabwe	Midlands
882100	Rusape	Zimbabwe	Manicaland
882599	Redcliff	Zimbabwe	Midlands
884141	Norton	Zimbabwe	Mashonaland West
884979	Mutare	Zimbabwe	Manicaland
886763	Masvingo	Zimbabwe	Masvingo
886990	Marondera	Zimbabwe	Mashonaland East
888710	Kwekwe	Zimbabwe	Midlands
889191	Karoi	Zimbabwe	Mashonaland West
889215	Kariba	Zimbabwe	Mashonaland West
889453	Kadoma	Zimbabwe	Mashonaland West
889942	Hwange	Zimbabwe	Matabeleland North
890299	Harare	Zimbabwe	Harare
890422	Gweru	Zimbabwe	Midlands
890983	Gokwe	Zimbabwe	Midlands
893485	Chiredzi	Zimbabwe	Masvingo
893549	Chipinge	Zimbabwe	Manicaland
893697	Chinhoyi	Zimbabwe	Mashonaland West
894239	Chegutu	Zimbabwe	Mashonaland West
894701	Bulawayo	Zimbabwe	Bulawayo
895061	Bindura	Zimbabwe	Mashonaland Central
895269	Beitbridge	Zimbabwe	Matabeleland South
1085510	Epworth	Zimbabwe	Harare
1106542	Chitungwiza	Zimbabwe	Harare
537737	Kuznetsk	Russia	Penza
4389418	Hannibal	United States	Missouri
5333689	Campbell	United States	California
792078	Čačak	Serbia	Central Serbia
8097131	Oak Hill	United States	Virginia
703448	Kiev	Ukraine	Kyiv City
5175865	Warren	United States	Ohio
2959681	Achim	Germany	Lower Saxony
2914929	Groß-Umstadt	Germany	Hesse
2643743	London	United Kingdom	England
582182	Anapa	Russia	Krasnodarskiy
3451190	Rio de Janeiro	Brazil	Rio de Janeiro
2950159	Berlin	Germany	Berlin
524901	Moscow	Russia	Moscow
498817	Saint Petersburg	Russia	St.-Petersburg
2759794	Amsterdam	Netherlands	North Holland
5785243	Aberdeen	United States	Washington
2867543	Münster	Germany	North Rhine-Westphalia
5419384	Denver	United States	Colorado
5368361	Los Angeles	United States	California
5506956	Las Vegas	United States	Nevada
5417598	Colorado Springs	United States	Colorado
542420	Krasnodar	Russia	Krasnodarskiy
2304931	Akwatia	Ghana	Eastern
993800	Johannesburg	South Africa	Gauteng
\.


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 186
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 1, false);


--
-- TOC entry 2177 (class 2606 OID 55688)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 1259 OID 55735)
-- Name: idx_cities_country_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cities_country_en ON cities USING btree (country_en);


--
-- TOC entry 2179 (class 1259 OID 55736)
-- Name: idx_cities_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cities_name_en ON cities USING btree (name_en);


--
-- TOC entry 2180 (class 1259 OID 55737)
-- Name: idx_cities_sub_country_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cities_sub_country_en ON cities USING btree (sub_country_en);


-- Completed on 2017-09-20 13:27:59 MSK

--
-- PostgreSQL database dump complete
--

