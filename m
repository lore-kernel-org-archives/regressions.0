Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021108.outbound.protection.outlook.com [40.107.167.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F00B4A07
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632236; cv=fail; b=n1afjrf+LzfYfjQGOoBGpxKSoR8SAgpLYgqmORRQ/AqrAWqu9kwWawCMzMaz6Tl9iIRvwucIxuHEzmViWO013fYR/HE4RlQvRPkdXsI0knjb7yDSpiPPpcgKXw2/H9WOQnAN3iaqEJX6UQwU3RbEBRZzgOCVPArcJppj0qoT8i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632236; c=relaxed/simple;
	bh=MJTGpqTU09HL0N3F+S5H+ArGgB+VQxQnyPnfDTw5v34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Emq2YY0sFF7DuK58m5+NfMShUlBgdZRsoozkN9qops6d8wPsByBK/ihf57vfNnzLkNmQdprKfcQYMn4alXJixWVPRlyAApKfqQgveWcyowR+qHRsDaeAhMleDdmSNntlI4bAlzI0z4lXrku+8d72XFlOD8gcLHh/iFgBJhgp9G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=impulsing.ch; spf=pass smtp.mailfrom=impulsing.ch; dkim=pass (2048-bit key) header.d=impulsing.ch header.i=@impulsing.ch header.b=r8IyfJKi; arc=fail smtp.client-ip=40.107.167.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=impulsing.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=impulsing.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=impulsing.ch header.i=@impulsing.ch header.b="r8IyfJKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSAoUVIghVm7qUuY5H/wbdr+aQmxWlPefJ3ZGR+UfKGwGm6XN3TPxkaqmVmKYtnCUDq4Fyks4Zxg1xGlCIwG0FyOYAwuyvRH6s9KAegUv5ev6YBT9K8weTojTSxfrKVfPKaaPxDBaacI5N+jaBuOlf4hGBesAtJnbBHwJ1E5o+jjkapulxt+TfPvTsAyriLpEIl4fwnOaO+6rmt/toQZQkhCitkq1CFqPaePC75k8xvlWBVlJd/3j8Zjimnzn42foPuJYwPaZguGEcDgxLqhpEiuf67U+jMQ2fuM2gFfa7YWZn2FSYAsA/EtAyiP2MjeuAld3zdpijiD4agGBgKJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJTGpqTU09HL0N3F+S5H+ArGgB+VQxQnyPnfDTw5v34=;
 b=aPxOGWvJhcIJCfDTpucX66tW+I9s3p4bY4r8Nrs3v6fA2n27A9KCzCCuT06PzB5b6N8nQIZOIoO7agVGT+CZwuBEz9r3UrYReTAF9c5sWkE0zbmTIuLSHtktp6ZYZyP4Am7qwobispM1jmUx/S/WOeVI8/hGtUgSmW5lmb6/s3C4tEiCWCno+cPB4OYj7jhhIxs1RYrZOK2QSS4zsaEux2j/5mYbte1bPM+PeK6O7nu6Z0PWATaRxftXl2SdEgn3WQ3EyBOEQCS6AnxHci9ZyjPPcNdnrcmP+oySW0Y6VNvpddU6GA3K/Gqyrf9emrslEExu6cwNIGl+qYr8nZPdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=impulsing.ch; dmarc=pass action=none header.from=impulsing.ch;
 dkim=pass header.d=impulsing.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impulsing.ch;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJTGpqTU09HL0N3F+S5H+ArGgB+VQxQnyPnfDTw5v34=;
 b=r8IyfJKixTccfQTtEvqN2XMOvqeOsmLHJE4ARMmFsVj2dwijkwKZxv8QVJfLRkLHuLJtvMLQ0gPssrZvTFjRYQF/z3JsTYizp/v1WuA+jmTWnEdeYtCejsOSCb+GQClxPIbHYJWf1QmJsoc42tZmmlHoU2u8GAH4cVu5O/ic9emXCPrc4jpMHGXDnyr1WYWQcO8LiyHfmxifKOHupIIg8DVP/AVpjploYr4krHfrVv2Ar12Awg0wm5KE94+dQIiPXdl1w1Bsm84MgB4YoeHynLGx8DXsObTGbgl04FsMmjayNx2UAf2TsvvSkZ2+2r2CS+p8PxbCp5oUJQo0IUZcgA==
Received: from ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5c::14)
 by GV1PPF666B94A1D.CHEP278.PROD.OUTLOOK.COM (2603:10a6:718::217) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:50:27 +0000
