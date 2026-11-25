Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795644383;
	b=Qx5uYheepAc8zHhQeiO+D3FAw3rSFje+9ahnqiKJsMTwqlh6F3HHLbWkAOGZ1/tIxpLK
	 mrfnf0CL/II840BdTf+gUWFBsugXQiqqFOjQEDqFbiXHBsdRxe6Jrafm8W1sO3ItWGwpk
	 /OkgStgjOSZNvNZfHhpB7q8Rtt2V6+2NV5SGkP1lOQI7rGsJkKVTKJoStCr+X/u4Hv3cq
	 GlGoECw3J3JzxLM+p5CHOxjcPj8KaO3q2kmG2aMnUjOH/i1knxXp5MdInSbW902eLDFLH
	 3+2BqMg5SYwuIPvETKuK5KLCygHuPDJx6kOWXiTnzs3CVR9UNPAt8hB7bUZDFuG9iyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644383;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KzpKYxZfVN4xEjiRiMhVeSu3PbRC/rBntovkFoCumhc=;
	b=qS1ADo9JSWvIKatvgNF/smQ+Pu6nvW1cPd3UuaCgz9ZaTwlhoMBxdtFYYlBcaihCxqYX
	 GJVgBqRGL7EBIADLKF+K3WWZclrlKhnFjzUXAUQnih/QVfvH30pAw819NAMbf6HZWp3Ob
	 6XO1+TX3qpZe8GJATaO7UBy6FcYcfcHOI0o6LhNWLY5BUV8gtl4eB/MDXD53asz9GFwjz
	 DU6db+NLbWJqojW/8U0X3zkWZPD6Ttk5OLXztXd72zNvedGxkMl+0UQN2B3uV7T/tlUsY
	 zmqTxAnamIqOuhCrOXy3ITW66rOsdmRwNXKlGoB5y8XpZ+oOCf/UaCr8w3+Ob0amKCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=uJJ+WSCp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.3
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010003.outbound.protection.outlook.com [52.103.12.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04A606A336
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 22:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F04A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=uJJ+WSCp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMIdrXAvtaezV3fIu2jyNthMrKWYLWwnngIMTNxTL2eBVyCPkQIahkMWivLEHQKlOphXuKeyrOY1WTvkwvrpqZ44ej6YnI3j6ZpTaZij9EVZiHIl05DJQJKHOxTH87qtolrp3hMh4CjLbOtQ6CS71iumeMdV30jTxkBlg3Kla64+peJWqksUKjILfZanI6fBm1zZfFJxWaFK37lXh2Bn9Y3yxuAuMhDUYcTy7sd+rcVk2G2BWVJwfeURh+lVeq04GJcpLRyx1gvtJSOy5RN7dPXmWiIpt+Xc1VLvlAq91Nkv7gkn1bYdpgh7HKRnvoyQnOf4yvth3rQK1yFPxAQazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzpKYxZfVN4xEjiRiMhVeSu3PbRC/rBntovkFoCumhc=;
 b=BZ7YOPEmawFUGG4/Ae0hu+1leUZeXUHCDed3TK3qwCpDZ6z1eiKtW7WcM9kQHefacrddQowgddGBJUWxMrjKl7/agEylRHrtDFGHV+D7JPeged/4jMtWyYVCkZ8SQwS/Z9WQVWElbVlynIXCN7iZOdWf7pU+eoYfnbjY+r6okd7DB+MIGLRekYDv5Xnd3ILE7wu7bPvdmdlCasrr7bwugNzQashmoeg2qvMgPrZNFPXsh7eNz45Zh2pY1estNQgKf6h8bUDlACHwWkaooTJJgTn38akqU9dhl1MfukTp3yShdem6IcczzcyMEi77bA58JhpGAfIA0SB9g/gUYiKnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzpKYxZfVN4xEjiRiMhVeSu3PbRC/rBntovkFoCumhc=;
 b=uJJ+WSCpiRowGx6W1M+gNjpFxXkUJeH6JQlcwp3fpSEUYbTT3uvQSFmkExtuYx/ELd+iuCFfsn/AvgWyjWnfqSEU/GMccmL3Xl3USrqRiPPE/bTIKr3yHGKEkE84EeybrGcQjWm5hiI6ZEuLGlGS5Vs2z60+vyDrRuMvZhZ+9MuB6K89zVm0WhzgthiypLyPZqLTqHiwU2EntKoyj+jqH7qZuOSNwn0T4/Vj9+oLoEzDiESqBMrJv+WFVjGjV80MozeULWG8bjGOHfH3+elrCfQkiYIyLvUzMBx4uPByS8lbpc4BBaMQr72Ce9EdxzXpMx1k6uZJOhDTfMq0L0O2ww==
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:29::14)
 by SN4P221MB0761.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 22:06:19 +0000
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2]) by CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 22:06:19 +0000
From: James Buck <jbuck2005.linux@outlook.com>
To: Vincent Guittot <vincent.guittot@linaro.org>, Chen Yu
	<yu.c.chen@intel.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi
	<arighi@nvidia.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, Usama
 Arif <usama.arif@linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
