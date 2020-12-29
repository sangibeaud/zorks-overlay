# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Synthetizer-V vocaloid engine and vst"
HOMEPAGE="https://synthesizerv.com/en/"
SRC_URI="https://s3-ap-northeast-1.amazonaws.com/synthesizerv-download/synthv-editor.zip"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/webkit-gtk"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PRESTRIPPED="/usr/lib64/vst/synthesizer-v-vsti.so"


ino_src_unpack(){
	pwd
	ls
	unzip synthv-editor.zip
	mv  synth-veditor synthetizer-v-0.18
	eapply_user
	}

src_unpack(){
	einfo `pwd && ls -l`
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	einfo `ls -la`
	mv synthv-editor ${P}
	}

src_prepare(){
	elog `pwd`
	elog `ls -la`
	eapply_user
}

src_install() {
	dodoc license-en.txt
	#exe synthesizer-v-editor
	exeinto /usr/bin
	doexe synthesizer-v-editor
	insinto /usr/lib64/vst
	doins synthesizer-v-vsti.so

	insinto /usr/share/synthv-editor
	doins -r NotoSansCJKjp-Regular.otf settings.xml color-schemes
	doins -r database presets demo preview-sound.sf2 translations
	doins -r lang-data registration

}

