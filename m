Received: from mail.interpipe.biz (mail.interpipe.biz [195.24.140.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F052FB6
	for <regressions@lists.linux.dev>; Wed, 19 May 2021 08:09:02 +0000 (UTC)
Received: from dp0.interpipe.biz (unknown [172.21.0.2])
	by mail.interpipe.biz (MTA) with ESMTPS id 92A41206D7;
	Wed, 19 May 2021 11:03:03 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.interpipe.biz 92A41206D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interpipe.biz;
	s=default; t=1621411383;
	bh=gICOJYZMmO6ZaoSOH6hOMTXWrR7VLl28k0e5hZWvUT0=;
	h=From:To:CC:Subject:Date:Reply-To;
	b=QZg2DZmCVfr2BrC9TnjHvIbou5w/+AfAegrjL/shXp9c9E8dzBDABruJ1QZjCDwll
	 4/3GIAStIUZtipojJLNRbl1TE3AlfactYqmJRJy21ek75QgwohvuHDPr6/QV83CfOf
	 75w5HjDD5KamV4Ump7kDJ/kOqniheS0TM9V2l624=
Received: from localhost (localhost [127.0.0.1])
	by dp0.interpipe.biz (MTA) with ESMTP id 8FFCB13DC81;
	Wed, 19 May 2021 11:03:03 +0300 (EEST)
Received: from dp0.interpipe.biz ([127.0.0.1])
	by localhost (ursa.dmz.dp.tkb [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dkczbwdb2plt; Wed, 19 May 2021 11:03:03 +0300 (EEST)
Received: from exi.m.interpipe.biz (unknown [172.17.1.209])
	by dp0.interpipe.biz (MTA) with ESMTPS id 7C2D713DC87;
	Wed, 19 May 2021 11:03:03 +0300 (EEST)
Received: from EXI1.office.dp.tkb (172.17.1.209) by EXI1.office.dp.tkb
 (172.17.1.209) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 11:01:30 +0300
Received: from EXI1.office.dp.tkb ([::1]) by EXI1.office.dp.tkb
 ([fe80::2913:57f5:8237:bda5%13]) with mapi id 15.00.1497.012; Wed, 19 May
 2021 11:01:30 +0300
From: Anatoli N.Chechelnickiy <Anatoli.Chechelnickiy@m.interpipe.biz>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "sashal@kernel.org"
	<sashal@kernel.org>
Subject: regressions in iommu system with 5.10.37
Thread-Topic: regressions in iommu system with 5.10.37
Thread-Index: AQHXTIUsm9FmSQlqM0mTWOuO/1M3bQ==
Date: Wed, 19 May 2021 08:01:29 +0000
Message-ID: <8893cfb2-d4e8-f3e9-e0b9-bbacf1220dca@m.interpipe.biz>
Reply-To: Anatoli N.Chechelnickiy <Anatoli.Chechelnickiy@m.interpipe.biz>
Accept-Language: en-US, ru-RU
Content-Language: ru-RU
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms030506080901090601010903"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--------------ms030506080901090601010903
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi

I'm sorry to report about regression in 5.10.37

with

CONFIG_IOMMU_IOVA=3Dy
CONFIG_IOMMU_API=3Dy
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_OF_IOMMU=3Dy
CONFIG_INTEL_IOMMU=3Dy
CONFIG_INTEL_IOMMU_SVM=3Dy
CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy

and iommu=3Don in grub.cfg


All my dell r340 and all lenovo servers won't boot any more. Just black=20
screen at once.


with intel_iommu=3Don iommu=3Dpt DELL R240 and Lenovo SR350 cat boot

Older Lenovo cannot boot even with "intel_iommu=3Don iommu=3Dpt" only wit=
h=20
iommu=3Doff in grub

With iommu=3Doff in grub all servers are booting well

With 5.4.36 do not have this problem


tested last 4 days with 10+ different servers(


--=20
Best regards,
Anatoli N. Chechel'nickiy
Senior expert of IT security department


Phone: +380 562 7474 200


Anatoli.Chechelnickiy@interpipe.biz
www.interpipe.biz



--------------ms030506080901090601010903
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ndC40LrQvtC70LDQtdCy0LjRhzE0MDIGCSqGSIb3DQEJARYlQW5hdG9saS5DaGVjaGVsbmlj
a2l5QG0uaW50ZXJwaXBlLmJpejCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALvF
HEM2JZ3mh0vV5XN1JE4c3m84Eoz7CKVeYImGYWUInSdnloxXvYxIWI4dm0NNKAh1v8cAVw47
t6RYRWwcDeuBxbdPGIK3nZj/4k8YTs9c/6zV6B21BQchUUgK/2Q9uskvF7c7xd/S1ZGDaoXN
i56zv2LUOqkCFXZYyFtUXpwtsN7qnWxZHdDb2OKlLxIB+G1o6PObSNZTU+kqli1pngEa9brn
j5B9RiV3sE559ADBNsLOyVf08w612bO6fysos602YSNJxN4ujr4XHmPmeHHMO/sdr73utoyZ
lLNQuCbbZzfAf12nPbdlSDpJyBoVFBYTiiUbcKpi9whKk8ohKYECAwEAAaOCBEwwggRIMDwG
CSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIL+9zqBgckrg/mNMYf65COBnOEVYNaVE4GM5QYC
AWQCARQwKQYDVR0lBCIwIAYKKwYBBAGCNwoDBAYIKwYBBQUHAwQGCCsGAQUFBwMCMAsGA1Ud
DwQEAwIFoDA1BgkrBgEEAYI3FQoEKDAmMAwGCisGAQQBgjcKAwQwCgYIKwYBBQUHAwQwCgYI
KwYBBQUHAwIwgZQGCSqGSIb3DQEJDwSBhjCBgzALBglghkgBZQMEASowCwYJYIZIAWUDBAEt
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEARkwCwYJYIZIAWUDBAECMAsGCWCGSAFlAwQBBTAK
BggqhkiG9w0DBzAHBgUrDgMCBzAOBggqhkiG9w0DAgICAIAwDgYIKoZIhvcNAwQCAgIAMB0G
A1UdDgQWBBTvmjvrAZKXDc8K5FtReZwxs6ZNdjAfBgNVHSMEGDAWgBS1/yBl/q35wnyyn85D
C7xTyHTs1DCCAZUGA1UdHwSCAYwwggGIMIIBhKCCAYCgggF8hoG8bGRhcDovLy9DTj1vZmZp
Y2UtUkVHSU4tQ0EsQ049RmFpbG92ZXIsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZp
Y2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9b2ZmaWNlLERDPWRwLERDPXRr
Yj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJp
YnV0aW9uUG9pbnSGgbpsZGFwOi8vL0NOPW9mZmljZS1SRUdJTi1DQSxDTj1yZWdpbjIsQ049
Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3Vy
YXRpb24sREM9b2ZmaWNlLERDPWRwLERDPXRrYj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwgcYGCCsGAQUFBwEBBIG5
MIG2MIGzBggrBgEFBQcwAoaBpmxkYXA6Ly8vQ049b2ZmaWNlLVJFR0lOLUNBLENOPUFJQSxD
Tj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9u
LERDPW9mZmljZSxEQz1kcCxEQz10a2I/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNz
PWNlcnRpZmljYXRpb25BdXRob3JpdHkwYAYDVR0RBFkwV6AuBgorBgEEAYI3FAIDoCAMHkFD
aGVjaGVsbmlja2l5QG0uaW50ZXJwaXBlLmJpeoElQW5hdG9saS5DaGVjaGVsbmlja2l5QG0u
aW50ZXJwaXBlLmJpejANBgkqhkiG9w0BAQUFAAOCAgEAHtpiwO796O0flVjo4CPqiovnlrqy
XIyDfhyDW8204JPbdOv0GW3gauxWj5vZBlR/0ouV1fdcLeacFIE7/9EuZ5i1tGUD2avbs6EW
Agl+T9gEPyhINjhZxDQ85EXUaVZp03urbjKx2I65A51LafSUBgAV/MH+eMcj5zxGvbnaTjHs
BkrCrT5q952mnHpfWVvLZZT6DRrY/sahFSqCK7DulPLCnugxkR+WYE6VZ1bsVG1y0lBU3/LR
s7JwXdn+2a2GpHaUCE/h+4ob0F/E8neJmvdN7kGqh7OZQyKd+Bt5Z3CHiIVuWBPQ491hEWpn
OerXHB10seRCPRq86TsMUH3SL8a4rQetwMJnLAMibDTwWdQ/Vv7eOYmEo1i2PmgUowHq17PF
bd61aOEytmqJNcSS19VA34h+WCac5GUm9TJYYEhnXYh1dh/5JnE/Xf1BVG8RmxkW9dZvRTnB
i8WRwaoWYrJceBpxzzEPg8VTTza72GlmV8yEB6A2OQlbPz9cqMRn9sCNHU9/eNDw8glocwKu
cwkgkQfO+rNn2ztjHYfKP/xMdtriABhRGcg1hvveax/Y6Co135Is43VFFAM9SSOmsQxAwFzQ
XEFnzYfSGYA8louNSahAOGcy19TWZfOa2QUerCukPk8eiFdm5dI7FvpLIJ+SO1xPEmClfC13
2pg+4RkxggK9MIICuQIBATAxMBoxGDAWBgNVBAMTD29mZmljZS1SRUdJTi1DQQITHgACSCXP
o2enD7ifkgAAAAJIJTANBglghkgBZQMEAgEFAKCCAV0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwNTE5MDgwMzAyWjAvBgkqhkiG9w0BCQQxIgQgRtSF
e/Y1SOTVOeToTxZ9Qz/Uxs7NuDZOV31SyP+4ai0wQAYJKwYBBAGCNxAEMTMwMTAaMRgwFgYD
VQQDEw9vZmZpY2UtUkVHSU4tQ0ECEx4AAkglz6Nnpw+4n5IAAAACSCUwQgYLKoZIhvcNAQkQ
AgsxM6AxMBoxGDAWBgNVBAMTD29mZmljZS1SRUdJTi1DQQITHgACSCXPo2enD7ifkgAAAAJI
JTBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcN
AwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMC
AgEoMA0GCSqGSIb3DQEBAQUABIIBAE+oXsVT/zQgcb6KUzL5f6vFjmiW7FrWYzj5Lw9PXeHY
o30Lmfo+JF1S/A6G+ioER9Ifn4yQ+PDRQZp89rp4pNU/+Stja4bx56TzssaXDVwqGL1lOOOv
9JGQvZeEXayl5BcNDdTz4Ttjr+wRykr5X53Mu4C34igXG50vRdrw5Q1AVUo9C0oRsp/sLPzw
9z9LtVO4AB1HlDhUzvjDGwYPa5hHww4L9/WUJ062jZER7bkEfGT0DrI21x0+HgB5RW64jJnf
LON1le1nEzgwKznWwB6hOcB1XTpoP6vBTEn3ZhhbVpNCZ9Bl9JpgsMTAOSI24+/NPmvXBsaj
Gmmt3uoWQZsAAAAAAAA=

--------------ms030506080901090601010903--
