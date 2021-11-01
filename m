Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFA92C86
	for <regressions@lists.linux.dev>; Mon,  1 Nov 2021 16:42:32 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mhaOE-0000yi-Vl; Mon, 01 Nov 2021 17:42:31 +0100
Message-ID: <7ee1c6ac-a75a-06bc-f6e5-6aa529919f0c@leemhuis.info>
Date: Mon, 1 Nov 2021 17:42:30 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BW
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
In-Reply-To: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1635784952;a94d3f3d;
X-HE-SMSGID: 1mhaOE-0000yi-Vl

On 29.10.21 19:14, Eugene Bordenkircher wrote:
> Hello all,
> 
> We've discovered a situation where the FSL udc driver
> (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating
> over the request queue, but the queue has been corrupted at some
> point so it loops infinitely.  I believe we have narrowed into the
> offending code, but we are in need of assistance trying to find an
> appropriate fix for the problem.  The identified code appears to be
> in all versions of the Linux kernel the driver exists in.

#regzbot ^introduced f79a60b8785
#regzbot link:
https://lore.kernel.org/all/CADRPPNSrhiwr8jmBb2h4cFYqHtuDKK8rL0i6Bkg7+xEyXJPATA@mail.gmail.com/
#regzbot link:
https://lore.kernel.org/all/2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com/
