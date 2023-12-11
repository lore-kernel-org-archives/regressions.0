Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2118.outbound.protection.outlook.com [40.107.241.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65A15AD8
	for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="i3MQsu8v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCA3lafmCib8XWOD1sJuKXT6rrDEXLuLPjZrv02Bl5tDDQtOHbI52cgZePwk7vRByYBnsA4t4dS7BX2cfpTflVqYGB34o+eUhgiuKKQhTAj+KvkUsTiPHpItU1aKk+DAQTJBOF3uQzKWvDsDhNoC5I+jwGDVTnCOYN2SIBe9B9cw3dbNh2PX0IDBOQX/Iy7KFCfSVtnW1Eweh+6yIsdn93QnjpHXYyNZc27wD7bAarrMLsXxOPsUh1EslPNtufcOuH5RiuTKF2CdSwLYJaICHgKpMP1dETWBJe1ibM0NRHvFiHoTj+3yNtzvrDEJ7loDEUIMz5VjEJ6NdB1tZal6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJTbgcxOBLnr+PEHP/as+F9Gc3EUlAexdYkxXuHNN6s=;
 b=LD2KONz3EpM9b5yJBz0QxgNkH3+OPKztvqHGpz6aunpfeJte79a+M76luzDrzyj9hqZ4dLUli2CCqHyxj7qtdtBYPtun/vWgiMzkc9soHapcgCBsIYYpOQj61hf7aXbz8LwjypTL9yS184bsycyJNw3jvj6ux1pEbXMpRTZ3iOhmra8i2qwqVebedL5dG82ZYDJ0/oAW51HpswUrjLiGJ6QNZ068HLnw2G+92ygiAA0IbVuVYg/pE4wvG+xA6Wtqp2Wj3be6Om3Ua/Ffbm5EeblHqi9UeAn6F3BRAg6uJ643HMmHdy3EMBau6olY7hEVrtew+hYfu5MetFL77/2QyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=rowland.harvard.edu smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJTbgcxOBLnr+PEHP/as+F9Gc3EUlAexdYkxXuHNN6s=;
 b=i3MQsu8vBhaLFWE2EuwrM5L7LXLkAEgOBtb3MdlwRsCnhrjJkAyHMVaLh8re9jduu0Yckaes2JCgmuAI5JQJvF4eM3OJLnbFP+4Hd/i662bfD5yoAVvGtg80C9rC+t2ZyvoVz0jp8CJgcBtHuUySGpq5honawjlZfVEcaPhQwc8=
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by AM9PR07MB7970.eurprd07.prod.outlook.com (2603:10a6:20b:307::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 10:40:39 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::a1) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 10:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 10:40:39 +0000
Received: from n95hx1g2.localnet (10.30.5.31) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Mon, 11 Dec
 2023 11:40:38 +0100
From: Christian Eggers <ceggers@arri.de>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
	Oliver Neukum <oneukum@suse.com>, USB mailing list
	<linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: [REGRESSION] Re: [PATCH 1/3] USB: core: Unite old scheme and new scheme descriptor reads
Date: Mon, 11 Dec 2023 11:40:38 +0100
Message-ID: <22131556.EfDdHjke4D@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|AM9PR07MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: dc83acde-2116-4825-5305-08dbfa359e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgrF3xqvN/tROl5ISlrGaVAcgzLE/9ItjQFwiLVOG90ajSdP6+GCw5ePlcaD9VVsA7FWxb/3TIxLgIvxpiGMlZNIPXy2/l6Gq9gokVcl4Uj7oGgONLxKJZLy+IbwmFpiQYxmMYwm7DfBSr7W4N2urZtySQcSXclk+3Wgo7/LdclforaUnJuP6Pp1AxoKixrZmi1wzzxRrlC7ovkmSR8JpNhFPPQBqbYEXoxxUEeJAsX52398eu+LF6ZBqnmavFpKUz5d3MK2PvXC7AVWrSb9Nv7WUjZbYl0h1xhZO9V5k535K87ttRiIn+NwQbwKDOTJZQJ3Plfh2F5fIyd9noDgbSDPSKpW34smqaucajpPbVaStyBWLMSYPmKe0RI4fy/9/gn1YLADNVUp2f+nx8ouEuAcE7rWiWo6PstnJlKlGXKjhq3w20yH7Pvay4q6d8eIwBF3v1LtFjjiM/aTr3q8m/XXAyfgihTolIr8mHNUUcDZkuxAGtJOvcqe6ywKVh54VhmbTImiHkcesiwez1FGZrqmanUyzRdjUi2dq70HC7RSjTwBZ5f/XanhA0bLnFXw4qXhMNN+r1AGlKJ+BDD4rfqFBTUhkq2OqmDWKjlRPHq1caEbDzplAkeqtl8sBf+z0XZi35FMYbFLFGgO+WjCEMSE4RwZDic8op9XvVD1Y9hAIBcXFYE3CzlGc0kf68ITpQW7wRdf1XEhnOvpu6bpDxNgPomiPvteT24QMxFVl/wPhDPFTPfESIsbVSN23PAXmetdoBPlIhAjCPLxA7Y+2+/pPffcZBRa7Ai7TlBg3AUUZgxwa2ERQpwZX4HHbrlE
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39850400004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(46966006)(36840700001)(26005)(16526019)(426003)(336012)(9686003)(36916002)(36860700001)(83380400001)(47076005)(5660300002)(9576002)(33716001)(41300700001)(2906002)(4326008)(478600001)(8676002)(8936002)(70206006)(70586007)(6916009)(54906003)(316002)(82740400003)(81166007)(86362001)(356005)(40480700001)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:40:39.3988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc83acde-2116-4825-5305-08dbfa359e08
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7970

> In preparation for reworking the usb_get_device_descriptor() routine,
> it is desirable to unite the two different code paths responsible for
> initially determining endpoint 0's maximum packet size in a newly
> discovered USB device.  Making this determination presents a
> chicken-and-egg sort of problem, in that the only way to learn the
> maxpacket value is to get it from the device descriptor retrieved from
> the device, but communicating with the device to retrieve a descriptor
> requires us to know beforehand the ep0 maxpacket size.
> 
> In practice this problem is solved in two different ways, referred to
> in hub.c as the "old scheme" and the "new scheme".  The old scheme
> (which is the approach recommended by the USB-2 spec) involves asking
> the device to send just the first eight bytes of its device
> descriptor.  Such a transfer uses packets containing no more than
> eight bytes each, and every USB device must have an ep0 maxpacket size
> 
> >= 8, so this should succeed.  Since the bMaxPacketSize0 field of the
> 
> device descriptor lies within the first eight bytes, this is all we
> need.
> 
> The new scheme is an imitation of the technique used in an early
> Windows USB implementation, giving it the happy advantage of working
> with a wide variety of devices (some of them at the time would not
> work with the old scheme, although that's probably less true now).  It
> involves making an initial guess of the ep0 maxpacket size, asking the
> device to send up to 64 bytes worth of its device descriptor (which is
> only 18 bytes long), and then resetting the device to clear any error
> condition that might have resulted from the guess being wrong.  The
> initial guess is determined by the connection speed; it should be
> correct in all cases other than full speed, for which the allowed
> values are 8, 16, 32, and 64 (in this case the initial guess is 64).
> 
> The reason for this patch is that the old- and new-scheme parts of
> hub_port_init() use different code paths, one involving
> usb_get_device_descriptor() and one not, for their initial reads of
> the device descriptor.  Since these reads have essentially the same
> purpose and are made under essentially the same circumstances, this is
> illogical.  It makes more sense to have both of them use a common
> subroutine.
> 
> This subroutine does basically what the new scheme's code did, because
> that approach is more general than the one used by the old scheme.  It
> only needs to know how many bytes to transfer and whether or not it is
> being called for the first iteration of a retry loop (in case of
> certain time-out errors).  There are two main differences from the
> 
> former code:
> 	We initialize the bDescriptorType field of the transfer buffer
> 	to 0 before performing the transfer, to avoid possibly
> 	accessing an uninitialized value afterward.
> 	
> 	We read the device descriptor into a temporary buffer rather
> 	than storing it directly into udev->descriptor, which the old
> 	scheme implementation used to do.
> 
> Since the whole point of this first read of the device descriptor is
> to determine the bMaxPacketSize0 value, that is what the new routine
> returns (or an error code).  The value is stored in a local variable
> rather than in udev->descriptor.  As a side effect, this necessitates
> moving a section of code that checks the bcdUSB field for SuperSpeed
> devices until after the full device descriptor has been retrieved.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: Oliver Neukum <oneukum@suse.com>

Last week I upgraded within the 5.15-stable branch. Since upstream commit
85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads"),
there are problems detecting a directly attached USB hub. I identified this
commit by bisecting and get the same result during upgrading within the 6.1-stable
branch.

Hardware: ARMv7 NXP i.MX6ULL with directly attached USB hub (Microchip USB4916).
Log messages:

[    6.150881] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    6.215484] usb 1-1: device descriptor read/8, error -71
[    6.377532] usb 1-1: device descriptor read/8, error -71
[    6.581934] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[    6.642853] usb 1-1: device descriptor read/8, error -71
[    6.803355] usb 1-1: device descriptor read/8, error -71
[    6.920418] usb usb1-port1: attempt power cycle
[    7.051419] usb 1-1: new high-speed USB device number 4 using ci_hdrc
[    7.192320] usb 1-1: New USB device found, idVendor=0424, idProduct=4916, bcdDevice= 8.02
[    7.192348] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    7.192363] usb 1-1: Product: Orbiter USB hub
[    7.192376] usb 1-1: Manufacturer: ARRI
[    7.193263] hub 1-1:1.0: USB hub found
[    7.193951] hub 1-1:1.0: 7 ports detected

The "device descriptor read" and "attempt power cycle" error messages definitely
haven't been there before the commit mentioned above. Disregarding the additional
log messages, the USB hub (and its devices) seem to work.

I didn't try reverting this single commit as it seems that later changes depends
on it.

regards
Christian


