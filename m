Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.47.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542629;
	b=0I/WkxPzBsOA4juPjb+cGUjwSGKVp3VSnjvmOXpOM/Qow/9Jv4B9skhM3Zehl6oq04S7
	 aKw7Ep8NoM+TpO81ftODHAHqGoKG7hcxc2ylHCQCUU1Rcf/jIktQjXvF6xCOwM6l9WGlA
	 lwOV1Sv4pmbUYDdvbcCaQ4Beb98NF8doBhi3DTaAuCqmWSmQEd5Yqp9z2G77O3lVX2AcC
	 6/SoSDKQ/fb/9c34KuJf4qNApepaZGVV7u03yJf+MzGzosRysoyKmTwNqPSwPFKZU8Lsj
	 Kl3cM4pDW9WkZ4zmKGHpkuWJc4xmhJuKFSGbX4G4EehwULi5DJECon78Atk13sKUg6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-fermilab-ob:
	 x-fermilab-sender-location:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=N53u6adYmOTJkyfReQPNrtyl5e37F/t+5hjBUk70UUA=;
	b=WVLEWaZXTeWWbRZgPaUXQBmafUfws9St4u8WQbIS/7qNjTg1pqqxJ2CPfAYgdBkNcqA/
	 XqAu5dhjdR+/4gC2Jyp/DcnAJsquV36L6k3nvvB/+ibsYznTQcI0MWXUunbRWX7Wi82dW
	 7T2T5TtDvgj87CecCSGiI9u508ennRUa63yR9WtkVuO4acAYxDnSHy1er+9quO0imSntU
	 q2yvYT0nFCcGivDwt7Ap/nbGNllic29pRJoZpWnlRHloDW1jcQUCFLp060baoHIohz0vN
	 UkwTrlNE4Q9Nf7rXasQqzZa9w6fUsbDXgQKOWF0f+DKgKrpjkCHTXj79h98fXX/YeNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fnal.gov;
	spf=pass smtp.mailfrom=fnal.gov;
	dkim=pass header.d=fnal.gov header.i=@fnal.gov header.a=rsa-sha256 header.s=selector2 header.b=Bvd8+5gV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.47.59
