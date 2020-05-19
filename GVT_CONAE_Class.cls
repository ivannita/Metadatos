%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Template para los documentos internos de la GVT
%%
%%
%%   Autores: Rocco, Leandro Fabian
%%            Tropper, Ivanna
%%   Fecha: 30/12/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GVT_CONAE_Class}[30/12/2019 GVT_CONAE_Class]
\LoadClass[11pt]{article} % La clase hereda de "article"

%****************************************************************************************************************
% Paquetes requeridos por la clase para su correcto funcionamiento
%****************************************************************************************************************
\RequirePackage{fancyhdr}	        % Encabezados
\RequirePackage{titlesec}	        % Modificaciones en captions, títulos, etc
\RequirePackage{graphicx}	        % Figuras
\RequirePackage{array}		        % Para tablas, arreglos, etc
\RequirePackage{longtable}	        % Para tablas largas --> entorno flexible
\RequirePackage{supertabular} 	    % Tablas
\RequirePackage{color}		        % Para definición de colores
\RequirePackage[table, dvipsnames]{xcolor}  % Para utilizar colores en las tablas
\RequirePackage{multirow}	        % Para entorno multifila en tablas
\RequirePackage{booktabs}           % Para poder pintar grupos de tablas
%\RequirePackage[latin1]{inputenc}	    % Codificación de entrada de este documento (permite acentos)
\RequirePackage[square,numbers]{natbib}		% Bibliografía
\RequirePackage{pdfpages} 	        % Para incluir pdf's externos en el documento
\RequirePackage{subfig}	        	% Para subfiguras
\RequirePackage{float}		        % Para flotantes
\RequirePackage[spanish]{babel}	    % Idioma español predeterminado
\RequirePackage[none]{hyphenat}	    % Para que Latex no corte las palabras
\RequirePackage{setspace}           % Para setear espacios entre líneas
\RequirePackage{picture}            % Para ubicar cosas en coordenadas arbitrarias
\RequirePackage{xparse}             % Para la creación de nuevos environments con parámetros en el bloque end
\RequirePackage{vmargin}            % Para configurar el tamaño de la página
\RequirePackage{paralist}           % Para entornos de enumeración con menor espacio entre ítems
\RequirePackage{soul}               % Para colocar resaltados, subrayados, texto tachado, etc etc
\RequirePackage{listings}           % Para colocar código en el documento
\RequirePackage[titletoc]{appendix}     % Para incluir apéndices en el índice
\RequirePackage[colorlinks, 
                breaklinks=true, 
                linkcolor=black, 
                citecolor=black, 
                filecolor=black,
                urlcolor=blue]{hyperref} % Hiperlinks
\RequirePackage[acronym,
                nomain,
                nonumberlist,
                nopostdot,
                nogroupskip]{glossaries} % Para lista de acrónimos y glosarios
\RequirePackage{lscape}

                
%----------------------------------------------------
% Configuraciones de los paquetes antes declarados
%----------------------------------------------------

% glossaries
\setglossarystyle{super} 	% Estilo de la lista de acrónimos
\setlength{\glsdescwidth}{1\textwidth}	% Obligo a que los acrónimos ocupen todo el ancho del texto
\setglossarysection{subsection}         % La lista de acrónimos es una subsección
\makeglossaries                         % Seteo el formato
\input{acronimosGVT.tex}                   % Archivo que contiene los acrónimos

% picture
\setlength{\unitlength}{1cm} % Defino unidades del entorno picture

% vmargin
\setpapersize{A4}       % Tamaño de hoja
\setmargins{2.5cm}    	% margen izquierdo
{1.5cm}                 % margen superior
{16.5cm}                % anchura del texto
{22.92cm}              	% altura del texto
{43.5pt}                % altura de los encabezados
{1cm}                   % espacio entre el texto y los encabezados
{10pt}                  % altura del pie de página
{1cm}                   % espacio entre el texto y el pie de página{vmargin}


