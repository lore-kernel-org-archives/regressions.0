Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011039.outbound.protection.outlook.com [52.103.38.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D720DD51
	for <regressions@lists.linux.dev>; Sat, 22 Nov 2025 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763830428; cv=fail; b=Jhmn9p2i4TcWsyBm+sKw+1Im+l8M2kGwSin0dt7ASFTA11TASmEPrWCJiSglvm5lwdPfnmtEFWEvOoEj6uSiplON1AvpI1jY/rB6qxt+CHDvWiH5cP1Ayf2ahi/CbMcmHNYKVY2NmnieRswVV87juBaBlz7jikspKp+XtE6/ov8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763830428; c=relaxed/simple;
	bh=UniMayHs8AwAgdOqOVbkChGdYFbb5WDv70oBAVb943w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qK1CUbs8eeLLtitx2fWYoN74A+45d8Bjy35PCNOv7N5DSCg0CvriySrZNLvUcvNAs9jyC4F0wHNcQmwfWPocDUi9J0mcDbDiNTPeLJcWkH4J/yI8TvRCJ9WRXmV1fBnEpXpeCKaYwrlJxXWpCE9oA3OGv0DnOHrU6ksgNtEb3Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=sz+pkzPn; arc=fail smtp.client-ip=52.103.38.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="sz+pkzPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KksScm2BtHEkGbgzhVAA4JwDKXf4ri7l7wkXxkzXMzmuzmQJmGZ429LketPsNxAEcPRG92Z7kEbPx5eXmvzF+Dzj0hsGCtxNgdXTWIVmsOGTRVV9AT10ADkZy9qm+dFjS3/elAubVhTcUmZWQu0m4YCgJPyTo3nw40eWGSE2Uz9su8HT/D/eb41Xvy8KVgB3TwlD+JxXjhykZ0yfJqt2po3LdkdPL7yXModlmhqLQC+dBaweTEN0w5oejtIHpWbizJ1E95plIT7m3rk2rk5c8SkkopQQouLsrwK7vc6hYtdYG5x1KUU2DLkC7GAEcJtAUGvmAGQKjUJW5g1ZQpeNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UniMayHs8AwAgdOqOVbkChGdYFbb5WDv70oBAVb943w=;
 b=tHw2w42zxI/WSvzd/b06qcBkiQ+/W28u82nLv6gTBS3dDRV4W/5BvA7vzq510zpotsnDjTHUNY6VpsBrcspzQVfy+89LFYfTs8h5YHq0LUbi4D0he/PLJIOaqM6jpXVnBkh/3AjlXuJwm3XBnwPLhTLwj4jAAre0frMK/svTAiy6ZSikcj2AxDmUI/6T7a33jZx6vKp6RX8w32WPcwHhc2OdGG9sKaqgTkdsUsMB3XZDMZQW6U1Ei2H+LJK0dXTJ/OHfpzoRxG2/FomZWTnSTTBUxa/wMw8lBxJJlOR2mkiuDhsbHi5O4L9cbHqzh0sbTsa5wokz6G/6kv3EsWUzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UniMayHs8AwAgdOqOVbkChGdYFbb5WDv70oBAVb943w=;
 b=sz+pkzPnWYAFR9Bxtmn5tgLijrxYjwqDGkRncOVwb7OsW9sACnvieGevsRWfZRV9npqUauCwOxDtNrBngJbWBA58hn3oyAb9Zbzs6w73zmp3MX7pIYrJY3lA75aTZ26ybHIMnkqgE7mCGJE6TKXxbaGDLP10cNdnwlJTFEypSbaRFouYMapWGErnccMq46xELl0tj7gLixj2Wr9mbeM6cOvENh8BT1KJyVYJRi4It1FVBUlQj0Jos6eTm59WAgwfavy3jaNRVmZZvG3GXgoZznqHWfwL2vTSA3gUbNZXFkp8xw8O50gPjm7Teo4amu2OzydV/y6NCi0SU7XfE0v70A==
Received: from LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:447::14)
 by LO7P302MB2349.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:461::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 16:53:44 +0000