Thread-Topic: [REGRESSION] sched/fair: SIS_UTIL limit in
 select_idle_capacity() leaves busy tasks on little CPUs while big CPUs are
 idle
Thread-Index: AQHdfBX3yoODcUWCA02VDJd3NOZx7Lc+GAkAgABTZoCAACtxAIAAQzsAgAB/w9g=
Date: Wed, 25 Nov 2026 22:06:19 +0000
Message-ID:
 <CY5P221MB09265EFF7DA86632B51FFE74BD432@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
References:
 <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4> <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
 <awa3/FFd4hAnvtxK@chenyu-dev>
 <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
In-Reply-To:
 <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5P221MB0926:EE_|SN4P221MB0761:EE_
x-ms-office365-filtering-correlation-id: c3027db4-35fb-4796-3b57-08df4b4055a4
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15030799006|41001999006|15080799012|8060799015|8062599012|19110799012|24021099003|51005399006|25010399006|12121999013|37011999003|4302099013|440099028|3412199025|102099032|1602099012|10035399007|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vECBME/Hv6CrZhE2kzTIvjLX7VNrQJqXh5l8UiSOSrYVhjMCYI8BXaveDL?=
 =?iso-8859-1?Q?8vsh7ony2T0QKMlPriWCneBFCZqjYO/96bzUPm7jcKFDCYoRHIdyPxK+39?=
 =?iso-8859-1?Q?k39/XdUKveUn9bqvyGvD1KLTXFUgHSfPZvvQVGFd2o/4i8Yg3Ms/+9vyhW?=
 =?iso-8859-1?Q?A5B3ne3p/Xm4iftW5LIQa7QsBVLeMIiY17PyJRJPqGYVtaF8SmLmloZueT?=
 =?iso-8859-1?Q?wABBcSWP/hb1E/etWB+Zauz7frysLjAK4EiDCpAwuLyNktv6e9peNzqGZa?=
 =?iso-8859-1?Q?T+GG9NsXedidWBAbhp/+q8dg8fqPTI4rqdxv3UbxhOQPFsH9V36dmnVXyM?=
 =?iso-8859-1?Q?Jp3F+fjXMwF0wXHlMU42xiOzFXUAdGhsErMbBPa41vAVXjpulOFa1q3wK5?=
 =?iso-8859-1?Q?hAQPzHvWtimvdTy64dXvHY3Rbie8pNVcnNUIc3i8VTE3LnRt2mV04guwGq?=
 =?iso-8859-1?Q?87s/jcPFM4C4MwJ6a08K581F/hEAhbG5ATgE0hjpnZS02hU1qzljGRCL+m?=
 =?iso-8859-1?Q?bNTMCKsJxtwLXud2oKa/iKCIXMRl6SGZLIAWmgZCFfxohPjLLQKkTdluwf?=
 =?iso-8859-1?Q?wf5TtFlrqU7ReUaoKyB+uMAtLqUEvhSLxRWXkNsKHx1JohbByl2gBjF/Wv?=
 =?iso-8859-1?Q?L6fw5gwf6hOi58qUjSwZXv2UvWhZ/M9wccsx+2E2NVbSAUetyVWvBxGhIq?=
 =?iso-8859-1?Q?f94eWdk5p4Uqh3LVCoU8p5SCFUreHtr+QLXujsphfN3VJQOIwyyHWJzjxx?=
 =?iso-8859-1?Q?gyMw+4R5UOiJ8auBJb0MU9xyq8jIcNbgylm3PAIHkRDJCR3j9ZbQ+Ly49A?=
 =?iso-8859-1?Q?8bI4RkPtjUAZgDj/fWug3Tg0LiVwABVwB0m1vFRlHFq11SuoycFLTHYBvT?=
 =?iso-8859-1?Q?+p37o94DFSnww1F+ezw0EcTxhP4b/FIIt8rUmXdCfZ9biev8IetxjALNtF?=
 =?iso-8859-1?Q?uLn1HD2+Xe0q/u9VPPo3G0s42VgpK7klUB5bX/aqPFDZhCz4j5n3lRS9Gb?=
 =?iso-8859-1?Q?/Mg2yCMG8JThhJ4UQF47DffHPksNV8L9+DVwqCi1jhOp0Ij4PMyuXti50s?=
 =?iso-8859-1?Q?y9q19LGtPvwz3vASyQngatEwCcLbsSqUS0TBxOK0antWvUbAulU/kr0tps?=
 =?iso-8859-1?Q?9j/hhXGeSCXGtMkkdRxFWG/eKr9yc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NNSmbpJZizEh41Qgeeuaop5wdWXNLE9Kln99Wbi7mikIcV2qPTFJwLzbfL?=
 =?iso-8859-1?Q?QVcq2HZfqaCm+WuikzhKmUJjIEbFLQLbOdiDEPAV5f2baGynrnlS2ZMK77?=
 =?iso-8859-1?Q?G7nx0Ha84hfiEWYOPbV8T05k0xRHw1cKcPxQDxYvQwauc7JQCPMC9r29fY?=
 =?iso-8859-1?Q?OVtT3BW1fLOof/EilI2ajLSmsd3wuJv3L6VmQP1jH4FPKRUZlusHD96MyE?=
 =?iso-8859-1?Q?kTeSLQd9C9XNHirFs+21qPEDydIzB/N+yr63bYx3oFQhmfPe+dEi5W9+Pa?=
 =?iso-8859-1?Q?QCwQrr5Ajo961ifv+RsvW5PV/Ox21Qc2K6f7hHBD1h9+zhR/SaCCSAkHoY?=
 =?iso-8859-1?Q?taYGFW+qMbRp0pvx4T4PbrORl33NJ4gD/KDrEd41BurN3vk6ZD3QW8ZYeq?=
 =?iso-8859-1?Q?j63+uMDg44WiQDvuYWYZz+VHQvshfuEZW4hNXvB158uk9o0hHoqtT7S5qA?=
 =?iso-8859-1?Q?QUVJaXDLgpsFg+BsgUqQuIwGzQUVSSQRscWbXRmRVY7hgWWQ6rTGDfRyWZ?=
 =?iso-8859-1?Q?N3UGURxuNjllhDpLYARcJHJygnxEsJI2qOLtAsr5QmZcCdKRjek7wV7RX9?=
 =?iso-8859-1?Q?S1OuoNM1CI2X6DMOi5fvJjTyHYQjaT64vmNhBYvJUmh64ryZnpioWu/41t?=
 =?iso-8859-1?Q?c/kIiHj3LrsiKJ0NuJr3++SRbYeayYdlWKRtqUCgVOc5stvVpozNM7S9cs?=
 =?iso-8859-1?Q?j0wxC3V4gaUiZHQM4anFOGzhUHspCdIwT843JMcUxA2nfHy/7DxbII49+e?=
 =?iso-8859-1?Q?zxwtdEhuXJV4CIEZKADXxKF+eBDrYstzHyurvR385JgG4inJMrPOyj+DsH?=
 =?iso-8859-1?Q?7sJkpH2P+zwVuQU9x6vqYhZm0g1swnn/PyTxnaJ3kDNfQ71Vu8U2whOmO2?=
 =?iso-8859-1?Q?7IyTIg0J72gCEzk3EqdKbR2nSa6a62fOlX2rgWNYZVIdIzBFXVLcf70xLT?=
 =?iso-8859-1?Q?DYYpriuiSxnRZONdTL6oQUftjs/BuYVLNm3nmYIbGjM9015ml1oyhXPmW5?=
 =?iso-8859-1?Q?+OcEvN5G0N9ciZ0CGLIlP7IY0F/RWs1A5oldT5t/ZO7XyYn6A2rA6N0E2n?=
 =?iso-8859-1?Q?dCobCvOAyaXZHPBt76W/1SdGFsiILVEVtatG0oLtAS63kBVY0mdMkpbqh2?=
 =?iso-8859-1?Q?qDdyWcyeaaTi+GI4UwJF8yKycNQmpfHJAPiBwk1ESdR/7/yhpCrCBlXMJf?=
 =?iso-8859-1?Q?24LwJf2Q8CAFUgjakgUK1w7/IOoLR1B5ytm4uNjYHU8UdT/Qi+m3+o0gm7?=
 =?iso-8859-1?Q?mbsoax5QWFNXqrhabFfK0JUzejqAsJdSRZ0rAhtDaJN6RzPMc+CnrH4PQb?=
 =?iso-8859-1?Q?Og7nYPybYy7+ZKeMwSDo5jm49g574oTkpGa66C0EwUtsVF2UYxqdFPE72l?=
 =?iso-8859-1?Q?xerUo5d3yooJxR4Z+fwTk/qAlJjZbPp9fFofRNTFFDSbbE0S+mwUI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c3027db4-35fb-4796-3b57-08df4b4055a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 22:06:19.6539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4P221MB0761

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *e=
nv,
>          y =3D SCHED_CAPACITY_SCALE - tmp;
>
>          /* equation [2] */
> -       y *=3D llc_weight;
> +       y *=3D max(llc_weight, 32);
>          do_div(y, SCHED_CAPACITY_SCALE);
> +       y =3D min_t(u64, y, llc_weight);
>          if ((int)y !=3D sd_share->nr_idle_scan)
>                  WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }

