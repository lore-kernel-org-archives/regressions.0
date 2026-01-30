Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB22DEA64
	for <regressions@lists.linux.dev>; Fri, 30 Jan 2026 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792475; cv=fail; b=KdhKBZdK7ItWLJYuFGTwhzqMe6tAOQRYdyVpifw5Tjw4NaNlhx1mXcJmVKcleSAn7bDt6JYm7uEQAqgXpiCul9dKkuatxNqXs/GavWfNOIDAEpl1MuoNNHIAdNOMekJLhIHSxE0SS6JOMQQ1TmJqFTGQb7BewChqPOz6bg451ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792475; c=relaxed/simple;
	bh=FB+ZbrJ5sLKrmPxNWsPcNhxzWHbC6GpAVkTndQQXJuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qvxPa52r5mmCeE4AFfn6SDyfHdJhvKHfqdO1JvaJ3Vsn2UoZxuw6Xj9YrYSoaehojNsbX8aRnsOvMQfzBKBDwkaqjtypRbVChsrKB1OLR2nJVZkCouoXK2Mr8k+9shVUIVGNYmoFebMjK55EfLN4IEaA9FOx+6BaxE8sXGUVUgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lm9NlqoP reason="signature verification failed"; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lm9NlqoP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KimtsFfcUcJI1C/jSsiXSBqeBxUPEo5AT4UR4rRKAaCmxo/Q42GDrVY2rPHPzURyUhkNNdtoV/wd4hUKrGuZCrFObsxTnAExYhB63r2Apy2J/qlWD4UY9SUZTz4sX2+/eywh9i6BxkD2x1agxDV/ZepHy3e4C8vHs/wUQeNe2wbnKnpMuO8yXwbrU4HeMJhu973hzWWaS1U5I8aZXaNq6spvhNtSDkMIrmrSwHNyBdbK4jbYcOhc0kB/rg8NL99/u3fsVZxNBOyC8hIPawPL+kk8ezKGyvPzyQw+4HFYPvxMxhb+HKEYaKkBfUsa5qUdyQwrrFCU8AcY+T4uvAj7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfu5LjORAmcUs2VQ86k9IVxWOlBHaGlN0E4j+WJwvUA=;
 b=GlRRqmrZEKxZsTiEqqlx+QYzgFpBsQuGjRP2sBpKySpYGuZvb7h0n6ll1avvo4BAtMh5TQBsh4BTy3e7byyw2E2ee6pdP9Qm7qtEss/W7kye3jDg7NqKoGkwIpLEKy1oLFMiTScQ9+eQuQQdPjaUpfJFb7/hI7NGNiOVU061nPeNNrBVeUH+CXAZyU9hh0KHMUbj/Yd1WpVaoYYBWjay87SYUyW5lTgtaAEhMGLy1FNVdnYY0gTI0/mjTalSRAm8AKzPhwWQt9TpmC5TMw/BpgyHkDVCdCdfh13mkefOiDXCVc2xzp1NNaU/n+2UPj4urksaXjnSV8fkJyKBEkEkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfu5LjORAmcUs2VQ86k9IVxWOlBHaGlN0E4j+WJwvUA=;
 b=Lm9NlqoPfbb0ZTxS5qjjK7diav87tzipjNNFVfCPg8ZccQxoVvOLfPN4TD8cuG+uvwQgjjKWusqp/6kgxiA5r5VEoEGX+bB6+6Xma94j7nI9XzGTJiFvOe3MQ6vc/4HTN7yaWmGyvvTmK+o7LO2e1JMnku8gklMmPmIQoCiHisM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Fri, 30 Jan 2026 17:01:10 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 17:01:10 +0000
