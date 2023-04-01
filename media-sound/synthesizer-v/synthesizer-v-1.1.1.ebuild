# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Synthetizer-V vocaloid engine and vst"
HOMEPAGE="https://synthesizerv.com/en/"
SRC_URI="https://s3-ap-northeast-1.amazonaws.com/synthesizerv-download/synthv-editor.zip"
SRC_URI=" https://dreamtonics.com/synthv/download/Synthesizer%20V%20Studio%20Basic/${PV}/svstudio-basic-linux64-${PV}.zip"

LICENSE="EULA"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="net-libs/webkit-gtk
	net-misc/curl[gnutls]"
RDEPEND="${DEPEND}"
BDEPEND=""

#QA_PRESTRIPPED="/usr/lib64/vst/synthesizer-v-vsti.so"
QA_PRESTRIPPED="/usr/bin/synthv-studio"


ino_src_unpack(){
	pwd
	ls
	unzip synthv-editor.zip
	mv  Synth* synthetizer-v-${PV}
	eapply_user
	}

src_unpack(){
	einfo `pwd && ls -l`
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	einfo `ls -la`
	#mv synthv-editor ${P}
	mv "Synthesizer V Studio Basic" synthesizer-v-${PV}
	pwd
	ls
	#mv "./Synthe*" synthetizer-v-${PV}
	}

src_prepare(){
	elog `pwd`
	elog `ls -la`
	eapply_user
}

src_install() {
	# exe synthesizer-v-editor
	dodoc -r docs/ 

	elog app installed to /opt/synthesizer-v
	elog make symbolic link and adjust path if necessary
	#exeinto /usr/bin
	#doexe synthv-studio
	
	insinto "/opt/synthesizer-v"

	doins -r *
	#doins synthesizer-v-vsti.so
	dodoc license-en.txt
	}
