Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795575204;
	b=reH4sjiDqdt0yFSTVpWX3e53OsdAUTWCkzYx02gmvLAux6eMnwG2mZJJD/LEWL3I4XRU
	 lqU1POHUN10OCk09O9reVchn0gOUTD9jchLeTkUYQlsAUGizZI7p8JhaepAch7HSEsYkz
	 a0OB46LyKI0cHAvjRj9sj1Z98BexeglIOdc+ArPWU3me0beS+qpYIR1LqMdlb+ypbjaY9
	 Ud/BDJp3tQ8apkT6Fd+7xtF3CIIq9hQpfCY5krq1NmUoQLxiHrgLeZDnL/5N5JvvmNkpK
	 mz6tnZumpq84Oy8+82KVOjxQnTBpQpQLNsZDGtHornqNt0PD0iXig7X5fBBYsURavzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575204;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vFS7QdjO5puzwlMacPQMPoCGHdlUW85ljlY+eoSO6w4=;
	b=1YwNcFbUK4tpCMFMz67wvkCjwnud6L4ShYEXUx74qyEw1u6gJxYZY4ESKzOo6oMDBT+U
	 WWj/LOnNaPCE4POvxdY1dkXNrIm/WWnD+C1QKdyjJKq0rLmyiSvPAMRSmx6qT49qLGIbI
	 nrIIAz5fesy+v/EIR7m+DvierAIzO8/SugC5PuyV07GKHaahWVRyyPyftNV+1zaMHtfnR
	 iVXdrYzDV7r5zHAv+3AVHiODk311Dej1BJdUOf0zAjG5Rx3AZWIGZML7ublawonP3WFyR
	 IoRTANwL9Enjxlojhb0xs/9d9tELpKK7tfOWxri0nPDm/XwIbzjYuHvFnck5eZMTN0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jsXy2fs2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E524606A323
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 02:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E524606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jsXy2fs2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR21K15wQQWQCCPdVSrk092Uz2SKFI+dKw3OP20z3r5ByF3TZYug2ROe7qDaMAVOKxR/R76Xfz8SndVjLSjJw4ACcFfS57C2ziN0HrcJ27nTllc9CTfrJLWZqoSI7d2dMvqZvQeMnItKs6FQTjrsbEQBzRwO2DecoWuF95taWXCrEgnzfzK/u36aGjQ6JdztUZbKaawB68M6swuZvXx7WujXsFZbu6cE9m7PjXHnb5uk/m6cbNQ8tBG72bRbE65saVEz/4aaRWAOmg7kRunaEr1n/EQ2QQI+utsjbTlNQG0BPEgJVltq9GCtuyBBzcrzxZygAIkftu+8k1lVpg0H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFS7QdjO5puzwlMacPQMPoCGHdlUW85ljlY+eoSO6w4=;
 b=ls8UqMeRHmtJUCkQaFaFcJ6b/HB4YGF/mn3WMzEgfLEq+/Zg2TD1LfKUGXjv81uy6OY4VuZ5nqO6LWvA+IKU5yx4/BG3Qy8jzvqw7Ylw3oCB5Oa1Jnbi18s9PosDSh6ydI90MB8F8DBj5/EUAwcTYtkjlNRVMR6PBWnUufp+WnKrI/JW/DhNMZuImcQ/gOo9OwbUnRUaIg38xJNUvJX6JBClTx9fPZvzaeY+C3MJxCjmcvZGomWowkAmoNQqcmOkRDFQPtDAh17YSFD4dx1rT8+TEebq/yFyMZCWs2f+4vqpNe1K/T3C9hQ3UwtJu557R9aRId9tfjz/oEYV0bQMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFS7QdjO5puzwlMacPQMPoCGHdlUW85ljlY+eoSO6w4=;
 b=jsXy2fs2Kz/sc0pSKt9CITLrzf0ldBKiA6QiNqXk8ipEsGHTwU91zXEz4qYDg33tQnW5rl5ipAgqA0itRXyIEAIDbfhGIOh1xYL1iDGg+vhw1m40VHN0IrWVPLV3H0jeYCwHspPSYuZGPYkmj2qVtcxe6wSVuCLy/5F6S01fi/s=
