Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6036999D
	for <regressions@lists.linux.dev>; Fri, 16 Jan 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583460; cv=fail; b=EfFbJBiRhgTNswtn3+kQqOg4SSvUS/diU3RM5LOCcevWiaYDbJLYzyM2A0Jz6lo7Pv0uWqmKks7fxc+EyRyodTYrR+nPSd4iGR3F35jQv11o9+6b0+u6/3pTsSEWz0i93f/+m+Tcx3buvn7IEpvETn6GXsA1qqWVhXOKA4s725U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583460; c=relaxed/simple;
	bh=HfO7xK0cQAC0tsfoumnVPwdMNYlT1wr4hLw/lrQcG9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fJ/IyKzHzpKDPfpDCQHi3cw2N6XabpsGG/OSJ3g+gBRt3rFxs4SGA8j0BaXpR8lBtH3TcK7qs9gRYcq5OM3/MjmYLUPitnRAvGIgtXnj3SujOTmuvDxmxy6Nm4SIjh0wj3iVLc0E9i1/yj/ENrYDVisOYTjbQw0KdHe6iv/SaAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xsaq22rG; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xsaq22rG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3mS2IC9RZIk6X+CXiDUwNbeeOsSC8m3kTLxXdOwuYXO4aFlEOhEp29OnIiKkX1tWJW4eqzSpI/Rrvet3G1UrlZravkuC2iRSjLC75cTp9/WRJg9t6fJxxeGPv6M+Hp/u2KcjhqyNdHUwz/DcOj/v55uA+ZXuaBhIeObhI4b73hkMoaCs+Kjk2y0Jh8+c6QrG1XOjnDyXKYk10VsN0bPfqxnZqf2IiAKq3ziA65gNXU0oLMTg91+g22k1WclrE9W10zcemn347ndMn3JwuC5mor0EdAgI/N1n7FCTgseeKKFgeDdk8m2VDlgt7UyEwOK7wf3hf+yjsW9YoAYz/G8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONxPRUYNx4yzclBMxe80SIGes+ArcUajWBi9f6wp1Fk=;
 b=jozKM2fkpQBQy3Fmh5A18xBUhpdbdoze8Hd0uAjtYOLvCOfF/Y4ffXXFzTt/4juI/O7RtdomJWwEuRukaH1K39Z89FL1U515rkaoy23PqOuDHhlWK+NR+ikPeNHxntcjM02PxSIVxtG8GSB2hHEsG7htpAFUZP+UseRYlSEE8BeogDgI7dDVKx1dHZ/aWASHjJ29YJUKoBQhIJiAQz3IWlWhsOwFH1Ois/9umVQH/Kn2F+LEjLpYrxtdgGx/FxV1s4Y9xo1VIlA8M2PYhuiYkncISCLVZa0hAo4moa4BMLVpFsf3JyqmUolxvk75EjxC3aYXEBt2oUK44+kCtzct9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONxPRUYNx4yzclBMxe80SIGes+ArcUajWBi9f6wp1Fk=;
 b=Xsaq22rGDNP6VK3jjlz/8F1gpaJ5fOhkRYZypYzqIqjwfHkiFv4QwnuC/0b8079RvMgWWUzcn4yPSe6A2GT0rzOXUFg18LBnegWzqDtbjE/RvTEsBpf0sLhElnS3OCd+0e5MGxqUFABOcSHw+PfaE+IachHH4aOjyJHFCLBeD2pQ/ktf7Pzp5g/Jcgcj7DzLLxkHRdE4uIOyQ0dulXp6VlaOvthxymJaPheGDsdA+xSo0zXXL012RE9xZYuwQGns4hKz20+S3f9+xp67oCJ90/7Tkeh7LcP0hRK57DGz0eFYeR4u7xXYs8Z4zWkMO4kYd4TKd+bPkrig2My79Wz2FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 17:10:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:10:50 +0000
Date: Fri, 16 Jan 2026 13:10:48 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: imx8 PCI regression since "iommu: Get DT/ACPI
 parsing into the proper probe path"
Message-ID: <20260116171048.GP961588@nvidia.com>
References: <a1d926f0-4cb5-4877-a4df-617902648d80@green-communications.fr>
 <eb94b379-6e0b-4beb-aaa7-413a4e7f04b9@green-communications.fr>
 <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