Thanks, this fixes it on my board also.

Setup as in my report: CIX P1 (8x Cortex-A720 at capacities 1024/984/905/86=
6, 4x Cortex-A520 at 279, one LLC of 12 CPUs), v7.3.5 with this change appl=
ied and my local workaround (dropping the SIS_UTIL limit in select_idle_cap=
acity()) removed. llama.cpp on the CPU, Qwen2.5-1.5B Q4_K_M, 8 threads, lla=
ma-bench pp512 / tg128 in tok/s:

  v6.18                               123.5 / 36.5
  v7.3.5                              109.0 / 29.5
  v7.3.5, NO_SIS_UTIL                 122.1 / 35.9
  v7.3.5 + this patch                 122.0 / 35.5
  v7.3.5 + this patch, NO_SIS_UTIL    121.2 / 35.8

With the patch, SIS_UTIL on and off are within noise of each other and of v=
6.18 (about 1%). Sampled thread placement during the run looks the same wit=
h SIS_UTIL on and off: the busy threads sit on the A720s, with at most one =
on an A520 at a time.

Tested-by: James Buck <jbuck2005.linux@outlook.com>

James

________________________________________
From: Vincent Guittot <vincent.guittot@linaro.org>
Sent: November 25, 2026 9:27 AM
To: Chen Yu <yu.c.chen@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>; Andrea Righi <arighi@nvidia.c=
om>; James Buck <jbuck2005.linux@outlook.com>; Peter Zijlstra <peterz@infra=
dead.org>; Ingo Molnar <mingo@redhat.com>; Juri Lelli <juri.lelli@redhat.co=
m>; Dietmar Eggemann <dietmar.eggemann@arm.com>; Valentin Schneider <vschne=
id@redhat.com>; Usama Arif <usama.arif@linux.dev>; linux-kernel@vger.kernel=
.org <linux-kernel@vger.kernel.org>; regressions@lists.linux.dev <regressio=
ns@lists.linux.dev>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacit=
y() leaves busy tasks on little CPUs while big CPUs are idle

