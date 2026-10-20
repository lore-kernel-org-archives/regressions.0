Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492217;
	b=vsudUo2ZhhIRfoaRJyHOvQu2aF4yHl9wsiTtKi/fu7vOtZpGYuyV7lKbWvUc6ZGzvaAZ
	 w1EtgOnR9wNKS/VEZjZvwQoA7SAvoAjeGN4wJMW69sw+oPsZ6Ex3ahuPUqq9qJpoAQXMj
	 I5zJrzhGCyQ8qcDFUCaE7N1EsL74p9I711jsqOjt8uI9YVCjdCK69vmu/q2XkYXM7Tyvz
	 Lkv8UK93Zv9qQ+CY6/LGSoZcj/I3K9qxZkQtJYgFR0CRfzfOaxk7JTFNbEF7wg76SOc7F
	 sH1PI04fJHtZCE1purVwugTPDio7k8zGIiVLSpkDPKIPFgfJKck1oUvyVpV8XFbknWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492217;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EaYw9OSd4pZZy/XrGF7rS93GV05twuc3u6CtaTihWSI=;
	b=t/NeE3gYs2VdHd4bVqWUNKj08z/QaIWPGdhlI+NCSQFf0+51N9hTuSDoN75H2oSuDjbe
	 AKcfdXqGaDIkbnwmTsinBoHj5UQXxPKaLMv6zimdQkooQAfaAGShRuuwMP7X1/wipf6fm
	 P7/z1o9XwAkKJQraLiXn+OB9low7TWFnHlBFl7s/FvG0ugahzkdnWB7Vk/f+wD8g5up2F
	 l98BVbxINQFWjIssOB+SxwItTSRcEQeEgSLCUkUHdz0bgSRlPyfUiXnPWZOS/PYyYFHvH
	 3STz2sI+dNfVu4BMYQhzhPycZ2gIZdZoJyUUKBcYBTL3AsyrBGB+C5cao6CbtKYveYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PoVlBXVi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.9
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDD606A328;
	Tue, 20 Oct 2026 10:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EDD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PoVlBXVi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsTBWOMh2xRfXX0Fo8R8FSILTpS3fugSwJklb2qP92J298L0lBnS1Iz0E2gWnD07RIBJs5XYE1PVOEdQGUI9DNckLqnsMc4Os1AY8wBPmVBgywCN5zbwuCBDkQQvYGnXuc0kyu34TI54SSlmzt/S12CFo0z5zwh0IgV1RNjCmLe1NC85O4+PayAIn6JjPiuiP7RnG+f6ujFf/tuujnL3+VGz5Kd4JdimZs4+tzK3TwmP9p8LmdfgL0xNcuirq8WhGRhPU72E0ZVPEEUOJSQLMcK1ZpEwbnwo/btaRgx5LSelo9TdkD1r60sD8dCDbLie83cfomd/0kdgCjInQxadpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaYw9OSd4pZZy/XrGF7rS93GV05twuc3u6CtaTihWSI=;
 b=fs+eiQF96WuVcVVap2gCG+LahGY6QDYxJ4Rsug++xSik1u/cB34+N/sqUf0IMtgZQlhEsipZbmJYmGESeX6pVs/IEvw6YeHlynb7DLgek0rMs4sy8VVlFFtMn0mkmIwaLkJkK+6EEbitYZArue3Bz/NBPfLyxdXHo9SoewTr488OEx59nhLFGOv6rny2yWTslQVXkn3yN7DBxGoL5OPHqS3Y+chjKl5oxkhK77dWG0JfeYOPgWgmacJa+NqVIbDyYelfSLYDea6362ysjGuBxdraNrqPJvvlJgWyH4z7nfY6SOnXw447HjcdctM6LyjMdh5v0uqJegcGtzCDm8djoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaYw9OSd4pZZy/XrGF7rS93GV05twuc3u6CtaTihWSI=;
 b=PoVlBXViGqwglpfiFHe5CJeKrtfrpu0RpzSqCIUq4IGIXYCVE1udQzA6CG2lFf+4EhX9wNMX83fcJ2E+aUI+piL4t2Ur3H83EFYxusCEMQXKeAwIYYhun4SwHYYmA7LkdKf6aOmDgHw5H+ElZfnCaEHM08ulcjDKJN9aF/pbOPU6ymBHp/RlonfoRAJzD51AHHcYbyxd7h0481+uKc8GrSy5M85pyj2AsuKnj1Z+l0F/OOsxVs657SbO3BLHECUEmiNk4eC0GnXALuOeKVvIcQhRgzAEOfkjnYcLIfxnPZEBdSBCJk/rwoCZ/N32FBo/KyltoJq4wU+hoM6pUkH6RQ==