% Configuración del paquete listing
\definecolor{commentColor}{rgb}{0.0, 0.5, 1.0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{MyCodeStyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{commentColor},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Cosas que deben estar obligatoriamente en el documento y declaradas al principio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
    % Para que en lugar de cuadro ponga tabla en los nombres
    \renewcommand{\tablename}{Tabla}
    \renewcommand{\tableautorefname}{Tabla}
    % Para renombrar los apéndices
    \renewcommand{\appendixname}{Apéndice}
    \renewcommand{\appendixautorefname}{Apéndice}
    % Para que justifique correctamente el texto
    \sloppy
    % Generar portada del documento
    \ifthenelse{1<2}{\portada}{\genCaratula}
    % Generar tabla de autores, revisores y aprobadores
    \infoAutor
    % Generar tabla de Log de cambios
    \LogCambios
    % Generar tabla documentos aplicables
    \DocAplicables
    % Generar tabla documentos de referencia
    \DocReferencia
    % Generar Copyright
    \Copyright
    % Generar índice
    \newpage\tableofcontents
    \newpage
    % Espacio entre párrafos
    \setlength{\parskip}{0.2cm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definición de variables a utilizar en el documento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nombre del proyecto
\def\Proyecto#1{\def\Proyecto{#1}}
% Título del documento
\def\TituloDoc#1{\def\TituloDoc{#1}}
% Código del documento
\def\CodigoDoc#1{\def\CodigoDoc{#1}}
% Versión del documento
\def\VersionDoc#1{\def\VersionDoc{#1}}
% Autores del documento
\def\AutorA#1{\def\AutorA{#1}}
\def\AutorB#1{\def\AutorB{#1}}
\def\AutorC#1{\def\AutorC{#1}}
\def\AutorD#1{\def\AutorD{#1}}
% Posiciones autores
\def\PosicionAutorA#1{\def\PosicionAutorA{#1}}
\def\PosicionAutorB#1{\def\PosicionAutorB{#1}}
\def\PosicionAutorC#1{\def\PosicionAutorC{#1}}
\def\PosicionAutorD#1{\def\PosicionAutorD{#1}}
% Revisores del documento
\def\RevisorA#1{\def\RevisorA{#1}}
\def\RevisorB#1{\def\RevisorB{#1}}
\def\RevisorC#1{\def\RevisorC{#1}}
\def\RevisorD#1{\def\RevisorD{#1}}
% Posiciones revisores
\def\PosicionRevisorA#1{\def\PosicionRevisorA{#1}}
\def\PosicionRevisorB#1{\def\PosicionRevisorB{#1}}
\def\PosicionRevisorC#1{\def\PosicionRevisorC{#1}}
\def\PosicionRevisorD#1{\def\PosicionRevisorD{#1}}
% Fecha revisión
\def\FechaRevisorA#1{\def\FechaRevisorA{#1}}
\def\FechaRevisorB#1{\def\FechaRevisorB{#1}}
\def\FechaRevisorC#1{\def\FechaRevisorC{#1}}
\def\FechaRevisorD#1{\def\FechaRevisorD{#1}}
% Aprobadores del documento
\def\AprobadorA#1{\def\AprobadorA{#1}}
\def\AprobadorB#1{\def\AprobadorB{#1}}
\def\AprobadorC#1{\def\AprobadorC{#1}}
\def\AprobadorD#1{\def\AprobadorD{#1}}
% Posiciones aprobadores
\def\PosicionAprobadorA#1{\def\PosicionAprobadorA{#1}}
\def\PosicionAprobadorB#1{\def\PosicionAprobadorB{#1}}
\def\PosicionAprobadorC#1{\def\PosicionAprobadorC{#1}}
\def\PosicionAprobadorD#1{\def\PosicionAprobadorD{#1}}
% Fecha aprobador
\def\FechaAprobadorA#1{\def\FechaAprobadorA{#1}}
\def\FechaAprobadorB#1{\def\FechaAprobadorB{#1}}
\def\FechaAprobadorC#1{\def\FechaAprobadorC{#1}}
\def\FechaAprobadorD#1{\def\FechaAprobadorD{#1}}
% Tipo de documento
\def\TipoDocumento#1{\def\TipoDocumento{#1}}
% Fecha de creación del documento
\def\FechaDoc#1{\def\FechaDoc{#1}}
% Cambios del documento
\def\VersionA#1{\def\VersionA{#1}}
\def\VersionB#1{\def\VersionB{#1}}
\def\VersionC#1{\def\VersionC{#1}}
\def\VersionD#1{\def\VersionD{#1}}
\def\VersionE#1{\def\VersionE{#1}}
\def\VersionF#1{\def\VersionF{#1}}
\def\VersionG#1{\def\VersionG{#1}}
\def\FechaA#1{\def\FechaA{#1}}
\def\FechaB#1{\def\FechaB{#1}}
\def\FechaC#1{\def\FechaC{#1}}
\def\FechaD#1{\def\FechaD{#1}}
\def\FechaE#1{\def\FechaE{#1}}
\def\FechaF#1{\def\FechaF{#1}}
\def\FechaG#1{\def\FechaG{#1}}
\def\CambioA#1{\def\CambioA{#1}}
\def\CambioB#1{\def\CambioB{#1}}
\def\CambioC#1{\def\CambioC{#1}}
\def\CambioD#1{\def\CambioD{#1}}
\def\CambioE#1{\def\CambioE{#1}}
\def\CambioF#1{\def\CambioF{#1}}
\def\CambioG#1{\def\CambioG{#1}}
% Documentos de referencia
\def\CodReferenciaA#1{\def\CodReferenciaA{#1}}
\def\CodReferenciaB#1{\def\CodReferenciaB{#1}}
\def\CodReferenciaC#1{\def\CodReferenciaC{#1}}
\def\CodReferenciaD#1{\def\CodReferenciaD{#1}}
\def\CodReferenciaE#1{\def\CodReferenciaE{#1}}
\def\CodReferenciaF#1{\def\CodReferenciaF{#1}}
\def\TituloReferenciaA#1{\def\TituloReferenciaA{#1}}
\def\TituloReferenciaB#1{\def\TituloReferenciaB{#1}}
\def\TituloReferenciaC#1{\def\TituloReferenciaC{#1}}
\def\TituloReferenciaD#1{\def\TituloReferenciaD{#1}}
\def\TituloReferenciaE#1{\def\TituloReferenciaE{#1}}
\def\TituloReferenciaF#1{\def\TituloReferenciaF{#1}}
% Documentos aplicables
\def\CodAplicableA#1{\def\CodAplicableA{#1}}
\def\CodAplicableB#1{\def\CodAplicableB{#1}}
\def\CodAplicableC#1{\def\CodAplicableC{#1}}
\def\CodAplicableD#1{\def\CodAplicableD{#1}}
\def\CodAplicableE#1{\def\CodAplicableE{#1}}
\def\CodAplicableF#1{\def\CodAplicableF{#1}}
\def\TituloAplicableA#1{\def\TituloAplicableA{#1}}
\def\TituloAplicableB#1{\def\TituloAplicableB{#1}}
\def\TituloAplicableC#1{\def\TituloAplicableC{#1}}
\def\TituloAplicableD#1{\def\TituloAplicableD{#1}}
\def\TituloAplicableE#1{\def\TituloAplicableE{#1}}
\def\TituloAplicableF#1{\def\TituloAplicableF{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configurar la fuente Liberation Serif en todo el documento (Compilar con Xelatex!!!!!)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[no-math]{fontspec}   
\setmainfont{Liberation Serif}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configuración de encabezados y pies de página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}                   % Estilo de encabezado y pie de página
\renewcommand{\headrulewidth}{2pt}  % Ancho de línea de encabezado
\renewcommand{\footrulewidth}{0pt}  % Ancho de línea de pie de página

\fancyhead[L]{} % Encabezado izquierdo
\fancyhead[C]{\setlength\extrarowheight{-4pt}   % Encabezado central
    \begin{tabular}{m{1.6cm} m{0.1cm} p{8cm} m{0.1cm} p{4.5cm}}
      \includegraphics[scale=0.057]{logos/CONAE_logo_transp.png} & & \bf\scriptsize\centering\TituloDoc & & \bfseries\scriptsize\CodigoDoc \\
    \end{tabular}\vspace{0cm}
}

\fancyhead[R]{} % Encabezado derecho


\fancyfoot[R]{\thepage} % Pie de página derecho
\fancyfoot[C]{}         % Pie de página central
\fancyfoot[L]{}         % Pie de página izquierdo



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Portada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\portada}{%
    \thispagestyle{empty}
    \begin{picture}(10,20)
        \linethickness{0.8mm}
        \put(-1,-4){\line(0,1){26}}     % Línea vertical izquierda
        \put(16,-4){\line(0,1){26}}    % Línea vertical derecha 
        \put(-1,-4){\line(1,0){17}}     % Línea horizontal inferior
        \put(-1,22){\line(1,0){17}}    % Línea horizontal superior
        \put(-1,-1){\line(1,0){17}}     % Línea horizontal de pie de portada
        \put(3,-4){\line(0,1){3}}        % Línea vertical de pie de portada
        % Nota documento interno GVT
        \put(3,21){\textcolor{gris}{\huge Documento interno de la GVT}}
        % Pie de portada
        \put(-0.8,-3.8){\includegraphics[scale=0.11]{logos/CONAE_logo_transp.png}}
        \put(3.5,-2){\bf\Large Gerencia de Vinculación Tecnológica}
        \put(3.5,-3){\bf\Large Comisión Nacional de Actividades Espaciales}
        % Nombre de proyecto
        \put(0.8,16){%
            \begin{minipage}{14cm}
                \centering\huge\MakeUppercase{\Proyecto}
            \end{minipage}
        }
        % Título del documento
        \put(0.8,12){%
            \begin{minipage}{14cm}
                \centering
                \huge\bf\TituloDoc
            \end{minipage}
        }
        % Nombre de los autores
        \put(-0.5,2){%
            \Large
            \begin{minipage}{7cm}
                \ifthenelse{\equal{\AutorB}{}}{%
                    \begin{tabular}{@{}ll}
                        Autor:    & \AutorA \vspace{0.3cm}\\ 
                        Fecha: & \FechaDoc \vspace{0.3cm}\\
                        Código: & \CodigoDoc
                    \end{tabular}
                }{%
                \ifthenelse{\equal{\AutorC}{}}{%
                \begin{tabular}{@{}ll}
                    Autores:    & \AutorA \\
                                & \AutorB \vspace{0.3cm}\\ 
                    Fecha: & \FechaDoc \vspace{0.3cm}\\
                    Código: & \CodigoDoc
                \end{tabular}}{%
                    \ifthenelse{\equal{\AutorD}{}}{
                        \begin{tabular}{@{}ll}
                            Autores:    & \AutorA \\
                                        & \AutorB \\
                                        & \AutorC \vspace{0.3cm}\\
                            Fecha: & \FechaDoc \vspace{0.3cm}\\
                            Código: & \CodigoDoc
                        \end{tabular}}{%
                        \begin{tabular}{@{}ll}
                            Autores:    & \AutorA \\
                                        & \AutorB \\
                                        & \AutorC \\
                                        & \AutorD \vspace{0.3cm}\\ 
                            Fecha: & \FechaDoc \vspace{0.3cm}\\
                            Código: & \CodigoDoc
                        \end{tabular}}}}
            \end{minipage}
        }
        %Versión del documento
        \put(12.5,1){\Large\bf Versión: \VersionDoc}
        % Tipo de documento
        \put(5.5,8){%
            \begin{minipage}{5cm}
                \centering\large
                \fbox{\TipoDocumento}
            \end{minipage}
        }
    \end{picture}
    \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Información del autor, revisores y aprobadores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\infoAutor}{\noindent
    \begin{minipage}{1\textwidth}
      \begin{tabular}{|m{2.6cm}|m{4cm}|m{4cm}|m{4cm}|}
        \hline
        \rowcolor{grismasclaro}
                & \begin{center}\textbf{NOMBRE}\end{center} & \begin{center}\textbf{POSICIÓN}\end{center} & \begin{center}\textbf{FECHA}\end{center} \\
        \hline
        \ifthenelse{\equal{\AutorB}{}}{%
            \cellcolor{grismasclaro} \textbf{AUTORES} & \AutorA & \PosicionAutorA & \FechaDoc \\
        }{%
            \ifthenelse{\equal{\AutorC}{}}{%
                \cellcolor{grismasclaro} & \AutorA & \PosicionAutorA & \FechaDoc \\ \cline{2-4}
                \cellcolor{grismasclaro} \multirow{-2}{*}{\textbf{AUTORES}}         & \AutorB & \PosicionAutorB & \FechaDoc \\
            }{%
                \ifthenelse{\equal{\AutorD}{}}{%
                    \cellcolor{grismasclaro} & \AutorA & \PosicionAutorA & \FechaDoc \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AutorB & \PosicionAutorB & \FechaDoc \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-3}{*}{\textbf{AUTORES}} & \AutorC & \PosicionAutorC & \FechaDoc \\
                }{%
                    \cellcolor{grismasclaro} & \AutorA & \PosicionAutorA & \FechaDoc \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AutorB & \PosicionAutorB & \FechaDoc \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AutorC & \PosicionAutorC & \FechaDoc \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-4}{*}{\textbf{AUTORES}} & \AutorD & \PosicionAutorD & \FechaDoc \\
                }
            }
        }
        \hline
        \ifthenelse{\equal{\RevisorB}{}}{%
            \cellcolor{grismasclaro}\textbf{REVISADO} & \RevisorA & \PosicionRevisorA & \FechaRevisorA \\
        }{%
            \ifthenelse{\equal{\RevisorC}{}}{%
                \cellcolor{grismasclaro} & \RevisorA & \PosicionRevisorA & \FechaRevisorA \\ \cline{2-4}
                \cellcolor{grismasclaro}\multirow{-2}{*}{\textbf{REVISADO}}  & \RevisorB & \PosicionRevisorB & \FechaRevisorB \\
            }{%
                \ifthenelse{\equal{\RevisorD}{}}{%
                    \cellcolor{grismasclaro} & \RevisorA & \PosicionRevisorA & \FechaRevisorA \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \RevisorB & \PosicionRevisorB & \FechaRevisorB \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-3}{*}{\textbf{REVISADO}} & \RevisorC & \PosicionRevisorC & \FechaRevisorC \\
                }{%
                    \cellcolor{grismasclaro} & \RevisorA & \PosicionRevisorA & \FechaRevisorA \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \RevisorB & \PosicionRevisorB & \FechaRevisorB \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \RevisorC & \PosicionRevisorC & \FechaRevisorC \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-4}{*}{\textbf{REVISADO}} & \RevisorD & \PosicionRevisorD & \FechaRevisorD \\
                }
            }
        }
        \hline 
        \ifthenelse{\equal{\AprobadorB}{}}{%
            \cellcolor{grismasclaro}\textbf{APROBADO} & \AprobadorA & \PosicionAprobadorA & \FechaAprobadorA \\
        }{%
            \ifthenelse{\equal{\AprobadorC}{}}{%
                \cellcolor{grismasclaro} & \AprobadorA & \PosicionAprobadorA & \FechaAprobadorA \\ \cline{2-4}
                \cellcolor{grismasclaro}\multirow{-2}{*}{\textbf{APROBADO}} & \AprobadorB & \PosicionAprobadorB & \FechaAprobadorB \\
            }{%
                \ifthenelse{\equal{\AprobadorD}{}}{%
                    \cellcolor{grismasclaro} & \AprobadorA & \PosicionAprobadorA & \FechaAprobadorA \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AprobadorB & \PosicionAprobadorB & \FechaAprobadorB \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-3}{*}{\textbf{APROBADO}}  & \AprobadorC & \PosicionAprobadorC & \FechaAprobadorC \\
                }{%
                    \cellcolor{grismasclaro} & \AprobadorA & \PosicionAprobadorA & \FechaAprobadorA \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AprobadorB & \PosicionAprobadorB & \FechaAprobadorB \\ \cline{2-4}
                    \cellcolor{grismasclaro} & \AprobadorC & \PosicionAprobadorC & \FechaAprobadorC \\ \cline{2-4}
                    \cellcolor{grismasclaro}\multirow{-4}{*}{\textbf{APROBADO}}             & \AprobadorD & \PosicionAprobadorD & \FechaAprobadorD \\
                }
            }
        }
        \hline
      \end{tabular}
  \end{minipage}\vspace{0.5cm}
  \normalsize
}
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Cuadro de Copyright
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
\newcommand{\Copyright}{\noindent
    {\footnotesize
    \fbox{\begin{minipage}{.985\textwidth}
    Este documento contiene información propiedad de la GVT de la CONAE sobre la cual tiene la potestad legal de proteger dicha información de la divulgación, el uso o la duplicación no autorizados. Se prohíbe expresamente cualquier divulgación, uso o duplicación de este documento o de cualquier información contenida en el mismo para fines distintos al propósito específico para el que se generó, excepto que CONAE lo acuerde por escrito.
    \end{minipage}}}
    }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Log de cambios
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
\newcommand{\LogCambios}{%
\begin{minipage}{1\textwidth}
    \begin{tabular}{|m{2cm}|m{2cm}|m{11.1cm}|}
         \hline
         \rowcolor{grismasclaro}
         \textbf{VERSIÓN} & \textbf{FECHA} & \textbf{CAMBIOS REALIZADOS} \\
         \hline
         \VersionA & \FechaA & \CambioA \\\hline
         \VersionB & \FechaB & \CambioB \\\hline
         \VersionC & \FechaC & \CambioC \\\hline
         \VersionD & \FechaD & \CambioD \\\hline
         \VersionE & \FechaE & \CambioE \\\hline
         \VersionF & \FechaF & \CambioF \\\hline
         \VersionG & \FechaG & \CambioG \\\hline
    \end{tabular}\vspace{0.5cm}
    \end{minipage}
    \newline
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Formato de tablas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Tabla con colores alternados
\NewDocumentEnvironment{alternateColorTab}{mmm} % Formato columnas, Caption, Label
{
    \rowcolors{2}{gray!25}{white}
    \begin{table}[H]
        \centering
        \caption{#2}
        \label{#3}
        \begin{tabular}{#1}
        \rowcolor{tableHeader}
}{
        \end{tabular}
    \end{table}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Formatos de figuras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Comando para colocar imágenes individuales. El formato es el siguiente:
%  \imagen{scala_respecto_al_texto}{directorio_imagen}{pie_de_figura}{etiqueta_para_referencias}
\newcommand{\imagen}[4]{
    \begin{figure}[H] % Coloca la figura en el lugar donde aparece en el código
	\centering
	\includegraphics[width=#1\textwidth]{#2}
	\caption{#3}
	\label{#4}
    \end{figure}
}


% Comando para colocar imágenes individuales flotantes. El formato es el siguiente:
%  \imagen{scala_respecto_al_texto}{directorio_imagen}{pie_de_figura}{etiqueta_para_referencias}
\newcommand{\imagenf}[4]{
    \begin{figure}[!ht] % Coloca la figure en el lugar donde se la declara, y si no puede la coloca en la parte de arriba de la siguiente página
	\centering
	\includegraphics[width=#1\textwidth]{#2}
	\caption{#3}
	\label{#4}
    \end{figure}
}

% Para colocar múltiples sub-figuras en una misma figura
% El formato es el siguiente (los campos <pie de subfigura> y <etiqueta de subfigura> pueden estar vacíos):
%       \begin{imagenmultiple}{<Caption de figura completa>}{<etiqueta de figura completa>}
%           \addImage{<escala respecto al texto>}{<ruta a la figura>}{<pie de subfigura>}{<etiqueta de subfigura>}
%           \addImage{<escala respecto al texto>}{<ruta a la figura>}{<pie de subfigura>}{<etiqueta de subfigura>}
%           \addImage{<escala respecto al texto>}{<ruta a la figura>}{<pie de subfigura>}{<etiqueta de subfigura>}
%           \addImage{<escala respecto al texto>}{<ruta a la figura>}{<pie de subfigura>}{<etiqueta de subfigura>}
%       \end{imagenmultiple}
\NewDocumentEnvironment{imagenmultiple}{mm}
{%
\begin{figure}[H]
    \centering
}{%
    \caption{#1}
    \label{#2}
\end{figure}
}

% Comando que va dentro del entorno imagenmultiple anterior
\newcommand{\addImage}[4]{
  \subfloat[#3]{
	    \label{#4}
	    \includegraphics[width=#1\textwidth]{#2}}
}

% Figura descriptiva
\newcommand{\imagenDescriptiva}[6]{
    \begin{figure}[H]
        \centering
        \begin{tabular}{m{#1\textwidth}m{#5\textwidth}}
            \includegraphics[width=#1\textwidth]{#2} & #6 \\
        \end{tabular}
        \caption{#3}
        \label{#4}
    \end{figure}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Definición de algunos comandos para colores                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{gris}{rgb}{0.3, 0.3, 0.3} % Defino color gris para la portada
\definecolor{green}{rgb}{0.09,0.53,0.17} % Defino color verde
\definecolor{tableHeader}{rgb}{0.42,0.67,0.93}

\newcommand{\red}[1]{% Color rojo: \red{Texto rojo}
  \textcolor{red}{#1}
}

\newcommand{\blue}[1]{% Color azul: \blue{Texto azul}
  \textcolor{blue}{#1}
}

\newcommand{\green}[1]{% Color verde: \green{Texto verde}
  \textcolor{green}{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Para que las referencias a subfigura tengan paréntesis                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\captionsetup[subfigure]{subrefformat=simple,labelformat=simple,listofformat=subsimple}
\renewcommand\thesubfigure{(\alph{subfigure})}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configuración de los \item para el entorno itemize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\labelitemi}{$\bullet$}   % bullets en el primer nivel
\renewcommand{\labelitemii}{$\circ$}    % círculos para el segundo nivel


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configuración y generación de la marca de agua
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{griss}{rgb}{0.9,0.9,0.9}
\usepackage[printwatermark]{xwatermark}
\newwatermark[allpages,color=griss,angle=45,scale=3,xpos=20,ypos=0]{BORRADOR}
\definecolor{grisclaro}{rgb}{0.8,0.8,0.8}
\definecolor{grismasclaro}{rgb}{0.9,0.9,0.9}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tabla de documentos aplicables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\DocAplicables}{%
    \begin{minipage}{1\textwidth}
        \begin{tabular}{|m{1cm}|m{4cm}|m{10.2cm}|}
            \hline
            \rowcolor{grisclaro}
            \multicolumn{3}{|c|}{\textbf{DOCUMENTOS APLICABLES}} \\
            \hline
            \rowcolor{grismasclaro}
            \textbf{Nº} & \textbf{CÓDIGO} & \textbf{TÍTULO} \\ \hline
            \ifthenelse{\equal{\CodAplicableA}{}}{}{\hypertarget{da1}{DA1}} & \CodAplicableA & \TituloAplicableA \\ \hline
            \ifthenelse{\equal{\CodAplicableB}{}}{}{\hypertarget{da2}{DA2}} & \CodAplicableB & \TituloAplicableB \\ \hline
            \ifthenelse{\equal{\CodAplicableC}{}}{}{\hypertarget{da3}{DA3}} & \CodAplicableC & \TituloAplicableC \\ \hline
            \ifthenelse{\equal{\CodAplicableD}{}}{}{\hypertarget{da4}{DA4}} & \CodAplicableD & \TituloAplicableD \\ \hline
            \ifthenelse{\equal{\CodAplicableE}{}}{}{\hypertarget{da5}{DA5}} & \CodAplicableE & \TituloAplicableE \\ \hline
            \ifthenelse{\equal{\CodAplicableF}{}}{}{\hypertarget{da6}{DA6}} & \CodAplicableF & \TituloAplicableF \\ \hline
        \end{tabular}
    \end{minipage}\vspace{0.5cm}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tabla de documentos de referencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\DocReferencia}{%
    \begin{minipage}{1\textwidth}
        \begin{tabular}{|m{1cm}|m{4cm}|m{10.2cm}|}
            \hline
            \rowcolor{grisclaro}
            \multicolumn{3}{|c|}{\textbf{DOCUMENTOS DE REFERENICA}} \\
            \hline
            \rowcolor{grismasclaro}
            \textbf{Nº} & \textbf{CÓDIGO} & \textbf{TÍTULO} \\ \hline
            \ifthenelse{\equal{\CodReferenciaA}{}}{}{\hypertarget{dr1}{DR1}} & \CodReferenciaA & \TituloReferenciaA \\ \hline
            \ifthenelse{\equal{\CodReferenciaB}{}}{}{\hypertarget{dr2}{DR2}} & \CodReferenciaB & \TituloReferenciaB \\ \hline
            \ifthenelse{\equal{\CodReferenciaC}{}}{}{\hypertarget{dr3}{DR3}} & \CodReferenciaC & \TituloReferenciaC \\ \hline
            \ifthenelse{\equal{\CodReferenciaD}{}}{}{\hypertarget{dr4}{DR4}} & \CodReferenciaD & \TituloReferenciaD \\ \hline
            \ifthenelse{\equal{\CodReferenciaE}{}}{}{\hypertarget{dr5}{DR5}} & \CodReferenciaE & \TituloReferenciaE \\ \hline
            \ifthenelse{\equal{\CodReferenciaF}{}}{}{\hypertarget{dr6}{DR6}} & \CodReferenciaF & \TituloReferenciaF \\ \hline
        \end{tabular}
    \end{minipage}\vspace{0.5cm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comandos para referenciar documentos de referencia y aplicables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\docref}[1]{%
    \hyperlink{#1}{\MakeUppercase{[#1]}}
}