Received: from LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM
 ([fe80::404f:b5ed:5fe9:9a75]) by LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM
 ([fe80::404f:b5ed:5fe9:9a75%4]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 16:53:44 +0000
From: Dave Morgan <d_a_morgan@hotmail.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Regression in how user space handles the Widevine Content Decryption
 Module (firefox and maybe others)
Thread-Topic: Regression in how user space handles the Widevine Content
 Decryption Module (firefox and maybe others)
Thread-Index: AQHcW9BzpDtT6mOpekWXkaihzHmtdQ==
Date: Sat, 22 Nov 2025 16:53:44 +0000
Message-ID:
 <LOBP302MB229140293C531C0E0A93E20CD2D2A@LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOBP302MB2291:EE_|LO7P302MB2349:EE_
x-ms-office365-filtering-correlation-id: 55a8e3a1-02c4-443c-bb5e-08de29e7b27f
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|31061999003|461199028|8062599012|15030799006|15080799012|8060799015|19110799012|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PK7pkosspkJJMvb1EFPgYnrrQDXA+03bUgkm2G5068gR7PPYYRNWYaSBln?=
 =?iso-8859-1?Q?EhGkBzksGh4PCPkbwTyXDnk3FFz9SCQAHuWIviPyq6PoDlsKNj9sshugc8?=
 =?iso-8859-1?Q?TbPbz/mFwOhc1HkoMIhUpbZgH/4flepkoVchPcCTSEcbJjiw+gH9uP69yl?=
 =?iso-8859-1?Q?sU4l6JM4rTax2K2M0VunUq5FRgwGIr1kQtAct8E38KebWTFwv85mK/S70+?=
 =?iso-8859-1?Q?2Mypc98jBDvwuTvmRARlNTKpz4xYMHv8KMJXR9YFuPQjKZG+JA1fhqcw8f?=
 =?iso-8859-1?Q?aqCEiKrw+sFpRcF001mxS/5gNMyI6QMbSCsJOwRM+JDh6AHPU9f9ZbXDf6?=
 =?iso-8859-1?Q?Wnf4bvvy2azrSQFFY4lfXvipdvpnCFz4Ajdzo86S2q4SzeKoramB92wrBH?=
 =?iso-8859-1?Q?mBtNx+CWEm7LDQz2fLkbBQP/0U8mtKwN0C7tuj/FNg/ZW7hEdrMsNXb78R?=
 =?iso-8859-1?Q?okVKx4l/g1/9qcb0yBxq5vu2CjwCjuM3BqZXaITAlpHWMDPZ5R/pgfEbBb?=
 =?iso-8859-1?Q?9Wq77DzUBUWoRmShpSAIhyV/2gqj6eGja/l7QKUfJd7xJ7gUr0rctClK/8?=
 =?iso-8859-1?Q?avsYW0pXa5yqG//8e/8vSMECQxd3TX8zeqKFBHwlKjNhz1AaQT/fqZtxnt?=
 =?iso-8859-1?Q?CUhTGy9sHDBVLkQqs6yt40XuN9+oa0SKH68zCijgIdoixuSJX3ST2+On0g?=
 =?iso-8859-1?Q?Ymo9RR6d0u7cCmPKDMb4U4pKYNjDGDzyYl5FnTju/hfPi1FaPkeOT/yAUE?=
 =?iso-8859-1?Q?RRGjobfYcCT9Z8vQWnkg9DDLwMTRpN/6VcQzSr7EifVF2Jee7PLlemCtOH?=
 =?iso-8859-1?Q?CjTwDAsBhU/U3MiMC2RNIYJzgk87rpxP2J0WBVnuDhjN36W/peRq3bNw3Z?=
 =?iso-8859-1?Q?MZ2YKoDGG1ih4/6DJWxNGZcxN2oKQhSdSlPGjbYX4RpUX3D89aI699Zana?=
 =?iso-8859-1?Q?T5L7QfRhTCxx/fVeTPe93Zbc1SaMLA24baQHLQ4C8UQFic/RkED2yGmShG?=
 =?iso-8859-1?Q?mlvd+BL3wH/Sj1wBYPGAC1X2IARD2d33yHkIlkjgYRImABKBwgHbVNOaWW?=
 =?iso-8859-1?Q?dih+xa7aLJ8JKkcEAw1NfaM7dS8SlH0Me4Dm2qevbfZ1ntPhZkeZy2KACU?=
 =?iso-8859-1?Q?Tl749OqUIrLbt4AJ5cNROzjEe7ldbgTMGvYfgSdWdEar8nm5p7Y3xZqydv?=
 =?iso-8859-1?Q?IQ3OM/ryGmLS8mhgGX/XMbeZeRD5dEtlY/59nNyGGfmB9vT1vZz6jGTMUE?=
 =?iso-8859-1?Q?wR11PMyDx9pvuFD53UsQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9uSPS3XKFq5wdJMLOVeuFXLn0sF0ZJTzCXFZnmGCoq5Z89k89+9e90j6jm?=
 =?iso-8859-1?Q?prpAFoemWcO2Wuc0Y/QQpQ84tePEWMfuG8idll28nEuFhoT7xd5wqUdsiM?=
 =?iso-8859-1?Q?u6YT3EV4Y9bYmOy9Ep2XfdKlpQUmw1TIHBPVsDeZHN5ArV9X6/Tkh/ukzF?=
 =?iso-8859-1?Q?p4WxS/e6xpHR/G2vxzVkKjIGegeTXCdOzS7DjzBXabBVuAbMBMhdR5HMD8?=
 =?iso-8859-1?Q?/0NB22AnuSshVdTScNP+4F8A4Uy+22TEaKK23k6q0bAItBXBCdP3VKh499?=
 =?iso-8859-1?Q?wmbtqtTCG5wMQQBhF4/uAt8uDCe63mjjcFmCf3081jXe9HxATTqNC8mSjM?=
 =?iso-8859-1?Q?+CtMalLmDUxcZqxqsQBHIobdQDoeOadajDig+zZxrQlT+A6MroaT6YUImT?=
 =?iso-8859-1?Q?MpOybR+5zQwLteGRbGngRwSEJkunQ4E9BSU+A8hIrcwUlJGAth34VtJNxt?=
 =?iso-8859-1?Q?AR6kVwYlxcQe2zNGvSeOCYZzC8+g+sFTEbjXPv+wO5BuPZ2tXA1o9G1fZQ?=
 =?iso-8859-1?Q?Dqeian4/91dCtj6yv6c17SCXsNCh9JvnqgzSd/z/9DZ+LKg22a4iotj0Hb?=
 =?iso-8859-1?Q?MVvS/hLGbOC7EO97AdKOhRyLdlR+SWuzy4ZYSHfQ9rgpdfmvy0zb2w4B1j?=
 =?iso-8859-1?Q?BZtUhQcb+WNov8URytvLB6xp/n8nITRfCt6kL4UBfAcHtnNasrr9lRQL2y?=
 =?iso-8859-1?Q?ZqWcq5s9PzRAsbPD+5K/r1iIbMnNckKHLEX4uGGfslS+C1lgQ7dUGBwPdC?=
 =?iso-8859-1?Q?tTCyqr+WP/7PaaBFMRybreNqR/n4DyhZ+Q+6X/rg07/1Uuu7GyiM5RY/uh?=
 =?iso-8859-1?Q?BE4GmXk6GAvgHotqwnlaOerI10xD/2gixVn9azSm9RhW19IOk/uQJRv3Ak?=
 =?iso-8859-1?Q?16uX4RKJqdQ6O0AOy0Wm3sWbJZeOOY0YBgzpCiA8R1rgcJ4mgG05LshGCc?=
 =?iso-8859-1?Q?DnZJzWrDAc/OydeMyvcq+gsiA72lJa8myb/rEMdX4SNrDIPJ/wXzaVYSt3?=
 =?iso-8859-1?Q?INCtJZrQ73xwK/r9ACvTLz4fk0/REy+BJ701h/aVr4OAWekuzYlNahT7Ns?=
 =?iso-8859-1?Q?AOQJIVPN4uB5B7aLD5V0uMZ1b1LrHA23Ikh/fjyzq+WCUSEeaahmZalpYf?=
 =?iso-8859-1?Q?roTOZ/TBsOQtfL118of+U0DbYY4vKZXVWOHi7Mr4blsVRgJltRIbS2/eSF?=
 =?iso-8859-1?Q?dvJXjSxz7/lAdHeVBaSGxeHnIz7pqv86tBDXctWLqrPYVDXt00n1p5ScgE?=
 =?iso-8859-1?Q?nn3tyw3NTuoWwlHot4guhkqi5AqobjPa9z2poN7jDc9+vEvOu9MFnq2tO5?=
 =?iso-8859-1?Q?bAkZCPJQbNkw2W0/0uLJ8QwgZA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-a2833.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOBP302MB2291.GBRP302.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a8e3a1-02c4-443c-bb5e-08de29e7b27f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 16:53:44.1771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P302MB2349

Userspace handles decryption fine up to linux-6.17.8, but fails in decrypti=
ng Netflix content using firefox for all rc versions for linux-6.18.0-rcX.=
=0A=
=0A=
Thanks for looking into this, and my appreciation to you all for your work.=
=0A=
=0A=
Dave=
