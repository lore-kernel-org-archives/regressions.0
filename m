Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B07139B
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 01:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3961MSNK01139866, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 3961MSNK01139866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 09:22:28 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 6 Oct 2023 09:22:29 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 6 Oct 2023 09:22:28 +0800
Received: from RTEXMBS03.realtek.com.tw ([fe80::5510:ad08:5390:1ed3]) by
 RTEXMBS03.realtek.com.tw ([fe80::5510:ad08:5390:1ed3%2]) with mapi id
 15.01.2375.007; Fri, 6 Oct 2023 09:22:28 +0800
From: Max Chou <max.chou@realtek.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
CC: Bagas Sanjaya <bagasdotme@gmail.com>, Hilda Wu <hildawu@realtek.com>,
        "alex_lu@realsil.com.cn" <alex_lu@realsil.com.cn>,
        Luiz Augusto von Dentz
	<luiz.von.dentz@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        "Johan
 Hedberg" <johan.hedberg@gmail.com>,
        Juerg Haefliger
	<juerg.haefliger@canonical.com>,
        Linux Bluetooth
	<linux-bluetooth@vger.kernel.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Regressions <regressions@lists.linux.dev>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: RE: Regression: devcoredump patch broke Realtek usb bluetooth adapter
Thread-Topic: Regression: devcoredump patch broke Realtek usb bluetooth
 adapter
Thread-Index: AQHZ9iZZqIk9cnxrEkOIPrwHFnXgfLA4N/0AgAA1ZDCAABycgIAAkrXQgAAclfD//8ULgIAC/Ddg
Date: Fri, 6 Oct 2023 01:22:28 +0000
Message-ID: <732012844f544d0daf790434025c8fb3@realtek.com>
References: <20231003182038.k57nirtt4sonvt7c@box.shutemov.name>
 <ZRyqIn0_qqEFBPdy@debian.me> <b2ef2f1c457a4cf7a246b2e8b8598a30@realtek.com>
 <20231004044947.vgegwvxxindkjo7g@box.shutemov.name>
 <7507ad6c8a964b179bf2b3318104a124@realtek.com>
 <20231004114609.dca6ebtmx37fsx5l@box.shutemov.name>
In-Reply-To: <20231004114609.dca6ebtmx37fsx5l@box.shutemov.name>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.132.197]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi!=20
Realtek will send a patch to fix this issue.

BRs,
Max


> -----Original Message-----
> From: Kirill A. Shutemov <kirill@shutemov.name>
> Sent: Wednesday, October 4, 2023 7:46 PM
> To: Max Chou <max.chou@realtek.com>
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>; Hilda Wu
> <hildawu@realtek.com>; alex_lu@realsil.com.cn; Luiz Augusto von Dentz
> <luiz.von.dentz@intel.com>; Marcel Holtmann <marcel@holtmann.org>;
> Johan Hedberg <johan.hedberg@gmail.com>; Juerg Haefliger
> <juerg.haefliger@canonical.com>; Linux Bluetooth
> <linux-bluetooth@vger.kernel.org>; Thorsten Leemhuis <linux@leemhuis.info=
>;
> Linux Regressions <regressions@lists.linux.dev>; Linux Kernel Mailing Lis=
t
> <linux-kernel@vger.kernel.org>
> Subject: Re: Regression: devcoredump patch broke Realtek usb bluetooth
> adapter
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Wed, Oct 04, 2023 at 07:28:45AM +0000, Max Chou wrote:
> > Hi! Kirill,
> > I guess the root cause is as below.
> > =3D=3D=3D
> > static int btrtl_register_devcoredump_support(struct hci_dev *hdev) {
> >         int err;
> >
> >         err =3D hci_devcd_register(hdev, btrtl_coredump, btrtl_dmp_hdr,
> > NULL);
> >
> >         return err;
> > }
> > =3D=3D=3D
> > If CONFIG_DEV_COREDUMP is not enabled, it would return -EOPNOTSUPP
> for hci_devcd_register().
> > Unfortunately, btrtl_register_devcoredump_support() will return it.
> > Finally, -EOPNOSTUPP will be returned for btrtl_setup_realtek().
> >
> > Could you have the following workaround for the root cause checked?
> > Please share dmesg as well. Thanks,
>=20
> Yes. It works and I see
>=20
> [    3.640539] Bluetooth: hci0: RTL: btrtl_register_devcoredump_support()=
:
> err =3D -95
>=20
> in dmesg. -EOPNOTSUPP indeed.
>=20
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