Received: from ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f17b:bc76:6e1d:fe98]) by ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f17b:bc76:6e1d:fe98%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:50:27 +0000
From: Philippe Schenker <philippe.schenker@impulsing.ch>
To: Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Francesco Dolcini <francesco@dolcini.it>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maxime Ripard
	<mripard@kernel.org>, =?utf-8?B?Sm/Do28gUGF1bG8gR29uw6dhbHZlcw==?=
	<jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, =?utf-8?B?Sm/Do28gUGF1bG8gR29uw6dhbHZlcw==?=
	<joao.goncalves@toradex.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Thread-Topic: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Thread-Index:
 AQHcUndMbK04XlvBvkW7rGsmbYfoxbTwPz8AgAAY9QCABrA6AIABqzwAgAD6BYCAAA2egIAAGKSAgAAR4ICAAA/YAIAABHCAgABUkgCAABRTgIAA/hGA
Date: Thu, 20 Nov 2025 09:50:27 +0000
Message-ID: <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch>
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
		<20251113084950.44a09e8e@bootlin.com>	<20251113091910.GA15538@francesco-nb>
		<DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
		<nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
		<20251119085127.6e3e429e@bootlin.com>
		<gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
		<DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com>
		<20251119111221.GA18602@francesco-nb>
		<593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
		<20251119122443.GA29208@francesco-nb>
		<DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
	 <20251119194023.6239d397@bootlin.com>
