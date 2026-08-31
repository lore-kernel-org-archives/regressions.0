Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454603C9EF0;
	Mon, 31 Aug 2026 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162939; cv=fail; b=IN7P6kQXdp0dIXaHsieg6w2e6IE+b0dEgDiq2HDCxwR6m4qqRdjq2d8IeaKPaMhuIhC9Chz/9p1O9imQ3G8j+dExsVfi4vlx/MnufkecIXKOaE5UywT2TQS6vsKEk+WFsJDc9oYw1upN4F50KfYzv5rZ2wSNFutWnDLwpnFqng0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162939; c=relaxed/simple;
	bh=Q+zJ5qhNQaGs0P6c/d0QGHadSSZKqyhXK02ovZZw1l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TXGrowRL/kTpbwICEYzqLDpkE3eq5k2D5VULvLeic5Eb5dayqbIobgEAhUtT+MVQFxfwRzXgY5/oniDRv/tpcX3RSJEwLENTkS+Advm4mgVxT0JOYWxR7Iy2y2evOXeCgosPiC3s/ffkHFeUYUQqepMyrg3p8kCWwmZHu3w61w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=nPAYeA+F; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=GGYnLt8Y; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="nPAYeA+F";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="GGYnLt8Y"
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52QGq635338;
	Mon, 31 Aug 2026 09:40:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	g88D2tU5fOG8Hqi5c6jcjkkJ4ku7FFg1A+cCYzpeJyM=; b=nPAYeA+FxkV5mkG0
	SeM+YvKBPjaQFE5SQMy6uflbHEZhi6mQgEUOIFJBT0zJf/fAu9BU3u10lDzl/UX2
	PVwnyuV3keM4aSjvIOD/rNtSRdg5WygvxPZPXEi4sPK2lgHCuuz3prHp+OMAkT6D
	+o4MPHz5F3788ujNkwp2hUhour7/nCE93hcMjsimQZ70ishx39MKYBGn8PXXglpO
	iFuSuEennMlIlkeVD/QYJrjE0UQFicGroN9cfULz1t0gUn2U9XhMB8yJgmJXAG4M
	YKzm5ho4a1dx8x1X6g2LmJ0rd29FrzrFF+2D54iJ5+6L2R0m54mviv+jn7CrK4XQ
	rz+G+A==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11021085.outbound.protection.outlook.com [52.101.65.85])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gbke1hwav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:40:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2q2ngH8zO99eO+ZmocKbNmHX5vdlE2cEQmxbJsM6drwAFxbiEEn3k9+esRz+64/QD2gidibPvG5XIYJz9OeyTCOxKbNyyaXVQBj173OexVLVZrp6EyRE2Q354uPxQUPbjOwtcYbv+IApajWxQo49Co7RQYQvMxnGP9qYX4dtiSDly7vLPQSJeZD6MYy9qYge4TXDflNyYfCmfIytljVtKP5N06i36sdU1bUYYnryW1TOYLERlp1GUfm7DfsYchmVIlk+SoYLrLtCIaymz2xjv3F4c4A+8LLMK4KUmuMVYdU478CEX5/Tw5RDc1DOHGbTzKEyGeEajR8SY+W9wm6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g88D2tU5fOG8Hqi5c6jcjkkJ4ku7FFg1A+cCYzpeJyM=;
 b=G1BPMR2lBy4DZjMXMLuQS/+zDECaa/7j/TTsrATkUzi7fDOPEnBRzDJPhDnDl6h6UqupkTITSFxeuNyrxqzFjeD6t5lf6OJt40/37itdSiW3HHfGHdHlvIvt0LZ5G5e8KZmfEV18JtKd+sNfRKOKlIUd3VRotELVM9ONai1oja5RlBnXGs7RIVpOfPfNnsaKev7MeeJKQ5qBVOSnUB1cGQkzR9c83VMjcliVj9SysT6PFm1qz2TkmnxvBshekacdCQGSSnhStToQ8UH1i+syIkxIIPMvQaxLG465vF6PI5er1VVT8I1OjWwLGoJapRgBwUMoBGkFYHp7UFW1lRJOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g88D2tU5fOG8Hqi5c6jcjkkJ4ku7FFg1A+cCYzpeJyM=;
 b=GGYnLt8Y6F6ESjdPdd+1WXFFgS8Girju8/NiTTbSZEpztmjR+5/Yil64IjUy+ljFS8s2GZLoBOCp8ci5ipnieZ65GFhoEfOMi2k/FOR78lVp9RRLXs1YDfeyM+UkZUnQ7GmxHi57FeKA63F4QLdGfs2cORWJfEsmQaIL9a7y33Y=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PAVP192MB2086.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 07:40:05 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 07:40:05 +0000