Received: from CH2PR14CA0052.namprd14.prod.outlook.com (2603:10b6:610:56::32)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 02:53:16 +0000
Received: from CH01EPF000BE949.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::2e) by CH2PR14CA0052.outlook.office365.com
 (2603:10b6:610:56::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Wed, 25
 Nov 2026 02:53:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE949.mail.protection.outlook.com (10.167.244.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 02:53:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 20:53:15 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 20:53:14 -0600
Received: from [10.136.45.121] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 20:53:11 -0600
Message-ID: <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
Date: Wed, 25 Nov 2026 08:23:10 +0530
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: Andrea Righi <arighi@nvidia.com>, James Buck <jbuck2005.linux@outlook.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, Usama Arif <usama.arif@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <awWOCejxtjP12xFX@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE949:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8d1c46-dc6e-4c41-bcf4-08df4a9f4097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|32650700020|23010399003|22082099003|18002099003|13003099007|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|56012099006|261022105027099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	34tXHzcC/rhONzUBdHlx9caVahM0FzCJ9Qq/Lxq24Bzgenxa2hx3xxrmv/VXXljyON2QSJCAg9PS7DnQd5KaBcY2MULnwRYJxl6bErFpmTNNSg82mEtSoUb3qMPp7I4w0aqxjhzLy65jpefCz1e6fD/9HIDxzu41K5iHix1WT/FWMbQD1IKCBh/KcQlsiYBi0J0lHDHpW6/biNEa7Sprz8uf8pTyqbZvWRVYyzxPyWjhYw5aCa5Y4+LypoZMpS2vL8ARYNmd/iLziXXu11H/eyFjZEe6q9Axz9pbq7S30ZifbJEU1rzyY2J9LkpBh7ixJLG2EAMcOkS67hcI7EqI1xTplKhp+om7CbAtFvGnxPLPDha2931kIJ/ghBdH+QVv9Z9x2Fwkc34itI/y0SvYZg77XGQFZCHqKT4MiWUz6hyDEXvxeSWdSqgGjxL8h1ADtF6dTwZSdfs24crvPQhZEdJrhr+NMwPHV4rcGUGPGcaZZNdmZQnfK9EtuoK+cMiD25vdUtSBAVYEfz9bEk2U1+8VBmAV99i40BMg3iidC5RgU/DmE6bQ0/xQYekz93aKXSVpaUpgE37JV2CopUJBlyX04hClygYaKjOmy/cw2574VW3Jj6Y0Jh4gE2U8Jbio9yhFdWeQ8c1T0/GjOatG7ntg5ZIQ3Hdxza2TzUeE7Dk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(32650700020)(23010399003)(22082099003)(18002099003)(13003099007)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(56012099006)(261022105027099003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9wj5x8WiGVl79bsAM9yNtiGePjdic1h2vQrjCLwdzc6aELAO2DabVj42QXXBXUZrWbZ/zU7gUnnNvytWZgNGyEhUXogOBkC//7YXO/8XShXkJtv7uyCFtaglOIanGnYQU7C2waiyeO202rzpeowSdkeA98GNwoIrCDJZPDfsd+ZmFQkKlt9s3KD1wSglrBhRmRChqQo+MEw4VmAqFGa/ELPU5izuGFZbmIwQKU0zn7Bif+QfxcGNE6AphAy/P60MYh1F8YUALr2TQW0mxdMKzso2e+yrblytvGFtNeVYPEAg0MGx4CVR55LQmm6yoXplBc24PrXU+dnHUx16thYDEUQJejDcsUh43ehhbQGGLs7C6morEKatbFBMksYT9Y9sOsAtxeiBYFoBE6Oat5O7yZMMhPYTA0NiWmu9BoVQcFVGNmzNrnLcDIzchCYsqSNZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 02:53:15.3284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8d1c46-dc6e-4c41-bcf4-08df4a9f4097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE949.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

Hello Andrea,

On 11/24/2026 6:45 PM, Andrea Righi wrote:
> Hi James,
> 
> On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
>> Hi,
>>
>> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking threads are placed on idle little CPUs while idle big CPUs are never looked at.
>>
>> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainline to behave the same.
> 
> A related regression from the same commit was reported by Usama here:
> https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev/
> 
> On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
> being idle. Your case shows that a nonzero budget can stop the scan
> before reaching an idle big CPU.
> 
> We've discussed a minimum scan budget and accounting for idle CPU
> availability, though a small minimum alone may not fix your case.

This had problems in the past when Chenyu was iterating on SIS_UTIL
where the search opportunity at higher utilization is actually very
low and cutting off search for !idle core was beneficial for SMT
systems.

Now, for systems without SMT, it has its benefits too but a system
without SMT should be equivalent to a SMT one where test_idle_core()
returns true always if an idle CPU is present.

So I'm wondering if {set,test}_idle_cores() can be extended !SMT
to act like a gating indicator to say if an idle core exists or
not much like how !get_rd_overloaded(this_rq->rd) serves as a
gate for newidle balance - it can be flipped to true when a CPU
goes idle or if load balancer sees an idle CPU. Thoughts?
 
> Given both reports, reverting the commit seems the safest thing to do
> for now. That would restore the previous asym search behavior and we can
> revisit a better consistent strategy to cover both sym and asym CPU
> selection later.
> 
> Prateek, Vincent, what do you think?

IMO it still makes sense for SMT systems since capacity on systems
with SMT only makes sense if the entire core is idle and then it is
just a best effort thing right?

set_idle_cores(), would flip the flag as soon as an idle core is
available and after that SIS_UTIL is bypassed. I don't think the
SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
sense given misfit penalty is much higher.

-- 
Thanks and Regards,
Prateek