In-Reply-To: <20251119194023.6239d397@bootlin.com>
Accept-Language: de-CH, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=impulsing.ch;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR1P278MB1137:EE_|GV1PPF666B94A1D:EE_
x-ms-office365-filtering-correlation-id: cf6678a5-ce9c-4595-9418-08de281a3be0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|4053099003;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHBiQWgrdlVOVjNKck4vaVZzSlRRU3ROM2VIai9DamxIZHZoTm1ZZ3VhYldi?=
 =?utf-8?B?R1VyOUg5VUJ0eERVTUI3NkFzaExGZjlVMG4weEF3eUsrZjIwYmpENlIvK0o4?=
 =?utf-8?B?TnRhdHI1ZUp2Yzd5VlF2VFNBV0ZTUitMQk5vVk5kNG9IWGQ2K2J2MzBCWHdO?=
 =?utf-8?B?aXEyYnNLN08zS0kwcmNVVm10ZnIxWlZjNWsvQitobUd0L29tdUpRSGlnTHBa?=
 =?utf-8?B?YmJFRTQxWU5MakgwTkM2eEphVnJNalRWWFpaS24rZXFJdm1WZ0g0SzhPM1p5?=
 =?utf-8?B?WGZTSGJtM2tuek9FbXpYcVJYVXpJRjlwa0Y3ZGJ2WHY3eEJrYktoN2IvUWZz?=
 =?utf-8?B?Z2wwbHE5bnljUUYzU2x3Vi9xemsxVlJTSDdQWGNmaTNsRFp2MWtxa1Y3LzFD?=
 =?utf-8?B?bmFCNTlpbzNreXFkc09WSmg3NzVFUFBJVzZONnN0RUlBNHZZdU9QelM3cThy?=
 =?utf-8?B?ZG10b1lPcWh0Skd4YlkrQmpMQ25BTDlMOEhVVTJDeGZaWTJuRGIvcDRiRGkw?=
 =?utf-8?B?SzRYd1ZhNm44eTdRRmt3dy83QVJ5WXFsOGRzaVNoaHIvQTVNTVZLanM1alFq?=
 =?utf-8?B?SVpOc1krdU5JQzFmVnB2Z0tLTERSc1QyNUwxZktFdm5QaXVsaXdXNmxYZEtY?=
 =?utf-8?B?R24xR25uN1M3YmUvZHJ6dXVTTVlhMWl6dkhqR0dKbFVsM2d1d1RWazQ4c3BH?=
 =?utf-8?B?THZ2cGlGdlcvS2l0TlpROEgybHdDemtYaXp1aUxGQ2wwNmxDWFhPS2tkdUVz?=
 =?utf-8?B?cUdjWmY1bzgxNTNvcEl1clBPYnBKQyt2UVIrWWsySEN6YU5zcHRZYTRwcy9V?=
 =?utf-8?B?RXVFelE5SjFidEZFRHVFS1NTNGYxREZHQjZiSnY3T05lQzhKZTN0VndFaVlC?=
 =?utf-8?B?RzdsUTQxcllrWERSNVF1d0lOZHdGR2dxOVpTS0VCQmJXQThIbzVhenMrV2k5?=
 =?utf-8?B?eGJRTlhwOC8yc21Rejh0UmY2ZkZVY2pHQ1lEU0tNQWl0MVdPMWE0bUl5Vm5t?=
 =?utf-8?B?b2xoTncrYXVycEI3UzR4WXpPZ21VR2p5eTR4VmorVVNPV3NMZXRaRExhai8v?=
 =?utf-8?B?NS9zQjNSM09OQ0NLTS9ITm41YVU5QTBGTm8vT2RrdE92SG5rbEpiaUJNUzZv?=
 =?utf-8?B?VGp1OVBlQnJLK3JLL0RJUGd4R0pURWNKejNFdTBhdDFWNjYzMXVjT3NtTyt1?=
 =?utf-8?B?bkxFTEgxL3pFOE0vem9nSnEyVGxZU2ZxT3FGSGZRMzFVajFpUWdPOTNibGJ6?=
 =?utf-8?B?bGplcHB2RElYc3pkZXJJN1Eyd3g2RWFFQWk2NXFRSEJ1WERKQlZBV3lxeHV5?=
 =?utf-8?B?UlMycWIzdC9tN3doZ3BhTWkxVkp3TU1BZXcrQ2RkMGpXcTFpdCtRMkNIdHF4?=
 =?utf-8?B?SkdKaEdoUUxQQXZNVzRkUEV4bmRNVVZxWlA4dXJDOGhVcGpCUkpsKy9sZzJG?=
 =?utf-8?B?dkpLd3A5aW1ZbVd1UGZnZGxCMjhPK01SejR4dTdyemUvaVZWU01PUjRFa2Ro?=
 =?utf-8?B?UG81MjZKVWlXRWlDemhvMTZBTExhYUd3WlhFMnhNM1phays4S3pmbmdBdnEx?=
 =?utf-8?B?VndzWU1WRW9iQjI1ZU1YOGtEODc2alJsSEpuSHdUM25yaVVCMXU2VHU2bkp0?=
 =?utf-8?B?Uy9GUlFUS2poekl5NEJEMUlrazlHT1FoTmpkZmlKMHBReXVpU2RRZEg5am5Y?=
 =?utf-8?B?UjNZQ2Q0UHdBU3VxVzV1ZFZNeldLVk80MFBBd3hwMFVDQk5vbTlNL2FLVlRE?=
 =?utf-8?B?em1CMWI2UW5SRk9Xc3R6QUJBMHY2Q0hiRnBLQ1ZyM2JyQTRCYjZzUk9oUE42?=
 =?utf-8?B?Zy93ZEpuNXlONERienpndjRsMmZRNTVkMjZrenROYVhQemUwRk8yNnJaZlNj?=
 =?utf-8?B?VDVSeklKVjRWWG5HZHNVTVd5bElTcmVyZDNsb3l5Z0p2YzBGNVJ3NStOdWRw?=
 =?utf-8?B?S1VJR0Z1cmFSWmp4clhQY0ZlbzNLbTUxVWJ5YThCTHNsUWlWVjFtZVRsblRh?=
 =?utf-8?B?R3hNeTdCSDRSclpJYnJPdjhBSDZSUmRSd1FOK3gycGRwVWJCMFdySGNqSHdk?=
 =?utf-8?Q?NtX6Vq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXJ6cHY4RytLSEpYMW1hS296L3BJdldKS1dQS2hWd3pJL01MaWtxSjROSkc0?=
 =?utf-8?B?dTZIQVAzWHRwU1NKV0RiRS9XZ1UzSEN5TUJXNTFSZW4zbWFzOW8wVUc0UFgy?=
 =?utf-8?B?ODI2aEhhaGNjN0FhVmJjZE4zRVhIdUtlVWZmMnR5SDh0VWQ2RnZoejZiWGpP?=
 =?utf-8?B?dUVrc1pGazZnYjM4N3hSdEpTeWtQYnRMRjNNbDZoSk92NFhXMU1IZ0k5RkVP?=
 =?utf-8?B?NVMrZFROOFlSOXBoa20rdUVDQ0RXSmE1Yk5xRmxZUmdDcCtJaEorS204VERk?=
 =?utf-8?B?NDhsR1lBZTZ4R1QvYzVwL2ZsSVBzQUtDREhybUcySE5tMWZkU25jZmNhWTJT?=
 =?utf-8?B?VDRmTGdBV1p0dklISS8rckNCQzJNa3pHMVJEeHJCdUhvb1BseXFRZnI2NHRl?=
 =?utf-8?B?VUlvK1ZmWkUzZjhYZHVidGFoSWF3SFRNQ3VINm1nTFZJUmpXR01mSllBZmJ0?=
 =?utf-8?B?NUdFaFU3eEl2b0ZTYlFUajVrTzNhNm1pQjY3ZmlqT0Y3NnVyRTViZ3NHa3h3?=
 =?utf-8?B?N0RyTmJKTHdXRElGcDh1MTAwbXhZbnJsYnN2byszZU9JZk9HdTVlSE1vOTlS?=
 =?utf-8?B?K3ZucjMrR3NWKzQ5WFNKSFR5SnBTNGtKTHhJN0VoeUF5NlZ1RThFUTVIQXdR?=
 =?utf-8?B?WjEvdUtXU29BUWt2VXBiTWl3aERKb0xxNW1SRlg0RDVuTmU2VExxZ2VieHUy?=
 =?utf-8?B?V05mcWZ5aHpxTlZjNVNaQ1ZSbERpMWsxcXZUUnFWWVBVOHBJLzBSRU45anZM?=
 =?utf-8?B?cllTQUlab3g3clZWaTh5K01uRTFkY2U1M2l4Y1RjbEROWWJvTTIwdGRzOVhB?=
 =?utf-8?B?d1RSOHA5b2VMSDQ5bUxQMGtjZFlNQ0VRdW43OVJBbzBNZW1mbm45TkJKTGFN?=
 =?utf-8?B?TGhxWjB5bE95SFY2TlFYaEIzRDQ4NTJrL3ZQak1PcnhnRklHb2RHSU1Gd2FR?=
 =?utf-8?B?Y3NBc3hySFVQY3hndDNpUWhtU2R4Z1dmT1Z5NU9UZGNFUGh1SmgyWWVHcUMz?=
 =?utf-8?B?aTY1SVRIWFhJR3RENnRNMkh5SXJFcElJcDhWOGhqYVhwQ2prMlVFMW1VWXZ6?=
 =?utf-8?B?L2FyZXVUQjMxdFFmNWR2OE9CcXRpZ3NGZ3ZLN3kzSmtzWDNXbnJuMGVQcjk0?=
 =?utf-8?B?eTl6VjRUNU4zUkR0U0I5VkE3S1Y2T09PNXZUeUZabVBFeEt0TW9EV05jT1pr?=
 =?utf-8?B?c0hTUVNEMGFWTGxrcTUwdXA1M1plWU1NdDMrWFBaOW9sNVYraGdsb0FLQkRR?=
 =?utf-8?B?VmI5VjYva2RZUEFUdkJyS2FiRDlhMk9VVXNLVTNjbUVtV2RuVHpHMzBpQlNo?=
 =?utf-8?B?Y2U4aW05R2JkRkY2L1VsQml3dTk2bEczTWx2RnVRMDB2SGxIZTdEOVNOdjNQ?=
 =?utf-8?B?b2ZLeDZpaTRIaGNsMnRwMmxJRkNrdE5iM1hIbExzOGI1Uzg3bVNWeFVhMmph?=
 =?utf-8?B?dkR0cU50SlFtQy9NVHJQc0VMTXhKOGplN1RiUFZzTjhuN2RHWjd5RW1KanZF?=
 =?utf-8?B?TGxuekozUnBENWR6N0lWeTA0UVZXT1pVUzhlazVIeGNETXoydm9idlV5VnJC?=
 =?utf-8?B?MXBUWFRlZ05iaHRCTFhJeUpGaFVFMlMvaWgzcGQ4ZVRZbEM3N1VWVHFIMGtV?=
 =?utf-8?B?dndPQ29vb04yQ0dMREI5VS9xQlJyaWsxdEVHT2hRaTdONUpjNDlabldzV0dW?=
 =?utf-8?B?ODF5RzdjbUpISVczc1MxL3pjNHBiRjJZSWFDSEdSWUtHRmk2c0J4KzlhTkhr?=
 =?utf-8?B?dDE4WXgxSG9tOUtrSVJHeWxqWDRvbnQ4Q1hDcUZIL0d3UFZXRnUzWTZXNEpE?=
 =?utf-8?B?VEhjMzJ1TStoRkZaSDJwRlNleU9HV20xSzVwV3hmOUIrN1R0MkJNQjlIRmJT?=
 =?utf-8?B?bUhhMDdXUzZPeThlVDZ4RW4wQ2lJUGY2MVdsZklPc05qK3pOVUgzUzBtZG50?=
 =?utf-8?B?UWR3bTkwQVMvZGI3WnNDbFpGMmhFVURiMVludEgvZ05BQzVXRTNIMnNQR2FS?=
 =?utf-8?B?WEE5R05kMi9VV1k3d3RuZGczTURnQkNLdFN5dGg3UEZ3NkE5KzFabWJkaTl4?=
 =?utf-8?B?R01VR2ZUR1F1ZDdWL3ZIZEZVV1p6NGdYc3JwamRSV0E4NjRrbjBlTCtNUk54?=
 =?utf-8?B?NVhORlhiblBDcE5UbDl6dTI1dE5SYUhmbGJ0c2psQThOL2VPZ2R6eHdTVExP?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-szCbYoUqh7Wz+RUvwIxJ"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: impulsing.ch
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR1P278MB1137.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6678a5-ce9c-4595-9418-08de281a3be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 09:50:27.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86709429-7470-4d0c-bd3c-b912eebdee40
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCbMMO/E3fIC3Yp4qo2XxHBYze+Mnz/kYHtalx7ZU6R4fk1CEh3Ur8TTWRa4JtFymuxF1XTZRvaYjSXhonFXofT0ZzIj1mitP4dMjWBPrlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPF666B94A1D

