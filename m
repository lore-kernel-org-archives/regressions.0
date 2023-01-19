Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65723C26
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 09:50:53 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by opfedar22.francetelecom.fr (ESMTP service) with ESMTPS id 4NyHgs32L7z2yqR;
	Thu, 19 Jan 2023 10:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
	s=ORANGE001; t=1674121273;
	bh=mCEdVgMjyut13wJUVxYvAyjmEtBthDb+bBzYZnGsEwI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=AghDeqE7pToCdEzudRdCewCXofa/vKLBvi6BFkpDVQneo7mU5A71lCPLTGetKG3fV
	 62fS9B2jsShinQwPSd3RtEXFtqCaQTDGHKfBkn0JgIXs/1Aw5netOAByzNdUFrf5bh
	 166nQLe74TPelsdHOfyx40YeN4aKXzcY4BEkgDJe/IpJcCuBGDPqcKVFX6tMoHH3wb
	 r9q1sFlDKiCaJbPHiKAXDuorAXp7ZILtPKNG7/kBH/3iRYNlLVQZoY3mE5DThSEL9i
	 044Rrb14LmPGPsm0X4xvgROtiLvi7ESE2DHciam8HDTIdiP0N74OvSz62NWUdIcClp
	 jlrQGCxboKiUg==
From: <sylvain.menu@orange.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"chuck.lever@oracle.com" <chuck.lever@oracle.com>, "jlayton@kernel.org"
	<jlayton@kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>
Subject: nfs mount disappears due to inode revalidate failure
Thread-Topic: nfs mount disappears due to inode revalidate failure
Thread-Index: Adkr6eSEIBA2MrcaQiG7TRL1gltnxw==
Content-Class:
Date: Thu, 19 Jan 2023 09:41:12 +0000
Message-ID: <a3a8530078d7493e8e094fd621357da0@orange.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_Enabled=true;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_SetDate=2023-01-19T09:40:58Z;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_Method=Privileged;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_Name=unrestricted_parent.2;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_SiteId=90c7a20a-f34b-40bf-bc48-b9253b6f5d20;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_ActionId=a2f200d9-7c08-43bb-9619-e85ddbee917a;
 MSIP_Label_07222825-62ea-40f3-96b5-5375c07996e2_ContentBits=0
x-originating-ip: [10.115.27.51]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_0006_01D92BF2.8ACC5FF0"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

------=_NextPart_000_0006_01D92BF2.8ACC5FF0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0007_01D92BF2.8ACC5FF0"


------=_NextPart_001_0007_01D92BF2.8ACC5FF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I am writing to report an issue on a nfs mount that disappears due to an
inode revalide failure.

 
<https://github.com/torvalds/linux/commit/cc89684c9a265828ce061037f1f79f4a68
ccd3f7> This very old commit exactly show the problem I have and
<https://bugzilla.kernel.org/show_bug.cgi?id=117651> this old resolved issue
is probably failing again today

 

To sum up, I have a NFS mount inside another NFS mount (for example:
/opt/nfs/mount1 & /opt/nfs/mount1/mount2).

If I kill a task trying to get a file descriptor on /opt/nfs/mount1/mount2
then it will be unmounted. My simple test code to reproduce very easily:

 

int main(int argc, char *argv[]) {

    while (1) {

        close(open(argv[1], O_RDONLY));

    }

}

 

In logs, I have: "nfs_revalidate_inode: (0:62/845965) getattr failed,
error=-512"

 

Tested on 5.19 and 6.1 kernel

 

Best regards,

Sylvain Menu

 


