Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F316D4C2
	for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721651328; cv=fail; b=glktkii7LG9nGOrfo5u6r2+OF/zmzGJPjAZ68AtiHGb8R0D10to4LxiAjpT1cxjTZiDIeCTp9VKMkmMjxzx2Xm1wuyXnbtFR9gwcyyN/vGfNPnT0N5XXsbciXC8jQky4ouXMs/kGrwWuMThWh/sdlzg7Cx3SX8qZvuGVc5TXnaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721651328; c=relaxed/simple;
	bh=uEsF3ypO3lz2IORk84nuFtd7dgCgQ6EvjF+PWcp75GY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gIrFThJFsPXukhski67SOV8G2siRF9Q8bkiPzmxU9Pwmm391PEu3+mXv5+ATlMdGSmBL44g3N5BJglJayuY1nN5tn5cpPA63QtcOXE6ETB2LjBv0QKEiw2irqOkjVXh8hPLadgEwWGtavJWbzI0fQs0BI0UyJ6QDu6NWC1fqZYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=FLEXZr14; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="FLEXZr14"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M96R1o025265;
	Mon, 22 Jul 2024 08:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from
	:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	smtpout1; bh=uEsF3ypO3lz2IORk84nuFtd7dgCgQ6EvjF+PWcp75GY=; b=FLE
	XZr14GdMK8FgJEZ1URcllWZvgAAlBLECYDGA2NFLwbOIci1aOtFkkqxxCnMzV2yA
	tP7orBb4iwjK4ZKlMB7e8t5/jn5r0WVn+e1G+dazXzfYx8NwK+abvzerw0zn+jL1
	t6mTpBKgQKjk74/Tz5q2nn0gjkBKeCfDhoB5IlpyoRa6R0KO5k9rQ46DcB9uxiYP
	Fv/mPR+DmH6SxGSl/iU+AyWdc29ox64LnK4gJcEjkhI0qLYqGgJdmpsWq7qbgJtB
	aY/658Uu/0dCQ79XLAOdhq20Ml6UPa2fDgzQqTTzQTAShwRjYS+wB2fpZ7vs09f3
	xX9JOu20OoInMWYZwbg==
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 40hbg5jj98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:28:36 -0400 (EDT)
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46MAjUAU038536;
	Mon, 22 Jul 2024 08:28:35 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 40gtbkyvy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2024 08:28:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN5qjdbwRl8tSAMjTk4N6DanmVsoJT+xqLP3l7XoihePcdd32QASTRImQD52fv6kL0RrCD8b7LdVJowIyrqUKnz8yGGrYJ6W6Lj/I+tDDE8ta3+XkcScvdpl5WSQRnAe0aByY1MwL4A3qecHWT7cfMgq2gee97xG9lFGnHIo61VAfay3bxUMTC/LxbH/+If+GD6HrCO0l74rmjOqNfA3MXNK2IsvCyTeX2jU3bRQNTmLzUpW1x98XlwswkuQQoCKFMFTQnr2xl8PNvkJx6UwjIDNqIJ1gXK0729jmhOUxj5JhQGkKlxOaTCkjejFn3bZde8kR00h6ArjVPdUj6QXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEsF3ypO3lz2IORk84nuFtd7dgCgQ6EvjF+PWcp75GY=;
 b=A1lYmzrSmSr0dxERkwgn2PdkTYmpKQH9ZF2u++5JJ0JNGoi2DQ1aWO2+Ktuq+fIei1WZoCLVsCarSCY1lR8NXyd48Reak7+OKaZ2J2Fm7/umGcJlwUYtZdURosY6NSjZu77puvYsISTh0qUXK+lfYIp4vqyEKYILsRPfF1/wDFJomtWLwWpp+6a8RTKHIFsQmcdb4qEOJLXuYtKY6y71meDbRRBizdLIxXBrVMIriMRW20EnQTPovCbHHQIR5VpagG+yYbstmEbuddassTdcxHHPZGuMGrcq+Klhe5lYaozs2w8vjHJaDWg39TXze6GyuxtsCNwYwME3V7FYSR2QAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DS7PR19MB5709.namprd19.prod.outlook.com (2603:10b6:8:70::15) by
 SN7PR19MB6783.namprd19.prod.outlook.com (2603:10b6:806:261::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Mon, 22 Jul 2024 12:28:31 +0000
Received: from DS7PR19MB5709.namprd19.prod.outlook.com
 ([fe80::3d06:d879:7717:36e0]) by DS7PR19MB5709.namprd19.prod.outlook.com
 ([fe80::3d06:d879:7717:36e0%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 12:28:31 +0000
From: "Shao, Marshall" <Marshall.Shao@Dell.com>
To: "ardb@kernel.org" <ardb@kernel.org>
CC: Christian Heusel <christian@heusel.eu>,
        "mavrix#kernel@simplelogin.com"
	<mavrix#kernel@simplelogin.com>,
        "regressions@leemhuis.info"
	<regressions@leemhuis.info>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: RE: Re: [REGRESSION] linux 6.6.18 and later fails to boot with
 "initramfs unpacking failed: invalid magic at start of compressed archive"
Thread-Topic: Re: [REGRESSION] linux 6.6.18 and later fails to boot with
 "initramfs unpacking failed: invalid magic at start of compressed archive"
Thread-Index: AdrcLO1SOmt+HIyyReWwKuR8EdkjPwABaqbQ
Date: Mon, 22 Jul 2024 12:28:31 +0000
Message-ID:
 <DS7PR19MB5709352911E93DBAA427EFEA8BA82@DS7PR19MB5709.namprd19.prod.outlook.com>
References:
 <DS7PR19MB5709A3ABE92F17FAF56386128BA82@DS7PR19MB5709.namprd19.prod.outlook.com>
In-Reply-To:
 <DS7PR19MB5709A3ABE92F17FAF56386128BA82@DS7PR19MB5709.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=f3eb1962-a9c6-4cb5-812b-84ab38cbd790;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2024-07-22T12:28:11Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5709:EE_|SN7PR19MB6783:EE_
x-ms-office365-filtering-correlation-id: 64302e17-6ca8-4504-00b9-08dcaa49cc37
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QQNFnT0a/WZmXo5v38bFim5a3atFs8JUqVXAO5E8/ou4uiK3ntL2z+sum4?=
 =?iso-8859-1?Q?h57a25NSqKGq5mOpCeVQFdJ7Dpm4JtIg+gfquIUGTme3VBoh61voVSiZqx?=
 =?iso-8859-1?Q?XESjLpOJgpjZnhdoCjRJ+mfrLpubwIDPsBeNUVayMWjGGwaKLk9OoORxI8?=
 =?iso-8859-1?Q?j3ywGzb5Dcs74qfZiZ0I9XB00TjjESqRRYW8tYT1B2kuevYkeKEHYEG4iQ?=
 =?iso-8859-1?Q?qsq+Q2CJx7t99karufzcybKiriJ11BXHYQ8gr5F4XoUt03pktD0QaVNc64?=
 =?iso-8859-1?Q?nhOtEX9hIbhQwjOFgwQAzsl/Knw/MJb42CA+LMSyhXSNhJ3xsk9DPFX4j+?=
 =?iso-8859-1?Q?QFDZkJAH38E8Mpz7PRwg4o/AKfvXKP3tDDv3KetEaIYnJ8PrV/oaw5tNSR?=
 =?iso-8859-1?Q?193jJZX7HZZ8WldHv8bwF5BR8Ap+x+Jk31/dJMxeyneMLtcDpYqEnIXeib?=
 =?iso-8859-1?Q?hehobOSJ38iawZi/kSzgayL4I7y5XcDVIqI6uiAegYWU7gkbgdmTgkOvbp?=
 =?iso-8859-1?Q?4292vNUwBu7KS9QRuTRHCBgYNDQfEAFqVeoQEkK7qhLpNf+ddqbqSFdOsC?=
 =?iso-8859-1?Q?W8ZWBVhkIxqUHhmASdeCc2+yzm2Hzk6lpheC0H46WKN7dSSYJZoejPJE3b?=
 =?iso-8859-1?Q?3YVRu//dIXEsTY9TcKHW4/waorvltY69QZs4cMGNTW+772sEuP4s0I2Drn?=
 =?iso-8859-1?Q?D7EPE3qfDUg5NlMVd0sxH78c5+c6CnGKyuAFjx4QsgYoQyaTBLTStFSc2I?=
 =?iso-8859-1?Q?wh37CR6S+PfI3zBZ3f6w3k8gyZ4WZMM3yMeujsfufizNjKK/D5O9Bus+Za?=
 =?iso-8859-1?Q?EIFdExHMHmEAebK90D42FHVioZcjPRzulHnmfmliYmvXwT4lsFoBV0f8Qo?=
 =?iso-8859-1?Q?Z5RoDPRmxfZbeCksmOgAJIadfnsYPsgst58NfOeD1TpPlOVfP4914Y/DHX?=
 =?iso-8859-1?Q?WOmmuN2Y5ix8puMZpG227a+lubDAAvqb+tT/UW2Tb/v7i8Yf6NPP6bl0/8?=
 =?iso-8859-1?Q?pjBKzZs8IwsOpu+Q4dvQcAE6yDutmQGDFJQYtZ5CvqV7iFPB36xnf6QBas?=
 =?iso-8859-1?Q?RtZLHqmfwjmU67XXDgjpl8LD2ScpSyuvZVn/RUkTwWPpzAjKsaklpcjKxN?=
 =?iso-8859-1?Q?NysANE1RgQpXkT8ZOoUcSM+aOjDKSVxPFMPoSmwQQ3VjC6JrRDy5uOPwfk?=
 =?iso-8859-1?Q?+de5/58b9xgvhAywjetZ+Wrx5MuFmE+1fOyecxMtOxkhr7jiLJIt4C6fBs?=
 =?iso-8859-1?Q?hQ6mvKhMdv4Y2V2fEiPLXL4Cs5Y8S50qWGstT0HUbumOp7rwOlzktfNkMi?=
 =?iso-8859-1?Q?0fcqFRHvd+RZPhgW32jBzArnnWMgdL/uUFzGKj9ESwvIh724UkMFPaB5xu?=
 =?iso-8859-1?Q?VvaD4O/3vlzwjbo/F1DsCsitvQylmdiqxQROG1qy8Sfg8ks9ZSKLwU14LX?=
 =?iso-8859-1?Q?v835UsarTpvaJXFEDAixJo8G/8XNTjxNAUXcdg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5709.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pFYzpRbldfwnrllktXUfJpOfroZmWJiyWsOtfsM0TCLam5slq7q34t5h09?=
 =?iso-8859-1?Q?TwmQy+AOhUHNWwbHGjmrCXJh91I/i8hX3jKhcOMFFb9UdmSQqLcymoEZfx?=
 =?iso-8859-1?Q?l+kyrXkU3l5zCSkG107B1WzxCixJkIAPa++TEppmr3bb58Xx2jXZRYRf3X?=
 =?iso-8859-1?Q?41fa1vLSIVJPuVrwynlmXUxUL0/ksQ/TjOaVTKT5VFUzEPcOwX6BoS7I0E?=
 =?iso-8859-1?Q?SqsyI8t/UMBWkC/rPYk4/KwiyM819jHWcb0hvXvHy4fLOT+mZeeksW5Uqs?=
 =?iso-8859-1?Q?zaVIF4XuCRhjnu+4a//6z3UovhZhHlw7rRXzWlu9J4WoavZ4MoNgLbAnYw?=
 =?iso-8859-1?Q?PtjmDaS2/q2w4HJ7EnCkL32EYTxgaUPoWnxnbTI57N7vXbeu6NPUXc0zTt?=
 =?iso-8859-1?Q?JV/IFom1fNEhMVlhoUTmK8Id0S5S4PfySg1wDXXqS2wPoMrY8a2t4ZpIRx?=
 =?iso-8859-1?Q?HeAyxn03KMJomwm1mrw8MdHxxsp9s9LrqTPg7nimz+wMUgTyqqvi94c6Gu?=
 =?iso-8859-1?Q?YGDoqN70XjNHBp2O2TnTo1RlSvjq6nL1tfwu1a/Pu99myMO/hFAu4VtnJz?=
 =?iso-8859-1?Q?VpeM/3u3bueX+rVL4lfVXc4pqxlU2r3YYO/uFIVIlX/zr7vaTm0O8l1n5b?=
 =?iso-8859-1?Q?wl+bBsUeg4b9bRN2ppTTiEwh3GqMT6cRBF6AJzB7M2JvVUHaYcBBFDqF8J?=
 =?iso-8859-1?Q?2acTRJRG2iHCJU8Nd6j9CVivh04qVP+ZLiNH1W0oAOArbE31ECuXMPpZCP?=
 =?iso-8859-1?Q?YuF4dBx1hhgOv4dfbGq0JK7lzLBrjy3hqIdcepV/X1QquKFBSpT9HTueUC?=
 =?iso-8859-1?Q?XTltq9QUBiPDtxjmOFwqMd3prBCaBTrOUAl4Tlb0NSWXQ+kOacvUP1b+Nw?=
 =?iso-8859-1?Q?np1YBeVFBefJ9dHK4XNlK3s5QgnMyex74tLeh69WGpWIRb8ZJeDqX5+KQi?=
 =?iso-8859-1?Q?cP8NQ5bKS7wjheIlkqVTIs9Uu+vEdEcaGK9QMWH2LOc0I8cZbn99hxF0qw?=
 =?iso-8859-1?Q?Sj3oQUREMa0ljdWR4ehNGRieiyPHVdTJZiKWagHejYQyeI0B1kis+XpYBQ?=
 =?iso-8859-1?Q?KTg4AU1AJ1bH6gLC6vWpk7dVJWnbTfszVtkbA2Dzpm/19CBsdINFsvGPaq?=
 =?iso-8859-1?Q?7W6HMZpuDYC78zvk1BzMMQ0uRgiNdWNGGnLV9Pa6mfjvQb9p/3dMa8XTNw?=
 =?iso-8859-1?Q?GJabgh/4+mRSPRueMl/DNXn5Xev7wBIfPJxvkG3gBZzH7E291ETaW6VtEd?=
 =?iso-8859-1?Q?vAhl/Z5+6txJHMqW76SOIaYYqQDRM2Rs3hMC4BzGhc4Of3066ncHjN6w83?=
 =?iso-8859-1?Q?7pB5a/x9ngJdhAUQkym+8dKDDHvX5U/WZBur5IxhKGlqWSn5NMFbuAhRHG?=
 =?iso-8859-1?Q?9eiiOCepnMlhIlaKfVZJZSvnqknX+P5xJ5g/5zxOC4WMYSXawUV30YwJq8?=
 =?iso-8859-1?Q?hJFYBXQNJ8BIqYEVT7c3DD5Fz0uaYDYay/QR/ps2q6brjOCVQ3/wvmjVUP?=
 =?iso-8859-1?Q?2qBXOLQh84m/b11stDFGeNAQR9xW2Wy9Oig7//WResDO3AHLahasyyfzxQ?=
 =?iso-8859-1?Q?tojTlvstKheGLO61035jdC+N+Z8+QFIaQcq53iGpPrHIzepJ9rOyj+ZlMr?=
 =?iso-8859-1?Q?xwysbr3t1Vlyj1ubahuE5yel0fXaSsO1t0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5709.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64302e17-6ca8-4504-00b9-08dcaa49cc37
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 12:28:31.5148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7TlTZnwryco7tIGWiIbtq/RpAuiF17dwe3SBa6eltujMkot0OyD3LZX3eg87NzwIcwcT1sxfmB6mgE4o4K8eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6783
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_08,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=853
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407220093
X-Proofpoint-GUID: Fv0BxY5vcqT1BQPTri4UHIpPQkUoaa7Q
X-Proofpoint-ORIG-GUID: Fv0BxY5vcqT1BQPTri4UHIpPQkUoaa7Q
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=810
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407220093

Hi Ard,

This problem seems not relevant to my fix, I didn't see any efi_pe_entry
booting problem on my firmware so far.=20

BIOS Information
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Vendor: Dell Inc.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Version: 1.13.0
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Release Date: 02/10/2020

It seems that they have stopped to update this BIOS. Anyway, I don't
have much information about XPS firmware, let me try to ask someone=20
else to take a look.

Regards,
Marshall Shao