--=-szCbYoUqh7Wz+RUvwIxJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
> Hi Luca, Francesco, others
>=20
> On Wed, 19 Nov 2025 18:27:38 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>=20
> > Hello,
> >=20
> > On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
> > ...
> > > > I might be mistaken, but I don't think the PLL will work if
> > > > unlocked...
> > > > But maybe the case is that it unlocks and lock again right
> > > > afterwards.=C2=A0=20
> > > > > > Jo=C3=A3o, Francesco, on what hardware do you observe the
> > > > > > problem? Which SoC?
> > > > > > Which encoder, any previous bridges?=C2=A0=20
> > > > >=20
> > > > > Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
> > > > > verdin.dtsi
> > > > >=20
> > > > > There is a DPI to DSI bridge in the module, tc358778, it has
> > > > > a 25MHz
> > > > > reference clock.
> > > > >=20
> > > > > TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
> > > > > Display
> > > > >=20
> > > > > From a preliminary investigation this is a HW limitation, we
> > > > > are not
> > > > > able to generate a "good enough" DSI clock, see
> > > > > tc358768_calc_pll() for=C2=A0=20
> >=20
> > Thanks Francesco for the feedback!
> >=20
> > I'm not sure I completely understand the issue described, but if
> > the TI
> > bridge requires a clock that cannot be provided by the hardware,
> > then this
> > actually looks like "a HW limitation" as you wrote, due to a HW
> > integration
> > limitation/bug/issue/whatever. In case this is confirmed, I think
> > quirks
> > are an appropriate tool to handle HW integration issues.
> >=20
> > > > I haven't studied the docs or done any testing, but I would
> > > > think that
> > > > it doesn't matter for the PLL even if the incoming DSI clock is
> > > > a bit
> > > > off, as long as it's continuous and stable.
> > > >=20
> > > > My first thought was that the DSI is using non-continuous
> > > > clock, but at
> > > > least the driver has code to drop the
> > > > MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
> > > > =C2=A0
> > > > > the actual code implementation of it, I believe that the
> > > > > datasheet is
> > > > > not available without NDA.
> > > > >=20
> > > > > Maybe the ugly hack "works-without-pll" is the way to work?
> > > > > It will
> > > > > require a DT change, but this seems doable.=C2=A0=20
> > > >=20
> > > > Revert is easier than adding new hacky DT properties... At
> > > > least until
> > > > the problem is understood.
> > > > =C2=A0
> > > > > Please note that this is the outcome of a short investigation
> > > > > done
> > > > > yesterday afternoon, so maybe I am overlooking something,
> > > > > unfortunately
> > > > > I do not have the bandwidth to work on it more this week.
> > > > > =C2=A0
> > > > > > Which clock rates?=C2=A0=20
> > > > > 71100000=C2=A0=20
> > > > It would be a good test to try out with a few different
> > > > clocks.=C2=A0=20
> > >=20
> > > 50 MHz works, for example.
> > >=20
> > > It seems that the issue exists when the actual display clock is
> > > different
> > > from the dsi clock. And this can happen for the reason I
> > > explained
> > > before (the DSI clock is computed starting from this 25MHz
> > > reference
> > > clock).=C2=A0=20
> >=20
>=20
> If there is no way to set a correct clock, I agree with Luca a quirk
> should
> be the best solution.
>=20
> For instance, in the dts:
> =C2=A0 ti,pll_may_unlock_quirk;

