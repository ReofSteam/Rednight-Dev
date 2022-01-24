-- Kaiserreich defines adapted for Red Night
-- Commented out items are under re-evaluation

-- Links
NDefines.NWiki.BASE_URL = "https://rednight.fandom.com/wiki/Red_Night:_A_Nightmare_in_Europe"
-- Vanilla is "http://www.hoi4wiki.com/"

-- Game
NDefines.NGame.END_DATE = "1985.1.1.1"										-- Vanilla is 1949.1.1.1
NDefines.NGame.HANDS_OFF_START_TAG = "BHU"									-- Vanilla is URG
NDefines.NGame.DECISION_ALERT_TIMEOUT_DAYS = 60								-- Vanilla is 30
NDefines.NCountry.BASE_STABILITY_WAR_FACTOR = -0.1							-- Vanilla is -0.3
NDefines.NCountry.BASE_STABILITY_PARTY_POPULARITY_FACTOR = 0.0				-- Vanilla is 0.15
NDefines.NCountry.MIN_STABILITY = -1.0										-- Vanilla is 0.0
NDefines.NCountry.WAR_SUPPORT_OFFNSIVE_WAR = -0.1							-- Vanilla is -0.2
NDefines.NCountry.EVENT_PROCESS_OFFSET = 5									-- Vanilla is 20
NDefines.NCountry.CAPITULATE_STOCKPILES_RATIO = 0.75						-- Vanilla is 0.5
NDefines.NPolitics.BASE_POLITICAL_POWER_INCREASE = 1.5						-- Vanilla is 2
NDefines.NBuildings.INFRASTRUCTURE_RESOURCE_BONUS = 0.05					-- Vanilla is 0.1
NDefines.NBuildings.OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 1              -- Vanilla is 0.5
NDefines.NCountry.SPECIAL_FORCES_CAP_BASE = 0.1								-- Vanilla is 0.05
NDefines.NCountry.SPECIAL_FORCES_CAP_MIN = 32								-- Vanilla is 24
NDefines.NMilitary.EQUIPMENT_COMBAT_LOSS_FACTOR = 0.45						-- Vanilla is 0.7

NDefines.NCountry.FEMALE_UNIT_LEADER_BASE_CHANCE = {
	-- applies as a factor to female unit leader randomization
	-- the values needs to be zero if you don't actually have random portraits
	0.0, -- navy leaders													-- Vanilla is 0.0
	0.0, -- army leaders													-- Vanilla is 0.0
	0.7, -- operatives														-- Vanilla is 1.0
}

-- Resistance
NDefines.NResistance.RESISTANCE_TARGET_MODIFIER_PER_STABILITY_LOSS = 0.1	-- Vanilla is 0.2
NDefines.NResistance.SUPPRESSION_NEEDED_BY_RESISTANCE_POINT = 0.5			-- Vanilla is 0.75
NDefines.NResistance.GARRISON_MANPOWER_LOST_BY_ATTACK = 0.012				-- Vanilla is 0.018

-- Annexations
NDefines.NBuildings.DESTRUCTION_COOLDOWN_IN_WAR = 70						-- Vanilla is 30

-- Diplomacy
NDefines.NDiplomacy.MAX_TRUST_VALUE = 200									-- Vanilla is 100
NDefines.NDiplomacy.MIN_TRUST_VALUE = -200									-- Vanilla is -100
NDefines.NDiplomacy.MAX_OPINION_VALUE = 200									-- Vanilla is 100
NDefines.NDiplomacy.MIN_OPINION_VALUE = -200								-- Vanilla is -100
NDefines.NDiplomacy.VERY_GOOD_OPINION = 100									-- Vanilla is 50
NDefines.NDiplomacy.VERY_BAD_OPINION = -100									-- Vanilla is -50
NDefines.NDiplomacy.FRONT_IS_DANGEROUS = 0									-- Vanilla is -100

-- Trade
NDefines.NTrade.BASE_TRADE_FACTOR = 100										-- Vanilla is 150

