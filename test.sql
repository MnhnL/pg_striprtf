\i pg_striprtf.sql
begin;
select
    plan (15);
select
    is (striprtf ('foobar'),
        'foobar',
        'String stays the same');
select
    is (striprtf (''), '', 'Empty string stays empty.');
select
    is (striprtf ('Nüthîng'),
        'Nüthîng',
        'Deal with plain string with unicode correctly');
select
    is (striprtf ('{\rtf1\ansi\ansicpg1252\deff0\uc1
{\fonttbl
{\f0\fnil\fcharset0\fprq0\fttruetype Times New Roman;}
{\f1\fnil\fcharset0\fprq0\fttruetype Liberation Sans;}
{\f2\fnil\fcharset0\fprq0\fttruetype Courier New;}}
{\colortbl
\red0\green0\blue0;
\red255\green255\blue255;
\red255\green255\blue255;}
{\stylesheet
{\s6\fi-431\li720\sbasedon28\snext28 Contents 1;}
{\s7\fi-431\li1440\sbasedon28\snext28 Contents 2;}
{\s1\fi-431\li720 Arrowhead List;}
{\s27\fi-431\li720\sbasedon28 Lower Roman List;}
{\s29\tx431\sbasedon20\snext28 Numbered Heading 1;}
{\s30\tx431\sbasedon21\snext28 Numbered Heading 2;}
{\s12\fi-431\li720 Diamond List;}
{\s9\fi-431\li2880\sbasedon28\snext28 Contents 4;}
{\s8\fi-431\li2160\sbasedon28\snext28 Contents 3;}
{\s31\tx431\sbasedon22\snext28 Numbered Heading 3;}
{\s32\fi-431\li720 Numbered List;}
{\s15\sbasedon28 Endnote Text;}
{\*\cs14\fs20\super Endnote Reference;}
{\s4\fi-431\li720 Bullet List;}
{\s5\tx1584\sbasedon29\snext28 Chapter Heading;}
{\s35\fi-431\li720 Square List;}
{\s11\fi-431\li720 Dashed List;}
{\s22\sb440\sa60\f1\fs24\b\sbasedon28\snext28 Heading 3;}
{\s37\fi-431\li720 Tick List;}
{\s24\fi-431\li720 Heart List;}
{\s40\fi-431\li720\sbasedon32 Upper Roman List;}
{\s39\fi-431\li720\sbasedon32 Upper Case List;}
{\s16\fi-288\li288\fs20\sbasedon28 Footnote;}
{\s19\fi-431\li720 Hand List;}
{\s18\fs20\sbasedon28 Footnote Text;}
{\s20\sb440\sa60\f1\fs34\b\sbasedon28\snext28 Heading 1;}
{\s21\sb440\sa60\f1\fs28\b\sbasedon28\snext28 Heading 2;}
{\s10\qc\sb240\sa120\f1\fs32\b\sbasedon28\snext28 Contents Header;}
{\s23\sb440\sa60\f1\fs24\b\sbasedon28\snext28 Heading 4;}
{\s28\f0\fs24 Normal;}
{\s26\fi-431\li720\sbasedon32 Lower Case List;}
{\s2\li1440\ri1440\sa120\sbasedon28 Block Text;}
{\s33\f2\sbasedon28 Plain Text;}
{\s34\tx1584\sbasedon29\snext28 Section Heading;}
{\s25\fi-431\li720 Implies List;}
{\s3\fi-431\li720 Box List;}
{\s36\fi-431\li720 Star List;}
{\*\cs17\fs20\super Footnote Reference;}
{\s38\fi-431\li720 Triangle List;}
{\s13\fi-288\li288\sbasedon28 Endnote;}}
\kerning0\cf0\ftnbj\fet2\ftnstart1\ftnnar\aftnnar\ftnstart1\aftnstart1\aenddoc\revprop3{\*\rdf}{\info\uc1{\author joshy}}\deftab720\viewkind1\paperw12240\paperh15840\margl1440\margr1440\widowctrl
\sectd\sbknone\colsx360\pgncont\ltrsect
\pard\plain\ltrpar\ql\s28\itap0{\s28\f0\fs24\lang1033{\*\listtag0}\abinodiroverride\ltrch Hello}{\s28\f0\fs24\lang1033{\*\listtag0}\par}}'), 'Hello', 'hello.rtf from test-suite');
select
    is (striprtf ('{\rtf1\ansi\deff3\adeflang1025
{\fonttbl{\f0\froman\fprq2\fcharset0 Times New Roman;}{\f1\froman\fprq2\fcharset2 Symbol;}{\f2\fswiss\fprq2\fcharset0 Arial;}{\f3\froman\fprq2\fcharset0 Liberation Serif{\*\falt Times New Roman};}{\f4\froman\fprq2\fcharset0 Liberation Sans{\*\falt Arial};}{\f5\fnil\fprq2\fcharset0 Lohit Devanagari;}{\f6\fnil\fprq2\fcharset0 Liberation Serif{\*\falt Times New Roman};}}
{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}
{\stylesheet{\s0\snext0\ql\widctlpar\hyphpar0\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24\lang1033 Normal;}
{\s15\sbasedon0\snext16\ql\widctlpar\hyphpar0\sb240\sa120\keepn\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f4\fs28 Heading;}
{\s16\sbasedon0\snext16\sl276\slmult1\ql\widctlpar\hyphpar0\sb0\sa140\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24 Text Body;}
{\s17\sbasedon16\snext17\sl276\slmult1\ql\widctlpar\hyphpar0\sb0\sa140\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24 List;}
{\s18\sbasedon0\snext18\ql\widctlpar\hyphpar0\sb120\sa120\ltrpar\cf1\i\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24 Caption;}
{\s19\sbasedon0\snext19\ql\widctlpar\hyphpar0\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24 Index;}
}{\*\generator LibreOffice/6.0.7.3$Linux_X86_64 LibreOffice_project/00m0$Build-3}{\info{\creatim\yr2020\mo12\dy11\hr12\min28}{\revtim\yr2020\mo12\dy11\hr12\min31}{\printim\yr0\mo0\dy0\hr0\min0}}{\*\userprops}\deftab709
\hyphauto0\viewscale100
{\*\pgdsctbl
{\pgdsc0\pgdscuse451\pgwsxn11906\pghsxn16838\marglsxn1134\margrsxn1134\margtsxn1134\margbsxn1134\pgdscnxt0 Default Style;}}
\formshade\paperh16838\paperw11906\margl1134\margr1134\margt1134\margb1134\sectd\sbknone\sectunlocked1\pgndec\pgwsxn11906\pghsxn16838\marglsxn1134\margrsxn1134\margtsxn1134\margbsxn1134\ftnbj\ftnstart1\ftnrstcont\ftnnar\aenddoc\aftnrstcont\aftnstart1\aftnnrlc
{\*\ftnsep\chftnsep}\pgndec\pard\plain \s0\ql\widctlpar\hyphpar0\ltrpar\cf1\kerning1\dbch\af5\langfe1081\dbch\af6\afs24\alang1033\loch\f3\fs24\lang1033{\cf1\kerning1\fs24\langfe1081\dbch\af6\afs24\alang1033\rtlch \ltrch\dbch\loch\f3
\u26580\''3f\u36947\''3f}
\par }'), '柔道', '\u-Encoded chinese characters');
select
    is (striprtf ('{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil MS Sans Serif;}}
{\colortbl ;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\f0\fs16 
\par }
'), '', 'Sample from SURVEY.DESCRIPTION. Empty string');
select
    is (striprtf ('{\rtf1\ansi\ansicpg1252\deff0\deflang1036{\fonttbl{\f0\fnil\fcharset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}
{\colortbl ;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang4103\f0\fs16 Kartierung von Ackerfl\'' e4chen in Boevange im Rahmen der Biodiv - Programme. lang1036 f1 par } '), ' Kartierung von Ackerflächen in Boevange im Rahmen der Biodiv - Programme.', 'Sample from SURVEY.DESCRIPTION. String with umlaut. ');

select is(striprtf(' { rtf1 ansi deff0 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} { colortbl;
red0 green0 blue0;
} viewkind4 uc1 pard cf1 lang1036 f0 fs16\''fcbersichtskartierung der neu aufgenommenen FFH-Anhamg II Schmertterlingsart Lycanea helle [Denis & Schifferm\''fcller,
(1775)] im luxemburgischen \' 'f6sling (April-Oktober 2005)\lang1033\f1 
\par }
'), 'übersichtskartierung der neu aufgenommenen FFH-Anhamg II Schmertterlingsart Lycanea helle [Denis & Schiffermüller, (1775)] im luxemburgischen ösling (April-Oktober 2005)');
select
    is (striprtf ('{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}
{\colortbl ;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang1036\f0\fs16 Observations or Specimens collected from citizens and given to MNHNL
\par 
\par Observations ou specimens collect\''e9es par le publique et donn\''e9es au MNHNL
\par 
\par Beobachtungen und Exemplare die von einem B\'' fcrger gesammelt und an dem MNHNL weitergegeben wurden lang1033 f1 par } '), E' Observations
            or Specimens collected from citizens
            and given to MNHNL n nObservations ou specimens collectées par le publique et données au MNHNL n nBeobachtungen und Exemplare die von einem Bürger gesammelt und an dem MNHNL weitergegeben wurden ');

select is(striprtf(' { rtf1 ansi ansicpg1252 deff0 deflang5132 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} { colortbl;
red0 green0 blue0;
} viewkind4 uc1 pard cf1 f0 fs16 d lang8192 ivers specimens
from
    the zoological collection of the MnhnL lang5132 f1 par } '), ' divers specimens
from
    the zoological collection of the MnhnL ');

select is(striprtf(' { rtf1 ansi ansicpg1252 deff0 deflang1033 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} { colortbl;
red0 green0 blue0;
} viewkind4 uc1 pard cf1 lang1036 f0 fs16 CF. BRE 1 par Steinbruch E. Burg Reuland lang1033 f1 par } '), E' CF. BRE 1 nSteinbruch E. Burg Reuland', 'LOCATION.DESCRIPTION ');

select is(striprtf(' { rtf1 ansi ansicpg1252 deff0 deflang1033 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} { colortbl;
red0 green0 blue0;
} viewkind4 uc1 pard cf1 lang5132 f0 fs16 sortie du mat\''e9riel \''e0 l''entr\''e9e du tunnel Markusbierg au lieu-dit Rangwee\lang1033\f1 
\par }
'), 'sortie du matériel à l''entrée du tunnel Markusbierg au lieu-dit Rangwee');
select
    is (striprtf ('{\rtf1\ansi\deff0{\fonttbl{\f0\fnil\fcharset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}
{\colortbl ;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang1031\f0\fs16 Project contains the specimens and records of the Syrphidae survey conducted by Evelyne Carri\'' e8res in 1998, 1999
            and 2000. par Syrphidae as well as by - catch specimens are included in this project. par par Related publication: par Carri\''e8res (2003) - Esp\''e8ces nouvelles et remarquables de syrphes (Diptera, Syrphidae) au Luxembourg. Bulletin de la Soci\''e9t\''e9 des naturalistes luxembourgeois 103: 79 - 82 lang5132 f1 par } '), E' Project contains the specimens
                and records of the Syrphidae survey conducted by Evelyne Carrières in 1998, 1999
                    and 2000. nSyrphidae as well as by - catch specimens are included in this project. n nRelated publication: nCarrières (2003) - Espèces nouvelles et remarquables de syrphes (Diptera, Syrphidae) au Luxembourg. Bulletin de la Société des naturalistes luxembourgeois 103: 79 - 82', 'SURVEY.DESCRIPTION ');

select is(striprtf(' { rtf1 ansi ansicpg1252 deff0 deflang1033 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} { colortbl;
red0 green0 blue0;
} viewkind4 uc1 pard cf1 lang5132 f0 fs16 Am s\''fcdlichen Waldrand des "Bois de Bettembourg". Die Pflanzen stehen direkt an einer Pferdewiese neben Bienenst\''f6cken lang1033 f1 par } '), ' Am südlichen Waldrand des "Bois de Bettembourg".Die Pflanzen stehen direkt an einer Pferdewiese neben Bienenstöcken', 'SURVEY_EVENT.COMMENT ');

select is(striprtf(' { rtf1 ansi ansicpg1252 deff0 deflang1033 { fonttbl { f0 fnil fcharset0 MS Sans Serif;
}{ f1 fnil MS Sans Serif;
}} viewkind4 uc1 pard lang1046 f0 fs16 Belle station situ\' 'e9e dans une peupleraie.\lang1033\f1 
\par }
'), 'Belle station située dans une peupleraie.');
select
    *
from
    finish ();
rollback;