X-ClientProxiedBy: MN0P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4075de-a5f3-46ef-5271-08de55223233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fvu0+vtXR5Cz6vHAN2LcMBKOXH68se1vDeKV4I6UeN0uvWcCNmSjFZF8rFMp?=
 =?us-ascii?Q?0gwkoiaKdi08Wi6ZKqahYAfTFMrl/e+0oDGmFmG+OlZL+mBxutSF7Uop9jAl?=
 =?us-ascii?Q?VVUIB5Eq1me8d9bsOIBfKPcJlEKp6FLVwRjpa5/452kjn/zEdbOrRHmvvrFP?=
 =?us-ascii?Q?KpeVs0xUXPxILWFMbs3OpKwU9ZXbYUVaUXyGAJVWR+68phm6YPs3bqmYG/uA?=
 =?us-ascii?Q?aO3515e7IITTf0YietDjaIGadd+2JXpy8IZJBTJ2P0S+5hA+n1kJd27fe84f?=
 =?us-ascii?Q?Mku5vRa8pFyxf/MsPAQe+HbYjo5SpWKoej4TR1b2q1BoVS21O4k9/zyKqaBz?=
 =?us-ascii?Q?Kf+y9e71OHJRyaIxSjTKS5oNceOY7Kzd/KadI6PqOfOAGn1y1eFgzDjsJDuO?=
 =?us-ascii?Q?R01dNtsHeduwgnGs7gb7xceYmkIpC2dMvwDp9aczzwL4JR0ow2PzqfcoD+Rq?=
 =?us-ascii?Q?qMwcf0XwHwkrK6iJsyarlGNS6dGkMrhY830EYaBLjq98Hc9qG0FBIewXgpNM?=
 =?us-ascii?Q?hn13Ak8XF/mhIXmqUvLVBMENmWGDFWQVy6lJ1B6n7P1q+2IaukbDMawu+T29?=
 =?us-ascii?Q?eLfW/JpGilol5Ss3T4JHWkZZfNiG4uT9CsiBjlp02JXX9J8N4MUmeVBOxIiS?=
 =?us-ascii?Q?XH02j/v8nQXqdWbYHU21GUt+jA2qvr7QjRqEqqAnlvpzxkHGKbKMGA6cSNgc?=
 =?us-ascii?Q?UJ3fqpkQX4JV5FsXqVHaFW9OMO2jLjFc7WehVnYJxqZhEJrwAK5KdmEOdKJ5?=
 =?us-ascii?Q?YYdBwkhRFU60Quz9QT1wpOtlqxSLydfoDtfYmQ9H0t8axasBNsvUiN+0FWGa?=
 =?us-ascii?Q?2UZ0BJZd0AtBMGvo9ubxZwnLRntJwDImLD36rHWQW5+jPvrAvBr63sTIPYIf?=
 =?us-ascii?Q?hkyAcYAEYDxuJ3AHiMAsUeRIiSE0SbNeDMqxNPVMs0XYx2N2w4WVR2+yU3mz?=
 =?us-ascii?Q?44Pix5Rayp+rgQFafdbvPm2cf50C9F1ZwmQrr3S+QewtsZcCLHcssIcp/SJA?=
 =?us-ascii?Q?89WeNgITGQ6wtI24MsE48Zn120QDRUdoSsqag327s6KBEvmuBfugCdtPDp7S?=
 =?us-ascii?Q?JpUsLDoclOQ/tDkdmabLYjJeHr7JcuXU+691mMxIpa9kK8hp/D4nLWOV9TWR?=
 =?us-ascii?Q?RBxt/TkTOvvo+WdwcNV6Gv9qaAuwbtDJZwK/2WCIYKA4GfD/LBQG/w4wBfb/?=
 =?us-ascii?Q?4290cb4u8Sbw864yruKseW6CL+9a+Y5jhtaY+N1EBgs60h5jjZ8P8CPILBvK?=
 =?us-ascii?Q?KuH0p/BLfwphd1Qhz6s9fPfM3bDkejjX8vyuBcylfbRFWO3FiIdb0DmfA+2P?=
 =?us-ascii?Q?C1c4SJHSpJ9xov932hsL1yy4tKw6VI0WdsKhPcli6TpvcdzS1uJ2ub6LvNcI?=
 =?us-ascii?Q?Abj0ptJF1TH+rJOAfmFpSPRrr19XWlGYAz5/9dBW2FPqxce6H1gtDDIbc4Z+?=
 =?us-ascii?Q?5sZu0pKY9EMXhUdLh3i5eiuoc6800M606hp3phtb1gmgCf7TjNZpb4CzySc9?=
 =?us-ascii?Q?wm4kR9lRVR2HRlJuR4j5YmtMNzck9pH5ImKGshoIGsxPml1v090qtVWn7vxw?=
 =?us-ascii?Q?X7aXXyHeEL1PgECCPWQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbzSyh2pofZHVWi4r75CGJEsub4k57hoyfiv/C5aNmRfy4JgS84f2RwS28d9?=
 =?us-ascii?Q?aNpreETjIwK9hKDu8RbgX1WKj/y5ZZSbtW0ijNFqEq7losAbJmF3spSLl5JG?=
 =?us-ascii?Q?MK0OGKCO1hDQ9shwVYj6RhzshDyYy10KlnjgOGZQPJiSkrf+V9u/3Aw5pbt5?=
 =?us-ascii?Q?otLsxTsg145gByynzcsTY619y9/rvJBRQP9xof3Q6fqCN6YrqbkDK2NoP4HL?=
 =?us-ascii?Q?o+QixmHSzr+kkQ+TJBmesddHEkTdzDKZOaM1QstxojHZmSpygclg9X71IlZC?=
 =?us-ascii?Q?1itPnCAkk5AULr/umDLrJyrBt6pG3ClyFBMXR6FCpnLUgSsZ0FtKAqUQ0KVa?=
 =?us-ascii?Q?W/tZztPzqOK7hyLQLcF8kzKdIIoCMV1mcUigSF6WjmVYb2OzILgFhORbg7MA?=
 =?us-ascii?Q?pkhlH6SGcfhUgjPOt8ZHMZCE+plT8Vf2LdtYEbfhIMtHK0XmZ/njgIren7uI?=
 =?us-ascii?Q?Gn6sK7ilu7Ekw1hX1ZuyRLl6pE9lduwNJX8DSeHtNO7FS+JoZ9TXiF1sjbBj?=
 =?us-ascii?Q?5zaLYGNkJACMp8I23q6RwwV3sGrtLTMOiFldyNzyAfecry9gbZL0YhyQ4Qrm?=
 =?us-ascii?Q?Xbm7JsM4QFxtPr3VKw+QOxy2UYFs6FwbsHTzaIRFTLMp5Q1Yldfn15iDDOge?=
 =?us-ascii?Q?z1v4mbQA8AxJGwQZwI4ExRG+Qm4eBBqo5zLqKgwflRi1ViIhd36h/hibzJB5?=
 =?us-ascii?Q?Rksna2MN3CahGghKb9lS6Kr6AGP4gUHLBq1B6TYkwtvnphFpecs45Q4OeUJ5?=
 =?us-ascii?Q?yDheM4PhPSl8kaZ8S/jTNlZQWJc8nraa2GsPauRQBltWGv9lnYTXtj+MuEXD?=
 =?us-ascii?Q?iI9pjaM7GOqOd9xA79P4fr35Z45btkNIOtTj9WbawZO695Sa/XNYuXKKD7W8?=
 =?us-ascii?Q?WLcVBVapDPjvMqxn8MrRxJwiecOAjE0cfZdb3/G6xxE9Q072uBYksU6bg4ri?=
 =?us-ascii?Q?kHaZB0XiJ7Whi6DSgT/7QLDspXTIMAI41fHfB3RHA/Grql+xRB5AunwQXHG+?=
 =?us-ascii?Q?6zC2gYBfw1vitYpA07Huk3vjKdD5LsBARz2tNzoUQrn36NDYLhOR5lOcXV/9?=
 =?us-ascii?Q?WfZgVRvfVhJ5mCiHA4nYVObYfjF3n3eRmOHqGDjqGdpvdG4AMui5+yDkuIqY?=
 =?us-ascii?Q?MqCaMR64ULPxl5UlSvkN8GipO8Xmj2N9X1qgXY1XaLNSbniZ8zx3l+qlj+G7?=
 =?us-ascii?Q?Rl0d3MzQXIgJw64yCHNPSqLzI7BQ6545Q+Ca5gn8bz5+iYvf3qN5k4AtVgrO?=
 =?us-ascii?Q?4Z3LyiNg1JOvu3YRwD8o617iUYP08yX0NsXpE8YtjTttrHzM+XF19zB7oMp7?=
 =?us-ascii?Q?8GXZ00S7upYSJMBb1V4csl5fgoVUK/QKCoYFtaOPhmWNxkdispVbc9yRbniz?=
 =?us-ascii?Q?36a8gFVYRQ4g7Xlr1vALszdba7QvxrUT+WOGchlOjwR0BttqLGnGyKtVhmTN?=
 =?us-ascii?Q?UKheuhN5LhOlzj76JIj21hTZFboN625daoE/R/DXTomysGcWWmWVHyqRQDNk?=
 =?us-ascii?Q?b5L7zkjr7MTO5yrMDy+sFrpGOun/H8TgLvbgi/o4dvEjO1TSqGLfGNGyeS2e?=
 =?us-ascii?Q?USxW1LZrNBQuKb963nXYu1YPeUrX7+4O1AbIsueTiCupVpna0xyd5e0LcMfj?=
 =?us-ascii?Q?oQQhOoEE4wHJ7oMCVUprjY4vnJzzkYvYkD+k+H8ffEm78Wm3ZZHGAKfC7sda?=
 =?us-ascii?Q?gnk2V9HQdCS/9S0J93LOQAOMu9gyl0JQS+xqDzSwllW0czpHbowEUUQqFrr6?=
 =?us-ascii?Q?UY9TXXj7Nw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4075de-a5f3-46ef-5271-08de55223233
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:10:49.5385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/5l964KdFBjpuc8pWiqXFxmeL+KLF9AisNpedoYhWvf9ZMWtHS+9nYC/DmB7JvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D