Date: Mon, 31 Aug 2026 09:40:02 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <apUv0jwZc2rwTaj-@FUE-ALEWI-WINX>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
 <6e4d21f9-87cb-44ea-bb04-eb4f047f3ff5@leemhuis.info>
 <aa6kLwNxoCIvquBT@FUE-ALEWI-WINX>
 <959d32b7-592f-48ce-a7a2-c2cf4b0cb44a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <959d32b7-592f-48ce-a7a2-c2cf4b0cb44a@ixit.cz>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: OS6P279CA0084.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3e::14) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PAVP192MB2086:EE_
X-MS-Office365-Filtering-Correlation-Id: f662a567-ae43-45f3-f603-08df073312fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|6133799003|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XYkUCg5SXGLV8twMYMtkUnv0UUUCWD5hzosf0SJWmHP6QFgcJclPiEN9coL1C/3e6mQ5WwzdnolZ90u6YDmmw7+NepL51gAlTmfPn4ZvUUsIJNgL2QC3CZxikK5wXZNv1sDKPDng5x+P4HDFxaNKY+Jai/nY3tf1sq3ZgcNg+5M9C7RwZ6pJE1q00hOx/GUg4dkv0jKk+y/5ozYwimSJZGsHYwNTQBiH15obLRjjeQhuJdgKpuItBQsL127TU2jXKk/+VYJznjL03Hd0GPT5snENZIADtt5Hd5cZ2k3ZC5arnVq+/jrWcqYJ0AtG9kfCW0rpRft2SOvVEzx78vz37V93Uw8w08f9Gq92YzfYlqCGOg5IxajjKvGUjtGuDjWYlYnmh5orZ+TiCIahYbXNO6WLlF0ehkCcNc7ew7bzKKP93UHOx20fQVa11ZF6HYibs/+47J/vCZgdoled5noA0kIyC6+3U4daX7qxYsUjoso2yEhoEWhkVoKcjVhhTK2CksfQsoCJpHIMtzwzS9XJnG2BLiBNlfxWU3iNWQ/wH5FcCoRac8m5OR0fbq67JR23Shf05bpAhR/YxroIju0iVV8EzKu7Pj1D1nlAzjDSOxCgqdWunJe1jaL+PAU2+yR4WZVshrNRJesgJVzz8bs8+LVBv+l5W2yHYU2WojolMO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFvd3dEYUhBeVAvMk5FUlUwZ1Q3SE9mRG15aXFDb2lSLzN5VVRzM2dzajdG?=
 =?utf-8?B?L2JJaDBJaVJROEo5TDdsUkdTczZOVFY5enV1b0VNdmVwUXR2WFM5MmZ4Qk0v?=
 =?utf-8?B?cHNobXZ1S2ZOMFVXL2FWYjBMaUdnc29sWlpCSlpPWTlOeUs3dUEzV2hUdlN2?=
 =?utf-8?B?QXIxZXRHS0pOSUVLSXY0Q2d3b2I3UjhrWEJUVExkV01sR2ZyTWEwZENIazEv?=
 =?utf-8?B?NWNpaXM0N1liVmpEclpPclFDclNuT1JTaW8xbnVITW9GN0h1dGsrclQ0S2Jm?=
 =?utf-8?B?SXc4SC9LOWtWcWs2amxuR24yLzU4SHR4SC92aGF3dXdjZHo1MXIvNEk2cjIr?=
 =?utf-8?B?QVFiZ0VybUNpWCsyK3o4WXFSU1BtcnFSVm40ZnZLMG4zRmZHaE9qaVhPMHdp?=
 =?utf-8?B?Vkk5MWk3T21jUVJGMno1L0kvRURwTmIyeGIzSVFTWkJMbVZxU3F4TGszcHlB?=
 =?utf-8?B?U2ltKzJxQXFIWHhaR1FSaFBrRjJmNHNNZWdSWjJDN3F5ZmhtdU5nUDZrdE1V?=
 =?utf-8?B?T3k5WWJZVmpDcVdDTis5MWF2azI3djh3c2VqRHB6bUh5bmdwUkxYd0NXVVAx?=
 =?utf-8?B?T2pjbW5RY2lUb3F6WHBvdVpScmVKWWJ2WDNNbkpPbjVlWVZ5SU1HK0k5N1RK?=
 =?utf-8?B?dHZla0FpcTQ2YzUydGxHcGREYnBNbFBxK2tWMlllY1pqQkRhRDBUamtsRTVh?=
 =?utf-8?B?c3ZSWlBoK2VWajJ6ZVlQaGZYSCtTVlBmM1U3TENIbjI1b0J1MlU4TFZyL1U2?=
 =?utf-8?B?SXUvcG9tbE84QldWckErbEZSUlpBcndvMzJmWFlXT2ZsdFRLWGRrVytWY2dw?=
 =?utf-8?B?Wk1tSHhtQVhYb2FMNFdGdnNJbFlRdmQrcjJDaEg3Y25keG1lRnBodHcwZS85?=
 =?utf-8?B?cVJFVWNvc0RkNUxGWWVtT2t6NjRMOWhiYVIvckZwN0IvdXBTMjFZSEJQdU05?=
 =?utf-8?B?bExlbE9jcXh5TTNBbUpINjNOVUlkSUxGRW82L0pMRFdxYTdGRU1pVWQ5Wnd5?=
 =?utf-8?B?Nkx6VXlVVWVMQ0RCcjdKUDRvQTZFeHZlQWFGVGFyTWxOeDJrejg4TExGNzB4?=
 =?utf-8?B?T0lsNGx6SW9PeWdWVXQvUDJJTG11RUlsYlV5aGpabG1qWjRNb28xaXo1cFBK?=
 =?utf-8?B?YnNNSkN3ZXduaFd4M1ZpelNyd0pmWno2WUpYaGpQL1JFa1BQdFNsQ3VvclVh?=
 =?utf-8?B?Q09TSmpyT0Jka3lrZkRkVUMyb1U2SXlMeUJLOGd5UXVRMEMxRzNPaU1VaFpI?=
 =?utf-8?B?NTgzR1FxUkx0Ym9tWEQxQmZmOTNKWnJmdXFrOTdFZ2ZGYURpV0pOTXQwaVll?=
 =?utf-8?B?RU9IcTFoUTdBSUpHZVZGZjhjTjRQN2x6TGV1RVVOWWdZb0wzN1lJSThRWUQy?=
 =?utf-8?B?cEFQZURLdWUzUWRYVUZCY1RPOHlGWVB2MFdDYzRWNXljUXF6YXpOZW9ubFRB?=
 =?utf-8?B?aG82Yy9lNG5GeTJqdWhtQnNTRkFnQW50d2lacGlFNFdVb2krd1B0R0RRN1VG?=
 =?utf-8?B?cWxNaGJVRFZoNjROa0hFdENHdWtkUXEwcU5tV0hZWFZRRmVYWk4zdGZ4TmZu?=
 =?utf-8?B?SG5Vcm5HVUFBU1NBYWJ1d0xpUXpVWXMzTHkrZXlkbnR2TW9pWndxTklWeVda?=
 =?utf-8?B?VGVUUXFwMmNMbElnYjRqY2E3MHIrWThiOHlURkM1d21JWkxXdUc1THNvdmIz?=
 =?utf-8?B?emZacmlyUU1KS2ovNUZwOS9oaXVoVDBYdXBsMVJLYU9RNlZ2aStmZDMvWXRC?=
 =?utf-8?B?bXJiQTVIb0RtNTdNMUNCZlVhMVd2bCtFQ3A2ckNYWHl5ZWVzNm5iSHJHNkxO?=
 =?utf-8?B?SFBoZ2I5Ukt3Y2JLcjdoVktkcFd4YU9rSDFudGY0UXdqOUFzcjFLbjRSSkNr?=
 =?utf-8?B?NTg4ZFQ3SlBaVXMvb1BmZ1VBL2o4SkhkT005cUJmU0JBTUJ4cCs5NXNlZ0F1?=
 =?utf-8?B?YXJ5SGc1N1F6YnRxODBsSjF1YTZoc3NOU3hJQjBXdlNZTkxEWW1rbk55d2Q4?=
 =?utf-8?B?L0pQNndpcWlmZWIxK1BFeDZaK2NIZXJQQkxJUG52bWxmZlNGcGlMMDdwWWtP?=
 =?utf-8?B?UHdWRVJrc1FNemR4a0Nsa3ZFOWswVWE2cmRTMk14QjhySHJxNFpTMElSYlE5?=
 =?utf-8?B?Q3hlMDJKL0wrWEw1NzlmMGNzN3paVEtadUlXWFNwNDhMSHVzaENhWEFGVlBL?=
 =?utf-8?B?RFVtR0MxT01WZ0tWL0dGVGZTLzhGQ3k2dlNKaGFTdmlIVnNJQS9VbEFVZjQ2?=
 =?utf-8?B?QW9OZWJxQ2lOOFNOMy83Y2ZjQXFBU3poRFRFWVZaaStrVjltTDVEYmxEQW4w?=
 =?utf-8?B?VlRIOTdsckNkNno4a2ZWYVMwMWtEMGZuQjBUSWcvT3p3STgxU0RVQT09?=
