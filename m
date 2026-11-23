Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448610;
	b=EyHBLLsrVKjuWYvDoUW4Xc023p+V36aFGLh9ASdfqMfw6eyWPs8qGDn5wyxrItzoZvhF
	 CEtGHpjeLGn3kaID+6coE4MtfhsNfQBqX/WD+mVBr8OzUbHl8aaIkyABwuzsg3hi27aas
	 r5j0x/wtRCh9KCJW/FmLH5AMO8gKHxlPGe67jUZgs0FmIpjpmrquEP5rpCeM0Ozkm6pWB
	 qSijDPcQehfD+utBBKQdxIbmxHPnk/Hdru74JMJpAc0ETMrrSNrgbeBnGAlH1Tx3chXA1
	 moI6Wx5t23YdlJ97xcz78B5EZX6a/IAhRgf1t/JFcBXH1SNzIjklqxcpq6B3JLFlrOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DkD3sWyEbb6p17Zk5BEK0KfG7ZC9ENFtXztg01a6Uv8=;
	b=afH7D59wO71QnRPgwxJxJLcI/8VLejxZcx1R/V/PCIWYIsGLKQfcXupLt8nWlU3FVz+r
	 uqXC+wGVludSUfWx0r4UHMBH/7OKGQlkEkEp725GKStjKlCvs+HZBmjDISAjlTt3Mh8OG
	 5mIY5xnxa3qlVDBgNeL2nlr5VmFJcyv847XVXRrso81AbPLeQEtAad4DGu3ooTggaKViC
	 8JpmmndMmHk1rai0W0k2XJES8RRcsXnTzgP1k7VxvYDakrVE1gAcR9xZouDdZLvrXGcZ5
	 n9fE5WxK7TQOPSXuBvj9R+HCduOE2J4snrTLaJlH7okHrdAYMMD3Eu50FE8hVJ06ggQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=REBmE+q2;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sL8+Pvdy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E11606A31A
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 15:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E11606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=REBmE+q2;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sL8+Pvdy
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKUh33362787;
	Mon, 23 Nov 2026 09:42:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DkD3sWyEbb6p17Zk5BEK0KfG7ZC9ENFtXztg01a6U
	v8=; b=REBmE+q2CFO9zq85QFtKsFxJoMByUdNK816JQmjClMafbvMJ2BA4WDU6E
	/OJZ2W1739fMp2i9VM9NUzAYbicDP0u9+3WKOFv8t2Ym6jGUXfTp+KAoezUT4e6v
	VPBp0JSrgoHEZIA0EBjoOuyHQxlTVScM9MlTY5eAwW2IOzPDxIElf+owCeXalcPU
	Z6tHdUumKHAE43ZtjUer6YjFYqEDXrR4C4F1k4+Ca4ZRDEItDZov1KLVZFX58tjG
	FHXLbDn5wxs0Kuzr20EALwGoCuLr6yz0t9msRacOcmmIotcfKDaYDxrA30VWy81C
	h5LGbo9+PyaTZ5rm/AjyRRVS0RznQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j3uasq7tq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 09:42:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upGMZZKEWE1BvU569PkZc7gqQ6RiHbb9jkKpCOK/1et0yyECe0SW1O0XED+tdHDF+lvItRDg95h4A+OW2mP6BnS8UN0e8aN48fXg8rHS1l2Wwu3kBei4EfmfPPIYqfZQMTPfp/+ShHTKixDxWf3Z4qU1oqjt4iA9gZ+ZiOJvlby2aXIu0foXLfwJZAmduvyvgg+E+4PERsiZhCGGfVX6XES4Y7t2jXf69yAqgLb1jWeJ6ul4LyGh5aljgbHreSrt/PRpuXrxKhLbD5rN9ROk47imYbpJlas/g2DnLihwuZtEXx8UNfBB6LDicoYq7719SVl9mn9+f8RY9rh00+lOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkD3sWyEbb6p17Zk5BEK0KfG7ZC9ENFtXztg01a6Uv8=;
 b=kGOrdyfTmuEXlC2/POBRchVNYNXNLIsvhNe7YPoSk4xbux0mQ3PLl5BkZSEIKSXIyGowy3QHcFnxmLc+U/+9s8c8SefKKe84vof6o5dEyh9m3KmYdfv0G+KX/oHPt64nHpuVEpUWfBh+bw2whaHcFQkgl6bQKALZVU+k50fdBig4TtLpzqOC9srs6DZ1FK+cTkeUfH/G5CBUHUYddJZz464qlY6J3na8PSmX6o8zJrkHNDzTG0pr+1+iM6r/tIoVlDNMeuRuisNTgj1ZZp4Y+MxU4ru0urSIJfFiQ/C1p8V9Xw9KnnNIm32E2PDTqgOOIMHxlvzKojOU9F6+evQPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=montane.tech smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkD3sWyEbb6p17Zk5BEK0KfG7ZC9ENFtXztg01a6Uv8=;
 b=sL8+PvdynkkjGF0C0QjlhDXSf9rCfaWm0/mSx+baTuA7JuPtJl0jT6qhoBpPRbHarlH8n/t74twVzJSUw+ajXPsUlSkd/BUEZSkBLz8+vroME7tBdI/4nHKz//fw64YkZUYj7uN6pvseJ0LQKFMDvq44quWYy2rNSJbiSNc8PqM=