On Fri, Jan 16, 2026 at 05:52:36PM +0100, Nicolas Cavallari wrote:
> I debugged it further, it seems to be mostly a PCI issue since the system
> does not actually have an IOMMU.
> 
> When examining changes in the PCI configuration (lspci -vvvv), the main
> difference is that, with the patch, Access Control Services are enabled on
> the PCI switch.
> 
>         Capabilities: [220 v1] Access Control Services
>                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
> UpstreamFwd+ EgressCtrl+ DirectTrans+
> -               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
> UpstreamFwd- EgressCtrl- DirectTrans-
> +               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> UpstreamFwd+ EgressCtrl- DirectTrans-
> 
> If I manually patch the config space in sysfs and re-disable ACS on the port
> connected to the LAN7430, I cannot reproduce the problem.  In fact,
> disabling only ReqRedir is enough to work around the issue.

My guess would be your system has some kind of address alias going on?

Assuming you are not facing an errata, ACS generally changes the
routing of TLPs so if you have a DMA address that could go to two
different places then messing with ACS will give you different
behaviors.

In specific when you turn all those ACS settings you cannot do P2P
traffic anymore. If your system expects this for some reason then you
must use the kernel command line option to disable acs.

If you are just doing normal netdev stuff then it is doubtful that you
are doing P2P at all, so I might guess a bug in the microchip ethernet
driver doing a wild DMA? Stricter ACS settings cause it to AER and the
device cannot recover?

It will be hard to get the bottom of the defect without a PCI trace

I don't know why your bisection landed on bcb8 - the intention was
that pci_enable_acs() is always called, and I didn't notice an obvious
reason why that wouldn't happen prior to bcb8.. It is called directly
from pci_device_add() Maybe investigating that angle would be
informative..

> I also read up on AER and I'm surprised that I don't see anything in dmesg
> when the problem occurs, even through UERcvd+ start appearing on the root
> context and AdvNonFatalErr+ appears on the switch.

Though UE and AdvNonFatalErr sure are weird indications for an
addressing error.. Is there some kind of special embedded system thing
going on? Vendor messages over PCI perhaps?

Jason
