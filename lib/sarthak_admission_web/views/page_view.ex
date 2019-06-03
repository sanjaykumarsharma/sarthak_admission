defmodule SarthakAdmissionWeb.PageView do
  use SarthakAdmissionWeb, :view

  def get_secondary_subjects() do
    [
      {"Choose Subject", ""},
      {"ADDITIONAL MATHAMETICS", "ADDLM"},
      {"ADDITIONAL ENGLISH", "ADENG"},
      {"ADVANCED MATHEMATICS", "ADVM"},
      {"ARTS", "ART"},
      {"BENGALI", "BENG"},
      {"BENGALI(A)", "BENG A"},
      {"BENGALI (B)", "BENG B"},
      {"BIOLOGY", "BIO"},
      {"BUSINESS MATHEMATICS", "BM"},
      {"CHEMISTRY", "CHM"},
      {"COMPUTER APPLICATION", "CMAP"},
      {"COMMERCE", "COM"},
      {"COMMERCIAL APPLICATION", "COMAP"},
      {"DRAWING", "DRW"},
      {"ENGLISH ASSAMESE", "EA"},
      {"ECONOMICS APPLICATIONS", "ECOA"},
      {"ADV. MATHS.", "ELECT MATH"},
      {"ENVIORMENTAL MANAGEMENT", "EM"},
      {"ENGLISH", "ENG"},
      {"ENGLISH (A)", "ENG (A)"},
      {"ENGLISH (B)", "ENG (B)"},
      {"ALTERNETIVE ENGLISH", "ENGALTR"},
      {"ENGLISH CORE", "ENGCOR"},
      {"ENVIRONMENTAL APPLICATION", "ENVAPL"},
      {"ENVIRONMENTAL EDUCATION", "EV"},
      {"ENVIORMENTAL SCIENCE", "EVS"},
      {"FASHION DESIGNING", "FADGN"},
      {"FOUNDATION OF IT", "FN. IT"},
      {"GEOGRAPHY", "GEO"},
      {"GEOLOGY", "GEOLGY"},
      {"GENERAL STUDIES", "GS"},
      {"HISTORY CIVICS GEOGRAPHY", "HCG"},
      {"HEALTH EDUCATION", "HE EDU"},
      {"HINDI", "HIN"},
      {"HINDI (A)", "HIN (A)"},
      {"HINDI (B)", "HIN (B)"},
      {"HINDI+E3NGLISH", "HINENG"},
      {"HINDI+URDU", "HINURD"},
      {"HISTORY", "HIS"},
      {"HISTORY CIVICS SCINCE GEOGRAPHY", "HISCIVSCGEO"},
      {"HOME SCIENCE", "HSC"},
      {"HISTORY &amp; GEOGRAPHY", "HSGO"},
      {"INFORMATION &amp; COMMUNICATION TECHNOLOGY", "ICT"},
      {"INTRODUCTORY I T", "IIT"},
      {"LIFESCIENCE", "LSC"},
      {"MATHEMATICS", "MATH"},
      {"MECHANICS", "MECHN"},
      {"MAITHILI", "MIL"},
      {"MULTY MEDIA", "MLM"},
      {"MUSIC", "MUS"},
      {"BOOK KEEPING", "OES"},
      {"ORIA", "ORY"},
      {"PHYSICS,CHEMISTRY &amp; BIOLOGY", "PHCHBO"},
      {"PHY &amp; HEALTH EDUCATION", "PHE"},
      {"PHYSICAL SCIENCE", "PHS"},
      {"PHYSICS", "PHY"},
      {"POLSCIENCE", "POLSC"},
      {"PERSIAN", "PRS"},
      {"PISCICULTURE", "PSCL"},
      {"SANSKRIT", "SANS"},
      {"SCIENCE AND TECHNOLOGY", "SCANDTECH"},
      {"SCIENCE", "SCN"},
      {"SOCIAL SCIENCE", "SOCSC"},
      {"SOCIAL STUDIES", "SST"},
      {"SUPW", "SUPW"},
      {"TECHNICAL DRAWING APPLICATION", "TDA"},
      {"URDU", "UR"},
      {"URDU A", "URD (A)"},
      {"URDU B", "URD (B)"},
      {"WORK EDUCATION", "WE"},
      {"WORK EDUCATION PHISICAL EDUCATION", "WORKEPHE"}
    ]
  end

  def get_higher_secondary_subjects() do
    [
      {"Choose Subject", ""},
      {"ACCOUNTANCY", "ACC"},
      {"ACOUNTENCY", "ACCT"},
      {"ADDITIONAL MATHAMETICS", "ADDLM"},
      {"APP/COMMERCIAL ART", "APP/COMMART"},
      {"AUTOMOBILE MECHANICS", "AUMC"},
      {"AOTOMOBILE SERVICE &amp; MAINTANENCE", "AUSM"},
      {"BENGALI", "BENG"},
      {"BENGALI(A)", "BENGA"},
      {"BENGALI(B)", "BENGB"},
      {"BIOLOGY", "BIOG"},
      {"BIOLOGICAL SCIENCE", "BIOS"},
      {"BUSINESS MATHEMATICS", "BM"},
      {"BUISNESS ORGANISATION MANAGMENT", "BOM"},
      {"BUISNESS ORGANISATION &amp; MANAGEWMENT", "BOM,"},
      {"Besic science", "BS22"},
      {"BUISNESS STYDIES", "BSTD"},
      {"COMPUTER ASSEMBLY &amp; MAINTENANCE", "CAAM"},
      {"COMMUNICATIVE ENGLISH", "CEN2"},
      {"COMPUTER FUNDAMENTAL &amp; APPLICATION", "CFAP"},
      {"CHEMISTRY", "CHEM"},
      {"COMPUTER APPLICATION", "CMAP"},
      {"COMMERCE", "COM"},
      {"MODERN COMPUTER APPLICATIONS", "COMA"},
      {"COMMERCIAL ARTS", "COMMA"},
      {"COMPUTER SCIENCE", "COMS"},
      {"ECONOMIC GEOGRAPHY", "ECOG"},
      {"ECONOMICS", "ECON"},
      {"EDUCATION", "EDCN"},
      {"ENGLISH", "ENG"},
      {"ENGLISH CORE", "ENG CORE"},
      {"ENGLISH (A)", "ENGA"},
      {"ENGLISH(B)", "ENGB"},
      {"ENGLISH CORE", "ENGCOR"},
      {"ENGLISH+HINDI", "ENGHIN"},
      {"CEN2", "ENGLISH COMMUNICATIV"},
      {"ENVIORNMENTAL STUDIES", "ENST"},
      {"ENVIRONMENTAL EDUCATION", "ENVE"},
      {"ENVIRONMENTAL SCIENCE", "EVS"},
      {"ELECTRICAL WARING AND INSTALATION", "EWAI"},
      {"GEOGRAPHY", "GEO"},
      {"GEOLOGY", "GEOGLY"},
      {"GEOM. &amp; MECHANICAL DRAWING", "GMD"},
      {"HINDI+ MAITHILI", "HIMA"},
      {"HINDI(A)", "HIN(A)"},
      {"HINDI(B)", "HINB"},
      {"HINDI", "HIND"},
      {"HINDI+ENGLISH", "HINENG"},
      {"HISTORY", "HIS"},
      {"HOME SCINCE", "HSC"},
      {"INFORMATICS PRACTICES", "INFPRC"},
      {"MATHEMATICS", "MATH"},
      {"maintenance and repair of electrical domestic appl", "MRED"},
      {"MUSIC HIND. VOCAL", "MUHINVOC"},
      {"MUSIC", "MUS"},
      {"NUTRATION", "NUTN"},
      {"PAINTING", "PAIT"},
      {"PC MAINTENANCE", "PCM"},
      {"PHILOSOPHY", "PHIL"},
      {"PHYSICAL EDUCATION", "PHYED"},
      {"PHYSICS", "PHYS"},
      {"POLITICAL SCINCE", "PLSC"},
      {"POLSCIENCE", "POLSC"},
      {"PROJECT", "PRJ"},
      {"R B NON HINDI ALTERNATIVE URDU", "RB URDU"},
      {"RB NON-HINDI/MAITHILI", "RB/MAI"},
      {"R B NON-HINDI (ALTERNATIVE ENGLISH)", "RBN-HAE"},
      {"SANSKRIT", "SNSK"},
      {"SPORTS &amp; PHYSICAL EDUCATION", "SPRTS"},
      {"STATISTICS", "STAT"},
      {"SUPW", "SUPW"},
      {"TEDG", "TECHNICAL DRAWING"},
      {"TECHNICAL DRAWING", "TEDG"},
      {"URDU", "UR"},
      {"URDU+HINDI", "URDHIN"}
    ]
  end

  def get_higher_secondary_board() do
    [
      "Board of Intermediate Education, Andhra Pradesh",
      "Andhra Pradesh Open School Society",
      "Assam Higher Secondary Education Council",
      "Assam Sanskrit Board",
      "Bihar Board of Open Schooling and Examination",
      "Bihar Intermediate Education Council, Patna",
      "Bihar Sanskrit Shiksha Board, Patna",
      "Bihar School Examination Board",
      "Bihar State Madrasa Education Board, Patna",
      "Board of High School &amp; Intermediate Education Uttar Pradesh",
      "Board of School Education Haryana",
      "Board of Secondary Education, Rajasthan",
      "Central Board of Secondary Education",
      "Chhattisgqrh Board of Secondary Education",
      "Chhattisgarh Madrasa Board",
      "Chhattisgarh Sanskrit Board",
      "Chhattisgarh State Open School",
      "Council for the Indian School Certificate Examinations",
      "Council of Higher Secondary Education, Manipur",
      "Council of Higher Secondary Education, Odisha",
      "Uttar Pradesh State Open School Board",
      "The Kerala State Higher Education Council",
      "Goa Board of Secondary &amp; Higher Secondary Education",
      "Gujarat secondary &amp; Higher Secondary Education Board",
      "Himachal Pradesh Board of School Education",
      "Jammu &amp; Kashmir State Board of School Education",
      "Jharkhand Academic Council",
      "Karnataka Board of the Pre-University Education",
      "Karnataka Open School (subsidiary of Karnataka Secondary Education Examination Borad)",
      "Karnataka secondary Education Examination Borad",
      "Kerala State Open School, Thiruvananthapuram",
      "Madhya Pradesh Board of Secondary Education",
      "Madhya Pradesh State Open School Education Board",
      "Maharashtra State Board of Secondary and Higher Secondary Education",
      "Meghalaya Board of School Education",
      "Mizoram Board of School Education",
      "Nagaland Board of School Education",
      "National Institute of Open Schooling (formarly National Open School)",
      "Punjab School Education Board",
      "Rajasthan State Open School, Jaipur",
      "Rashtriya Sanskrit Sansthan",
      "School Education Department, Government of Tamil Nadu",
      "Telangana State Board of Intermediate Education",
      "The Haryana open school (subsidiary of Board of School Education Haryana)",
      "The Jammu &amp; Kashmir State Open School",
      "The West Bengal Council of Rabindra Open Schooling",
      "Tripura Board of Secondary Education",
      "Uttranchal Siksha evam Pariksha Parishad (Education Board), Ramnagar, Nainital",
      "Vocational Higher secondary Education Department, Government of Kerala",
      "West Bengal Board of Madrasah Education",
      "West Bengal council of Higher secondary Education",
      "West Bengal State Council of Vocational Education &amp; Training"
    ]
  end

  def hostal_required(param) do
    case param do
      true ->
        "Yes"

      false ->
        "No"
    end
  end

  def economically_backward(param) do
    case param do
      true ->
        "Yes"

      false ->
        "No"
    end
  end

  def student_permanent_address(p_address, p_ps, p_district) do
    address = p_address
  end

  def student_communication_address(c_address, c_ps, c_dist) do
    address = c_address
  end
end