Received: from CO1PR09CU001.outbound.protection.outlook.com (mail-westus2azon11011059.outbound.protection.outlook.com [52.101.47.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D5606A321
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 17:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fnal.gov
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnal.gov
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fnal.gov header.i=@fnal.gov header.a=rsa-sha256 header.s=selector2 header.b=Bvd8+5gV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSF7XAAYhctBOQhdnOkvOouDR2RP1vibuBRBIZ0qO8qJT2DO8Wi7yinoieeRCsCGh4p397Fv+zmelT3Gy7MK8HZ6+mj23lgNwEKNwCM8Wj/u308+2t5jZ9lUGzRjPp2bKxRk7ZDwqcbt+SLBc1riMkGqguXMtdd7V5/i5f/sNZyMczsmiP5wy20rMuVPbKLMticQ8xU8dGGlWUDqdxi0KT6aDt69feqlWkNaNvwmBnC0BtgDp3Taj5O2+fjWDGh7ejhJytfgmOrvSPjY5ZPfKtUAwOaGf0vCxeI7qglgSNjH06BprnSJj/6d3h3hoLtCIhixT6eOKBfV5LrUVb9rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N53u6adYmOTJkyfReQPNrtyl5e37F/t+5hjBUk70UUA=;
 b=uTF0/V1xOXn5E8KDsLaoAviNzcBfGFVpEwlOvnkwdGzbuT0E7ZhsLPVks446wfkWvNyQHLlCn5TCY5gC5MQKbrbNU+ueGnLKZSPD3A6jeJYdvT+ZhstZui7/7gRNcgL6rtB6eGMCeigpZtdtkJ3OMJmX7Ht10C6ekhMkdKHtLkBGOgiqAE2Lyp8y2q1y20VcwvYG3Dkwyh8fXAjTeIfLnlJ4i1YQM15OPGhsLp67D8rOOjdEQ5c+8gi6H3xlLdJUdwfl9laP9LJ+/dF9l/vfnQZWYbgtxss5TEJ8TOnRyuvjzGpNC8US9fn46OudQBIGz4QvPoV7uTyvqiu3NgXEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fnal.gov; dmarc=pass action=none header.from=fnal.gov;
 dkim=pass header.d=fnal.gov; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fnal.gov; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N53u6adYmOTJkyfReQPNrtyl5e37F/t+5hjBUk70UUA=;
 b=Bvd8+5gVlxwrHv4FbovtGIDKibr0Wvkt2TkN4gqPYzJr6xobnIHCFrWpthx4pKhnqqvOlCzB4VQa/iKGVr8K3YTXEHKeucTx7var3FJFbuxO0ufo6/3IvjhFUaZcAZ3cznwZGqwxkjd69VFr1MfC0srZv2AziLnbmGy3YaQkwcC0oFHFM1mqEcfp/Usvh8FVGh/QsJigSbJ5jxVrJZ3BDx/67Bq4xOmMFykgx2Itti58zteLOxJ+hj4m0CjRWv2gz/x/aJjygfc6lDPEkqrjExadPAun1Jk41GoWf/t2vYLoYWGJPDN1O8NasyiU7Cs53uQva5MvAgGgtdcv4qYQrA==
Received: from DS5PR09MB13532.namprd09.prod.outlook.com (2603:10b6:8:47a::5)
 by DS5PR09MB13025.namprd09.prod.outlook.com (2603:10b6:8:486::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 17:50:23 +0000
Received: from DS5PR09MB13532.namprd09.prod.outlook.com
 ([fe80::21dd:6f53:4c7c:1611]) by DS5PR09MB13532.namprd09.prod.outlook.com
 ([fe80::21dd:6f53:4c7c:1611%7]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:50:22 +0000
From: Ronald Rechenmacher <ron@fnal.gov>
To: Jani Nikula <jani.nikula@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20
 in BW allocation mode for HBR3-only DP OUT, external monitors stay black
 (v7.2 -> v7.3)
Thread-Topic: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20
 in BW allocation mode for HBR3-only DP OUT, external monitors stay black
 (v7.2 -> v7.3)
Thread-Index: AQHdeST1dAec1YnCd0qQ5BmHrAikIrc8G2qAgAFjYCU=
Date: Tue, 24 Nov 2026 17:50:22 +0000
Message-ID:
 <DS5PR09MB1353241C0DFC9781B60E696C2DC442@DS5PR09MB13532.namprd09.prod.outlook.com>
References:
 <DS5PR09MB1353250098A5804464BB8BAE6DC782@DS5PR09MB13532.namprd09.prod.outlook.com>
 <7c77eaf0bdd8370e2259c654dd866561ca07d382@intel.com>
In-Reply-To: <7c77eaf0bdd8370e2259c654dd866561ca07d382@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fnal.gov;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS5PR09MB13532:EE_|DS5PR09MB13025:EE_
x-ms-office365-filtering-correlation-id: dbac0a88-717d-4ef5-1810-08df4a536994
x-fermilab-ob: 1
x-fermilab-sender-location: inside
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|22082099003|6133799003|12006099003|18002099003|4133799003|3023799007|4143699003|261022075727099003|5023799004|261021121427099003|56012099006|261021133027099003|261021135927099003|261022115727099003|261028144727099003|261102130727099003|261021130227099003|261026121527099003|261009223027099003|261022113327099003|261026130827099003|261026135527099003|261026140227099003|261021123027099003|261022105027099003|38070700021|10067099003|261102123227099003;
x-microsoft-antispam-message-info:
 GxiQ3wXuQ7rU18oxiy4aBOGLA1Pe086Jt/8BfQr+CAa8OUcQnkbQYAf6gw+rZyQ5IlR05RbZVEk+seOgsV1wvy0AcMpZGEE0fT344qDo/EKIjfqrhp7RgGo8UC3rb/CYFQfOqwKn+OcRzaf9bQD7xwoZonUx1fLgjepNrDyu+6KZ4e+5qhdw2WVn27Z0BWysqIc33qMCE7rcsVC1b1picYWJBePExDJB2ODN6nEl5QTqhv7+4Y1TnybYe+GC1gfZTWyIShXc7tWEPuiQk1jl6pfA2oF/4lkkrnQp2O+OtyLUUIDYi7eCpxpvnxp84rM4i4PhxR4UmaBvhiatwcXHjDRBARJkKsojQ75KpW6QanV2ZETe9XhInR5LTZ5O/Q2f6rrIIYpmlO6wI9QdMZGexUpcys6VyhM9ttK7jMCcaHJDYfh1LeYJNcOG1faUdZw1wfO7WY/KbzxxRT9kxSKDqWOLEQ8q/vwJN0WhkvfWsqnAPTVDBg6jnT9h2lSL42W08Bz2kBRQY3SXpKGrt7dm6/EBwdX6ZkQHJzI3ytKFp5K0hMaIh+mWjDTCqVbFn13ip9O2g/ol9EmdGmSNRL1zwTeR5iaYsC1pBBMl8iVNHT8mZsYOUBSOEBfiPA4T648lKVVI2IsZsBlwNFMVLItAld9KtqFNniMXZg2xT0U44g4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR09MB13532.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(22082099003)(6133799003)(12006099003)(18002099003)(4133799003)(3023799007)(4143699003)(261022075727099003)(5023799004)(261021121427099003)(56012099006)(261021133027099003)(261021135927099003)(261022115727099003)(261028144727099003)(261102130727099003)(261021130227099003)(261026121527099003)(261009223027099003)(261022113327099003)(261026130827099003)(261026135527099003)(261026140227099003)(261021123027099003)(261022105027099003)(38070700021)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?gpaq5udhssAAOClK801kW2EpAMvWJTJcjXHwt4bjWypjneego6bKABIU?=
 =?Windows-1252?Q?/JR5sBq4J2dvAGwRq7cppVFhwwMu71eYZUcwkJDUbpGTRL0UWXs58djW?=
 =?Windows-1252?Q?Mn9oK9wYkizIH9wSCcGLwBwGCx0Buhza7njJhiIpc3CZ26jRNeYzg9Ap?=
 =?Windows-1252?Q?bJErtfX87MCuL1B4k97bR2t/XbZVmLrfWhORjBvISgEV1S2XX4HxIzEV?=
 =?Windows-1252?Q?CpBRO2BCf0JHN6rMfjZNYCjz2DYjlzXS/VOuSG1NocgUvYfl7XzaTv40?=
 =?Windows-1252?Q?Jb7DrThyZFn0bCEKuvsKblpIrlRLP4AVeWA8X55pJpk3FwqedHrh1OXW?=
 =?Windows-1252?Q?6LpP5Wa96nvhb0jEteP9b8iKMhQR4IR1Z5a4T88OHRo64lYlQgXsJBMP?=
 =?Windows-1252?Q?d7SB9RIetjIACKfaP/X3fuLvnb3XtS4iOrmXH1UYsQ6cM78Rs7kOq0oW?=
 =?Windows-1252?Q?TWg++9sWOqpJ4Rzjhx8oBnTipk1QfQfm6RLBWakz7rAbUn8jv4EroDz5?=
 =?Windows-1252?Q?BQzdzsCA/hLvy+R8avNlxZE9vJF19E2dHs/1M3lgcjUIRnh8+YcsLFGL?=
 =?Windows-1252?Q?CMyUl2BAzejiB1Wy68DnvmmyCWtcts3Uh2C5O/Pi+7x1zITrRNdK/+cv?=
 =?Windows-1252?Q?Hd2fPXHJipuE5EjB4VJRhox8uSNiBwjo0vK6ZbwD74fook7GRqyNQpvL?=
 =?Windows-1252?Q?QwNEeJZynNmjxSGfv/sXMlEY1ozeHvuZqWWhwY13Vjx4R0GE3WsY3VcA?=
 =?Windows-1252?Q?lOsndMLGNkuN418QLqLPXGRT72en0TrEbBsAijZWVTVnPvl3XxNYDQVT?=
 =?Windows-1252?Q?gldPTQaD+w0MSmJxBlCjjU+GMIn6fZAbf7BQUGRE99jz+3G4wp7e1Mm4?=
 =?Windows-1252?Q?FAYGPScSO/erLcCQOEzHihobIxxIbLEvBn0CyouFrcRaQOVFRurGctZq?=
 =?Windows-1252?Q?sGOasoA28AZNq8jKtvZ0sHJ0wxrq5c2Dw9K1OgECC6CD+a1ia5s9Nntw?=
 =?Windows-1252?Q?PavyACBFKMB1Zneqdu2h4OluZe1ZRTToohRIB6665qrr9/GynTsz0IyS?=
 =?Windows-1252?Q?6ASXf84XzfYmuIvF3KAVIHEKkC4piCfaKUXaKRJoI8/MFOcg7jUfAA9F?=
 =?Windows-1252?Q?7ReIRiiybsyyAy8wTHLFnbljoRwyaeibXmAOgMpWmdtstUkvkkYlsGXQ?=
 =?Windows-1252?Q?2K+UzcfTin5UTNqPEzjNv4gKnzUdg8BFdjv4xJQvJeqXx3lX0J5hTDfb?=
 =?Windows-1252?Q?lVkXcEDs4aqBuLAISPGqzNCVzp/kvY6KMNMoRssdyajoLDxgaduCFcC+?=
 =?Windows-1252?Q?DLi50OjQm35O++frKkckMlfxZhFsJ2AF1ZB1jQGPumPVKbaha9x3T8db?=
 =?Windows-1252?Q?fLQGQ1nJyd/JxdLeoC59snvHmzeoY9cPEPYyxfbHxV8bWGMSN9mCsOcg?=
 =?Windows-1252?Q?FK/Qrmu3IxivuKEJ0ea8SD/uSG1PwNNhM7ieY3naeqy/isqH1WqmlIyK?=
 =?Windows-1252?Q?H2OdP4lwZZfdutC4Wji5xDz4c4QZb9U6doPVWAxVqXFBdJ0jGgbUVxpv?=
 =?Windows-1252?Q?RMi8hKfNoGE3XWOpzKjLhlt9Lvtb9mG5xtw2Y2SQ+b7d2AF0ca12mYvI?=
 =?Windows-1252?Q?Lvdn3e7/P207FZGC0NHv6k0C4ipTNFkPGCCKLgJKkLwjTUwh7+xgIKov?=
 =?Windows-1252?Q?YOzhIS9SjMXXLA5ii4avXf3IdQ6ZVnOkMGBXZxRgJ6e9rTK1pewJj9nt?=
 =?Windows-1252?Q?i0w/+2Gq9m1GA2LdRDS4ZtJtQ3+ecB79CbL6LYzVVKYELRm0aPTYWd8d?=
 =?Windows-1252?Q?Epjz6DDoP45Qu3W5OofujdIJfIFM8DF7gDJEjYnYO54LF2fs9UpdyBay?=
 =?Windows-1252?Q?uKh6yZpQbeqqmg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: fnal.gov
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS5PR09MB13532.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbac0a88-717d-4ef5-1810-08df4a536994
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 17:50:22.3056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d5f83d3-d338-4fd3-b1c9-b7d94d70255a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR09MB13025

Hi,=0A=
=0A=
Thanks, that patch fixes it here.=0A=
=0A=
Tested "drm/i915/dp: Fix source PHY updates for UHBR links with LTTPRs"=0A=
https://lore.kernel.org/all/20261123120954.1115838-1-imre.deak@intel.com/=
=0A=
on top of Fedora's 7.3.4-300.fc45. The kernel also carries one unrelated=0A=
local patch (a PCI P2PDMA host-bridge allowlist entry); nothing else in=0A=
display or thunderbolt is changed. I removed thunderbolt.bw_alloc_mode=3D0,=
=0A=
so BW allocation mode is enabled, and booted with drm.debug=3D0x10e=0A=
thunderbolt.dyndbg=3D+p.=0A=
=0A=
Results (Dell Pro Max 18 Plus + Dell Pro TBT5 Dock WD25TB5, 3 monitors on=
=0A=
the dock's MST hub):=0A=
=0A=
- Cold boot with the dock attached, then 3 unplug/replug cycles.=0A=
- All 7 link trainings on DP-3 passed at UHBR20 x4 on the first attempt.=0A=
  The source now applies the requested TX FFE preset and channel EQ=0A=
  completes after two iterations:=0A=
=0A=
    [DPRX] 128b/132b, lanes: 4, TX FFE presets: 0/0/0/0=0A=
    [DPRX] 128b/132b, lanes: 4, TX FFE request: 14/14/14/14=0A=
    [DPRX] 128b/132b, lanes: 4, TX FFE presets: 14/14/14/14=0A=
    [DPRX] 128b/132b, lanes: 4, TX FFE request: 14/14/14/14=0A=
    [DPRX] 128b/132b, lanes: 4, TX FFE presets: 14/14/14/14=0A=
    [DPRX] 128b/132b Link Training passed at link rate =3D 2000000, lane co=
unt =3D 4=0A=
=0A=
  On 7.3.3 the sink kept requesting preset 14 until "Lane channel eq=0A=
  timeout" / "Max loop count reached".=0A=
- No "eq timeout", "Max loop count reached," or "Reducing link parameters"=
=0A=
  messages, and no modeset-retry / snd_hda_spdif_ctls_unassign WARN.=0A=
- All three monitors light up at boot and after every replug;=0A=
  i915_display_info shows port_clock=3D2000000, lane_count=3D4 on all three=
=0A=
  MST pipes.=0A=
=0A=
So my guess in the report (a failed UHBR attempt leaving the dock in a bad=
=0A=
state) is moot: UHBR20 itself trains fine once the source FFE presets are=
=0A=
programmed, and the HBR3 fallback path is no longer reached.=0A=
=0A=
Tested-by: Ron Rechenmacher <ron@fnal.gov>=0A=
=0A=
#regzbot fix: drm/i915/dp: Fix source PHY updates for UHBR links with LTTPR=
s=0A=
=0A=
Thanks,=0A=
Ron Rechenmacher=0A=
=0A=
=0A=
________________________________________=0A=
From: Jani Nikula <jani.nikula@linux.intel.com>=0A=
Sent: Monday, November 23, 2026 2:11 PM=0A=
To: Ronald Rechenmacher; linux-usb@vger.kernel.org=0A=
Cc: intel-gfx@lists.freedesktop.org; regressions@lists.linux.dev=0A=
Subject: Re: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR2=
0 in BW allocation mode for HBR3-only DP OUT, external monitors stay black =
(v7.2 -> v7.3)=0A=
=0A=
[EXTERNAL] =96 This message is from an external sender=0A=
=0A=
On Fri, 20 Nov 2026, Ronald Rechenmacher <ron@fnal.gov> wrote:=0A=
> Subject: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20 =
in BW allocation mode for HBR3-only DP OUT, external monitors stay black (v=
7.2 -> v7.3)=0A=
>=0A=
> To: Thunderbolt/USB4 maintainers, linux-usb=0A=
> Cc: i915/DP tunnel developers, intel-gfx, regressions=0A=
>=0A=
> Hi,=0A=
>=0A=
> Since moving from 7.2 to 7.3, the external monitors behind a Thunderbolt =
5=0A=
> dock stay black. They are detected, read EDID, and show up in the desktop=
's=0A=
> display settings, but no picture appears. Booting with=0A=
> thunderbolt.bw_alloc_mode=3D0 fixes it completely.=0A=
=0A=
Does [1] fix it?=0A=
=0A=
If not, please file a bug as described at [2]=0A=
=0A=
=0A=
BR,=0A=
Jani.=0A=
=0A=
=0A=
[1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_=
r_20261123120954.1115838-2D1-2Dimre.deak-40intel.com&d=3DDwIFaQ&c=3DgRgGjJ3=
BkIsb5y6s49QqsA&r=3D7KXkqf0bzyUQv15jBKEcHw&m=3DWbtGBMNnikBCE_5bRt_3C41noX9b=
J-cH0cFXlewGwKQVbCrdXe0i9NSfZxhreRS0&s=3DdCjUoOMnzVMdEbASjLsrUG6QeyNgvs9V2v=
zGRRV-C1Y&e=3D=0A=
[2] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__drm.pages.freede=
sktop.org_intel-2Ddocs_how-2Dto-2Dfile-2Di915-2Dbugs.html&d=3DDwIFaQ&c=3DgR=
gGjJ3BkIsb5y6s49QqsA&r=3D7KXkqf0bzyUQv15jBKEcHw&m=3DWbtGBMNnikBCE_5bRt_3C41=
noX9bJ-cH0cFXlewGwKQVbCrdXe0i9NSfZxhreRS0&s=3DrVzUy6qrWoDNiOMi61LshbXJh76bR=
aquVr9Q0BkJx44&e=3D=0A=
=0A=
=0A=
>=0A=
> #regzbot introduced: v7.2..v7.3=0A=
>=0A=
> Hardware=0A=
> --------=0A=
> - Laptop: Dell Pro Max 18 Plus MB18250, BIOS 3.5.2 (10/15/2026)=0A=
> - CPU/display: Arrow Lake-HX, i915 (MTL display version 14.00, PCI 8086:7=
d67)=0A=
> - Host router: Barlow Ridge JHL9580 (8086:5780/5781), NVM 64.81; the=0A=
>   i915 DDI TC3 port is wired to the router's DP IN (TC port mode "legacy"=
)=0A=
> - Dock: Dell Pro TBT5 Dock WD25TB5 (Barlow Ridge hub JHL9480), NVM 69.81,=
=0A=
>   internal Synaptics MST branch (DPCD 1.4, max HBR3 x4)=0A=
> - 3 monitors on the MST hub: 2x 3840x2160@60 (one uses DSC), 1x 1920x1080=
@60=0A=
> - USB4 link to the dock comes up asymmetric (3 RX / 1 TX, 40 Gb/s lanes)=
=0A=
>=0A=
> Kernels=0A=
> -------=0A=
> - Good: 7.2.15 (Fedora 7.2.15-200.fc44)=0A=
> - Bad:  7.3.3  (Fedora 7.3.3-300.fc45)=0A=
> - The 7.3.4 stable changelog has no i915, drm display, or thunderbolt=0A=
>   changes, so I expect 7.3.4 to be affected too (not tested).=0A=
>=0A=
> What happens=0A=
> ------------=0A=
> Both tunnel adapters report HBR3 x4 as their maximum. With bandwidth=0A=
> allocation mode enabled, though, the tunnel's maximum is reported as=0A=
> UHBR20 x4, and i915 picks that up as the DPRX rate:=0A=
>=0A=
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP IN maximum supported b=
andwidth 8100 Mb/s x4 =3D 25920 Mb/s=0A=
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP OUT maximum supported =
bandwidth 8100 Mb/s x4 =3D 25920 Mb/s=0A=
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): non-reduced bandwidth 810=
0 Mb/s x4 =3D 25920 Mb/s=0A=
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): maximum bandwidth through=
 allocation mode 20000 Mb/s x4 =3D 77575 Mb/s=0A=
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation mode=
 enabled=0A=
>   i915 0000:00:02.0: [drm:drm_dp_tunnel_enable_bw_alloc] [DPTUN 1:1:13][A=
UX USBC3/DDI TC3/PHY TC3] Enabling BW alloc mode: DPRX:20000x4 Group alloc:=
0/103500 Mb/s (Ok)=0A=
>=0A=
> The LTTPR (LTTPR 1) PHY capabilities read by i915 also flip between=0A=
> "04 03 00" and "04 00 00" around this point, i.e. its 128b/132b UHBR10/20=
=0A=
> bits come and go.=0A=
>=0A=
> i915 then tries 128b/132b, which always fails:=0A=
>=0A=
>   i915 [CONNECTOR:543:DP-3][ENCODER:542:DDI TC3/PHY TC3][DPRX] Max loop c=
ount reached=0A=
>   i915 ... [DPRX] 128b/132b Link Training failed at link rate =3D 2000000=
, lane count =3D 4=0A=
>   i915 ... [DPRX] 128b/132b Link Training failed at link rate =3D 2000000=
, lane count =3D 4=0A=
>   i915 ... [DPRX] Reducing link parameters from 4x2000000 to 4x1000000=0A=
>=0A=
> Two observed outcomes:=0A=
>=0A=
> 1. Cold boot with the dock attached: UHBR20 and UHBR10 fail, then i915 fa=
lls=0A=
>    back to HBR3, and 8b/10b training passes for both the LTTPR and the DP=
RX.=0A=
>    The monitors still stay black.=0A=
> 2. Dock hotplug: the fallback state is reset, and UHBR20 fails twice. The=
=0A=
>    limit drops to UHBR10, but there is no further training attempt, and=
=0A=
>    i915_display_info still shows port_clock=3D2000000 on all MST pipes. T=
he=0A=
>    monitors stay black. On the hotplug path i915's modeset retry also hit=
 a=0A=
>    WARN in snd_hda_spdif_ctls_unassign (from=0A=
>    intel_connector_modeset_retry_work_fn -> intel_audio_codec_disable).=
=0A=
>=0A=
> In about 12 boot/hotplug attempts on 7.3.3, the monitors came up once or =
twice.=0A=
>=0A=
> Workarounds that work on 7.3.3=0A=
> ------------------------------=0A=
> a) thunderbolt.bw_alloc_mode=3D0 on the kernel command line: no UHBR atte=
mpts,=0A=
>    training passes at HBR3 x4 on the first try at boot and after hotplug,=
=0A=
>    all monitors work, no i915 errors.=0A=
> b) With BW allocation mode left enabled, forcing HBR3 before any UHBR att=
empt=0A=
>    on the new link also works, and the forced rate survives later hotplug=
s:=0A=
>      echo 810000 > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_=
link_rate=0A=
>      echo 1      > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_=
link_retrain=0A=
>    Forcing 540000 the same way trained successfully but stayed black (nee=
ds=0A=
>    DSC at ~13 bpp for this monitor setup).=0A=
>=0A=
> So falling back to HBR3 after a failed UHBR attempt is not enough; HBR3 o=
nly=0A=
> works when UHBR is never attempted. My guess is that the failed 128b/132b=
=0A=
> training leaves the Barlow Ridge DP IN/OUT path or the dock's branch devi=
ce in=0A=
> a state that 8b/10b retraining does not recover, but I can't verify that.=
=0A=
>=0A=
> On 7.2.15, i915 always reports i915_dp_max_link_rate=3D810000 for this=0A=
> connector and never logs a 128b/132b attempt or a link training error. I=
=0A=
> don't have drm.debug/thunderbolt dyndbg logs from 7.2, so I can't say whe=
ther=0A=
> 7.2 enabled BW allocation mode on this tunnel.=0A=
>=0A=
> Questions=0A=
> ---------=0A=
> - Should the tunnel's "maximum bandwidth through allocation mode" be capp=
ed=0A=
>   by the DP OUT adapter's maximum (HBR3 x4 here)?=0A=
> - Should i915 handle a failed UHBR attempt on this path differently, keep=
ing=0A=
>   the fallback across hotplug and recovering after the 8b/10b fallback?=
=0A=
>=0A=
> I have full logs (drm.debug=3D0x10e thunderbolt.dyndbg=3D+p) for the bad =
boot,=0A=
> covering a cold boot, a hotplug, and both debugfs experiments, plus=0A=
> i915_display_info, i915_dp_mst_info and connector debugfs snapshots from =
7.2.15=0A=
> and 7.3.3. I can test patches or a mainline build, and can bisect v7.2..v=
7.3=0A=
> if that helps.=0A=
> Download URL: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__driv=
e.google.com_uc-3Fexport-3Ddownload-26id-3D1ZE5GYE69IgIpT6fWs5XHmMpseIurGgK=
8&d=3DDwIFaQ&c=3DgRgGjJ3BkIsb5y6s49QqsA&r=3D7KXkqf0bzyUQv15jBKEcHw&m=3DWbtG=
BMNnikBCE_5bRt_3C41noX9bJ-cH0cFXlewGwKQVbCrdXe0i9NSfZxhreRS0&s=3DfbQWcJvgh3=
ipP_DR3JM7CTSKxJphgGUQV7JklVAu6OM&e=3D=0A=
>=0A=
> Thanks,=0A=
> Ron Rechenmacher=0A=
=0A=
--=0A=
Jani Nikula, Intel=0A=
