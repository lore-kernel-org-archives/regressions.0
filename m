Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2113.outbound.protection.outlook.com [40.107.7.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7ADF51
	for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="r3+mahXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpTNaOU7rCLxmsMl+lL1IgkjrG+5eqmUw+B+wp/Sql39jlrwOqeOUXyOVEP0VkNRXzaO+jo5uqRnIK98bsOrp06VXAuh6xfFXyS5p4ENs0gIgWspGSX1RZ5C3L9Zf3fkJE0obRzaxUyiW6J5SgEqA5e+OkCWfjVBYEcsaEN7osVFLYEwB10hlTT7vqGiEsMXV4GqmahHYJqvau/6m2nJjGCwkr1GWXlPMeIJqt8wdvYcCDM1NKDdvkIg91x6iuvrMfP+RDVnRjfEVJuGtNeK0APabfK+KfvbfTbYUQE8R+fNqI5jYYh4yvvEwN/FKREjzn4HitLZ5KVu5NXpKTl/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oDjWQLoFzX6PJypEZ8Q0xUbHFFFxOoviC27xrBWsCY=;
 b=nsud5XKHQ0Q0XI8s+Ld2Cpy0mCwX5XSUyM6dBDpVWzr7M5/SMyPm5kqkTzIswI79GO7w3smfH+Ign+3vM63ZD4icEmZukugM+LH1jhFF5OEB3AGkMT4fWHs+dJKTVcFOApv3J08eixqZtea1WU+y9I7rqm1Jvh3va6gg9DmNUcAANREr8804n3jiVfxaOXBDdosWaJlaeDpTNmlmt5AQr1JJ+X6pqr8vb7VB0f64561Swps3Q8RCLoLCzQOjfqJRPrSDi5qOpCKU1ExqVAHzE4rR4mCLa8D/4+/OFm7JEOxBz+426cJPuF0nRT3YSIXsMJkXaaKyCvu/6R+iyY85yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=rowland.harvard.edu smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oDjWQLoFzX6PJypEZ8Q0xUbHFFFxOoviC27xrBWsCY=;
 b=r3+mahXzJrGhaXJsl/YDtu3+vf3qDM6559hoXZXz+kRBdzM8AD+8E2wZWfN1llKtgC5njnaGuqD6ZrXi7jvafJElgUdLsQtEAocBn06IJteGxazDch6nHZkiaRfRL0m9+X7WNgWESu0lQbl57kZ+NZEQJzSjjvHVhR3Qn4g9irg=
Received: from DB8PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:10:be::48)
 by DU2PR07MB8143.eurprd07.prod.outlook.com (2603:10a6:10:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 08:01:50 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::83) by DB8PR03CA0035.outlook.office365.com
 (2603:10a6:10:be::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Tue, 12 Dec 2023 08:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 08:01:48 +0000
Received: from n95hx1g2.localnet (10.30.5.31) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 12 Dec
 2023 09:01:47 +0100
From: Christian Eggers <ceggers@arri.de>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
	Oliver Neukum <oneukum@suse.com>, USB mailing list
	<linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Re: [PATCH 1/3] USB: core: Unite old scheme and new scheme descriptor reads
Date: Tue, 12 Dec 2023 09:01:47 +0100
Message-ID: <5737917.DvuYhMxLoT@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <c89fa5da-171f-48cc-ac9a-7949c45b5e54@rowland.harvard.edu>
References: <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu> <22131556.EfDdHjke4D@n95hx1g2> <c89fa5da-171f-48cc-ac9a-7949c45b5e54@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|DU2PR07MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ea3fd5-b668-45b4-9e56-08dbfae8975a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NPdggbc1zuetSrVb+DVLsL3V0Lp+eh/wEBkZxrW7vnSIEgPitmLdH0vcTThzexv21+jWMwcy8P2stLVkauPYPplp5Wz3t2D6YOzbXKyOGEQX2y9XkyuG4oyFl7zv/fbTii8QAq3NTHmo5/1ecDYdKXelB8AJAVs6GMepGoLhTQ0o0SghaJaqdZu2NYeDwySwPCwjgWmM/DTZsvXcx2F2B9reVtEBOkhS/DcIiBlF1+ABandr4bU7cER67KUx/MbB7AFjttVYvavSLxKsYp9JuTSDZcKwU87CPv9AE7bfLY3fqulIG1ntsnGDExfFd73XLVBX0aWjAVqT0va/sosWoGlI64vSR5CgU9hrRprHgOunNM0TIjK0OqUigN4SJ33Bw13I2+ODOos9LOO7EGmWUFWIn7fse4mzGux0TpLAMpUZUX3Ygt8CvZNiaou6E0yAgT/s8GCwuAQ0hSzsolHEGeTMlvaLqpB1sSjaCotqXcTUc2rhCqYj/hC0eOEjPtPdU9b6R5nHs2xir4EpsiE6JN+/pI4rqdu8x4hqMMW9qZaAwFjyQwU6ZCyIh7J3gn4G4z0nrJCOBXNablT91aPEBev8tRSWWGyiuFl8F5b3hvXF0jcJmZPa3xBgAKqEBkMyoktWe40CLMBSmvkonK4uCsMkc8OBa15RMSqL/NxkBFmeg3dOv+m02y7V3dOW8+4ryW9iUEeZBXqOy5GNIcQqNo9aw3dsist78i28FZ0ZoAx0+9v3zrc1DcyT0omIbbLmLhKhmqGytKx8Edsninri+wOyQD3RWoRZI1+brFuSoGJe4/RlPulxRpI0NHgYLih+B98FbiaSeqTbSSy/i5HTxQ==
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39850400004)(396003)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(46966006)(36840700001)(41300700001)(81166007)(82740400003)(8676002)(8936002)(86362001)(316002)(33716001)(70206006)(6916009)(54906003)(70586007)(478600001)(356005)(2906002)(16526019)(36916002)(426003)(40480700001)(336012)(9686003)(26005)(5660300002)(9576002)(83380400001)(47076005)(4326008)(36860700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 08:01:48.0930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ea3fd5-b668-45b4-9e56-08dbfae8975a
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8143

Hi Alan,

On Monday, 11 December 2023, 17:21:56 CET, Alan Stern wrote:
> On Mon, Dec 11, 2023 at 11:40:38AM +0100, Christian Eggers wrote:
> > Last week I upgraded within the 5.15-stable branch. Since upstream commit
> > 85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads"),
> > there are problems detecting a directly attached USB hub. I identified this
> > commit by bisecting and get the same result during upgrading within the 6.1-stable
> > branch.
> > 
> > Hardware: ARMv7 NXP i.MX6ULL with directly attached USB hub (Microchip USB4916).
> > Log messages:
> > 
> > [    6.150881] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> > [    6.215484] usb 1-1: device descriptor read/8, error -71
> > [    6.377532] usb 1-1: device descriptor read/8, error -71
> 
> Is the old_scheme_first module parameter for the usbcore module set?  
> 
> That and the USB_PORT_QUIRK_OLD_SCHEME are the only things I can see 
> which would cause those errors -- and apparently this quirk never gets 
> set in current kernels.
that was the problem! In previous attempts to reduce the boot time of my system
I have set USB_PORT_QUIRK_OLD_SCHEME for specific combinations of bus/port numbers.

After reverting this, the warnings don't appear anymore, so everything is fine now.

Thanks for identifying the problem and sorry for the noise.

regards,
Christian



