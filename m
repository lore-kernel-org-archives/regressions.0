Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D182F3C21
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683531266; x=1715067266;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=uUW9vNI8Yex5UT84vkl259LxQ1clFnHVQdhyy8FSXs8=;
  b=KCf6vF42LxY6gLaG6Ni90ijT3RcgtT36PDiRoQ96Z6pXpWkopfU9jtXQ
   rIQpMz0HSZIOP0nXB/1eai/6E/MWVQpLZqGXcJ1AE+p+vPlvD1kIZjgdw
   3svXCT097smCnky7NiZM8OkMRNqi38rM+7LgVr5eyMeFE+ai34yv5wjnS
   /rJZ+el9tmreXNRQrDum/78A7v87AK8KUF51Mo3V6i9AVcGONRCQ5YlKx
   6YWGcJm2SWfF7PtHSq89NqI5Qhv1MrDYCe4lJnctwBU8l/HktxPIpKULo
   g4iw9kv42F6F2t/gavpo6eX2pEH78ewhWMmv59wRy3O7y5tTmCQ+8rnq2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="348407017"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="c'?scan'208,217";a="348407017"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 00:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="944745217"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="c'?scan'208,217";a="944745217"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 00:34:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 00:34:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 00:34:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 00:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxBSRsA0aRAe6sYEvKfxdxzmTZj0NK3EJPuY7cwVOZBUErGVz22prdCw8+TwRyM2P/+tiOqXjET5jHQp5HNZ8OfLtt0QYZ9MZ8XsFDH70wsMdSwFwIU7mo5xRnxb8qZkbgVq6yI2ha60pSz7i98gfQokaKpD67nOPocdP/uPbRH9adbNGGTDqfSsakqynryl/o1FDuzqDcUQQxJ4809Tcsy6a9Ctk0nlOsIsF5oSyhiNS+a/+h6X8miVyuiM07yOiHPFOuaZvKen5RBk2m2vxpEegYIaZyNQwRQIIdgh8aj4GSpszi5LEugGW5K57/rxxK7ZGWIclm+y+xglVey9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgcOpBWOSpbQRyreIwl9UL3OdG2b1IcXqLR1Z1DNGiU=;
 b=TJ+M77i11rb3bbgi95wyhKvFUXOaC8fJPx541fyn9I3jD4k63ZLyIloBxXFsFKUETPvelVfkSnXQb8fDf+FPysSLJt+aMtDw62RjXCcSl+AuKMsKqbMuwMby8l3YJiXkP5VU5hY2banbj5+wpHR00GyVLVU58MiOmlfgh2epLwcIGFofQQjtxLWzenmkmINTJmod/OWzjj77oVbyLXXuLVYcLo3lYPvpzagNAUJp0n4339JBBYcGWqiFTleiLo+Y7Ca0o04SvNs70irFkloGCgs+MvWxK0N3hPOAWtC6Xq5/QowBGrFLzrZKUO5PbjPkunEaVZ4Qpl8FAdYcrcGn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5518.namprd11.prod.outlook.com (2603:10b6:5:39a::8) by
 SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 07:33:59 +0000
