Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793671248;
	b=fQ/R1tuxB9xwKHg70UIKVL7vRMDBzmRgDz03/4wugXRszKVn8LuYsaHXCSMgdgKFXkn2
	 vAspBb+Pf+pXEtD2mElggQzXEhMq3V4Y32Uoj4t3V/Sn4lJXZuztlFvmkHriC1rTsTKNL
	 of/o5npSfoRLKIkawINopJSJGxjhc8L/A51o/gQaOF/0dd26CECB0vp+RG8MMT89MV+z9
	 scKO9ioZ217TYHW+RZnTnWoD8DVGUMD8y0JU/M143hC5mQtphyrpdudwPdMTIXSz7V+uE
	 OHQ0b0vVDQitpOB6SD4MvdKUhGP3EQeaOFswJ966pO97iZXzaD3LPSIy+zPRagZkmeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uyajW0/ADOBEwf3sBdzSWL2oXd7mEs6A1OiyChjI4gw=;
	b=Tmq7hLLubcXw5VXbbEKvXmWLUw7X0CUw/4hY5LdNDFu2DnXYU6QtSS/jJ1/KRIh8GHV/
	 iVxVBcEQGZLWrMkZDQfCcLlsSCvgMfJucudq0ctOvRXPYHLXg62oS6PnrAeWgwyeVaMb3
	 fS0Vc55i/yYdsR3X123WDEgtONHTUqK1C2WfrfMlP3xqCsUGeYRMr+mpgi7pGoJTWIFO8
	 ZlggNjvZm2CSx64CaYHOl47CfNRvpB7gMitC4vwtnyObthVscLqsLzJmApcC3cbilbjIH
	 NR+ASfGiWThzzCG6sbdkxvknKT5SwxAU5Nq3sakeJvypNmscSnvUa0UiY+5rCLEPNTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iGFyUKF2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.40
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F4606A326;
	Tue,  3 Nov 2026 02:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iGFyUKF2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmE2WWbYobGBmvv9gefPCRwjfJsOF468h/hFo7li1gBHA0EXIBfyiNDTaWn+c7EYqjsiC4o1hJcUXypUnu3RYfu4ad4rchCPkeFO5vYUov17vAjdcI2PbKTOkHD8x2KJt/6TCg4mYhQHmnXmOrtsNhB/21t1VvDgRxjR3v59OZLuW2BmmdBhWEVNtmU71dWE4za5TSy4f+7X1KLa+iywY6asK9CuuuamT5/Hl2DU49zpKvFmdcGMUnUYFk+un2eZFwSes2lH9Ee2O3LbRwxHaI9bE4QukIpNnLmPVxhH6lV+bZ7lLbgDJBgzIPYjJtSwOL5MKgdBNdTuAMMSumbnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyajW0/ADOBEwf3sBdzSWL2oXd7mEs6A1OiyChjI4gw=;
 b=aYdAodRPwqOmeUfojKkXDJpr+/lyShx/kyPT+pz/t68zazOCkLQlnypSK6i5/TdEEgkzQm2XTNRg0xiAruvjYseB0227Flpa780UxstDFqgrANV5uFXaAqarFSUqP/un7Dq4gaqcor296y46XUMtvgDxDFa+3+cEZy9WynkJBk3ViAaRDTGQL7j6uVwrTsJ9GPwDT4VcyIJmBmTPIhxI9s0NL6v0dcVnbP0GZMbDl/kOBHgqh6cgk0LcUyM86hqdMcEOxJ5SFuvAWpd3Ey1DqKyThdoa4c1gy74VISPMhCYDJQQsd2UXLp9kN7lDMedpnd+sq4T33e/cEfwYbosqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyajW0/ADOBEwf3sBdzSWL2oXd7mEs6A1OiyChjI4gw=;
 b=iGFyUKF29K0DZ+Lr6hqe/eqUSQJECWAsfmYzJgupDRUucbN4PkgJuVnM29q3d9IapXdAc8fV1We4viyjhAilvVOE6hMSdu3kqLcb9Iea9MyZNFMIZfeWVd52rsx4BYUsQdM75QijQPT8Qijxze2g3TH6Xu0Fbt1aGC1YlW9Zbr1JgMk6GV4bqW24Rkr4XqmHRh/pROKP/YXtCx/K4MdsBQeRDC7yT0OetmezSwYsGdhn4PEQQq7NdVYpNVIUwFCrfeihndp8DyKrXihvH90snkcwnwnCsU1pN68YFXu1vCPoKRXs5WoVoMgbN1Rlu9yr+5YRmY0qO8iudWbh4x/Pug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:00:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:00:42 +0000
