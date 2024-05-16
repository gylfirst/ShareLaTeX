FROM sharelatex/sharelatex:4.2

RUN apt-get update && apt-get install -y python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && pip --no-cache-dir install Pygments \
    && tlmgr || (export TEXLIVE_VERSION="$(find /usr/local/texlive -type d -name "2*" -printf "%f\n" | tail -1)" \
    && tlmgr option repository https://pi.kwarc.info/historic/systems/texlive/$TEXLIVE_VERSION/tlnet-final) \
    && tlmgr update --self --all --reinstall-forcibly-removed \
    && tlmgr install scheme-medium collection-bibtexextra collection-pictures adjustbox animate \
    appendix bigfoot blindtext braket censor csquotes datetime2 datetime2-en-fulltext \
    datetime2-english datetime2-french emptypage enumitem epigraph etoc floatrow footmisc frankenstein \
    glossaries glossaries-english glossaries-french listingsutf8 mdframed media9 minted multirow \
    needspace nextpage ocgx2 pbox pdfcol quoting relsize subfiles tcolorbox textpos titlesec \
    titling tocloft todonotes tokcycle upquote varwidth wrapfig zref \
    && luaotfload-tool -fu && tlmgr path add
