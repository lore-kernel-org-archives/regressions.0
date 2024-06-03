Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4917B642
	for <regressions@lists.linux.dev>; Mon,  3 Jun 2024 02:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717381796; cv=fail; b=c55id0by0m4DkcCgJHvG0qhh0lTmpWSCi+lpOE4sLst7anrBoy+7GpTSChDty9QA+z8beVy2Qb2T+kzIiGDCQQzY5v5cBNbMtiU8kfJ3m6h0uyFCY3RAQYTiV2bD8JZhCc6qZRzvQKc+ZQpP7Mt9hf39bmd8FoVOmDtwk/0fACU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717381796; c=relaxed/simple;
	bh=yMbltnmtoiJM2fzald5SyO0aCCSP3nNn3UdU/hlgb2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uAkfBCF8WW715VCQhtzh6VHXcWbeML0KTW4nZ5/KiZCRTA3WlxA6zZvDwJLSiZFypfc8hrxWQSb/ybOVvG1Rlf9sl5RsdGVxV0CY7RHDTI4kvQWWynJZc7Mj2e1eT8Lte0MTyZAwJrEFo0R3PrlqHV8AbnCMTIABqxiAf9DwRYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2BW1yVSw; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2BW1yVSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ95nkP8rg06feiKJOXlGDbh4aWYg0hs0yko67hSFEa0HSgCMcUSVe8pUm2JbfN/HR0W90P8j+QLFJ5JJOfUwRzUl9+NRyjZnbW3vP7mGrqD49R8l8gZNtMt3N1U1FtSKN+d+29/xVvHmjgWzTelZ6haehh0q5ctAUWDqlyPNxod1altEr8e71jzHEKaAhItkOa+n5s4sHuK/yb1Bmwb01D4s0D3Sms/btEetpNOrz6SmSLtELVDrxbq/iXN0d/smkj0HETcl6cLgTbgALSWNgKBONYP5z9SEYEToviPWU3umUlzmIjX8++Z1GLC8oAOEH6WKKpizgZeHNa8CiYlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8MFWGu2ucwdm60RCo46EIvPtFoq/FYk+lrdfEmGLNQ=;
 b=Nq0LRtXbTKRH/onQYRCgYK4zt2M88/3HKSFAzXmFnE/95qzFJHEXsOudF6YS99/kdMVTSbEacjUm17NszigGCN4ZKZozlD+WJvRr8BMgBoJaC345sF4Zft5YiFL5kXqCM0ulCM0ihzlwOvrHujNy67KDtMc+9Hg/tHnPptsvrqFDCRX46UX1xoSiFlSGjAnAuOiKEFJ4NEOB80SHNa0MQOacP2cvYe86PPvfjhOgFrKOyNOwPl9+CYc1t5t5cW5VRRDCnfbotG67vTVWMWEuUJIW4oVf0NFcIcAMxBh+WfIZtoJggZZKZbLqVkDPkgYZ3eUg9rzAchEElI921dnUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8MFWGu2ucwdm60RCo46EIvPtFoq/FYk+lrdfEmGLNQ=;
 b=2BW1yVSwEY9nNkdhX9XWQsE3FQ0aw8QRIH6EnqghT3ZaRuJu46z6OoTsqvt2ZWw5yofuGS4hb/8WKNp6935k+ybR4Zn8Jk8Uw56AIUBxV88lzbN2DP8QZPhBGoB9BwqBsKOi5mrrAOU/VYCBhwDykJTB1z7ZLy6VA0Dw0OmVL3I=
