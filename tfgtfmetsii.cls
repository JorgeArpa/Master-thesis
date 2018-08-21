\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tfgtfmetsii}[2017/01/15 TFG/TFM para la ETSII de la UPV]
\LoadClass[10pt]{book}
\usepackage{minitoc}
\usepackage{ebgaramond,newtxmath,ebgaramond-maths}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lettrine}
\DeclareFontFamily{T1}{lmr}{}
\DeclareFontShape{T1}{lmr}{m}{n}{<->ec-lmr5}{}
\title{Automatic representatino of the electrical grid layout \\}
\author{Jorge Arpa Garzaran} \let\Author\@author
\date{Septmber 2018} \let\Date\@date


%\usepackage{footnote}


% ------------------------------------------------------

\RequirePackage{ifthen}

% ------------------------------------------------------

\newboolean{TFG}\setboolean{TFG}{false}
\newboolean{TFM}\setboolean{TFM}{false}


\newboolean{DistanciesEquacions}\setboolean{DistanciesEquacions}{true}

\newboolean{RM}\setboolean{RM}{false}
\newboolean{SF}\setboolean{SF}{false}


\newboolean{valencia}\setboolean{valencia}{false}
\newboolean{castellano}\setboolean{castellano}{false}
\newboolean{english}\setboolean{english}{false}


% ------------------------------------------------------


\DeclareOption{tfg}{\setboolean{TFG}{true}}
\DeclareOption{tfm}{\setboolean{TFM}{true}}


\DeclareOption{rm}{\setboolean{RM}{true}}
\DeclareOption{sf}{\setboolean{SF}{true}}


\DeclareOption{nomathskip}{\setboolean{DistanciesEquacions}{false}}

\DeclareOption{castellano}{
	\setboolean{castellano}{true}
	\setboolean{valencia}{false}
	\setboolean{english}{false}
}
\DeclareOption{valencia}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{true}
	\setboolean{english}{false}
	}
\DeclareOption{english}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{false}
	\setboolean{english}{true}
	}

% ------------------------------------------------------

\DeclareOption*{\ClassWarning{tfgtfmetsii}{No se puede procesar la opci�n: ?\CurrentOption?}}

% ------------------------------------------------------

\ExecuteOptions{tfg,rm,castellano}
\ProcessOptions\relax


% ------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage{calc}
%\RequirePackage{hyperref}


% ---------------------------------------------------------------------
% Tipus de lletra


\ifTFG
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
	\newcommand{\TF}{TFG\xspace}
	\newcommand{\Grado}{Grado\xspace}
	\newcommand{\maxpag}{80\xspace}
	\newcommand{\enlacedescargas}{\href{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}}
	\newcommand{\urldescargas}{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}
\fi

\ifTFM
    %para font family dos opciones:
    %garamond ugm (a modificar negrita y cursiva de los titulos)
    %roman modern cmr
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\fontfamily{cmr}\selectfont}
	\renewcommand{\TF}{TFM\xspace}
	\renewcommand{\Grado}{M�ster\xspace}
	\renewcommand{\maxpag}{120\xspace}
	\renewcommand{\enlacedescargas}{\href{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}}
	\renewcommand{\urldescargas}{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}
\fi


% ---------------------------------------------------------------------
\ifSF
	\renewcommand{\familydefault}{\sfdefault}
\else
	\renewcommand{\familydefault}{\rmdefault}
\fi

\renewcommand*{\ttdefault}{qcr}

% ---------------------------------------------------------------------
% Format de p�gina

\RequirePackage{geometry}


	


\newlength{\myheadsep}
\setlength{\myheadsep}{3cm-1.25cm-15pt}

\geometry{ 
	a4paper, twoside,         	% A4 a doble cara
	hmargin = {2.5cm, 2.5cm}, 	% {Izquierdo, Derecho}
	vmargin = {3cm, 3cm}, % {Superior, Inferior} 
	%includehead, includefoot, 	% Incluyendo encabezado y pie
	headsep = \myheadsep,  % Separaci?n entre el encabezado y el texto
	footskip = 1.75cm,        	% Separaci?n entre el texto y el pie
	headheight = 15pt
}


% ---------------------------------------------------------------------
% Cap�aleres i peus de p�gina

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}

\fancyhead[LE,RO]{\itshape\thepage} % Esborra la configuraci? de la cap?alera
\fancyhead[RE]{\itshape\nouppercase{\leftmark}}
\fancyhead[LO]{\itshape\nouppercase{\rightmark}}
%\fancyfoot{} % Esborra la configuraci? del peu


\ifTFG

%	\fancyhead[C]{\TFGtitulo}

\fi

\ifTFM

%	\fancyhead[C]{\TFMtitulo - \thesection }

\fi


\fancyfoot{}

