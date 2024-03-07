Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B2A39136666
	for <regressions@lists.linux.dev>; Thu,  7 Mar 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840060; cv=none; b=EPL+Cqb2hJpag9H4IYB+ZwVQwLOoribnJI9uT08QWYSUzOooFaSyWzO/B9A0BkOPCu+rmqgRCBFIXsbG0RjDAW2KCT1nypNTbdAvGHZ7Pei/3VN2rzyyz5ymLRNe9ibPmYRxZqRZiakkLWH/W0xiI+38aTZmT2ug24vUkqACSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840060; c=relaxed/simple;
	bh=dzWw9ypdL6tyWbWNt4plhJV3vNWWQvPdRPS/5vUSsMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6XLslOICuD5xl63MqL3T+eZILFSDuNVKWKjbzilPj12j3nujjEI35mBxlKWyH6s1uenIxJjv4bi08e7kvOQPIdk/BKYCejUPhRh/R3o+feJeAsPMKplJ2RG263urBMIqYRno89NiN3lFy5h4Wzhjzy2ddg+31A1807EY7zqMzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 230033 invoked by uid 1000); 7 Mar 2024 14:34:17 -0500
Date: Thu, 7 Mar 2024 14:34:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>

On Thu, Mar 07, 2024 at 05:17:20PM +0100, Jan Čermák wrote:
> Hi Alan,
> 
> On 06. 03. 24 22:08, Alan Stern wrote:
> > Can you provide two usbmon traces, one showing the problem with those
> > patches present and the other (on the same system but with the patches
> > reverted) showing the recovery?  Comparison of the two should indicate
> > what's happening differently.
> 
> I reproduced the issue on my old ThinkPad X220 with 6.6.20 kernel, you can
> find the usbmon captures below.

This is quite strange; the two traces are the same up to this point:

ffff9f9a29b3f300 298538675 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff9f9a29b3f300 298538893 C Co:1:002:0 0 0
ffff9f9a012cae40 298581342 C Ii:1:002:1 0:2048 1 = 04
ffff9f9a012cae40 298581372 S Ii:1:002:1 -115:2048 1 <
ffff9f9a29b3f300 298742112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff9f9a29b3f300 298742459 C Ci:1:002:0 0 4 = 03011000

------------------------------------------------------------------

ffff8fc4ee367240 368298641 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff8fc4ee367240 368298823 C Co:1:002:0 0 0
ffff8fc4c0c5ac00 368343025 C Ii:1:002:1 0:2048 1 = 04
ffff8fc4c0c5ac00 368343056 S Ii:1:002:1 -115:2048 1 <
ffff8fc4ee367240 368502095 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff8fc4ee367240 368502372 C Ci:1:002:0 0 4 = 01011100

The difference is in the last line: 03011000 vs. 01011100.  This means
that in the "working" scenario the device disconnected itself from
the USB bus for no apparent reason and then reconnected, whereas in
the "nonworking" scenario it didn't.  The computer did nothing
different before then, so I have no idea why the device's behavior
changed.  It's a mystery.

Another thing the traces showed is that the device doesn't like the
"new" initialization scheme; it wants the "old" one.  You can test
this by setting the old_scheme_first module parameter for usbcore
before plugging in the device:

	echo 1 >/sys/module/usbcore/parameters/old_scheme_first

Also, you can try the patch below (without the module parameter set).
I suspect it should be applied in any case, but it would be nice to
know if it makes any difference in your case.

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -5481,6 +5481,7 @@ loop:
 			msleep(2 * hub_power_on_good_delay(hub));
 			usb_hub_set_port_power(hdev, hub, port1, true);
 			msleep(hub_power_on_good_delay(hub));
+			hub_port_debounce_be_stable(hub, port1);
 		}
 	}
 	if (hub->hdev->parent ||