X-Exchange-RoutingPolicyChecked:
	p6Mnlm7leDKyNLOL+8w71EGLdVi6UNs9ayUA4P/oRymVhCWkACcgubuDgCUHQGlzINjTaNikZ3s/c8lGC26Iq15ki6Oy3yUsUJud9DTyDiM7pFpJoz+Looyno2g6q1ahuCaapJKBsWtxPCMPFZ0C2jK32R5Edzs5gloYyDTy5+yl2SyS9abUcvVenJjfcVbX6b84uRTqXLFhOUS4j230lWHCpuO+HzgC6CATHJ5l4GVFZbUAvgq0ZSQ/Gc7Lrc1uAKJlWhTrKZJna2tfeISz5j1qd08q5EH5un64zPcnr0Qgy/DYrYPtitwdQqiIaba1+dqa5G4yu43wld8o8uz6Dg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ke/kDjN4xdIIRtrfTf67B8dYau15nfUd2srYy7V/Yht6OJobjnT4W2jWZ0pLVJds42CVYFO1Al5hht2BzE6hE/yzhQlrXRUecLP22HWpYhc+IOhW+J0pgBbQdfr9I1pCrQ1J1ZSgPSEfX554H3YkqGK0llxU+6QxuQ+GGa+HMWALORF1EIRL0koQbizwXlJVNm5bgwsnNdlcCpaZoAJDMddLxVdUFEHzyQkdeGtdGJMvMHv65yBF/12049qIoowXqQn5hUoSjeB7kDBVHco5bCnbjgkd+eQAPjOsUcy+V5SpGM4OucHNONUmTIXZD02+wBYjwOM8osLVl3cexBLK8b7cvY3tqDjl3tBqxz1KHw8JhXq2LGC6WS2+ripcm3TRGRADmxN/5vwxWPHdC1NWXWzonx28KGyC6t6QyEl1wQ6MPuS6xhHV0urMEt5Sw494aTBdLS/8b40aEq4TWQ1/jzYDkbgCYbTh/fJm6wn8uiCwP7Pf++2074dUnsT54CHHocCjnRyn5dm4MUZEttjUjV12Nxb1pXs26ZXHrpA7GxeNzD4N9ClBfENhV28eEPwDdQ+fX6SAZkaS192PseOCVfW+KJnScQ+FgaXHQH23GZ9gq6soO5fTi+jyIyvPtwR/
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f662a567-ae43-45f3-f603-08df073312fa
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:40:05.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfmpMxIvwC+/ZO/9r93Xd2xmU2GEmReIz0/34tE0MhEbTVCTa4RAxVe8VO4dKyikc7+oNIc2OxPISCsZVmvqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP192MB2086
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PAVP192MB2086.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: jMmwoibqcN4mVy03carpiz_85rSk0pay
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NCBTYWx0ZWRfX1BtDe1HOiLFC
 FNE2k2y0y5yGdirlvFIK1BGQhn4kvLe+3Y2sCIlsTFBtUUNaM3jzA+lPJHnfsBurgWY09TJyws2
 8reHIUDzUBxFcr5Y6gF8lg8rGJSnxLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NCBTYWx0ZWRfX88UkgsClw5Dl
 qc7FtJ5UGifna9HWINC/0VkGKZssdYiCS5qDa/iu3Hul51vvOjyTPWg16YTR5WwsJFMU4jvwvWy
 j/DiwMo8vag6ncJSJ/MppNlGYSiVsFQ82eD3O8PmLnNwy2oqIwnyjFEBeM4ZeAVgeZ1FaTAYRhR
 QsCuFgEFGoQD1caXjKra6QAcnUK3yaYu5JOvDwJOqRFOaL1V8KFqmUyHqEQLlmjzVOFYhg8VZvB
 CTXfYiizRg1jMDu8xiXz9gX9MFmOM6r4jrKR0wMMygtd/ecqJKPt088FtbMML5+yWU0JiZeLz0Y
 ZqI5hMGZG1Cu/57ofRiA++EUIIOsOUudHqOoKfV3LB+Tg2PVHfkLKcQ9lJo8GdK//tbSMulXG/v
 DDRVgB+ilNsNMSRob9VRG4ASRey1BW9h9wyTzqD+1xDXtUvK1VkxQvHdZIrBvAmPZ8Wq99vEwIG
 yRxXclwZM6OX8eEvNOg==