Date: Tue, 3 Nov 2026 10:05:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
Message-ID: <aulBazOZ1pL5XgnF@shlinux89>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
 <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
X-ClientProxiedBy: MA5PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 0190d006-bebb-4f9c-3d7b-08df394e43fd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|7416014|1800799024|376014|10067099003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	vO6Gkbn5tKsIswxBsUEg3lEQbdKhkDZWe8TFE7zkSA63psaH+jSnSF4ZYalOS/S/G63ti7Spx4cRGHIw/Yp+xnXUcUN4mRZVwuU2Ri6MHfDC0VzIbZAENNEfwx7h9EZqgQWzpucGxGW7/aevKJz514nhyItIKtl+2c1snKrfMbyeqpmpdALmKE0M/tU2deOFIYDPW89BlKXIRG/z8UhnHwA2shY2jO/q+T3vGsFAB+qi4XerEC2lBLomHxfvL50vD/2iBVF8YOkVRsUbq4+tQ/eIsuxifVHaYJdUUPhxTaySY5/L+ALxS+IfUYzwa20ALi8qSfDBdNC84ioHrZzcYGEezeoTMb9JhREh/oLP4j/PkCO9fo2Il6z3W95eYEKpIChyo2o/rX8gs2l/M5Q0kZDlsKyJ5ODdbVfSFxvcZe908YOGMabrXW23ToynfWI4kqvSKHsstNT7Ko2CegWOdLrwD04DhL+QH6DUDIbA+M8yzCjcyYo0b8sM6FpAnLmKSqWzSRvLxekh3jRhHvfz4QBYqqoICjLSgpnC52vfILCgBSo+UXzfziUDPPfmzQHBLhQSMgtddLyx+SbbO/2KZcu7QdyPa+itc7W/04q1AUzdrgzIk2SkbnLxhK/YMwQOztUTcEFXI/6ri3+IvhqTGgUozf8Evzj4E1wqgqWbb/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(7416014)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uMyJT7npGuEO8JrPHsbjppAWRAtpQgq/7QbbKcda8vJseWX+sgKwgCtP4Y0O?=
 =?us-ascii?Q?1JS+Ap1R+puLfLDIBa10rgUJzINOhwr/nDwBT0x1dxZh3h0Qbkqm5vyWFSbb?=
 =?us-ascii?Q?l2yPOzz4Ep67dd150zqRG/2maajsEu7wKKzwZlcz+UwKxHqYhcWRsuB+0zQc?=
 =?us-ascii?Q?AYa990uqqyX04dfDd1+4ny6pe49tnUAj4RXtjf+zBnQe20Qh2+McfKWf7zkq?=
 =?us-ascii?Q?l5FvNOXhr+xGQI3bZ7Tx53CqAqNNFKk3ZRqBmWKcnkGaka2TQgjQNQFsmXON?=
 =?us-ascii?Q?spDTtDDaJ9tTAapKWlknCy7ubFon7MGIAKmtG6cKd+G1btYyu0Je7KWdnJuc?=
 =?us-ascii?Q?/+2zLShys0w/+MQfQvW46V6uVV3vPjGI/H5EPh08D1+qL59FnTtO6VJbKxq5?=
 =?us-ascii?Q?+THJVn26M5lAeGa8M15D3Fzj6Chxiwr/GlFXs/i3TVR8xG6HIiqxi557sWE6?=
 =?us-ascii?Q?r7w9ej5lYM1NnrvAhWW5x+tvrPcwQo6OISxC04jrcRoZUfnQthXK0dT1AU88?=
 =?us-ascii?Q?2A2mm525E7t0GyAlTgQ1qp4zB2DqWarg8REqAOsIy7NSrSmQkVdQJoePpwTE?=
 =?us-ascii?Q?8XsRPjYvF5EJ/GO7AmHiIVfVccSi1TZYCGEhENWzqocmNg+N6hHS/BbJi9Mb?=
 =?us-ascii?Q?ZUDsyrDO3pNU3apAkdgvaNBrM1eAcDFKuZ1UHrp2bBR24VfaKMuPw2pVN5iA?=
 =?us-ascii?Q?k3sm5IUxDa6rlz2eC07K4C/TKu8Au02uSgRtOcd9Cbmm1FjzCFZgV+7Tr34m?=
 =?us-ascii?Q?TtlfMuASIDl5T1UmsXYB6iqw+9KXKZ5dYvuxEWBA6BPUN4iFAUJtup0VoHDy?=
 =?us-ascii?Q?jLwkhd9dn+YVuQxpMPEGyt1k1/MDNqk4UrHVBhpf2tVEMEqC3op5xC7lDYfv?=
 =?us-ascii?Q?HJ6Qja6jstGq/d9W47Ux5OnHGrZjLqtf+xEFBKPMdC7HvIfL2SsiYiDTiF/H?=
 =?us-ascii?Q?0bw8q/an+hXLowAb6c/f6glGBg95M0/xQOV39yasyCnvr/n0Ew5/e3B+7Uow?=
 =?us-ascii?Q?Jgzw1fIyMOMEu6FBI/F5rO4s/VUfZvdClwZPOJkwq+a9nC/PHin4t9vQj7n3?=
 =?us-ascii?Q?tTqf8JI8tQRDReVwUISC0BehvyT9b14Is+H+qCmm1RrF0mnuBFPGWDGWnZQ3?=
 =?us-ascii?Q?kG33ArKJzSBpvfPkssEOx+gQQ/35pH6n5tJogGZmd+uL9mlQ0AKIgEiJ/Z5r?=
 =?us-ascii?Q?MCWkE2b9G9sZWbhaC2TbDTBR0xBiDQ//St9cTXXoxCj4dRohraQmGupImlsy?=
 =?us-ascii?Q?1EJLl7QuV+VMx62TKdXpJ0gdsGs0WS8YjCi5Z9PJUxunREiCRr4Rg7EWmZYy?=
 =?us-ascii?Q?uE1IdRanoS/D0LTLK/W/puIoAV/8sFchzA+EvJnodWS5/2RJURrJeFpZGFJI?=
 =?us-ascii?Q?ms8ELCIq0OrlZBbRzhRG7jONbmKkeyw2OWLpwhERqgOSLjVnWgl7fO48YlcU?=
 =?us-ascii?Q?bHb3F4u6FSf26diZjmDz+c7Hpru+yfapYqtuB1P3RZ8lnaVv7R2pob15maRV?=
 =?us-ascii?Q?Bi7KosJ1Uwd68yh+9+g3SFo9MXGWQSlMwedJrOfphmwrVSyF9Qbe6Yni2624?=
 =?us-ascii?Q?X3VFc8HH5HyjrJCxqRRdnmkbSBufpx/Cb8E4uJ1kNsK2gz9Y2P5K3hIq+e3c?=
 =?us-ascii?Q?m7YaaFxSrnJZ7IWm3CdoymEASNP86ab5ktpe63kDDSiRM8hUNHPMzVowKI6x?=
 =?us-ascii?Q?VYWTLuHZCeXP+NnOgxCSdtY1NFmZQ7bcNcOH+pta/Ut5CmyY3Z4JQRnyrKn7?=
 =?us-ascii?Q?UqZf4RjjuOpDj1e+Shm8cPppFUPitezB9snetu/rkE2f/kU3ZL7h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0190d006-bebb-4f9c-3d7b-08df394e43fd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:00:42.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLRN6NoNd4XjkU5fHMPoFmG6HNlgGk4lqaiXrTpy8jl2VFU1LizMacPfZlIiyob0l0zgE5Ik8CU8MnkZDzAP3LT8XQEAt2iPk7sMim9kkwEfSGV9YQXCTPAcOnTP7U/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960

On Fri, Oct 30, 2026 at 12:09:35PM -0500, Frank Li wrote:
>On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>> > Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>> >
>> > Thank you report this problem. Suppose below patch should fix this problem.
>> >
>> > I have not time to test it today.
>> >
>> >
>> > Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
>
>Finially, it is hack at uboot.
>
>592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
>601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
>618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
>620:                                          "power-domains", ...
>578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
>681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
>848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
>
>
>Need combine power-domains with iommus.

StreamID is not default programmed, so we did that in U-Boot.
If not do that in U-Boot, we may need to find a place to configure streamID
in kernel.

Regards
Peng

>
>diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
>index 176e2e332f87c..cc2b9a212780f 100644
>--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
>@@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                        phys = <&usb3_phy>;
>                        phy-names = "cdns3,usb3-phy";
>                        cdns,on-chip-buff-size = /bits/ 16 <18>;
>+                       power-domains = <&pd IMX_SC_R_USB_2>;
>                        status = "disabled";
>                };
>        };
>
>Frank
>
>>
>> Emanuele
