create or replace function striprtf (rtf text)
    returns text
    as $$
declare
    matches record;
    word text;
    arg text;
    _hex text;
    _char text;
    brace text;
    tchar text;
    stack integer[][] := array[array[-1, -1]];
    ucskip int := 1;
    curskip int := 0;
    ignorable int := 0;
    destinations text[] := array['aftncn', 'aftnsep', 'aftnsepc', 'annotation', 'atnauthor', 'atndate', 'atnicn', 'atnid', 'atnparent', 'atnref', 'atntime', 'atrfend', 'atrfstart', 'author', 'background', 'bkmkend', 'bkmkstart', 'blipuid', 'buptim', 'category', 'colorschememapping', 'colortbl', 'comment', 'company', 'creatim', 'datafield', 'datastore', 'defchp', 'defpap', 'do', 'doccomm', 'docvar', 'dptxbxtext', 'ebcend', 'ebcstart', 'factoidname', 'falt', 'fchars', 'ffdeftext', 'ffentrymcr', 'ffexitmcr', 'ffformat', 'ffhelptext', 'ffl', 'ffname', 'ffstattext', 'file', 'filetbl', 'fldinst', 'fldtype', 'fname', 'fontemb', 'fontfile', 'fonttbl', 'footer', 'footerf', 'footerl', 'footerr', 'footnote', 'formfield', 'ftncn', 'ftnsep', 'ftnsepc', 'g', 'generator', 'gridtbl', 'header', 'headerf', 'headerl', 'headerr', 'hl', 'hlfr', 'hlinkbase', 'hlloc', 'hlsrc', 'hsv', 'htmltag', 'info', 'keycode', 'keywords', 'latentstyles', 'lchars', 'levelnumbers', 'leveltext', 'lfolevel', 'linkval', 'list', 'listlevel', 'listname', 'listoverride', 'listoverridetable', 'listpicture', 'liststylename', 'listtable', 'listtext', 'lsdlockedexcept', 'macc', 'maccPr', 'mailmerge', 'maln', 'malnScr', 'manager', 'margPr', 'mbar', 'mbarPr', 'mbaseJc', 'mbegChr', 'mborderBox', 'mborderBoxPr', 'mbox', 'mboxPr', 'mchr', 'mcount', 'mctrlPr', 'md', 'mdeg', 'mdegHide', 'mden', 'mdiff', 'mdPr', 'me', 'mendChr', 'meqArr', 'meqArrPr', 'mf', 'mfName', 'mfPr', 'mfunc', 'mfuncPr', 'mgroupChr', 'mgroupChrPr', 'mgrow', 'mhideBot', 'mhideLeft', 'mhideRight', 'mhideTop', 'mhtmltag', 'mlim', 'mlimloc', 'mlimlow', 'mlimlowPr', 'mlimupp', 'mlimuppPr', 'mm', 'mmaddfieldname', 'mmath', 'mmathPict', 'mmathPr', 'mmaxdist', 'mmc', 'mmcJc', 'mmconnectstr', 'mmconnectstrdata', 'mmcPr', 'mmcs', 'mmdatasource', 'mmheadersource', 'mmmailsubject', 'mmodso', 'mmodsofilter', 'mmodsofldmpdata', 'mmodsomappedname', 'mmodsoname', 'mmodsorecipdata', 'mmodsosort', 'mmodsosrc', 'mmodsotable', 'mmodsoudl', 'mmodsoudldata', 'mmodsouniquetag', 'mmPr', 'mmquery', 'mmr', 'mnary', 'mnaryPr', 'mnoBreak', 'mnum', 'mobjDist', 'moMath', 'moMathPara', 'moMathParaPr', 'mopEmu', 'mphant', 'mphantPr', 'mplcHide', 'mpos', 'mr', 'mrad', 'mradPr', 'mrPr', 'msepChr', 'mshow', 'mshp', 'msPre', 'msPrePr', 'msSub', 'msSubPr', 'msSubSup', 'msSubSupPr', 'msSup', 'msSupPr', 'mstrikeBLTR', 'mstrikeH', 'mstrikeTLBR', 'mstrikeV', 'msub', 'msubHide', 'msup', 'msupHide', 'mtransp', 'mtype', 'mvertJc', 'mvfmf', 'mvfml', 'mvtof', 'mvtol', 'mzeroAsc', 'mzeroDesc', 'mzeroWid', 'nesttableprops', 'nextfile', 'nonesttables', 'objalias', 'objclass', 'objdata', 'object', 'objname', 'objsect', 'objtime', 'oldcprops', 'oldpprops', 'oldsprops', 'oldtprops', 'oleclsid', 'operator', 'panose', 'password', 'passwordhash', 'pgp', 'pgptbl', 'picprop', 'pict', 'pn', 'pnseclvl', 'pntext', 'pntxta', 'pntxtb', 'printim', 'private', 'propname', 'protend', 'protstart', 'protusertbl', 'pxe', 'result', 'revtbl', 'revtim', 'rsidtbl', 'rxe', 'shp', 'shpgrp', 'shpinst', 'shppict', 'shprslt', 'shptxt', 'sn', 'sp', 'staticval', 'stylesheet', 'subject', 'sv', 'svb', 'tc', 'template', 'themedata', 'title', 'txe', 'ud', 'upr', 'userprops', 'wgrffmtfilter', 'windowcaption', 'writereservation', 'writereservhash', 'xe', 'xform', 'xmlattrname', 'xmlattrvalue', 'xmlclose', 'xmlname', 'xmlnstbl', 'xmlopen'];
    outstr text := '';