Received: from DS7P220CA0098.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::19) by
 BLAPR10MB4898.namprd10.prod.outlook.com (2603:10b6:208:327::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 15:42:51 +0000
Received: from DM3PEPF000265B1.namprd02.prod.outlook.com
 (2603:10b6:8:25a:cafe::29) by DS7P220CA0098.outlook.office365.com
 (2603:10b6:8:25a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 15:42:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM3PEPF000265B1.mail.protection.outlook.com (10.167.23.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 15:42:50 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 09:42:38 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 09:42:37 -0600
Received: from DLEE209.ent.ti.com ([fe80::286b:c111:5b4f:ff9a]) by
 DLEE209.ent.ti.com ([fe80::286b:c111:5b4f:ff9a%7]) with mapi id
 15.02.2562.045; Mon, 23 Nov 2026 09:42:37 -0600
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Mark Brown <broonie@kernel.org>,
        Thorsten Leemhuis
	<regressions@leemhuis.info>
CC: "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Holalu Yogendra, Niranjan"
	<niranjan.hy@ti.com>,
        "antoine@montane.tech" <antoine@montane.tech>,
        "andrey.golovko@gmail.com" <andrey.golovko@gmail.com>,
        Lee Mann
	<leepaulmann@gmail.com>,
        "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>,
        "matthew.schwartz@linux.dev"
	<matthew.schwartz@linux.dev>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>
Subject: Re: [EXTERNAL] Re: [PATCH v7] ASoC: tas2783-sdw: add firmware
 download status check
Thread-Topic: [EXTERNAL] Re: [PATCH v7] ASoC: tas2783-sdw: add firmware
 download status check
Thread-Index: AQHdSbsX2Hmo6YLx80i87bh4CYcqkbcjzkAAgALbVoCABfaKgIAACkwAgA+hKACAAC6pAP//tJDK
Date: Mon, 23 Nov 2026 15:42:37 +0000
Message-ID: <8e3ca22e2bbf4cfcb6b807d5f1c3b058@ti.com>
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
 <20261113124358.11823-1-leepaulmann@gmail.com>
 <52ec243f-5d13-4260-86cf-57800e1b887a@leemhuis.info>,<075d49a5-8595-4fc2-9180-b7e98a4dfefb@sirena.org.uk>
In-Reply-To: <075d49a5-8595-4fc2-9180-b7e98a4dfefb@sirena.org.uk>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B1:EE_|BLAPR10MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a71761c-657a-47d0-8bec-08df49786e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261026140227099003|261026121527099003|261022105027099003|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QPKo/MTSoUkZqTTvwx5ro7zy5DhDG3e/jXKNXcOzG/WgsK6woCpN/lYQB9PM6/AcreZyEB5z+Q79H36MVYTEmDzKNVBAGnrmQQxpaLa5bdHCYrmfx994QoBk6ozcd68dR5JxMqdQsDae6CsS9f1kvCMVomfSrPOn6GGiq+zHcJyUVLVtSBRXqC3FKKYhKO5/OFKHZ5wRT60tfn1j8QF0R4FLDf/vX954c+WPMKI0ewmqnMmqeNZptUVrzqjwnZ/Se7/NJIFf+Ds6U5YML0wgv5+gtLCWd96Uzr4e9SraxPt3YqndECHCf1TIgdT9Cj/bceaSgd+njEpCFBbSr4BkEEDAf1dhFLYTowkfGCRa6kay4rWYzwS9lp8B0x8XMTs1+vT7oT0sI1kmuPnAuWQDks68JW9VmuO0zXniowFlnnX+teAo8negKED42LdaqMdY5WpGPUBpqrEGjpWccG+7VN47KQKgraAwTMas0HPH+11zz9tjnMZHJMDmDZ9F0YSJOAFL9UbM2s0CuBu178BApbM8FqCQrNm5VdwOEN/iZxedfMavbjqIG/Zvi1fG5vbdQmegExL3ftDIkotR6idTEVLfPglW22rkfguSW9pf4EV3nZOjqrQ7K/3nzlaimFqkcXj01vLjb+LmpU/BnMJGyMuycL+SsrdO8eBfq/DhIw/GCmugxpr59Ap5+bBYGdAfzE1m644ZnWmuKIBzZbZPtQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T7hZwX0Y6KZ3KT/VQDiepAi7K+5/x9GDRvyaDIaUC0FK1nUroD2XkZzXebjGhPWb1xeqOQiCHZGeDzhe4dwli610zv2UW0Lwq9hTHPdF0FQqr4q5EmKpmz4WGl2VMVaY4proB2L4deLIR6mrtPupHMRIEjZ8ZHJg/1zzixpSsEvpAX4kdgxfp71cxOnoyOhxBXd3NzSgyVF6c5XCull+Bm5frjRgOLToFSxbNsZIjivyx5wTheFWg2i7fZwaO8PCG0uXC02CBDeQU4O1YvGooOWZpyV9H9bemdYO2bsezpsAXuw5TTCxgkvRd+FE3EcbuwhodNvaia3Bcasnu0NHPvr+RnsEq+Wj98CvX8zxyysm1bTP7d76rWQA5OuQDr+U9sNUb04ac8Zy11Rf7ip3VSqQnQt6C8YymMo3LB51Vl/ws03GmsY8Rbm+PU3dP+gA
X-Exchange-RoutingPolicyChecked:
	LF0W3ZPm9wxLya2FL9H9c9v1aCfdnWjhgINHqd+r9Vyca8zpkL5H4l7fZuXKjNoIeWRHdTYm0WrHsEwv8l/dlMQODnS/ZRm2qmwBQcinE1l+ZiiJae+SFUIDmwN0mz39aAdoDbY2rMqfwHtAKd/Jk9aJGLuKhdgkng8LXHSEJACVgiZp37paNl+Ys+abBDhuBhqP1WUDbhROGX4e4YwUlEdC8YhvnIqqBvRsKOwL8+bs9i/3R8oymnxrbM5oGL7AP1G5ZlRzBl1ZoGZSZwlMfFZz2q90ZBUoAnMNYLibu/MDNrNY2pZEwBYCCFApmGepkjV5FT/vsICETIAawyu0vA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:42:50.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a71761c-657a-47d0-8bec-08df49786e85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4898
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX/hiewnAF084X
 u4mhttUKocMGyAl3Ddx2xNIjUI3iITc9XSzLwCOdoo/GPLJaJbgK4pQB8Jaf716jLuA97jjqepw
 8m/fRLCV0rr8wCBum6WTphrT4tduxe45/ZRqwo38xbJ5CS03E3+BoM0PlHfUAeD0/xiju53OV3H
 q4+8PoDgdYsza8BmxNXiD82Zw5jhnIEIKa1oetZHqa3y+fD3nVoFJjpn55SUdKQ+EyKnDHLkZ/4
 1IUbbb91ciI0uIseiA9AKMuOjUFIihpMvf2LSi8QYs2OD5YU9+asw18kHJe8JJMh5kxOCcoOYKz
 gRXzfVuN3Kq+RV9BrjUvPgtwgJIzC5ZUEnyYLDerOHaAgbtyavRef9DtT0onCkgrURKqQkwAUMJ
 yjfVF3JMumIk+YpnmzV8k1H1g4DN31cOUNsSEQrK+YVkZom1qmpCCEtMzDp957bledseQNcDimQ
 cXk/vFe/uUEYbe1FgRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX9f6GmZlKdjrF
 nRgxC70iYF5QaaXWUP7uqzxmI2h+VXbx0y2DsDdGHpnCYsN2X0Dq9hE+nOUVDJvE9f03BMkLzxH
 7KUz8/Lf+wAtDm8ivCPyHEte5lz9YYI=
X-Proofpoint-GUID: _-Z5tlsVp2l_qiTXVwaFwtPv9geKGaay
X-Authority-Analysis: v=2.4 cv=Zsp4uN7G c=1 sm=1 tr=0 ts=6b045eff cx=c_pps
 a=n4Rd88MCvJemCXT3WVAnXw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=HSjQpOrDgPAA:10
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zu3UOkZVTvakzkANwzAA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: _-Z5tlsVp2l_qiTXVwaFwtPv9geKGaay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

> From: Mark Brown <broonie@kernel.org>
> Sent: 23 November 2026 22:11
> To: Thorsten Leemhuis
> Cc: Xu, Baojun; Ding, Shenghao; Holalu Yogendra, Niranjan; antoine@montan=
e.tech; andrey.golovko@gmail.com; Lee Mann; pierre-louis.bossart@linux.dev;=
 matthew.schwartz@linux.dev; linux-sound@vger.kernel.org; regressions@lists=
.linux.dev
> Subject: [EXTERNAL] Re: [PATCH v7] ASoC: tas2783-sdw: add firmware downlo=
ad status check
> =20
> On Mon, Nov 23, 2026 at 12:24:40PM +0100, Thorsten Leemhuis wrote:
> > On 11/13/26 13:43, Lee Mann wrote:
> > > On 11/13/26 13:07, Thorsten Leemhuis wrote:
>=20
> > >> But if not: Lee, does a revert of the culprit fix this?
>=20
> > > Yes.
>=20
> > Hmmm. After more than two weeks still no reaction from Baojun Xu so far
> > afaics, neither here not in the ticket mentioned below. Lore also
> > doesn't find any other messages from Baojun Xu since early Nov.
>=20
> > Mark, do you know how to bring this to the attention of the right
> > developers? Or should we just revert the culprit for now?
>=20
> I've got no better way of contacting them than anyone else here; if
> someone wants to submit a revert explaining the issue...?
>=20
Please accept my apologies for the late response. Unfortunately, the patch
failed to function correctly on my 4-AMP platform, so I have reverted the
changes. I am currently looking into the matter and will provide an update
shortly..

Best Regards
Jim