Received: from AMBPR04MB484752.eurprd04.prod.outlook.com
 (2603:10a6:20b:7da::11) by AS8PR04MB7736.eurprd04.prod.outlook.com
 (2603:10a6:20b:2af::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 10:30:14 +0000
Received: from AMBPR04MB484752.eurprd04.prod.outlook.com
 ([fe80::47e:af5a:c2c:93bb]) by AMBPR04MB484752.eurprd04.prod.outlook.com
 ([fe80::47e:af5a:c2c:93bb%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 10:30:14 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Frank Li <frank.li@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Lucas Stach
	<l.stach@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Potential problems for DT-described PCIe nodes on
 i.MX
Thread-Topic: [REGRESSION] Potential problems for DT-described PCIe nodes on
 i.MX
Thread-Index: AQHdYHWdGFNcUmvO90+txsav+NGSFrcGOi8A
Date: Tue, 20 Oct 2026 10:30:14 +0000
Message-ID:
 <AMBPR04MB4847528E0F026D1CB38E88AE0492672@AMBPR04MB484752.eurprd04.prod.outlook.com>
References: <171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de>
In-Reply-To: <171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-20T10:27:05.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB484752:EE_|AS8PR04MB7736:EE_
x-ms-office365-filtering-correlation-id: f6e95164-c07b-459d-1946-08df2e9520c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|38070700021|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Mww5ciGrOMimrENLgFcCkfym9+o/SjqMgMgmFn0JRSYdpA/i6CFPTb8MevDYFQpG0fkl7awZ9d92hLrcnjH3oSU98XOaVqql9yN/6PXmdtoj5aIdT4L9dCy4cMyFhqsIvz8CrKi2N4mqPoM9HdEfbI5bI9O1UiDEosXj5fuSpyVkHGqaieAmXrLVbVD+pr7MxenvjrG1q+J4XHxFBZa/oGawp87kmgMCb8O5vvMtDpsESyx7gXNKMhzrCWEdiKD3xNbSrxvZuPo6JrLKYwpjBEPqRKwEG6UWb4PIxklz2NIGKTjZ7Lvzve32GJ7TMZXKqEGzli8wkC29L2pdZbPdkV5m+p6hy1VBwFzsp0lySctPbUyxxafl1nUpAHByJ3eIjCpC94pUOn98zFOa+97hyPNg1+uiqjGp71UWOud+u3dTfK0lE6salrAZNcL5qHDgxH1nMy4UauIc/keG/Nb4dfXPItm9FY3GayvAeUSf1P0xi/j4LjafOEoMg2iqeVbHL7LAV2Ih+UrJTn3CgS0lBNKgcLZeLdKy2Y1YvlxOCJ+cTlm5lk/EuusJPs+RtBur7WICiah+rV2J6EhwtCXJPj85sSg4NfqIOXql7JoXBY8iouV1XN9k3NobPLTeW/zNE2EoDqjvyr8gXRlPxK3y/rYcH4IcA+TzrJU4koZvbUVxM3furSdv5Uztcf3gxT53BNcxjXa0LBSLB4VHk05z0y/s0X1/0L9syYi5d12iNcY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB484752.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PhoTXH7uJq10RW9AKPtnqWrTm1f3vjLIs36b6EggmJfKOfXAk4lugs2tMRk6?=
 =?us-ascii?Q?IC/0eyH8ltj1D4H3ygUaf2X5e3+4Rl9soFA6kxJou6thconM+tRyvs6YPquc?=
 =?us-ascii?Q?M6PH6q7T/CJIlofrLdCKp4AxbzA7Lv8JbdFBmQfpPJk+dDq8S+bV0ZU2qqnZ?=
 =?us-ascii?Q?ZLxKTW8fki/0dB5mv2wfgtRNID9W714RAqenRDmY3exRY7GX9pCvaxVNYl48?=
 =?us-ascii?Q?/N6t3IrPBUKHBfRabTQ4t1tWHjJ6eyx08/1ZtShGOrjc1HOKwbCXedyI8PtF?=
 =?us-ascii?Q?Y7w7StvchOWFJz+dXbywjv02XX9lZFA4J0/MIFK7J7LPLTDd4zt9U8Dk6zkA?=
 =?us-ascii?Q?sHtnBnx8+o1blTUaHBoSaSONcgCGOYO0+19NAfa/ibTOb3kdhayoeE8DyePX?=
 =?us-ascii?Q?I16xcqWSHOJKu+dItH8MSkWCytlIUuIk5NYrG0eyf2T+POwZ0X18JCdagn71?=
 =?us-ascii?Q?aMdZZDfzB5E7JMUXmGwLR0TpKw0uBC+HKtuA2/vElaZakskqggAmPSi7u6yM?=
 =?us-ascii?Q?QkoN4fBuYGvqqyz3Svl5VSIOHYHuq7mt4+hl5XzrLyNevkT1MGYLjL3is9nC?=
 =?us-ascii?Q?oYf7zKwNn7JlHgBzlsvqTkrV6HAh8aYcs6swBfxlYtSm/oQ5s5zWU8dkKN7m?=
 =?us-ascii?Q?QmVw3MTA9ZVheKjScQ57S11Zn/xZ5Wuo7SrKG18qSGaj+BYGGA1DIZ2KkKHh?=
 =?us-ascii?Q?B5LWqq1giq/k8aZYjpl3lbbsO8OGHUcco3sVQFKBv4uGrWhbWISk8Qd4iCgr?=
 =?us-ascii?Q?TBVZEqM/3v0o+V3Q03hzF6/LaxSaztg1b2VzOdzfgcRv1k5r38bNeheb15dX?=
 =?us-ascii?Q?XOk/LfXJhNIuqf9oIPqOstexcbZ9GVl2t37bt4feXGaE5vfEuWZAXa0IRLMG?=
 =?us-ascii?Q?qyVN1Gc++LzqZWnKVXE5zvZfJ9VmlOl8L41RY9hqn32b64WcP6t4RCRlGIVT?=
 =?us-ascii?Q?tzUPiYHxyRoObLwHqe9wpYdr5mUgI7AASUoWvTQ511+Thok/P1gv5fhqEpYV?=
 =?us-ascii?Q?FlA5nDAPIE2tlQIHTfyRKMmvxxSLwhAtXjfhwStoSqH12N94pL010bJ2egWt?=
 =?us-ascii?Q?q3rbcfqSXLp7Nrje6yzupQYQAO2xSlnV07M+2eydIELNW453d7sakXSkNS2X?=
 =?us-ascii?Q?V8vDUR+xw7LVEk9mr1kCQ3G1GC6NQJ5eyoyLZzDhV2HtMb4yp2svbswmH4w+?=
 =?us-ascii?Q?1IL5IdNEsNcYaU8BDuuKFA7aa81XrXaDmrdFoYzyx7igQYr7XwucqxJ/bCrT?=
 =?us-ascii?Q?9/nNx4L8TWS9u2bn+cs/H8esLA3d/Y5Uz8NcfPHHrRc1hLSYhQF6seEPeoIC?=
 =?us-ascii?Q?rZeP2AYtms9a+mynd6SAcXdqF+B1wpoQwuvdlaa+EjrTwWd6NzJS5krKUVNe?=
 =?us-ascii?Q?PSLe2ase9budl8edbcY07B1i44v01J5enUvW7YlnCpQNHXMw3l2o08ac0MOZ?=
 =?us-ascii?Q?x/nLnbcW1oGg35N3Or9ifsB4oGktTPQs2HeBxmTVKnKbCCGrQsGWpLDmTwkX?=
 =?us-ascii?Q?z/aqlko0RsI9Ji+wGBURN1rqPrBCsxKnyeXGcDFWViTXv2NhuVmogS18Ia9N?=
 =?us-ascii?Q?Tf68yGeDjxmMYZwoYI3ZXHth0Myu9+BP7rj7gW7RbbNRcpUfcvxP2X9L1UY3?=
 =?us-ascii?Q?r9Qarc6V1bR/yhCvdX1gvg33Gm6Xam9sZuFwFYJZNjDQq9Ctk1LHc97WouJ0?=
 =?us-ascii?Q?A2x4PcI9AYGz6K5nX1NRx8c/mM7igqhQJTS6/l9l/PXuXyjS?=
Content-Type: text/plain; charset="us-ascii"
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB484752.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e95164-c07b-459d-1946-08df2e9520c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 10:30:14.4301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJC9EKoPHD4LiG92+3G7IWznK35ty2eRuF28KPYHYca0MmxQFvM0LWPE7HRkCAArfdaS4j0wxescfGXRnzne7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

> Subject: [REGRESSION] Potential problems for DT-described PCIe nodes on
> i.MX
>
> Hi,
>
> Linux commits:
>
> 9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST
> property") 37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and
> PERST property") 396fbe9a028d ("arm64: dts: imx8mp: Add Root Port node
> and PERST property")
>
> Both in v7.2-rc1 introduce potential regressions for i.MX boards that alr=
eady
> described a root port under a different node name, e.g.:
>
> host@0:   ZII RDU2
> root@0,0: GE Boards
> pcie@0,0: Gateworks boards
> root@0,0: SolidRun Hummingboard
>
> All these nodes may become stale now as the SoC DTSI have introduced thei=
r
> own pcie@0.
>
> At least on the ZII board, barebox fixes up a MAC address into the DT nod=
e,
> which is no longer used if the kernel decides to use the newly added
> duplicate pcie@0 node instead.
>
> Fix is probably merging the existing properties and child nodes to be und=
er
> the new &pcie_port0/&pcie0_port0 and drop the board-level Root Port node.
>

Hi Ahmad, thanks for the report.
Agree for the fix plan -- merge the existing properties and child nodes to =
the new pcie_port0.
I will send a patch set to fix above impacted dts/dtsi files.

Best Regards
Sherry


NXP Confidential