------=_NextPart_001_0007_01D92BF2.8ACC5FF0
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>Hell=
o,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'><o:p=
>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>I =
am writing to report an issue on a nfs mount =
that&nbsp;disappears&nbsp;due to an inode revalide failure.</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'><a =
href=3D"https://github.com/torvalds/linux/commit/cc89684c9a265828ce061037=
f1f79f4a68ccd3f7"><span lang=3DEN-US>This very old =
commit</span></a></span><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'> =
exactly show the problem I have and&nbsp;</span><span =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'><a =
href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D117651"><span =
lang=3DEN-US>this old resolved issue</span></a></span><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'> is =
probably failing again today</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>To =
sum up, I have a NFS mount inside another NFS mount (for =
example:&nbsp;/opt/nfs/mount1 =
&amp;&nbsp;/opt/nfs/mount1/mount2).</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>If =
I kill a task trying to get a file descriptor =
on&nbsp;/opt/nfs/mount1/mount2 then it will be unmounted. My simple test =
code to reproduce very easily:</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>int =
main(int argc, char *argv[])&nbsp;{</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>&nbs=
p; &nbsp; while (1) {</span><span lang=3DEN-US><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>&nbs=
p; &nbsp; &nbsp; &nbsp;&nbsp;close(open(argv[1], O_RDONLY));</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>&nbs=
p; &nbsp; }</span><span lang=3DEN-US><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>}</s=
pan><span lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>In =
logs, I have: &quot;nfs_revalidate_inode: (0:62/845965) getattr failed, =
error=3D-512&quot;</span><span lang=3DEN-US><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>Test=
ed on 5.19 and 6.1 kernel</span><span =
lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'><o:p=
>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>Best=
 regards,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:9.5pt;font-family:"Arial",sans-serif;color:black'>Sylv=
ain Menu<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_001_0007_01D92BF2.8ACC5FF0--