\renewcommand{\headrulewidth}{0.25pt}
\renewcommand{\footrulewidth}{0pt}	




% ---------------------------------------------------------------------
% Format de par�graf y maquetaci�



\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}
\linespread{1.15}

\setlength{\widowpenalty}{10000pt}
\setlength{\clubpenalty}{10000pt}

\raggedbottom


% ---------------------------------------------------------------------
% Mojora los t?tulos de las figuras y tablas

\RequirePackage{caption}
\renewcommand{\captionlabelfont}{\bfseries\small}
\renewcommand{\captionfont}{\small}

% ------------------------------------------------------------------------
% Formato de las secciones

\RequirePackage[
	raggedright,
	compact,
	nobottomtitles*, % Evita que queden t?tols solts al final de la p?gina
	clearempty, % Modifica \cleardoublepage per a que els fulls parells buides siguen blanques
	]{titlesec}

% ------------------------------------------------------------------------

\titleformat{\part}
	[display]
	{\thispagestyle{empty}\filcenter
	\tolerance=10000\hyphenpenalty=10000}
	{\fontsize{18}{20}\bfseries\partname\enspace\thepart}
	{1pc}
	{\fontsize{24}{30}\bfseries}

% ------------------------------------------------------------------------

\titleformat{\chapter}
	[display]
	{\normalfont\Large\filcenter}
	{\raggedleft\fontsize{18}{20}\bfseries\chaptertitlename\enspace\thechapter}
	{-0ex}
	{\raggedleft\fontsize{24}{30}\bfseries}%\usefont{T1}{cmss}{n}{n}\selectfont
	[\vspace{1cm}]


% ------------------------------------------------------------------------


	% ------------------------------------------------------------------------
	
	\titleformat{\section}
		[hang]
		{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
		{\normalfont\Large\bfseries\thesection}
		{1em}
		{\Large\bfseries}
	
	% ------------------------------------------------------------------------
	
	\titleformat{\subsection}
		[hang]
		{\vspace{1.5ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
		{\normalfont\large\bfseries\itshape\thesubsection}
		{1em}
		{\large\bfseries\itshape}
		[\vspace{0.75ex}]
	


% ------------------------------------------------------------------------

    \titleformat{\subsubsection}
    	[hang]
    	{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
    	{\normalfont\normalsize\itshape\thesubsubsection}
    	{1em}
    	{\normalsize\itshape}
    	[\vspace{0.75ex}]
        
        \titleformat{\subsubsubsection}
    	[hang]
    	{\vspace{1ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
    	{\normalfont\normalsize\itshape\thesubsubsubsection}
    	{1em}
    	{\normalsize\itshape}
    	[\vspace{0.5ex}]

% -------------------------------------------------------
% Para controlar la numeraci?n y formato de la tabla de contenidos

\setcounter{tocdepth}{4}

\RequirePackage{titletoc}

%\titlecontents{part} 
	%[0em] 
	%{\addvspace{2.5ex}\Large\bfseries} 
	%{\partname\enspace\thecontentslabel\enspace} 
	%{} 
	%{\hfill\contentspage} 
	%[\vspace{-1ex}]
	
\titlecontents{chapter} 
	[0em] 
	{\addvspace{2ex}\mdseries\Large\bfseries} 
	{\thecontentslabel\enspace} 
	{} 
	{\hfill\contentspage}
	[\vspace{-1ex}]
	
\titlecontents{section} 
	[1.5em] 
	{\normalfont\addvspace{.5ex}\normalsize} 
	{\thecontentslabel\enspace} 
	{} 
	{\titlerule*[0.5pc]{.}\contentspage} 
	[\vspace{-1.5ex}]	
	
\titlecontents{subsection} 
	[3.5em] 
	{\normalfont\vspace{.25ex}\small}
	{\thecontentslabel\enspace} 
	{} 
	{\titlerule*[0.5pc]{.}\contentspage} 
	[\vspace{-1.5ex}]
	
\titlecontents{subsubsection}
    [6.5em]
    {\normalfont\vspace{.25ex}\small}
    {\thecontentslabel\enspace}
    {}
    {\titlerule*[0.5pc]{.}\contentspage}
    [\vspace{-1.5ex}]




% ------------------------------------------------------------------------


\RequirePackage{enumitem}
\setlist[1]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}
\setlist[2]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}


% ------------------------------------------------------------------------

\RequirePackage{mathtools}

\ifDistanciesEquacions
\AtBeginDocument
	{
	% ---------------------------------------------------
	% Dist?ncies de les equacions al text
	
	% Per a les equacions normals
	\abovedisplayshortskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayshortskip = 2.0ex plus 1ex minus 0.0ex
	
	% Per a les equacions en varies l?nies
	\abovedisplayskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayskip = 2.0ex plus 1ex minus 0.0ex
	}
\fi

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