begin
    stack := stack[2:2];
    for matches in
    select
        m.m
    from
        regexp_matches(rtf, '\\([a-z]{1,32})(-?\d{1,10})?[ ]?|\\''([0-9a-f]{2})|\\([^a-z])|([{}])|[\r\n]+|(.)', 'ig') m -- case insensitive and global
    loop
        word := (matches.m)[1];
        arg := (matches.m)[2];
        _hex := (matches.m)[3];
        _char := (matches.m)[4];
        brace := (matches.m)[5];
        tchar := (matches.m)[6];
        if brace is not null then
            curskip := 0;
            if brace = '{' then
                stack := array_cat(array[array[ucskip, ignorable]], stack);
                elseif brace = '}' then
                if array_length(stack, 1) >= 1 then
                    ucskip := stack[1][1];
                    ignorable := stack[1][2];
                    stack := stack[2:array_length(stack, 1)];
                else
                    -- ugly hack
                    ucskip := 0;
                    ignorable := 1;
                end if;
            end if;
            elseif _char is not null then
            curskip := 0;
            if _char in ('~', E'\n', E'\r', '{', '}', '\', ' - ', ' _ ')
		   and ignorable = 0 then
	          case _char
	            when '~' then
	              outstr := outstr || E'\+00A0'; -- non-breaking space
	            when E'\n' then
	              outstr := outstr || E'\n';
	            when E'\r' then
	              outstr := outstr || E'\r';
	            when '-' then
	              outstr := outstr || E'\+00AD';
	            when '_' then
	              outstr := outstr || E'\+2011';
	            else
	              outstr := outstr || _char;
	            end case;
	        elseif _char = '*' then
	          ignorable = 1;
	        end if;
	       
	    elseif word is not null then
	        curskip := 0;
	       
	        if word = any(destinations) then
	            ignorable := 1;
	        elseif word = 'ansicpg' then
	            -- TODO: Set the code-page
		elseif word = 'u' then -- Parse \uN with N being a unicode code point.
		    -- TODO: Ignored for now
	        end if;
	       
	        if ignorable = 1 then
	        -- FIXME Also check the specialchars words
	        elseif word in ('~', E'\n', E'\r', '{', '}', '\', '-', '_'
) then
                case _char
                when '~' then
                    outstr := outstr || E'\+00A0'; -- non-breaking space
                when E'\n' then
                    outstr := outstr || E'\n';
                when E'\r' then
                    outstr := outstr || E'\r';
                when '-' then
                    outstr := outstr || E'\+00AD';
                when '_' then
                    outstr := outstr || E'\+2011';
                    -- when null then
                    --    outstr := outstr || E'\n';
                else
                    outstr := outstr || _char;
                end case;
                elseif word in ('par') then
                    outstr := outstr || E'\n'; elseif word = 'uc' then
                    ucskip := arg::integer; elseif word = 'u' then
                    --  curskip := 0; -- FIXME: We currently don't implement \uN correctly, therefore we just use the fallback char coming after.
                    if arg is null then
                            curskip := ucskip;
                        else
                            outstr := outstr || chr(arg::int); curskip := ucskip;
                        end if;
                -- TODO : implement stuff with *
            end if;
                -- Hex encoded chars: \'XX where XX is hex value from current code page
                elseif _hex is not null then
                if curskip > 0 then
                    -- Maybe skip
                    curskip := curskip - 1;
                    elseif ignorable = 0 then
                    outstr := outstr || convert_from(decode(_hex, 'hex'), 'LATIN1');
                end if;
                -- Regular chars from text
                elseif tchar is not null then
                if curskip > 0 then
                    curskip := curskip - 1;
                    elseif ignorable = 0 then
                    outstr := outstr || tchar;
                end if;
            end if;
        end loop;
        if
        right (outstr,
        1) = E'\n' then
            return substr(outstr, 1, length(outstr) - 1);
        else
            return outstr;
        end if;
end;
$$
language plpgsql;