I followed the discussion only loosely. But I once worked on bringing
up the SN65DSI83 and from what I can remember is that there was a
frequency range of the input clock where the PLL of SN65DSI83 just did
not lock at all.

I couldn't explain what was happening since the clock I fed was within
the limits of the documentation I had.

What I ultimately did was to just choose a clock that works. Given that
experience I'm not sure about adding quirks on TI side.

But anyway I'm not very familiar with the topic and it's a long time
since I worked on it. Just wanted to point out this experience I had,
maybe it helps.

Best Regards,
Philippe

>=20
> In the driver, mask the PLL unlock status bit from monitoring
> (polling
> and irq) if this boolean property is true:
> =C2=A0- Mask IRQ PLL Unlock bit in REG_IRQ_EN when IRQ are enabled
> =C2=A0- Mask IRQ PLL Unlock bit in REG_IRQ_STAT in
> sn65dsi83_handle_errors() to
> =C2=A0=C2=A0 avoid a recover process on PLL unlock.
>=20
> Best regards,
> Herv=C3=A9

--=-szCbYoUqh7Wz+RUvwIxJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNATURE-----=0A=
=0A=
iQHTBAABCgA9FiEEPaCxfVqqNYSPnRhRjRDjR2hoXxoFAmke5DcfHHBoaWxpcHBl=0A=
LnNjaGVua2VyQGltcHVsc2luZy5jaAAKCRCNEONHaGhfGiQBDADL/Tx/Lfedv4WA=0A=
Ya18XLBvAuUH8LkyJ/B/Oi2SjIcpBrP/GZJyZjn+fyK1vEaYV8HUrI4leaBCVzrF=0A=
l6tYd9oTHwM/E41o5zS9jraf+B6Fbha5pu9Nyi6xGvntXFFPatGKGdD03IPvxTzH=0A=
UHg3KsvBLC24HwxsZCvwj6DnMi5gV4eXkNIWfLnbR2jKhq+UwVg0iAVtJjVLlwdt=0A=
pfZvUyZcjMr9cKS35A6Wdm/7dpcVvaE2+MwRVyi//q7RwPFSPiKj6pLeQVgRJFDR=0A=
rZgu0qolvg1HAcVs3vp76hVQLJLPnfVD+Gewff29HIu2zKF70sSGtGho4K8paqkn=0A=
qFZdzia8Xn40teb+a5v2+F1/8z0qUo7rRyNe6cy9VBIsuYLhxKnHG/ESgDPLYJTl=0A=
0w/dD7h6BRB+LJ/hlm669zYdHyq2lVWmNnCiJVf3jPSz0LUpWJ7d2tUFH2PWZAnK=0A=
Gz/2iiVzUtKUtQfo39KNYwO4X6MNcM762gTTIVPtDx/KkjpzGQM=3D=0A=
=3D7Dq+=0A=
-----END PGP SIGNATURE-----=0A=

--=-szCbYoUqh7Wz+RUvwIxJ--