------=_NextPart_000_0006_01D92BF2.8ACC5FF0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
ogsf5Z7CE95+DAuUAbcaqUNh8FVmeDERiIjXoImSfW7QERVimsTVPxt1mLUCAwEAAaOCAoIwggJ+
MB0GA1UdDgQWBBT/A21fEDRXJiutQWc42masBz77+DAfBgNVHSMEGDAWgBTs7DHr1umvFzVzvp1s
VPfoxKcvxDAOBgNVHQ8BAf8EBAMCBSAwEwYDVR0lBAwwCgYIKwYBBQUHAwQwggFyBgNVHR8EggFp
MIIBZTCB2aCB1qCB04aB0GxkYXA6Ly8vY249T3JhbmdlIEludGVybmFsIEcyIFVzZXIgQ2xhc3Mg
MiBDQSxjbj1pZ2NnZnRpLENOPUNEUCxDTj1QdWJsaWMgS2V5IFNlcnZpY2VzLENOPVNlcnZpY2Vz
LENOPUNvbmZpZ3VyYXRpb24sREM9YWQsREM9ZnJhbmNldGVsZWNvbSxEQz1mcj9jZXJ0aWZpY2F0
ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Y2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwRaBD
oEGGP2h0dHA6Ly9wa2ktY3JsLml0bi5mdGdyb3VwL2NybC9vcmFuZ2VpbnRlcm5hbGcyLXVzZXIt
Y2xhc3MyLmNybDBAoD6gPIY6aHR0cDovL3BraS5vcmFuZ2UuY29tL2NybC9vcmFuZ2VpbnRlcm5h
bGcyLXVzZXItY2xhc3MyLmNybDAiBgNVHREEGzAZgRdzeWx2YWluLm1lbnVAb3JhbmdlLmNvbTA/
BgNVHSAEODA2MDQGCSqBegEQDAoHATAnMCUGCCsGAQUFBwIBFhlodHRwOi8vcGtpLm9yYW5nZS5j
b20vY3BzMDwGCCsGAQUFBwEBBDAwLjAsBggrBgEFBQcwAYYgaHR0cDovL3BraS1vY3NwLml0bi5m
dGdyb3VwL29jc3AwDQYJKoZIhvcNAQELBQADggIBABiBk7iLq4mTVQjCZ9PYwOkaEK03Zi7xUXkW
WCYEKQdBwENhXD52bVME1kZ2OGF8a/gJgWn3x3wToaHBw9pjjIEov/CTj6SLerAzZf9e/UadTfbm
x27jABepE1LgtxZC42BsYjHSlPOmWvazoBafQVjCvHQB/9YJ1UZeJYln7+g6MCaxI/SYpYEsRmvu
3x/2jhs1+rJWel9wtaRqKtzMcR9RFjI6Ms0bCW998y2tvilXEgPTjFFw87UHvIs0yBKwuj60Fe5O
9iQRWIP4P+fyxZBL19AEQImtoSe4pFOgk+xNaZZ7kkJTFvu5a9gjvfuAOmuisHJsVjgJM7gc1mdW
GgjSZW5nVtcIKuPrkWxTN/tixu3KHaiQFfQoodm26wW/hByy760gA5bTkbi7ZHSaJ8MXQeV7roW5
Dk9EOAAs1DYzLyoTpCGVmAu2s/xcCten5BFS50SPEPYNFj1lobMdUSoE+v239D1NwP92hRG2YoeY
AfJAy0aIbmtyae+Z8JcPiW0HRVhlbnjHPyCeJhvZvQCUOnnjSB/iPsvK5ma5PUSjnv9cqO/3ARhn
sjE5ovWJq9djaIALhvjSlo3fwkgMkvcTfINIDRMjnvWJK3xt05VGGSv6LW5+Ar2gpuKv/0Wl3QW/
QLKKjloJrEXnNZYx3CX19IR+EmwxsNdb1lZqhGdTMIIG1DCCBLygAwIBAgIUXkWnE/O1XDPcTfd/
YlfcPCrau6wwDQYJKoZIhvcNAQELBQAwZTELMAkGA1UEBhMCRlIxDzANBgNVBAoMBk9yYW5nZTEY
MBYGA1UECwwPRlIgODkgMzgwMTI5ODY2MSswKQYDVQQDDCJPcmFuZ2UgSW50ZXJuYWwgRzIgVXNl
ciBDbGFzcyAyIENBMB4XDTIxMDkyMzA2MjMxNFoXDTI1MDkyMzA2MjMxNFowXTELMAkGA1UEBhMC
RlIxDzANBgNVBAoMBk9yYW5nZTEVMBMGA1UEAwwMTWVudSBTeWx2YWluMSYwJAYJKoZIhvcNAQkB
FhdzeWx2YWluLm1lbnVAb3JhbmdlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
AInYNLSGGDNoPBvYp0TY/myvcPzZNJV92Nv+mtiHauwFvT2gWJ7JNoQGhR2kpUD91fTiO9Whl+UY
Sx3zy8luR0c6e5NLzw6tKC4fMtEXtIXhFTQ8b3+TknQjiYSF++FVtHtCTy3tDRQ0KB/ZFrYxrxDN
ECmEY+vKbOzAD+fT7pqMDAYGZpLltyWHFHP5UjsXPPOkEiMNfcx5mU2Nw3DHgek+Ee5N5vFoCbCM
crepja5nIwJmNqBD8NVtiqDUz9uQz/f+huuPhDljIY/MTcnoEP3/+R7AoPBHVFqd0PY4u6YAJIP+
w5ZxV2UUVGQicq6mGbv/G3DGGU61VHbao3EZg6kCAwEAAaOCAoIwggJ+MB0GA1UdDgQWBBQ4BfIm
mkhQPAsIGJBauqGXj106MzAfBgNVHSMEGDAWgBTs7DHr1umvFzVzvp1sVPfoxKcvxDAOBgNVHQ8B
Af8EBAMCBsAwEwYDVR0lBAwwCgYIKwYBBQUHAwQwggFyBgNVHR8EggFpMIIBZTCB2aCB1qCB04aB
0GxkYXA6Ly8vY249T3JhbmdlIEludGVybmFsIEcyIFVzZXIgQ2xhc3MgMiBDQSxjbj1pZ2NnZnRp
LENOPUNEUCxDTj1QdWJsaWMgS2V5IFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRp
b24sREM9YWQsREM9ZnJhbmNldGVsZWNvbSxEQz1mcj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Y2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwRaBDoEGGP2h0dHA6Ly9wa2kt
Y3JsLml0bi5mdGdyb3VwL2NybC9vcmFuZ2VpbnRlcm5hbGcyLXVzZXItY2xhc3MyLmNybDBAoD6g
PIY6aHR0cDovL3BraS5vcmFuZ2UuY29tL2NybC9vcmFuZ2VpbnRlcm5hbGcyLXVzZXItY2xhc3My
LmNybDAiBgNVHREEGzAZgRdzeWx2YWluLm1lbnVAb3JhbmdlLmNvbTA/BgNVHSAEODA2MDQGCSqB
egEQDAoGATAnMCUGCCsGAQUFBwIBFhlodHRwOi8vcGtpLm9yYW5nZS5jb20vY3BzMDwGCCsGAQUF
BwEBBDAwLjAsBggrBgEFBQcwAYYgaHR0cDovL3BraS1vY3NwLml0bi5mdGdyb3VwL29jc3AwDQYJ
KoZIhvcNAQELBQADggIBABiag1JlVhMvYbDPfoOKU/XyBQ2qobWCraXBoXXqZOAO5Dk9yT9n5ATz
ifx0tcrpyrH/x/EqgAN31F7FbCu20ptMRYww5I/jeFL1z24Ye8kqWjKC0rPI4GRHfTETpbhqngzG
/ZqRNGJH/QesqGdj3vi6PIKu9JtwJHLTd+kvNpqz1ZAUmgv3DwrU42Z4+FebC7ZnRCJ9l4i2ADYm
b5zymeZ+faty4KnCT9x0XQZm1Pv1utADk146AcM6J0alJA7zEinqaFZZRNJgB2kJKBQXt+TOAdv0
oSSJ//972/FSQix/ejD8DSWG4V9ruppiPYcwRR25PszEh8dBXSPJu4PXNjna0pCRzfU+pfb4WgC/
AQ9weiPW40dj+jTD+ZXKTLTUh3O/wXwvgJqLxmkgaep9kxyHQG6+n424VjW67yj7X5c4HCTAUSQh
bYBXt//XmUZm79sTVQGVGef/uN82Q3VYLIqpJk/GG1SwLVjKF3Ur4kFOrnUsAVhS7TxJNRPY0ZAS
p9oePiQxBa/0qtlHNue3r4ZcnaLhPsRwizjvIRVdMa13zHsEsOD6AptjvxMbWeUEw8Fkupx8QqxA
uAviKCLoj2UJzvi6HEB1g4DDbuN+B9QjWutpRFaHY0RcHs168godxEmoHZrJvHiSaAS0TNJtTrzp
WbWa3+b+0Mh9GuFrLG4zMYIDyzCCA8cCAQEwfTBlMQswCQYDVQQGEwJGUjEPMA0GA1UECgwGT3Jh
bmdlMRgwFgYDVQQLDA9GUiA4OSAzODAxMjk4NjYxKzApBgNVBAMMIk9yYW5nZSBJbnRlcm5hbCBH
MiBVc2VyIENsYXNzIDIgQ0ECFF5FpxPztVwz3E33f2JX3Dwq2rusMA0GCWCGSAFlAwQCAQUAoIIC
HzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzAxMTkwOTQxMDla
MC8GCSqGSIb3DQEJBDEiBCC7DaqAuaX96gvOT2NAedPpvCsKLIH6tb2GvjoUZMzWCzCBjAYJKwYB
BAGCNxAEMX8wfTBlMQswCQYDVQQGEwJGUjEPMA0GA1UECgwGT3JhbmdlMRgwFgYDVQQLDA9GUiA4
OSAzODAxMjk4NjYxKzApBgNVBAMMIk9yYW5nZSBJbnRlcm5hbCBHMiBVc2VyIENsYXNzIDIgQ0EC
FAdYMdm6likDsEoSHzz5comtOdkaMIGOBgsqhkiG9w0BCRACCzF/oH0wZTELMAkGA1UEBhMCRlIx
DzANBgNVBAoMBk9yYW5nZTEYMBYGA1UECwwPRlIgODkgMzgwMTI5ODY2MSswKQYDVQQDDCJPcmFu
Z2UgSW50ZXJuYWwgRzIgVXNlciBDbGFzcyAyIENBAhQHWDHZupYpA7BKEh88+XKJrTnZGjCBkwYJ
KoZIhvcNAQkPMYGFMIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJ
YIZIAWUDBAECMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgB
ZQMEAgMwCwYJYIZIAWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA7bQDayT1z
3H+GO0PA00CpDPggVOm9V/OA40DpalEzBnST+2GIoGILn4124dhXwXg6EiJkQKNfZhjNxVrw/t+J
Wu6bUXH20UPRUQDQdWVYbohTd1mkhDRVs58KEOAZytWxTcDPhNc0/nZLPtMUx8nnlOMrlPA0yzcN
npZogxxuw2G0+153YJNki9uHVaM5k4nHU2BT4PvMJYSh+Hccmyxn0OWxmD99toLvW/LN/qd33nHA
RLtNkD0UGs5sYVHbHz6nmP93CBh4kclE0iWnclEvnADjq2XrA4C5OftFWRRdwapwl2X8Gq9K0Uy0
OIklm7IXXDV++iVZt/tqBSa5mX6IAAAAAAAA

------=_NextPart_000_0006_01D92BF2.8ACC5FF0--
