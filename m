Received: from smtpauth.rollernet.us (smtpauth.rollernet.us [208.79.240.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270433F9
	for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 18:56:52 +0000 (UTC)
Received: from smtpauth.rollernet.us (localhost [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id 332A72800046;
	Thu, 24 Nov 2022 10:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aronetics.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type;
	 s=roll2210; t=1669315733; bh=nndGbhh0G8KFxb0s5a8Zf+N6CuZxqGdD0g
	kl2c4apcI=; b=JIUVT1Jf814n+cjNGy4rvbHod6pXof8HaY9s9d1Q3DGK3k7VHu
	GmtPkR8DE4JquY4K4aU4FXlu82SdzB4M6TtQA/kKnAT/zkDq13BV8B85DdCc3aEL
	AknP56kaRROdfiM1vLwxL1rwp3pBiqaZPLwlemoNXE7gvp+LqZDvHXK5DP8zpRy+
	PQ12RWeJ+666UWU4BA8G97468ERJ3PVrzB7oU+JHRwvJpOu+3aSxc0TwFMCYdyEb
	s3h5lpRurkD9AKpkDq0dIVjay7lhHlHnlFaco27EZsHQmwUC6zUuvplm29AJ8ctN
	8p2VBOT88X8sbm9VGTF74G56HQhBKlwINhXw==
From: "John Aron" <john@aronetics.com>
To: <stable@vger.kernel.org>
Cc: <regressions@lists.linux.dev>,
	<kernelnewbies@kernelnewbies.org>,
	"'Mark Salter'" <mark.salter@canonical.com>,
	"Mark Lewis" <mark.lewis@canonical.com>
Subject: OBJTOOL Build error
Date: Thu, 24 Nov 2022 13:48:08 -0500
Message-ID: <041601d90035$4f738de0$ee5aa9a0$@aronetics.com>
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkANSPo8+dX8wblQtug0tQ/yn3MRw==
Content-Language: en-us
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_040E_01D9000B.4283E280"
X-Rollernet-Modified: Received headers cleared at submission by user request
X-Rollernet-Abuse: Contact abuse@rollernet.us to report. Abuse policy: http://www.rollernet.us/policy
X-Rollernet-Submit: Submit ID 76f.637fbc8e.9da1d.0

This is a multipart message in MIME format.

------=_NextPart_000_040E_01D9000B.4283E280
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_040F_01D9000B.4283E280"


------=_NextPart_001_040F_01D9000B.4283E280
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello -

 

I have an idea of where to begin: our kernel code compiles and works on Red
Hat, CentOS, and Fedora. In Ubuntu 20.04, I have an error.

 

root@form:/home/john/thor-linux/Kernel/ubuntu20.04# make

rmmod: ERROR: Module thor is not currently loaded

make: [Makefile:7: all] Error 1 (ignored)

make[1]: Entering directory '/usr/src/linux-headers-5.4.0-131-generic'

  CC [M]  /home/john/thor-linux/Kernel/ubuntu22.04/thor.o

/home/john/thor-linux/Kernel/ubuntu22.04/thor.o: warning: objtool:
_Controller_process_response_map()+0x1b3:    unreachable instruction

  Building modules, stage 2.

  MODPOST 1 modules

  CC [M]  /home/john/thor-linux/Kernel/ubuntu22.04/thor.mod.o

  LD [M]  /home/john/thor-linux/Kernel/ubuntu22.04/thor.ko

make[1]: Leaving directory '/usr/src/linux-headers-5.4.0-131-generic'

make[1]: Entering directory '/usr/src/linux-headers-5.4.0-131-generic'

  CLEAN   /home/john/thor-linux/Kernel/ubuntu22.04/Module.symvers

make[1]: Leaving directory '/usr/src/linux-headers-5.4.0-131-generic'

#@sudo dmesg -C

#@sudo insmod /usr/local/etc/thor.ko

filename:       /usr/local/etc/thor.ko

version:        0.1

description:    THOR KMOD

author:         Aronetics

license:        GPL

srcversion:     BC856FA85DB2FEFD38A1B2A

depends:

retpoline:      Y

name:           thor

vermagic:       5.4.0-131-generic SMP mod_unload modversions

#@sudo dmesg

root@form:/home/john/thor-linux/Kernel/ubuntu20.04#
<mailto:root@form:/home/john/thor-linux/Kernel/ubuntu20.04#> 

 

Every 2.0s: tail -n30 /var/lib/dkms/thor/1.0.1/build/make.log

 

DKMS make.log for thor-1.0.1 for kernel 5.4.0-131-generic (x86_64)

Thu 24 Nov 2022 01:10:33 PM EST

make: Entering directory '/usr/src/linux-headers-5.4.0-131-generic'

  CC [M]  /var/lib/dkms/thor/1.0.1/build/thor.o

/var/lib/dkms/thor/1.0.1/build/thor.o: warning: objtool:
_Controller_process_response_map()+0x1b3: unreachable instruction

  Building modules, stage 2.

  MODPOST 1 modules

  CC [M]  /var/lib/dkms/thor/1.0.1/build/thor.mod.o

  LD [M]  /var/lib/dkms/thor/1.0.1/build/thor.ko

make: Leaving directory '/usr/src/linux-headers-5.4.0-131-generic'

 

Is this an error in objtool on Ubuntu within
/usr/src/linux-headers-5.4.0-${26-130}/tools/objtool ?

 

From RHEL 8

 

[root@profile rhel8]# make

make[1]: Entering directory '/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'

  CC [M]  /home/john/thor-linux/Kernel/rhel8/thor.o

  Building modules, stage 2.

  MODPOST 1 modules

  CC      /home/john/thor-linux/Kernel/rhel8/thor.mod.o

  LD [M]  /home/john/thor-linux/Kernel/rhel8/thor.ko

make[1]: Leaving directory '/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'

make[1]: Entering directory '/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'

  CLEAN   /home/john/thor-linux/Kernel/rhel8/.tmp_versions

  CLEAN   /home/john/thor-linux/Kernel/rhel8/Module.symvers

make[1]: Leaving directory '/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'

#@sudo dmesg -C

#@sudo insmod /usr/local/etc/thor.ko

filename:       /usr/local/etc/thor.ko

version:        0.1

description:    THOR KMOD

author:         Aronetics

license:        GPL

rhelversion:    8.6

srcversion:     FC77130B3C3461BF8DE20B6

depends:

name:           thor

vermagic:       4.18.0-372.26.1.el8_6.x86_64 SMP mod_unload modversions

#@sudo dmesg

[root@profile rhel8]#

 

John


------=_NextPart_001_040F_01D9000B.4283E280
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:3.0pt;margin-right:0in;margin-bottom:3.0pt;ma=
rgin-left:0in'><span style=3D'font-size:10.0pt'>Hello =
&#8211;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:3.0pt;margin-right:0in;margin-bottom:3.0pt;ma=
rgin-left:0in'><span =
style=3D'font-size:10.0pt;color:#1D1C1D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal =
style=3D'mso-margin-top-alt:3.0pt;margin-right:0in;margin-bottom:3.0pt;ma=
rgin-left:0in'><span style=3D'font-size:10.0pt;color:#1D1C1D'>I have an =
idea of where to begin: our kernel code compiles and works on Red Hat, =
CentOS, and Fedora. In Ubuntu 20.04, I have an =
error.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:3.0pt;margin-right:0in;margin-bottom:3.0pt;ma=
rgin-left:0in'><span =
style=3D'font-size:10.0pt;color:#1D1C1D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>root@form:/home/john/thor-linux/Kernel/ubuntu2=
0.04# make<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>rmmod: ERROR: Module thor is not currently =
loaded<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>make: [Makefile:7: all] Error 1 =
(ignored)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>make[1]: Entering directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; CC [M]&nbsp; =
/home/john/thor-linux/Kernel/ubuntu22.04/thor.o<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>/home/john/thor-linux/Kernel/ubuntu22.04/thor.=
o: warning: objtool: =
_Controller_process_response_map()+0x1b3:&nbsp;&nbsp;&nbsp; unreachable =
instruction<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; Building modules, stage =
2.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; MODPOST 1 =
modules<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; CC [M]&nbsp; =
/home/john/thor-linux/Kernel/ubuntu22.04/thor.mod.o<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; LD =
[M]&nbsp; =
/home/john/thor-linux/Kernel/ubuntu22.04/thor.ko<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: Leaving =
directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: Entering =
directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; =
CLEAN&nbsp;&nbsp; =
/home/john/thor-linux/Kernel/ubuntu22.04/Module.symvers<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: =
Leaving directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>#@sudo dmesg =
-C<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>#@sudo insmod =
/usr/local/etc/thor.ko<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>filename:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/usr/local/etc/thor.ko<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>version:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0.1<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>description:&nbsp;&nbsp;&nbsp; THOR =
KMOD<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Aronetics<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>license:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; GPL<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>srcversion:&nbsp;&nbsp;&nbsp;&nbsp; =
BC856FA85DB2FEFD38A1B2A<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>depends:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>retpoline:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Y<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; thor<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>vermagic:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
5.4.0-131-generic SMP mod_unload modversions<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>#@sudo =
dmesg<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><a =
href=3D"mailto:root@form:/home/john/thor-linux/Kernel/ubuntu20.04#">root@=
form:/home/john/thor-linux/Kernel/ubuntu20.04#</a><o:p></o:p></span></p><=
p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>Every 2.0s: tail -n30 =
/var/lib/dkms/thor/1.0.1/build/make.log<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>DKMS make.log for =
thor-1.0.1 for kernel 5.4.0-131-generic (x86_64)<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>Thu 24 Nov 2022 =
01:10:33 PM EST<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>make: Entering directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; CC [M]&nbsp; =
/var/lib/dkms/thor/1.0.1/build/thor.o<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>/var/lib/dkms/thor/1.0.1/build/thor.o: =
warning: objtool: _Controller_process_response_map()+0x1b3: unreachable =
instruction<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; Building modules, stage =
2.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; MODPOST 1 =
modules<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; CC [M]&nbsp; =
/var/lib/dkms/thor/1.0.1/build/thor.mod.o<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; LD [M]&nbsp; =
/var/lib/dkms/thor/1.0.1/build/thor.ko<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>make: Leaving =
directory =
'/usr/src/linux-headers-5.4.0-131-generic'<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>Is this an error in =
objtool on Ubuntu within =
/usr/src/linux-headers-5.4.0-${26-130}/tools/objtool =
?<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>From RHEL =
8<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>[root@profile rhel8]# =
make<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>make[1]: Entering directory =
'/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; CC [M]&nbsp; =
/home/john/thor-linux/Kernel/rhel8/thor.o<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; Building =
modules, stage 2.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; MODPOST 1 =
modules<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>&nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/home/john/thor-linux/Kernel/rhel8/thor.mod.o<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; LD [M]&nbsp; =
/home/john/thor-linux/Kernel/rhel8/thor.ko<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: Leaving =
directory =
'/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: Entering =
directory =
'/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; =
CLEAN&nbsp;&nbsp; =
/home/john/thor-linux/Kernel/rhel8/.tmp_versions<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>&nbsp; =
CLEAN&nbsp;&nbsp; =
/home/john/thor-linux/Kernel/rhel8/Module.symvers<o:p></o:p></span></p><p=
 class=3DMsoNormal><span style=3D'font-size:10.0pt'>make[1]: Leaving =
directory =
'/usr/src/kernels/4.18.0-372.26.1.el8_6.x86_64'<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'>#@sudo dmesg =
-C<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>#@sudo insmod =
/usr/local/etc/thor.ko<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>filename:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/usr/local/etc/thor.ko<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>version:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0.1<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>description:&nbsp;&nbsp;&nbsp; THOR =
KMOD<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Aronetics<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>license:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; GPL<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>rhelversion:&nbsp;&nbsp;&nbsp; =
8.6<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>srcversion:&nbsp;&nbsp;&nbsp;&nbsp; =
FC77130B3C3461BF8DE20B6<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>depends:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; thor<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt'>vermagic:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
4.18.0-372.26.1.el8_6.x86_64 SMP mod_unload =
modversions<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DFR =
style=3D'font-size:10.0pt'>#@sudo dmesg<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR =
style=3D'font-size:10.0pt'>[root@profile rhel8]#<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR =
style=3D'font-size:10.0pt'>John<o:p></o:p></span></p></div></body></html>
------=_NextPart_001_040F_01D9000B.4283E280--

------=_NextPart_000_040E_01D9000B.4283E280
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIXlzCCA1cw
ggI/oAMCAQICAQEwDQYJKoZIhvcNAQELBQAwTTELMAkGA1UEBhMCVVMxGDAWBgNVBAoTD1UuUy4g
R292ZXJubWVudDEMMAoGA1UECxMDRUNBMRYwFAYDVQQDEw1FQ0EgUm9vdCBDQSA0MB4XDTEyMDMy
MDE2MTMwNFoXDTI5MTIzMDE2MTMwNFowTTELMAkGA1UEBhMCVVMxGDAWBgNVBAoTD1UuUy4gR292
ZXJubWVudDEMMAoGA1UECxMDRUNBMRYwFAYDVQQDEw1FQ0EgUm9vdCBDQSA0MIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuHBpV72AWkHAGeaV59SCE9wsOEuKgsociF2OfjwMb2Xh2rgc
cRi23hQIedvGipnt+iHdYhgALfAUzFpOd57y6HcUAxTGqf2yEqBn/x83etBwj5bXcCQOLZ1FXjwA
E+6gOjEakCBXZeQwF8bJBHndHv+gyO9frAAlOgG/lpwElY6tUrORcPT07DPhDwgXgriGCj850dyQ
Occ+uTMpg9kK6BPgXj0NJYDEbM8sLoAq0C1ASRvEnLbzNikm7DEAcxrNd5Wt5SxL8RQpNugxXN71
XI92W6sB1s/nzSer9LRzUEI0JYdXWh5UmTubAerF3ZWjsHK27HChKqqF+vGpOJQVBwIDAQABo0Iw
QDAdBgNVHQ4EFgQUM1ulb3pVYCuBSyYUzHm/SrqLMr0wDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBALYfYXiGvrV6cReK8ddFAhX3uiDF5ZNpJV4VcTlO
wdHY6HtDu40Z0cAg3+dNq4pdf4AgjY3vAmiK1QCcIbcFrOe3j7GUUz25bvj36IJV0SgkZYDlFsew
RAvThFJDI8ja+172AYbZN7/9brhQyA3mPHT6C26P8ozD31C3nyj4rlAcmsy+dm5K2vS1KDWhHXKR
dhog7zrIRJDAHQZ7sM24weayW09IFVojo2rJBlp8jIhEcYma52rePQmv0cu8lacIV45RoTER03Hw
g+9Qx+55bDsjY/iaZm4OKSAbrSXNubi/G9JzQADDTayJZPFzoIOJDhp0mKiUPLZ07JROAhXrMW4w
ggSSMIIDeqADAgECAgIC9TANBgkqhkiG9w0BAQsFADBNMQswCQYDVQQGEwJVUzEYMBYGA1UEChMP
VS5TLiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0ExFjAUBgNVBAMTDUVDQSBSb290IENBIDQwHhcN
MTkwNTA3MTI1NTI4WhcNMjUwNTA3MTI1NTI4WjB1MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5T
LiBHb3Zlcm5tZW50MQwwCgYDVQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9y
aXRpZXMxGjAYBgNVBAMTEUlkZW5UcnVzdCBFQ0EgUzIyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAt6DTxW5yDAER5mqwNjBumWj29f1myTOf5jY+hFnWGTHaJd/V9DcX12FxPaAgOsj8
q3k9NOOYIPQO6woEVFFf31rNmuE7b5lmhOtjGP8BUUOQIq0lBZxH+Kx6yXQ0gDtDZkpVQMDkxMOx
Ko8cRcc65DjecWG006CCLcTBN/nIhykX8cXlxIk8klIkkuC7j6ymjTnMHCAhKGpu1AbDIjyC+RhF
hkrhuYNsw9Bpqm941owaLCeiHky8K/mWLfYYv3Yysz6aUJcWdwZUoEStjClzMDPsRyJD9CbxQ0ZC
rSa1NK9HSGc0teT088t21uLDvkWBzGr7hCOPXJqQGZ4F3oS4IQIDAQABo4IBUjCCAU4wHwYDVR0j
BBgwFoAUM1ulb3pVYCuBSyYUzHm/SrqLMr0wHQYDVR0OBBYEFOikBAKeSdIV0aVfu+uUOQS7gilu
MA4GA1UdDwEB/wQEAwIBhjAzBgNVHSAELDAqMAwGCmCGSAFlAwIBDAQwDAYKYIZIAWUDAgEMBTAM
BgpghkgBZQMCAQwKMBIGA1UdEwEB/wQIMAYBAf8CAQAwDAYDVR0kBAUwA4ABADA3BgNVHR8EMDAu
MCygKqAohiZodHRwOi8vY3JsLmRpc2EubWlsL2NybC9FQ0FST09UQ0E0LmNybDBsBggrBgEFBQcB
AQRgMF4wOgYIKwYBBQUHMAKGLmh0dHA6Ly9jcmwuZGlzYS5taWwvaXNzdWVkdG8vRUNBUk9PVENB
NF9JVC5wN2MwIAYIKwYBBQUHMAGGFGh0dHA6Ly9vY3NwLmRpc2EubWlsMA0GCSqGSIb3DQEBCwUA
A4IBAQBIB/AYjrPQr2Jh/qkcECcjetqBrhU8SsNRI42IW2xdfRqBODnKxWDFkkBtfNd/8+g5/76e
6c8f0Zw9fn8UTqdMaU0H9ylZt9ngc8aM6BhcaOyK1ClZwHohTpZHemhlI8nw6o7VRgIWl8E0Om/A
OOuNxPOYJ1DeG4XfGKqbTMwXVLVYE1M9PO3kNQpVFiXzwtw5WxCoQjkXd6aq1PWWehMF+r54/O4+
Ycu/Gr5y66EEFPnqLKXjJnJcOVDzwQ/k/7sGpQW7kxHeY/+YbBVdG0R0MvCyKIBWgIwimt0viqqq
a3oOCnYP3J1vB7vu+GH9d1bZKB64WZGknXyHK3QS8DArMIIHqDCCBpCgAwIBAgIQQAFu/9vH1Hi9
faHFlIkOwDANBgkqhkiG9w0BAQsFADB1MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5TLiBHb3Zl
cm5tZW50MQwwCgYDVQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9yaXRpZXMx
GjAYBgNVBAMTEUlkZW5UcnVzdCBFQ0EgUzIyMB4XDTE5MTIxMzE1MjM0M1oXDTIyMTIxMjE1MjM0
M1owgZUxCzAJBgNVBAYTAlVTMRgwFgYDVQQKEw9VLlMuIEdvdmVybm1lbnQxDDAKBgNVBAsTA0VD
QTESMBAGA1UECxMJSWRlblRydXN0MRYwFAYDVQQLEw1Bcm9uZXRpY3MgTExDMTIwMAYDVQQDEylK
b2huIEFyb246QTAxMDlCMzAwMDAwMTZFQTg2RjNGMjMwMDAwMUQyNTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBALEOcknUWWvkkaX1oKZfNlKj3CgBICGb1GoeE1rnUQvcEDuVeAtP+zsW
5rxqusImavijhTwckMzo6QFNkUaInis462cAK+fDVL8btNBl0RatZuW6LJpFwYJBJ9mI5yXVAv+Q
tQ3USTwDU29OH5E4s1+SUrX31Ts2P+iq3nEc4XFNYjBn8KAeDBkJg9rrxvqZh5mxMpuUkDNfH+ZM
pVXVHvRk7sTYLYJXc6mG8EKk1tllw8czhaLvxQxse1w+PPWbVsluf2Bqv5eU1JvS5MXHnK2A/NmS
aa/chm46GdRr9Jh32rKCQcw+BCEa4HG4NyvibXiSD/OKasb6/U+xnIAjnsUCAwEAAaOCBBEwggQN
MA4GA1UdDwEB/wQEAwIFIDCCATEGCCsGAQUFBwEBBIIBIzCCAR8wKwYIKwYBBQUHMAGGH2h0dHA6
Ly9lY2FzMi5vY3NwLmlkZW50cnVzdC5jb20wgagGCCsGAQUFBzAChoGbbGRhcDovL2xkYXBlY2Eu
aWRlbnRydXN0LmNvbS9jbiUzRElkZW5UcnVzdCUyMEVDQSUyMFMyMiUyQ291JTNEQ2VydGlmaWNh
dGlvbiUyMEF1dGhvcml0aWVzJTJDb3UlM0RFQ0ElMkNvJTNEVS5TLiUyMEdvdmVybm1lbnQlMkNj
JTNEVVM/Y0FDZXJ0aWZpY2F0ZTtiaW5hcnkwRQYIKwYBBQUHMAKGOWh0dHA6Ly92YWxpZGF0aW9u
LmlkZW50cnVzdC5jb20vY2VydHMvaWRlbnRydXN0ZWNhczIyLmNlcjAfBgNVHSMEGDAWgBTopAQC
nknSFdGlX7vrlDkEu4IpbjAbBgNVHQkEFDASMBAGCCsGAQUFBwkEMQQTAlVTMIIBMwYDVR0gBIIB
KjCCASYwggEiBgpghkgBZQMCAQwFMIIBEjBLBggrBgEFBQcCARY/aHR0cHM6Ly9zZWN1cmUuaWRl
bnRydXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L2VjYS9pbmRleC5odG1sMIHCBggrBgEFBQcC
AjCBtQyBskNlcnRpZmljYXRlIHVzZSByZXN0cmljdGVkIHRvIFJlbHlpbmcgUGFydHkocykgaW4g
YWNjb3JkYW5jZSB3aXRoIEVDQS1DUCAoc2VlIGh0dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20v
Y2VydGlmaWNhdGVzL3BvbGljeS9FQ0EvaW5kZXguaHRtbCkuIEVDQS1DUFMgaW5jb3Jwb3JhdGVk
IGJ5IHJlZmVyZW5jZS4wgf0GA1UdHwSB9TCB8jCBsKCBraCBqoaBp2xkYXA6Ly9sZGFwZWNhLmlk
ZW50cnVzdC5jb20vY24lM0RJZGVuVHJ1c3QlMjBFQ0ElMjBTMjIlMkNvdSUzRENlcnRpZmljYXRp
b24lMjBBdXRob3JpdGllcyUyQ291JTNERUNBJTJDbyUzRFUuUy4lMjBHb3Zlcm5tZW50JTJDYyUz
RFVTP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q7YmluYXJ5MD2gO6A5hjdodHRwOi8vdmFsaWRh
dGlvbi5pZGVudHJ1c3QuY29tL2NybC9pZGVudHJ1c3RlY2FzMjIuY3JsMB0GA1UdEQQWMBSBEmpv
aG5AYXJvbmV0aWNzLmNvbTAdBgNVHQ4EFgQUubvtwtL7mOqQ4xQAAHBOKiFE0VQwEwYDVR0lBAww
CgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAB3CQjE6kc6J1T0nCka4EQPQbHrrjEYcoY26
oX1gtxgpkmL7V3NakWycjwzLOIFD9PipfK61TT/j6UNvNHg2GUatdipfIZ+oXGEkq3LG16dOl/On
FpY6qTT2PF1hZUrUAPXTSq6syomsTzP4BNc02+X5BNNIn6302q63+RfjZFUUKEozP+XEFANxwccJ
Z6w9oB6w+nk+u55dCRmPxEw+6iPVEpn/V1BDt/9wu7GR6kbne0n9JUs0ChT6lGYsd1OZGyWb4L5i
BeZ8433zFdeaMQMgZNFEpzcYtTLOOV94KVdsQbEAVjuy5ys3LueB+TmHp54Sek2jm76gzVR8EF0F
os4wggf2MIIG3qADAgECAhBAAW7/3NMKJM1U1yqHjdeXMA0GCSqGSIb3DQEBCwUAMHUxCzAJBgNV
BAYTAlVTMRgwFgYDVQQKEw9VLlMuIEdvdmVybm1lbnQxDDAKBgNVBAsTA0VDQTEiMCAGA1UECxMZ
Q2VydGlmaWNhdGlvbiBBdXRob3JpdGllczEaMBgGA1UEAxMRSWRlblRydXN0IEVDQSBTMjIwHhcN
MTkxMjEzMTUyNDUyWhcNMjIxMjEyMTUyNDUyWjCBlTELMAkGA1UEBhMCVVMxGDAWBgNVBAoTD1Uu
Uy4gR292ZXJubWVudDEMMAoGA1UECxMDRUNBMRIwEAYDVQQLEwlJZGVuVHJ1c3QxFjAUBgNVBAsT
DUFyb25ldGljcyBMTEMxMjAwBgNVBAMTKUpvaG4gQXJvbjpBMDEwOUIzMDAwMDAxNkVBODZGM0Yy
MzAwMDAxRDI1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy3NpPOFjY6VLGiFUeCtC
iOyNmDyeV3lOnaDNRsdk603M+o6f+ZFinFnp2bvBt1WfOz4zGu2Nd7Mk5c788MOSk26M2KzpjS10
giyYYEaCDbBE9Z/owhySIRLVeSo1A6CiRHcTEBAaNfYpLGqXYXbELZDk2E1H5vmnVKcrWRxG2YZR
lxw4sAhLi8fmHQDvYPofsDKcebAUAbf7gpsMhtXFimCna3YgJvpGTR+BZ0ipONkp5wjz8l8V4b6g
1xFGdWufwEd0ct33ZY3BZVIaRypc3Jr3T6IcvjA4k9HwUzkcjSuCLe+So2ur7gTmY2FO6yoEDfIw
pBQU06QD5Pot7BnzdQIDAQABo4IEXzCCBFswDgYDVR0PAQH/BAQDAgbAMIIBMQYIKwYBBQUHAQEE
ggEjMIIBHzArBggrBgEFBQcwAYYfaHR0cDovL2VjYXMyLm9jc3AuaWRlbnRydXN0LmNvbTCBqAYI
KwYBBQUHMAKGgZtsZGFwOi8vbGRhcGVjYS5pZGVudHJ1c3QuY29tL2NuJTNESWRlblRydXN0JTIw
RUNBJTIwUzIyJTJDb3UlM0RDZXJ0aWZpY2F0aW9uJTIwQXV0aG9yaXRpZXMlMkNvdSUzREVDQSUy
Q28lM0RVLlMuJTIwR292ZXJubWVudCUyQ2MlM0RVUz9jQUNlcnRpZmljYXRlO2JpbmFyeTBFBggr
BgEFBQcwAoY5aHR0cDovL3ZhbGlkYXRpb24uaWRlbnRydXN0LmNvbS9jZXJ0cy9pZGVudHJ1c3Rl
Y2FzMjIuY2VyMB8GA1UdIwQYMBaAFOikBAKeSdIV0aVfu+uUOQS7giluMBsGA1UdCQQUMBIwEAYI
KwYBBQUHCQQxBBMCVVMwggEzBgNVHSAEggEqMIIBJjCCASIGCmCGSAFlAwIBDAUwggESMEsGCCsG
AQUFBwIBFj9odHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kv
ZWNhL2luZGV4Lmh0bWwwgcIGCCsGAQUFBwICMIG1DIGyQ2VydGlmaWNhdGUgdXNlIHJlc3RyaWN0
ZWQgdG8gUmVseWluZyBQYXJ0eShzKSBpbiBhY2NvcmRhbmNlIHdpdGggRUNBLUNQIChzZWUgaHR0
cHM6Ly9zZWN1cmUuaWRlbnRydXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L0VDQS9pbmRleC5o
dG1sKS4gRUNBLUNQUyBpbmNvcnBvcmF0ZWQgYnkgcmVmZXJlbmNlLjCB/QYDVR0fBIH1MIHyMIGw
oIGtoIGqhoGnbGRhcDovL2xkYXBlY2EuaWRlbnRydXN0LmNvbS9jbiUzRElkZW5UcnVzdCUyMEVD
QSUyMFMyMiUyQ291JTNEQ2VydGlmaWNhdGlvbiUyMEF1dGhvcml0aWVzJTJDb3UlM0RFQ0ElMkNv
JTNEVS5TLiUyMEdvdmVybm1lbnQlMkNjJTNEVVM/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdDti
aW5hcnkwPaA7oDmGN2h0dHA6Ly92YWxpZGF0aW9uLmlkZW50cnVzdC5jb20vY3JsL2lkZW50cnVz
dGVjYXMyMi5jcmwwVQYDVR0RBE4wTIESam9obkBhcm9uZXRpY3MuY29toDYGCisGAQQBgjcUAgOg
KAwmQTAxMDlCMzAwMDAwMTZFQTg2RjNGMjMwMDAwMUQyNUBET0RFQ0EwHQYDVR0OBBYEFNxheynV
IGu32/+BAJUls+Xd5lguMCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQC
AjANBgkqhkiG9w0BAQsFAAOCAQEAZ5P1oC44GLasrCz7mLzBbu8EcBtVK2drq7Kr0b1HBt/YS+MZ
egtyCcoQeutwheALquDsTm4BcaIBo5kxghOjm+cTQLPfthDbi7gjM36vdFtlysSiFjiPLgqWN+yA
uJjbdc3oXfE+FyPDbo8nMBJN8PQc2v77/OYPJ0UhYuvdsNt+t3NHhJVjDCOLuSEQAZw32D05nhiY
E/GmF2CLmWQMyuxKQVaT+H2bjp8/2MSqD0BWffXN7RJJWPIO1xhj6DVYJW93IYWTJwcomrK0GxFy
cR4+SQEkY+ImADwdNNxkHgCvU8ej4Jv2aFYVfVGZ8W4B7KumCFTYAdte8OgA2xwS7TGCA+QwggPg
AgEBMIGJMHUxCzAJBgNVBAYTAlVTMRgwFgYDVQQKEw9VLlMuIEdvdmVybm1lbnQxDDAKBgNVBAsT
A0VDQTEiMCAGA1UECxMZQ2VydGlmaWNhdGlvbiBBdXRob3JpdGllczEaMBgGA1UEAxMRSWRlblRy
dXN0IEVDQSBTMjICEEABbv/c0wokzVTXKoeN15cwCQYFKw4DAhoFAKCCAi8wGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIxMTI0MTg0NzE0WjAjBgkqhkiG9w0BCQQx
FgQUCyAvq9jbsRPfJZNdLNWiUDTBkUAwgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASow
CwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYI
KoZIhvcNAwICAUAwBwYFKw4DAhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQME
AgEwgZoGCSsGAQQBgjcQBDGBjDCBiTB1MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5TLiBHb3Zl
cm5tZW50MQwwCgYDVQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9yaXRpZXMx
GjAYBgNVBAMTEUlkZW5UcnVzdCBFQ0EgUzIyAhBAAW7/28fUeL19ocWUiQ7AMIGcBgsqhkiG9w0B
CRACCzGBjKCBiTB1MQswCQYDVQQGEwJVUzEYMBYGA1UEChMPVS5TLiBHb3Zlcm5tZW50MQwwCgYD
VQQLEwNFQ0ExIjAgBgNVBAsTGUNlcnRpZmljYXRpb24gQXV0aG9yaXRpZXMxGjAYBgNVBAMTEUlk
ZW5UcnVzdCBFQ0EgUzIyAhBAAW7/28fUeL19ocWUiQ7AMA0GCSqGSIb3DQEBAQUABIIBAFBkdIma
afd85RgVf019fskTCpIMrXtqRbvnJktpnEeKnbGPyW0l6vZ5hCF1uVl2ZD/Oa59WkOc74WHJ9kwX
9815dcG6GQXUUu//2HADrd70jEnHDCFiAXD4DUBPiszMpuuC1Lct8etS4z+ML7NaL+ertaLjTFNF
5pyxm24PL1H15HLR2rnSEvZt1ud93cAqeI85ZFDz39qbX/LQ3YFq+9o9uDaFIVUUbGlyzMIHdT+I
R2WTd2ia2qdwOGLCroFZFJlUI42DNtyVGjAyaKvyvuM1e+SXcgEb48fk4/7yV/ekLolXUDqgKgA9
2ClFY+02Ybcr6TJBpDnP8RPDDNXTTKoAAAAAAAA=

------=_NextPart_000_040E_01D9000B.4283E280--