On Wed, 25 Nov 2026 at 11:38, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> > On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> =
wrote:
> > >
> > > Hello Andrea,
> > >
> > > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > > Hi James,
> > > >
> > > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > > >> Hi,
> > > >>
> > > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to se=
lect_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my =
big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because=
 waking threads are placed on idle little CPUs while idle big CPUs are neve=
r looked at.
> > > >>
> > > >> Turning SIS_UTIL off at runtime restores the old speed. select_idl=
e_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I exp=
ect mainline to behave the same.
> > > >
> > > > A related regression from the same commit was reported by Usama her=
e:
> > > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux=
.dev/
> > > >
> > > > On Grace, a zero SIS_UTIL budget skips the search despite suitable =
CPUs
> > > > being idle. Your case shows that a nonzero budget can stop the scan
> > > > before reaching an idle big CPU.
> > > >
> > > > We've discussed a minimum scan budget and accounting for idle CPU
> > > > availability, though a small minimum alone may not fix your case.
> > >
> > > This had problems in the past when Chenyu was iterating on SIS_UTIL
> > > where the search opportunity at higher utilization is actually very
> > > low and cutting off search for !idle core was beneficial for SMT
> > > systems.
> > >
> > > Now, for systems without SMT, it has its benefits too but a system
> > > without SMT should be equivalent to a SMT one where test_idle_core()
> > > returns true always if an idle CPU is present.
> > >
> > > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > > to act like a gating indicator to say if an idle core exists or
> > > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > > gate for newidle balance - it can be flipped to true when a CPU
> > > goes idle or if load balancer sees an idle CPU. Thoughts?
> >
> > I tested idle_cores tracking for !SMT and EAS months ago [1]
> > [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guitto=
t@linaro.org/
> >
> > >
> > > > Given both reports, reverting the commit seems the safest thing to =
do
> > > > for now. That would restore the previous asym search behavior and w=
e can
> > > > revisit a better consistent strategy to cover both sym and asym CPU
> > > > selection later.
> > > >
> > > > Prateek, Vincent, what do you think?
> > >
> > > IMO it still makes sense for SMT systems since capacity on systems
> > > with SMT only makes sense if the entire core is idle and then it is
> > > just a best effort thing right?
> > >
> > > set_idle_cores(), would flip the flag as soon as an idle core is
> > > available and after that SIS_UTIL is bypassed. I don't think the
> > > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> > > sense given misfit penalty is much higher.
> >
> > In fact that depends on the number of CPUs in your LLC.
> > The current SIS_UTIL is unfair for small system because you skip the
> > loop with "low" utilization:
> > - with 12 cores per LLC, you skip the loop if the avg utilization per
> > cpu is above 839 whereas it also means that you have the compute
> > capacity of more than 2 CPUs that is not used and util_est can worse
> > the situation
> > - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> > utilization per CPU
> > - and with 12864 cores LLC, it's 10 CPUs
> >
> >
>
> As you suggested in [1], maybe we can give a floor value of 3 when has_id=
le_core
> is true both for SMT and !SMT case(mainly for nr_scan =3D 0 case). Beside=
s, we can
> scale up the number of CPUs to be scanned by their llc_weight, to fake
> a 32 CPUs LLC for the small LLC system, this should mitigate
> the issue of current report and the issue reported at [1].

This fixes the regression on my radxa O6 by keeping nr_idle_scan full
for llc smaller than 32 CPUs while the avg utilization per CPU is
below ~550

>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *e=
nv,
>         y =3D SCHED_CAPACITY_SCALE - tmp;
>
>         /* equation [2] */
> -       y *=3D llc_weight;
> +       y *=3D max(llc_weight, 32);
>         do_div(y, SCHED_CAPACITY_SCALE);
> +       y =3D min_t(u64, y, llc_weight);
>         if ((int)y !=3D sd_share->nr_idle_scan)
>                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }
> --
> 2.25.1
>
> [1] https://lore.kernel.org/all/CAKfTPtDVqKyQ491MdUr2RbGmJ9ivofiiX7D7Xd-S=
h2F0NLFmRw@mail.gmail.com/
> > >
> > > --
> > > Thanks and Regards,
> > > Prateek
> > >