Received: from DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) by
 SJ0PR12MB6830.namprd12.prod.outlook.com (2603:10b6:a03:47c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 02:29:51 +0000
Received: from DS7PR12MB5766.namprd12.prod.outlook.com
 ([fe80::7546:1785:7a42:1d49]) by DS7PR12MB5766.namprd12.prod.outlook.com
 ([fe80::7546:1785:7a42:1d49%4]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 02:29:50 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "zack.rusin@broadcom.com"
	<zack.rusin@broadcom.com>
CC: "Petkov, Borislav" <Borislav.Petkov@amd.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] QXL display malfunction
Thread-Topic: [REGRESSION] QXL display malfunction
Thread-Index: Adq1XQDtRohTTtWlSaWZK1r1HvW2gQAALRPw
Date: Mon, 3 Jun 2024 02:29:50 +0000
Message-ID:
 <DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
References:
 <DS7PR12MB576622398096CB650FF6AF4294FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
In-Reply-To:
 <DS7PR12MB576622398096CB650FF6AF4294FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c4052fed-571a-452a-9f30-0c734057c083;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-03T02:03:47Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5766:EE_|SJ0PR12MB6830:EE_
x-ms-office365-filtering-correlation-id: ff2720d6-4542-4b9f-d4d3-08dc83750b97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CvfzpErC7K6D6kH8dUJJtv969ZqwQZExG53Bzv5pUWi+19Mo73OlxVLNSmQr?=
 =?us-ascii?Q?woPhMWuEmiCZ0BD+cYEjhpO033wAEJxm+Um2ypbowQSPW90DjT28F8+P4oaz?=
 =?us-ascii?Q?lGuEzseyWzCQkj7HEX9+ysP5PjktmP+uRmLWAy4MfNHANsMnfFoeFSYujSGJ?=
 =?us-ascii?Q?DkzGZFPVTG+bA1TE/6SjkAVGwRB32Slt+CnGp5onvZpSkNSsvc+CpjkOWSmk?=
 =?us-ascii?Q?X0/r8OoL7PncToDPg9DFp3hh2sM8yeKlnPwcvMISKkPM6QyrmngtZ2MAvLCP?=
 =?us-ascii?Q?zqFqK//lPH54t5o6X3GZEAupsA1U9r6cpvtyRxtLByBtVuq/zgDs9qeM+2mk?=
 =?us-ascii?Q?vlr3DA3KQ70+Xa0jt1pSSi8MzLZPjaIgG0l0pEk91lv1d3wa+IQ5cPnBkhGb?=
 =?us-ascii?Q?M5QK+AIr1gMMEmYXJ7z1GNNBLaUFBByLMqMdFybDXJpCqoDvZmWC1HSCdp5N?=
 =?us-ascii?Q?yOIUho/4No7uygZJfychM9zYKTJncUMuhBNSkBT/UOketxGW5Rst9EljyYMW?=
 =?us-ascii?Q?m50H+uO8YeDXytg88QvlJMjmkBfU5MOGCBykOfP/zg2dXcyPOC8AlBA/5Gf2?=
 =?us-ascii?Q?uy7oA/czA8ll8xKqinddhq0Bx/jY/ALhrc9P4tbQDlS9hkUbxtOvgDajEO+L?=
 =?us-ascii?Q?ETkyLyJ/p1SEhl+7HFHEjotywu5Sij1R5ADHC61+SdGfvLTeslQtiWCRjwfW?=
 =?us-ascii?Q?0ATJK1sIGirPn+RuyIbT2ErzQUWNfApUngBA97NWUHlkdsKx9PxRbk2u5Wdb?=
 =?us-ascii?Q?vCG8s2gHvydFgE3NTqRerYcrw33/YzdC1Rt1KZ3J4wx4e9w1/Zsb2H9AyBBY?=
 =?us-ascii?Q?QrqPgeDPkIqCA/FxiLasshqu7iw5RyD8KmoNAxbLW5haCd+b8Wl/v+1+FAnh?=
 =?us-ascii?Q?l047r4L45ClU/XAd0YpbOWySL1xfazKCrfRrHtMVQ3WpkL063vAZVT9EE1Pa?=
 =?us-ascii?Q?N0IwifyIx2hm8ysWKAMWAc17d0NOy1aqTKvfMzfNJ3ME4zTbMq07Cjbiv2/e?=
 =?us-ascii?Q?7j7nUNd2/JmdDfYfx64HENT0xEyfbqhhBc5iMhB2J/ov3SHkCXpIq/M2Vu78?=
 =?us-ascii?Q?Q2e64cdLZ0yW8Yd6eSTgbDEoOmbGHTegkvENqwxCK9+YN/aTBHM+CLb4ZOnt?=
 =?us-ascii?Q?KfaOT869lYQbkpyqF1mOOHTlAk4uezdoMwCDiXIc+V3VDifEIs2BtdnuqKKy?=
 =?us-ascii?Q?GvXwyavv7e1RhW4h6hzicy385u2zg3CIwrHkfUOT9VSrrliqTWeTm+jmSide?=
 =?us-ascii?Q?Lv14NMoBlu/C/uOOnhLfXo5nR/fY7dtvoXEQz9tbJLvItat9xiLQF1l5q5GP?=
 =?us-ascii?Q?cYFTbmL129xQbgEOB9y4oIf2dSHc9ylyFQnmv5Cq2f7eTQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5766.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KcKgR1fghzXYAM7yOnktr/YiG4AUEfF2O+MqapRhbeva1fwVtE2TNDZEM/vL?=
 =?us-ascii?Q?jZBSMBoCigI2m2okOolg+3tu2sq4knyUfO20NuQKbgBZnZ1BAwdSVHU14egu?=
 =?us-ascii?Q?6fZAwjfBrpY2R8Ydhr2QspCdHJGT4cvSMlWgIGSVLgWiRuQX6sdytqV01OVd?=
 =?us-ascii?Q?/4dDlFchE7PNgxk4+maPrBnzsDwLweBpB9WHRG6Ji8IcWqSyueY3P7vpksRE?=
 =?us-ascii?Q?V+Jj2DaXSrO/gFLOD0igQ1QC5Ry7ryJdTQeXppSYrCjYrWXKod5FVFxACAmb?=
 =?us-ascii?Q?KoGQYopN/sLGhQHhjL84/vlkG4gfc/aUil+ALyDUy6iLjxDrGcuKS2DJfqWS?=
 =?us-ascii?Q?iYrGIfteeAZrVN9gpWdAZiG9fkriV5NAJ9wOYBPaGSAkNqunk2nAL/J8XyCB?=
 =?us-ascii?Q?v1f4+wBqXBB6RwgRX5AXGZ1wX5YBv4Kdpb5Ha3cMIkhod7/dNm0zzBeDLNkv?=
 =?us-ascii?Q?n/zyY3XIG/4zoR+H0FkdwB55+EWjKbWQtSW8LP7fnAfJNaFnUXMQ2S5yNyDr?=
 =?us-ascii?Q?uG9R2xfIxwzH3QBNzZSm/0z5WJE6JrC++y1AqNpw532GC2eas6aSE/hGG6n2?=
 =?us-ascii?Q?/+29REjnb6/5NQ3J9O5SdGtvYpnkd8UwKpozd2vLZzj1DQ60HMkfc2iLAESJ?=
 =?us-ascii?Q?shyYXwdxD1yAJb+4DCwpxi3KIivOfLe/8GW29VVb5EbucYjC5yZICr0DPmLv?=
 =?us-ascii?Q?XwRJo4hwlgDDvDg2QD5Hi8UKRqy/cGf4/2jExTrUM07vcq3Nr3ASkX21rSJl?=
 =?us-ascii?Q?df83CSCdNOtRCRVXV2TwYKS2IrDdNShsSra22Yz7V3J47dpkMUJsh4qxA61B?=
 =?us-ascii?Q?ttRfZoXFNOOBFb2lvk79KA5K5ycvV9NHbb4MR+O/BhU4H9b26BfVf60NBeTd?=
 =?us-ascii?Q?lqZJhZc3BtsCBbad1qWHDFEIj28+lhgIT47flqRmBRWISAd1YxP+iXxCfVus?=
 =?us-ascii?Q?yiMJ300zGqD5z2faP5MQgAKG1aLhlzEOA7Yn5Gop5S3Sb9l+pyz0/3bU3Dhl?=
 =?us-ascii?Q?48p+W+6IIXIIt43GnZUGxJ6SBdzsNfVYq0u57EmDdEciu4wTWqeKx36txWDs?=
 =?us-ascii?Q?CTLdHfngTDNcA1vPsrao9Ym3tnTg5PrVGsnRNcg6zFULUq8RJj5W0RZ8njAi?=
 =?us-ascii?Q?ORfVW2IV+rzmt5jJtcWchuBu0sVI3VvyHtyUZpjkiCj5zn7xeDb3rOvOIi/C?=
 =?us-ascii?Q?dmtaZIZJNY2i4ZDT5L1NNsBKtRhqGa6mXYInGDzAwDaO8rKyv4JJgKSiBIRS?=
 =?us-ascii?Q?Z9ur5M5D/u/u1tPx66MpvokcJOqvKNgrRb45tsURzjzoUFFPt+bhuu0YnZny?=
 =?us-ascii?Q?mNc9Ukbhj3ktECh1yLQuvpKr/sjjNf3LBCPJkfiukvoAWTCikX0Uynwbivlt?=
 =?us-ascii?Q?YKrRyEd8cAi3c0VFiq+9t0KQ2EF66GMHNpSTleSckbq/8NHvqQ9xMILHts4M?=
 =?us-ascii?Q?G5U5p/Kh5qz1MwBS+JlCSA7vQ4DwsGCZebhk/iGtcmNc6vhLkolCZ1ivy1H8?=
 =?us-ascii?Q?25uqBPcSE0jOQVFTCBuGp2A0n7GkPYUzvd1rMTS5RXYvGNiebG27cKTo7VRy?=
 =?us-ascii?Q?AtafKjfTwUj88u18DJU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5766.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2720d6-4542-4b9f-d4d3-08dc83750b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 02:29:50.8066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qiTGGUqyy+D/rpaVZML11vWgQ8OkujguwFtSM3C4N7rk41jLglQNwzQFKgVpsUzV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6830

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Kaplan, David
> Sent: Sunday, June 2, 2024 9:25 PM
> To: tzimmermann@suse.de; dmitry.osipenko@collabora.com; Koenig,
> Christian <Christian.Koenig@amd.com>; zach.rusin@broadcom.com
> Cc: Petkov, Borislav <Borislav.Petkov@amd.com>; regressions@list.linux.de=
v
> Subject: [REGRESSION] QXL display malfunction
>
> Hi,
>
> I am running an Ubuntu 19.10 VM with a tip kernel using QXL video and I'v=
e
> observed the VM graphics often malfunction after boot, sometimes failing =
to
> load the Ubuntu desktop or even immediately shutting the guest down.
> When it does load, the guest dmesg log often contains errors like
>
> [    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1
> wrong: 65376256x16777216+0+0
> [    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1
> wrong: 65376256x16777216+0+0
> [    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1
> wrong: 65335296x16777216+0+0
> [    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find id=
 in
> release_idr
>
> I bisected the issue down to "drm/qxl: Do not pin buffer objects for vmap=
"
> (b33651a5c98dbd5a919219d8c129d0674ef74299).
>
> The full guest .config and guest XML can be provided if desired.  The gue=
st
> kernel has QXL support compiled in and the VM has
>
> <video>
>   <model type=3D"qxl" ram=3D"65536" vram=3D"65536" vgamem=3D"16384"
> heads=3D"1" primary=3D"yes"/>
>   <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x01"
> function=3D"0x0"/> </video>
>
> The host is Ubuntu 24.04 (stock) running QEMU version 8.2.2.  The VM is r=
un
> under virt-manager 4.1.0.  If other information would be helpful, just le=
t me
> know.
>
> Thanks --David Kaplan

Fixing emails...sorry

--David Kaplan