Received: from DM4PR11MB5518.namprd11.prod.outlook.com
 ([fe80::3124:6fbf:e20a:f14a]) by DM4PR11MB5518.namprd11.prod.outlook.com
 ([fe80::3124:6fbf:e20a:f14a%2]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 07:33:58 +0000
From: "Rai, Anjali" <anjali.rai@intel.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "Gandhi, Jinen" <jinen.gandhi@intel.com>, "Qin, Kailun"
	<kailun.qin@intel.com>
Subject: Regression Issue
Thread-Topic: Regression Issue
Thread-Index: AdmBflVc4Ic7nWyeSlqpAyBHS0vdoQ==
Date: Mon, 8 May 2023 07:33:58 +0000
Message-ID: <DM4PR11MB55183E4B87078E0F496386029A719@DM4PR11MB5518.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5518:EE_|SN7PR11MB7420:EE_
x-ms-office365-filtering-correlation-id: 0722ff13-e932-49b3-f5a3-08db4f969624
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OntABiMrUe5HizZijlrn9PHA7SAvhujM2DXu8UwAZWCn72oj6ViwIhmteMWRAN40r9mKErQ9O6Ulvbe51LD5CQO0IVHC/VvGGBzhTZEhsKy1iL7L4sTrC+XQuGRhokuvj1cOGFhFXRmF/YMddH49XXEaPjH+rLdEchqJv6CRorXUuz5FS12RtFezD3cTvsT5S2LtStrgcuciMq7+qIXMYkn3vUiVqMqrjcHLN+EvRKqn1H3yGENh1sZUEu0cFX+KqcsEZs3RnTMMSVlHwCnZB2Q6UPNoDKEJh8odbRUZ/VQAoL3P2V8ErTQHHkyLiVNkah57Nlgek2ecixfmMvX1SS4SO5njNjIocWaVUxhHUU45OijWQt7dP+tuP0soO9siCv+0jXqZc9EmYILuAq4n6Yzbng8nUlSAXRrsP06qoT1yENxGLCCVE9cKuTi2PLbXvoAY3yZP9GzezaSzWBUgq/Qn6MquoDsRZluruHPShB/p7xetIl0oSWykUoqxDN7bO/ATfqH76NF47YdCe0UsAlwCISaAE/R/U3RY+x4hWhAhCeZmb6JKogAQqZnRizqFBwijEky5+/J9PvBdiLYofyo6zOaE41LGnBtHgumvoBHjXaAA7INDFqEn6i0BXHhmbyZ7fYcLf3N9m9aQrkyaag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5518.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(83380400001)(966005)(3480700007)(7696005)(478600001)(54906003)(71200400001)(110136005)(9686003)(6506007)(26005)(186003)(107886003)(7116003)(2906002)(166002)(33656002)(52536014)(38100700002)(4326008)(66556008)(66946007)(76116006)(66446008)(82960400001)(64756008)(66476007)(41300700001)(122000001)(99936003)(8676002)(8936002)(9326002)(5660300002)(38070700005)(316002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w4fRsxDRkuCsHhZuDQUYIiQnzmIWlqNeDVKUP4bLD4YkiQ15d0xvKZQGi5Gq?=
 =?us-ascii?Q?LRcbI/LFKR2eeUrgg7pP3veYkhrcjW1fbnLVOirllMqYTjYPRnD+YAvSvun/?=
 =?us-ascii?Q?2ClAwoY5sc1EYXa8p8BpRzltxh+SKxoE8GxKKpijtvGqHpKQvIy0mOLR5Wn+?=
 =?us-ascii?Q?GebsNc1DwWHiYbDtyhGdsc9z9waeOAKfHy2eqqukv9qhC7fbwtvhJh+2qUSf?=
 =?us-ascii?Q?cnQ5SuXUMWj/T+Scx5hInPhgCYwmSppTwvNHOlEhPCbpSutFhEWEmDFqlEiq?=
 =?us-ascii?Q?TE73STL/9wvR2hdJ1HWwirhCU1Au9eVdaiyHShm/lJAUshvzD+l8+9cFyaSu?=
 =?us-ascii?Q?b19Iy+xIZJMHB3RBaV75UqHbPcSJM5e+85yoFkoRyqaC67pNoMKkvrUyzFfA?=
 =?us-ascii?Q?vhMp6RsI8KX4qMBh65icWa0N/D9XSXgF9ALx++oShmMDWhbXr7aaPJo2jnwG?=
 =?us-ascii?Q?+LE5KFR8KmSs1j6hz7U4dG/iTpLVxXWn3cg8I/KYYvgdqH0Xo/Aa40nbUE89?=
 =?us-ascii?Q?xZQYNEyeW3BozvCUw+OCXf8iYSRGeHn9Cu4xGhH5javtfZkklBvustPCkYIy?=
 =?us-ascii?Q?MaWuzHLqK3RWbVn9R95tc14D/NHyW4/oYHlYRBdwCZParmsYQilvGBqMnnPx?=
 =?us-ascii?Q?JJbz2aIMec5hmx+VaLKMYFdtteIN5kHKTsv7lSfy4uHQdp9UXRtDZs4TJLfK?=
 =?us-ascii?Q?e/HrT5vxjdI476Q4uIuufw03tLx9LD5q2t7AuRVDQ9KA/VSOSu7Z5zj2yGGg?=
 =?us-ascii?Q?bVmJ4Jmwyo30iq8IMSNkXnBXHt+Zw2OnSW7nJQMNvdN+0R4Z/zjKKb8bl0VG?=
 =?us-ascii?Q?qbt3N16kQFnm+qAxwMmNB0sDpu0SB1lG9OTd2xBEQt3DX6ck+9Xvp0itTnP5?=
 =?us-ascii?Q?/F1MJzpV4Z1wseS/CPb7hvpacRp/8C8BnkEtrbCTaCd7zqBR9fR5DsJbnYYJ?=
 =?us-ascii?Q?xlpx2yLV+O8NdZCzaeGU99glduCQWB6IM/JIH0dlt5xRmVBHf8bJeB7tWazb?=
 =?us-ascii?Q?s1iOKKgvr8UTh78wrCSJVgjjKlgsggF9qXlEYK7UPpHbpDCEx5doJGZpp9p9?=
 =?us-ascii?Q?kH1W04BLDSGIYGOBwgDfbKqtIU/Zh7/FVtBiaqcoXmecgrI75w6QfHBhWMtC?=
 =?us-ascii?Q?WJTRtzEEQTmMxs/Olu7nHNHZd2wjQBdxFGbgJPJntmyjQEqxpXPbJm14oBS0?=
 =?us-ascii?Q?aENpZTKtzHSthml8Rm7V4vD5XplJiffT4ngKxTdWpIYSwjZV8644bun1ju83?=
 =?us-ascii?Q?PLoRHkvwy0CbFOHx0XxFobvrUWUAUMMka9d13ac/94kY06G610E8Yq4diQ+P?=
 =?us-ascii?Q?HYXn02I/D0tQYpVPVXFmETUMRZDkg6bk5IpOevETRm49WS5LNqy2bHxgZgGF?=
 =?us-ascii?Q?1v0Z9t4fgkVdD0kAWryysc0oSB93Vz4cXK1ORbGonDkBr7ieLq6wm5fxIj37?=
 =?us-ascii?Q?V4mcC4IGf/BUYuJFDkb7QS9LzFErOaR2P62WNY4w104QuRFhzcz/ZXL9bR/q?=
 =?us-ascii?Q?8lBq2V+2Y0KaEteLVqgDXFdWOGgR9oSvamDT7YCyg6XzQTO6P8UwoqVQKcTd?=
 =?us-ascii?Q?vsdy4it0a7mfnXzNmz9xQDBH5q1TmhxDUejubBuZ?=
Content-Type: multipart/mixed;
	boundary="_004_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5518.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0722ff13-e932-49b3-f5a3-08db4f969624
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 07:33:58.5741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41bN8O71QI5Ge0c2FOH2kc++tb12lep/Ww3SJ0tVG5QnChAErN3y5cE/FAg2T146NB1UTDMFjH/xsPbJ1TQSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-OriginatorOrg: intel.com

--_004_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_"

--_000_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

We have one test which test the functionality of "using the same loopback a=
ddress and port for both IPV6 and IPV4", The test should result in EADDRINU=
SE for binding IPv4 to same port, but it was successful

Test Description:
The test creates sockets for both IPv4 and IPv6, and forces IPV6 to listen =
for both IPV4 and IPV6 connections; this in turn makes binding another (IPV=
4) socket on the same port meaningless and results in -EADDRINUSE

Our systems had Kernel v6.0.9 and the test was successfully executing, we r=
ecently upgraded our systems to v6.2, and we saw this as a failure. The sys=
tems which are not upgraded, there it is still passing.

We don't exactly at which point this test broke, but our assumption is http=
s://github.com/torvalds/linux/commit/28044fc1d4953b07acec0da4d2fc4784c57ea6=
fb

Can you please check on your end whether this is an actual regression of a =
feature request.

I have attached the cope snippet for the particular test as well as the url=
 https://github.com/gramineproject/gramine/blob/master/libos/test/regressio=
n/tcp_ipv6_v6only.c

Thanks,
Anjali


--_000_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi <br>
<br>
We have one test which test the functionality of <b>&#8220;using the same l=
oopback address and port for both IPV6 and IPV4&#8221;,</b> The test should=
 result in EADDRINUSE for binding IPv4 to same port, but it was successful<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Test Description:<o:p></o:p></p>
<p class=3D"MsoNormal">The test creates sockets for both IPv4 and IPv6, and=
 forces IPV6 to listen for both IPV4 and IPV6 connections; this in turn mak=
es binding another (IPV4) socket on the same port meaningless and results i=
n -EADDRINUSE<br>
<b><br>
</b>Our systems had Kernel v6.0.9 and the test was successfully executing, =
we recently upgraded our systems to v6.2, and we saw this as a failure. The=
 systems which are not upgraded, there it is still passing.<br>
<br>
We don&#8217;t exactly at which point this test broke, but our assumption i=
s <a href=3D"https://github.com/torvalds/linux/commit/28044fc1d4953b07acec0=
da4d2fc4784c57ea6fb">
https://github.com/torvalds/linux/commit/28044fc1d4953b07acec0da4d2fc4784c5=
7ea6fb</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please check on your end whether this is an =
actual regression of a feature request.<br>
<br>
I have attached the cope snippet for the particular test as well as the url=
 <a href=3D"https://github.com/gramineproject/gramine/blob/master/libos/tes=
t/regression/tcp_ipv6_v6only.c">
https://github.com/gramineproject/gramine/blob/master/libos/test/regression=
/tcp_ipv6_v6only.c</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Anjali<br>
<br>
<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_--

--_004_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_
Content-Type: text/plain; name="tcp_ipv6_v6only.c"
Content-Description: tcp_ipv6_v6only.c
Content-Disposition: attachment; filename="tcp_ipv6_v6only.c"; size=4619;
	creation-date="Mon, 08 May 2023 07:24:50 GMT";
	modification-date="Mon, 08 May 2023 07:33:57 GMT"
Content-Transfer-Encoding: base64

I2RlZmluZSBfREVGQVVMVF9TT1VSQ0UNCiNpbmNsdWRlIDxhcnBhL2luZXQuaD4NCiNpbmNsdWRl
IDxlcnJuby5oPg0KI2luY2x1ZGUgPG5ldGluZXQvaW4uaD4NCiNpbmNsdWRlIDxzdGRpby5oPg0K
I2luY2x1ZGUgPHN0ZGxpYi5oPg0KI2luY2x1ZGUgPHN0cmluZy5oPg0KI2luY2x1ZGUgPHN5cy9z
b2NrZXQuaD4NCiNpbmNsdWRlIDxzeXMvdGltZS5oPg0KI2luY2x1ZGUgPHN5cy90eXBlcy5oPg0K
I2luY2x1ZGUgPHVuaXN0ZC5oPg0KDQovKiB1c2UgdGhlIHNhbWUgbG9vcGJhY2sgYWRkcmVzcyBh
bmQgcG9ydCBmb3IgYm90aCBJUFY2IGFuZCBJUFY0ICovDQojZGVmaW5lIFNSVl9JUFY2ICI6OjEv
MTI4Ig0KI2RlZmluZSBTUlZfSVBWNCAiMTI3LjAuMC4xIg0KI2RlZmluZSBQT1JUICAgICAxMTEx
Mg0KI2RlZmluZSBUSU1FT1VUICA1DQoNCmludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJndikg
ew0KICAgIGludCBzb2NrZXRfaXB2NDsNCiAgICBpbnQgc29ja2V0X2lwdjY7DQogICAgaW50IHJl
dDsNCg0KICAgIGlmICgoc29ja2V0X2lwdjYgPSBzb2NrZXQoQUZfSU5FVDYsIFNPQ0tfU1RSRUFN
LCAwKSkgPCAwKSB7DQogICAgICAgIHBlcnJvcigic29ja2V0KGlwdjYpIik7DQogICAgICAgIHJl
dHVybiAxOw0KICAgIH0NCg0KICAgIGlmICgoc29ja2V0X2lwdjQgPSBzb2NrZXQoQUZfSU5FVCwg
U09DS19TVFJFQU0sIDApKSA8IDApIHsNCiAgICAgICAgcGVycm9yKCJzb2NrZXQoaXB2NCkiKTsN
CiAgICAgICAgcmV0dXJuIDE7DQogICAgfQ0KDQogICAgaW50IGVuYWJsZSA9IDE7DQogICAgaWYg
KHNldHNvY2tvcHQoc29ja2V0X2lwdjYsIFNPTF9TT0NLRVQsIFNPX1JFVVNFQUREUiwgJmVuYWJs
ZSwgc2l6ZW9mKGVuYWJsZSkpIDwgMCkgew0KICAgICAgICBwZXJyb3IoInNldHNvY2tvcHQoaXB2
NiwgU09fUkVVU0VBRERSID0gMSkiKTsNCiAgICAgICAgcmV0dXJuIDE7DQogICAgfQ0KICAgIGlm
IChzZXRzb2Nrb3B0KHNvY2tldF9pcHY0LCBTT0xfU09DS0VULCBTT19SRVVTRUFERFIsICZlbmFi
bGUsIHNpemVvZihlbmFibGUpKSA8IDApIHsNCiAgICAgICAgcGVycm9yKCJzZXRzb2Nrb3B0KGlw
djQsIFNPX1JFVVNFQUREUiA9IDEpIik7DQogICAgICAgIHJldHVybiAxOw0KICAgIH0NCg0KICAg
IC8qIHRoaXMgZm9yY2VzIElQVjYgdG8gbGlzdGVuIGZvciBib3RoIElQVjQgYW5kIElQVjYgY29u
bmVjdGlvbnM7IHRoaXMgaW4gdHVybiBtYWtlcyBiaW5kaW5nDQogICAgICogYW5vdGhlciAoSVBW
NCkgc29ja2V0IG9uIHRoZSBzYW1lIHBvcnQgbWVhbmluZ2xlc3MgYW5kIHJlc3VsdHMgaW4gLUVB
RERSSU5VU0UgKi8NCiAgICBpbnQgZGlzYWJsZSA9IDA7DQogICAgaWYgKHNldHNvY2tvcHQoc29j
a2V0X2lwdjYsIElQUFJPVE9fSVBWNiwgSVBWNl9WNk9OTFksICZkaXNhYmxlLCBzaXplb2YoZGlz
YWJsZSkpIDwgMCkgew0KICAgICAgICBwZXJyb3IoInNldHNvY2tvcHQoSVBWNl9WNk9OTFkgPSAw
KSIpOw0KICAgICAgICByZXR1cm4gMTsNCiAgICB9DQoNCiAgICBzdHJ1Y3Qgc29ja2FkZHJfaW42
IGFkZHJlc3NfaXB2NjsNCiAgICBtZW1zZXQoJmFkZHJlc3NfaXB2NiwgMCwgc2l6ZW9mKGFkZHJl
c3NfaXB2NikpOw0KICAgIGFkZHJlc3NfaXB2Ni5zaW42X2ZhbWlseSA9IEFGX0lORVQ2Ow0KICAg
IGFkZHJlc3NfaXB2Ni5zaW42X3BvcnQgICA9IGh0b25zKFBPUlQpOw0KDQogICAgaWYgKGluZXRf
cHRvbihBRl9JTkVUNiwgU1JWX0lQVjYsICZhZGRyZXNzX2lwdjYuc2luNl9hZGRyKSA8IDApIHsN
CiAgICAgICAgcGVycm9yKCJpbmV0X3B0b24oaXB2NikiKTsNCiAgICAgICAgcmV0dXJuIDE7DQog
ICAgfQ0KDQogICAgaWYgKGJpbmQoc29ja2V0X2lwdjYsIChzdHJ1Y3Qgc29ja2FkZHIqKSZhZGRy
ZXNzX2lwdjYsIHNpemVvZihhZGRyZXNzX2lwdjYpKSA8IDApIHsNCiAgICAgICAgcGVycm9yKCJi
aW5kKGlwdjYpIik7DQogICAgICAgIHJldHVybiAxOw0KICAgIH0NCg0KICAgIC8qIHdlIG11c3Qg
c3RhcnQgbGlzdGVuaW5nIG9uIElQVjYgc29ja2V0IHRvIG1ha2UgaXQgYWN0aXZlIGFuZCBraWNr
IGluIExpbnV4IHJ1bGVzIGZvciBiaW5kKCkNCiAgICAgKi8NCiAgICBpZiAobGlzdGVuKHNvY2tl
dF9pcHY2LCAzKSA8IDApIHsNCiAgICAgICAgcGVycm9yKCJsaXN0ZW4oaXB2NikiKTsNCiAgICAg
ICAgcmV0dXJuIDE7DQogICAgfQ0KDQogICAgc3RydWN0IHRpbWV2YWwgdHYgPSB7LnR2X3NlYyA9
IFRJTUVPVVR9Ow0KICAgIHNvY2tsZW5fdCBvcHRsZW4gID0gc2l6ZW9mKHR2KTsNCiAgICBpZiAo
c2V0c29ja29wdChzb2NrZXRfaXB2NiwgU09MX1NPQ0tFVCwgU09fUkNWVElNRU8sICZ0diwgc2l6
ZW9mKHR2KSkgPCAwKSB7DQogICAgICAgIHBlcnJvcigic2V0c29ja29wdChpcHY2LCBTT19SQ1ZU
SU1FTykiKTsNCiAgICAgICAgcmV0dXJuIDE7DQogICAgfQ0KICAgIGlmIChzZXRzb2Nrb3B0KHNv
Y2tldF9pcHY2LCBTT0xfU09DS0VULCBTT19TTkRUSU1FTywgJnR2LCBzaXplb2YodHYpKSA8IDAp
IHsNCiAgICAgICAgcGVycm9yKCJzZXRzb2Nrb3B0KGlwdjYsIFNPX1NORFRJTUVPKSIpOw0KICAg
ICAgICByZXR1cm4gMTsNCiAgICB9DQoNCiAgICB0di50dl9zZWMgID0gMDsNCiAgICB0di50dl91
c2VjID0gMDsNCiAgICBpZiAoZ2V0c29ja29wdChzb2NrZXRfaXB2NiwgU09MX1NPQ0tFVCwgU09f
UkNWVElNRU8sICZ0diwgJm9wdGxlbikgPCAwKSB7DQogICAgICAgIHBlcnJvcigiZ2V0c29ja29w
dChpcHY2LCBTT19SQ1ZUSU1FTykiKTsNCiAgICAgICAgcmV0dXJuIDE7DQogICAgfQ0KICAgIGlm
ICh0di50dl9zZWMgIT0gVElNRU9VVCB8fCB0di50dl91c2VjICE9IDAgfHwgb3B0bGVuICE9IHNp
emVvZih0dikpIHsNCiAgICAgICAgZnByaW50ZihzdGRlcnIsICJnZXRzb2Nrb3B0KGlwdjYsIFNP
X1JDVlRJTUVPKSByZXR1cm5lZCB3cm9uZyB2YWx1ZVxuIik7DQogICAgICAgIHJldHVybiAxOw0K
ICAgIH0NCg0KICAgIHR2LnR2X3NlYyAgPSAwOw0KICAgIHR2LnR2X3VzZWMgPSAwOw0KICAgIG9w
dGxlbiAgICAgPSBzaXplb2YodHYpOw0KICAgIGlmIChnZXRzb2Nrb3B0KHNvY2tldF9pcHY2LCBT
T0xfU09DS0VULCBTT19TTkRUSU1FTywgJnR2LCAmb3B0bGVuKSA8IDApIHsNCiAgICAgICAgcGVy
cm9yKCJnZXRzb2Nrb3B0KGlwdjYsIFNPX1NORFRJTUVPKSIpOw0KICAgICAgICByZXR1cm4gMTsN
CiAgICB9DQogICAgaWYgKHR2LnR2X3NlYyAhPSBUSU1FT1VUIHx8IHR2LnR2X3VzZWMgIT0gMCB8
fCBvcHRsZW4gIT0gc2l6ZW9mKHR2KSkgew0KICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImdldHNv
Y2tvcHQoaXB2NiwgU09fU05EVElNRU8pIHJldHVybmVkIHdyb25nIHZhbHVlXG4iKTsNCiAgICAg
ICAgcmV0dXJuIDE7DQogICAgfQ0KDQogICAgc3RydWN0IHNvY2thZGRyX2luIGFkZHJlc3NfaXB2
NDsNCiAgICBtZW1zZXQoJmFkZHJlc3NfaXB2NCwgMCwgc2l6ZW9mKGFkZHJlc3NfaXB2NCkpOw0K
ICAgIGFkZHJlc3NfaXB2NC5zaW5fZmFtaWx5ID0gQUZfSU5FVDsNCiAgICBhZGRyZXNzX2lwdjQu
c2luX3BvcnQgICA9IGh0b25zKFBPUlQpOyAvKiBub3RlIHRoZSBzYW1lIHBvcnQhICovDQoNCiAg
ICBpZiAoaW5ldF9wdG9uKEFGX0lORVQsIFNSVl9JUFY0LCAmYWRkcmVzc19pcHY0LnNpbl9hZGRy
KSA8IDApIHsNCiAgICAgICAgcGVycm9yKCJpbmV0X3B0b24oaXB2NCkiKTsNCiAgICAgICAgcmV0
dXJuIDE7DQogICAgfQ0KDQogICAgcmV0ID0gYmluZChzb2NrZXRfaXB2NCwgKHN0cnVjdCBzb2Nr
YWRkciopJmFkZHJlc3NfaXB2NCwgc2l6ZW9mKGFkZHJlc3NfaXB2NCkpOw0KICAgIGlmIChyZXQg
IT0gLTEgfHwgZXJybm8gIT0gRUFERFJJTlVTRSkgew0KICAgICAgICBmcHJpbnRmKHN0ZGVyciwN
CiAgICAgICAgICAgICAgICAiYmluZChpcHY0KSB3YXMgc3VjY2Vzc2Z1bCBldmVuIHRob3VnaCB0
aGVyZSBpcyBubyBJUFY2X1Y2T05MWSBvbiBzYW1lIHBvcnRcbiIpOw0KICAgICAgICByZXR1cm4g
MTsNCiAgICB9DQoNCiAgICBpZiAoc2V0c29ja29wdChzb2NrZXRfaXB2NiwgU09MX1NPQ0tFVCwg
U09fUkVVU0VQT1JULCAmZW5hYmxlLCBzaXplb2YoZW5hYmxlKSkgPCAwKSB7DQogICAgICAgIHBl
cnJvcigic2V0c29ja29wdChpcHY2LCBTT19SRVVTRVBPUlQgPSAxKSIpOw0KICAgICAgICByZXR1
cm4gMTsNCiAgICB9DQogICAgaWYgKHNldHNvY2tvcHQoc29ja2V0X2lwdjQsIFNPTF9TT0NLRVQs
IFNPX1JFVVNFUE9SVCwgJmVuYWJsZSwgc2l6ZW9mKGVuYWJsZSkpIDwgMCkgew0KICAgICAgICBw
ZXJyb3IoInNldHNvY2tvcHQoaXB2NCwgU09fUkVVU0VQT1JUID0gMSkiKTsNCiAgICAgICAgcmV0
dXJuIDE7DQogICAgfQ0KDQogICAgaWYgKGJpbmQoc29ja2V0X2lwdjQsIChzdHJ1Y3Qgc29ja2Fk
ZHIqKSZhZGRyZXNzX2lwdjQsIHNpemVvZihhZGRyZXNzX2lwdjQpKSA8IDApIHsNCiAgICAgICAg
cGVycm9yKCJiaW5kKGlwdjQpIGZhaWxlZCBldmVuIHRob3VnaCBTT19SRVVTRVBPUlQgaGFzIGJl
ZW4gY2FsbGVkIG9uIGJvdGggc29ja2V0cyIpOw0KICAgICAgICByZXR1cm4gMTsNCiAgICB9DQoN
CiAgICBwdXRzKCJ0ZXN0IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkiKTsNCiAgICByZXR1cm4gMDsN
Cn0=

--_004_DM4PR11MB55183E4B87078E0F496386029A719DM4PR11MB5518namp_--