Date: Fri, 30 Jan 2026 12:01:06 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260130165953.GA1618638@yaz-khff2.amd.com>
References: <aWWZb3eRfQdB4OsI@mail-itl>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWWZb3eRfQdB4OsI@mail-itl>
X-ClientProxiedBy: SA9PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:806:23::9) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: d603d23f-ceee-42cd-7749-08de60212ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xrP5KRl1PhP/vU5DACkj6VPbARMlKGMd/2jFgILySjTC82DvAmVMQRcWi3?=
 =?iso-8859-1?Q?1Z5SKkBHE+0esgtodKFO3gQW4DjOKhNILFx6/u1EBlexkAOtOK25kXVDDC?=
 =?iso-8859-1?Q?1dH3SUyhngX6b9/2LznXu8q4AK5cMEfdz7Ei5bFMXeTGzbGbJB6tqcxlZg?=
 =?iso-8859-1?Q?FvW0n7avP6Y17bkP3H4n88CzEv9KYVuBHQW+nW1wjA/LtUy7iyZLjSQInl?=
 =?iso-8859-1?Q?bI0u8JAipaRN6LWgsaFyj+RHVrMqPnNpTs01AnA5Vtm+vH0jC4fFsLSJg3?=
 =?iso-8859-1?Q?OPmKFok/31QVLY3QAcZp4/uGVIK1HA/+jrO/0ocoB8oX8t85aqxMe1hH1W?=
 =?iso-8859-1?Q?TKoGN9zo3kZ4ny0ulTiqIgt3DJ3U9x/ZXCP9038kaGStpcdjwaVnEglDtd?=
 =?iso-8859-1?Q?BmXvOnDqwkf2ZrpWXHFVshRY7t/UD35pWtZgagvbPp3LbzXcVSNZvMoRfd?=
 =?iso-8859-1?Q?D6FoiK2pCJAaNZvkVAIWEfVFycIyw5o5fYmJrXTjcY40q7G+3IFNwEHLlj?=
 =?iso-8859-1?Q?TJdYuz9LAx/ADMEfUwx1uboGEPMWXag+DSzDIAPVuNa8UInKRlExMkID4p?=
 =?iso-8859-1?Q?mgf5gkahMTX1n8dCCxwvABKXaXyBXdyvXhEkKapMWO4RzCd+o7qPkzxkC+?=
 =?iso-8859-1?Q?zGIsO90J5xIDu3FGtMqllsBXgnG4zzFE+FRl28v4OXqolS4OVzR6mR/sLA?=
 =?iso-8859-1?Q?qL3cO26OSYl9uM9NDzyYGibRIsx5MkIxFnqkvoDak8YaIr+QFQ7IbgO3pl?=
 =?iso-8859-1?Q?DyuyP9MRNvhY4jzxXSdCzx7v9AZ9yjnFXTUReWBtmFpYnEM9p8RS/cXpQM?=
 =?iso-8859-1?Q?8i3Z/JPl4nNOcfYd8gO39nfosRDnFkJADiK0/lUDjdRDSFolo449/IAIR3?=
 =?iso-8859-1?Q?wNX9ZIq5tW4ji6mPcbUgX+2Gkj0T1tUGNC4qJU+Xe9QtXYXI23aU14zYV8?=
 =?iso-8859-1?Q?saJQXkPL/nA1XU5mem81K1lhh7Eh0qMTYTj0nj2dc1W/5WEbRnxhocOcK2?=
 =?iso-8859-1?Q?hf1SgSdX4ppsL9WVAeuoTlKcWlPB28lqR7wMOJ/fTO5QAhQMyOXV0cqCQj?=
 =?iso-8859-1?Q?xDDbj3xIDxi0r+Z//ZB1XmrNiVwx9IPuat99CKa9sFwaxRiI0e8UKDv39W?=
 =?iso-8859-1?Q?OMqHqBLJkzDTgE4NXzwkaWgJPD1a5RTwiEjtq2j5A1yOmwBB1XODskkQ6N?=
 =?iso-8859-1?Q?olP14FszJzezJQkQcFXpsfF2fd7LUHJqvQyRGzY+Tu2rn7elEBTARD4lat?=
 =?iso-8859-1?Q?FhS2HEpic1T6oxnp5DwVjWhAtmgKm1PkWEP/iNNm2QBuQ6HpMvXEAOQd8Z?=
 =?iso-8859-1?Q?YWy/vDsJOCLUty4P71Pbu0CosdsVSckxN7WXqCpKzBctNmBxQ9jVDleyXh?=
 =?iso-8859-1?Q?osEjPDTVlL8zxaBpRWy76J8956HZ74fPtEmcTBG3nOEEmjZdjwtg4PnmId?=
 =?iso-8859-1?Q?R4oE5e6rrvyhwNbzWSQbCoAGyvbDvtCe86xeoSnLGi8Xqa1BPl4wrtAvcV?=
 =?iso-8859-1?Q?NhPQT/wMC8kvropkL4QTm90Fg1bnkrQ251QwWSd9MhJX6JYKMwz4/zcYLm?=
 =?iso-8859-1?Q?+rlnM/skIp0Dzyk33mPt8YYKCPWL4bAWZx2QGqUcIKjZGRLWEg1d0oEHKs?=
 =?iso-8859-1?Q?RQc3rxVMEAd14=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SEAJR8QuM5PK/XpRKwwhPxuBLfg4lFah4h3ygaxrGfq5FJ2AOQ0t/aH/sV?=
 =?iso-8859-1?Q?P+m+6ry7O3LQV1t1yULzRtYqmzfpHJ9MM8P+G2b2Tq2vrSRWdcQM0YJYYm?=
 =?iso-8859-1?Q?qEIACL63kvtFBkdtL3THQSVktrFjBolLrej1snKVm53BOsyGhI0lPlM8B5?=
 =?iso-8859-1?Q?QhIkNPi9rZuFJWEyXUyUbEn1W8ojsrz/uTwcJgXrBkRtDdNL9y2zOygI7r?=
 =?iso-8859-1?Q?f+vBo3x9aTRPV9b8BGY/6qhEjX4LcMTqyfNjj0p5UYJ/dvQgB/xhvdB+ui?=
 =?iso-8859-1?Q?E/+hRDUxxGJlAtP6Zir71FdDui3RuZRHOy0QWZbvWa7rC55EPf8iRjKhSM?=
 =?iso-8859-1?Q?fdFRsoKR5zLFyBBHpeIMEWIx4+x+oUiFrs0jNBecNP4N5KbGouKBubeugy?=
 =?iso-8859-1?Q?3ubNf6GguFKaFBBmOh9qkCPBJgjqT+2bIWJB8O1qMjNhRoxGL76W99GfNH?=
 =?iso-8859-1?Q?w7rnS2I0EhqXKrpISKCF7qXwl3divAY3S7KIAVc9UUnFD+xl4zpNlMJDuT?=
 =?iso-8859-1?Q?XmBbGpQm4v6SI3aCGZF2pBesFrSyO+GfXZFGq1ePUpZWpLJ1phTOgWn5JJ?=
 =?iso-8859-1?Q?ZS/0fsqldx6EMheRwzSs6UhSDOpHJqYcUIkThRAoNDFLpEQOO0gdKypB1X?=
 =?iso-8859-1?Q?PmNmBH/tDK6H+g94QrCI/ngcVcwiTcRSPy2wKzWvDb94nDeVlD6WmCeb8+?=
 =?iso-8859-1?Q?/HFlfZNqv08KKRihDwCacyqjmW8vgZpz1bifUiScQJci3AqSdn95PNA9qY?=
 =?iso-8859-1?Q?CgXG0wkBkMkFkPQsfvPSDbl3WJ68UkxOANvTDJLzjUdX4Yfr+epTtW6XFJ?=
 =?iso-8859-1?Q?qRCtpe9IV2qu7VyosRY1UukyaDAtZdr1mE3acmu+ecQbit5XQS84iqVvRz?=
 =?iso-8859-1?Q?WbYUKKoeyw0jO/sHZVa03RHl2MZyMdTSvVJe6S7m7LB+6zVRO+HMy2SKSU?=
 =?iso-8859-1?Q?kLt6Z48gsFCWyXKSPYTUIc8ygc9YIp2FqaZx8w0z7CCqnD7kEX4OLRrpBd?=
 =?iso-8859-1?Q?XB50wkGZs6yo2HpsGx+a6LXYKB/kFygoL75JRzlheGbh1gXLT0mSiOKSOJ?=
 =?iso-8859-1?Q?OK3pTMtZySoYpFwNjy19olAI2Qzp1WP2g0qVElwOWTajVI1fnNgfXGVLhr?=
 =?iso-8859-1?Q?lWcN5WCMliqRL3J7HziD4I8isq7y0pYZjAWIgZpzjXnRhzP/KS4U191XEj?=
 =?iso-8859-1?Q?GdIo33eGzm8zNggBrq5qAfEdZi33RmDROGA6kgC2ZyiHPuEQ1lomSW24pY?=
 =?iso-8859-1?Q?/pVRMgg6pk8thwuutB7K9d+1qizBgXovw4wYhKyQHLQYQlbqc1185RLovP?=
 =?iso-8859-1?Q?lRpEf04XGNbL1fTeNSdGoirU7U33mzfSA3cBZ/vn2/k/6KiLVuCd7lkZXp?=
 =?iso-8859-1?Q?SdEhg3XPcGw+B7JH/9tzbsKKTPgGScI0a7CihKl+RmFUHV2EkufqDD/bRV?=
 =?iso-8859-1?Q?/xXgp4OukFaEC5GDI8INA3tyT5UMwA8MGll2JDbtDZEKu9Fr3R5aHQEVr0?=
 =?iso-8859-1?Q?ub/PvO4TfwfZ04NxnYqD8W0w5PMPJtv/0bZqygmSFLSFC1X1KUm82GKkV9?=
 =?iso-8859-1?Q?XB5cUj/TuvQcS4uxC0F6+YjfCJDFzTOouiwm5syqaBQud9cd7hB0A6BdWA?=
 =?iso-8859-1?Q?rCiikngfnRyIErftaP++jYMM0nWptzpqMb4uBuOq2mm//dPqoXI81K0M9W?=
 =?iso-8859-1?Q?1AOmelFAa1xDKWYk0i5aH5iavGPbHGIVWfjaJzdZwez8cWaK4CMINYhn4P?=
 =?iso-8859-1?Q?tfWBGUTFz8yD6effaY85VUPK21nl8XiFc3m+Z+ViNGHBqZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d603d23f-ceee-42cd-7749-08de60212ac2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:01:10.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/VU7lB1yR1ZYTUC7Wa7+/kbmD1FAG6qvBDtFrjdbu6XxNjIBw8+EH4DL4E5LedUU1wb/4dejiitnfLMJTW8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

On Tue, Jan 13, 2026 at 02:01:34AM +0100, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
> with AMD Raphael/Granite Ridge USB controller passed through.
> It worked correctly in 6.12.59. Between those versions, I don't see any
> relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
> but the AMD node driver did got some changes, so my guess is one of them
> is to blame. I know the good-bad range is huge, but there aren't that
> many changes to the AMD node driver in this range.
> 
> It's running on Qubes OS 4.3, which uses Xen 4.19, and does PCI
> passthrough of USB controllers to a dedicated VM (HVM).
> 

Hi Marek,

Can you please test with the following patch?
adbf61cc47cb ("x86/acpi/boot: Correct acpi_is_processor_usable() check again")

This is in the TIP maintainers repo and linux-next.

Thanks,
Yazen