-- World Tension
NDefines.NDiplomacy.TENSION_STATE_VALUE = 0									-- Vanilla is 2
NDefines.NDiplomacy.TENSION_CIVIL_WAR_IMPACT = 0							-- Vanilla is 0.2
NDefines.NDiplomacy.TENSION_NO_CB_WAR = 0									-- Vanilla is 15
NDefines.NDiplomacy.TENSION_CB_WAR = 0										-- Vanilla is 5
NDefines.NDiplomacy.TENSION_ANNEX_NO_CLAIM = 0								-- Vanilla is 2
NDefines.NDiplomacy.TENSION_ANNEX_CLAIM = 0									-- Vanilla is 1
NDefines.NDiplomacy.TENSION_ANNEX_CORE = 0								  	-- Vanilla is 0.5
NDefines.NDiplomacy.TENSION_PUPPET = 0										-- Vanilla is 2
NDefines.NDiplomacy.TENSION_GENERATE_WARGOAL = 0							-- Vanilla is 1
NDefines.NDiplomacy.TENSION_VOLUNTEER_FORCE_DIVISION = 0					-- Vanilla is 0.5
NDefines.NDiplomacy.TENSION_DECAY = 0.1										-- Vanilla is 0.1
NDefines.NDiplomacy.TENSION_SIZE_FACTOR = 0									-- Vanilla is 1.0

-- Peace Conference
NDefines.NDiplomacy.BASE_PEACE_PUPPET_FACTOR = 0							-- Vanilla is 100
NDefines.NDiplomacy.BASE_PEACE_LIBERATE_FACTOR = 0							-- Vanilla is 100
NDefines.NDiplomacy.PEACE_SCORE_PER_PASS = 1.0								-- Vanilla is 0.2
NDefines.NDiplomacy.PEACE_MIN_SCORE = 0.5									-- Vanilla is 0.3
NDefines.NCountry.STATE_OCCUPATION_COST_MULTIPLIER = 0.10					-- Vanilla is 0.01

-- Air
NDefines.NAir.NAVAL_STRIKE_DAMAGE_TO_STR = 1.0								-- Vanilla is 2.0
NDefines.NAir.NAVAL_STRIKE_DAMAGE_TO_ORG = 1.25								-- Vanilla is 2.5

-- Volunteers
NDefines.NAI.SEND_VOLUNTEER_EVAL_BASE_DISTANCE = 1000.0  					-- Vanilla is 175.0
NDefines.NAI.SEND_VOLUNTEER_EVAL_CONTAINMENT_FACTOR = 0						-- Vanilla is 0.1
NDefines.NDiplomacy.VOLUNTEERS_DIVISIONS_REQUIRED = 0						-- Vanilla is 30
NDefines.NDiplomacy.VOLUNTEERS_PER_TARGET_PROVINCE = 0.025					-- Vanilla is 0.05
NDefines.NDiplomacy.VOLUNTEERS_PER_COUNTRY_ARMY = 0.025						-- Vanilla is 0.05

-- Graphics
NDefines.NGraphics.POLITICAL_GRID_SMALL_BOX_LIMIT = 12						-- Vanilla is 6
NDefines.NGraphics.COUNTRY_FLAG_SMALL_TEX_WIDTH = 10						-- Vanilla is 10
NDefines.NGraphics.COUNTRY_FLAG_TEX_MAX_SIZE = 2048							-- Vanilla is 256
NDefines.NGraphics.COUNTRY_FLAG_SMALL_TEX_MAX_SIZE = 512					-- Vanilla is 64
NDefines.NGraphics.COUNTRY_FLAG_STRIPE_TEX_MAX_WIDTH = 11					-- Vanilla is 10
NDefines.NGraphics.COUNTRY_FLAG_STRIPE_TEX_MAX_HEIGHT = 8196				-- Vanilla is 2048
NDefines.NGraphics.COUNTRY_FLAG_LARGE_STRIPE_MAX_HEIGHT = 24000				-- Vanilla is 8192
NDefines.NGraphics.VICTORY_POINT_MAP_ICON_TEXT_CUTOFF = {200, 350, 600}  	-- Vanilla is 100, 250, 500
NDefines.NGraphics.VICTORY_POINTS_DISTANCE_CUTOFF = {300, 500, 1000} 		-- Vanilla is 300, 500, 1500