X-Authority-Analysis: v=2.4 cv=Vff/rlp9 c=1 sm=1 tr=0 ts=6a952fd8 cx=c_pps
 a=dceCaKy/xC/3bTNpRNSjDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=Bj5zObVrgAXbszc5Rv8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jMmwoibqcN4mVy03carpiz_85rSk0pay

On Mon, Aug 24, 2026 at 01:36:38AM +0200, David Heidelberg wrote:
> On 09/03/2026 11:42, Alexander Wilhelm wrote:
> > On Mon, Mar 09, 2026 at 11:30:42AM +0100, Thorsten Leemhuis wrote:
> > > On 2/14/26 20:26, Bjorn Andersson wrote:
> > > > On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> > > > > On 19/11/2025 11:40, Alexander Wilhelm wrote:
> > > > > > Currently, the QMI interface only works on little endian systems due to how
> > > > > > it encodes and decodes data. Most QMI related data structures are defined
> > > > > > in CPU native order and do not use endian specific types.
> > > > > > 
> > > > > > Add support for endian conversion of basic element types in the QMI
> > > > > > encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> > > > > > ensure correct interpretation on big endian systems. These changes are
> > > > > > required to allow QMI to operate correctly across architectures with
> > > > > > different endianness.
> > > > > > ---
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > I recently (next-20260119) started receiving errors on Pixel 3:
> > > > > [...]
> > > > > Since it's not well tested, I believe there could be problem with
> > > > > configuration, but after reverting this series, no errors pop up.
> > > > > 
> > > > > I would believe maybe these errors was previously hidden, but just to be
> > > > > sure asking here.
> > > > 
> > > > #regzbot ^introduced: fe099c387e06
> > > 
> > > Looks like nothing much has happened since then – or was there some
> > > progress or even a solution I missed?
> > 
> > The current proposal is that the driver side should always use `u32` for
> > all `DATA_LEN` fields. Most drivers already follow this, and Bjorn has
> > proposed the patch for the one that was using a different type, and it has
> > already been applied.
> > 
> > Check:
> > [1/1] remoteproc: sysmon: Correct subsys_name_len type in QMI request
> >        commit: da994db94e60f9a9411108ddf4d1836147ad4c9c
> 
> So I assume we can drop:
> 
>  - soc: qcom: qmi: Fix "invalid data length" in encoder
>  - soc: qcom: qmi: Avoid splatting the "length" destination field
> 
> we carry, right?

Yes, that is correct.


Best regards
Alexander Wilhelm