-- General AI
NDefines.NAI.NEUTRAL_THREAT_PARANOIA = 0									-- Vanilla is 10
NDefines.NAI.DIFFERENT_FACTION_THREAT = 0									-- Vanilla is 30
NDefines.NAI.RESEARCH_BONUS_FACTOR = 1.5									-- Vanilla is 0.9
NDefines.NAI.MIN_AI_SCORE_TO_TRADE_LAW_OVERRIDE_HARD_CODED_SCORE = 0.0		-- Vanilla is 1000.0

-- Battleplan AI
NDefines.NAI.HOUR_BAD_COMBAT_REEVALUATE = 42								-- Vanilla is 100
NDefines.NAI.PLAN_ACTIVATION_SUPERIORITY_AGGRO = 1.2						-- Vanilla is 1.0
NDefines.NAI.AI_FRONT_MOVEMENT_FACTOR_FOR_READY = 0.1						-- Vanilla is 0.25
NDefines.NAI.PLAN_VALUE_TO_EXECUTE = -0.2									-- Vanilla is -0.5
NDefines.NAI.MIN_PLAN_VALUE_TO_MICRO_INACTIVE = 0.1							-- Vanilla is 0.2

NDefines.NAI.VP_LEVEL_IMPORTANCE_HIGH = 25									-- Not defined in vanilla
NDefines.NAI.VP_LEVEL_IMPORTANCE_MEDIUM = 10								-- Vanilla is 10
NDefines.NAI.VP_LEVEL_IMPORTANCE_LOW = 3									-- Not defined in vanilla

-- Combat AI
NDefines.NAI.MAX_DIST_PORT_RUSH = 40.0										-- Vanilla is 0.2
NDefines.NAI.FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.3			-- Vanilla is 0.5
NDefines.NAI.HEAVILY_FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.3	-- Vanilla is 0.5
NDefines.NAI.INVASION_DISTANCE_RANDOMNESS = 400								-- Vanilla is 300
NDefines.NMilitary.PLAN_EXECUTE_CAREFUL_MAX_FORT = 4						-- Vanilla is 5
NDefines.NAI.ATTACK_HEAVILY_DEFENDED_LIMIT = 1.1							-- Vanilla is 0.5

-- Naval AI
NDefines.NAI.MAX_DISTANCE_NALAV_INVASION = 300.0							-- Vanilla is 200
NDefines.NAI.ENEMY_NAVY_STRENGTH_DONT_BOTHER = 1.5							-- Vanilla is 2.5
NDefines.NAI.NAVAL_INVADED_AREA_PRIO_MULT = 4.0								-- Vanilla is 2.0

-- Production AI
NDefines.NAI.MANPOWER_RESERVED_THRESHOLD = 0.1 								-- Undefined in vanilla
NDefines.NAI.DEPLOY_MIN_TRAINING_WAR_FACTOR = 0.05							-- Vanilla is 0.25
NDefines.NAI.DEPLOY_MIN_EQUIPMENT_WAR_FACTOR = 0.80							-- Vanilla is 90
NDefines.NAI.MIN_FIELD_STRENGTH_TO_BUILD_UNITS = 0.6						-- Vanilla is 0.7
NDefines.NAI.MIN_MANPOWER_TO_BUILD_UNITS = 0.6								-- Vanilla is 0.7
NDefines.NAI.UPGRADE_DIVISION_RELUCTANCE = 14								-- Vanilla is 7
NDefines.NAI.VARIANT_UPGRADE_MIN_XP = 1000									-- Vanilla is 50

