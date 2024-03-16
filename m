Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 44FEF2903
	for <regressions@lists.linux.dev>; Sat, 16 Mar 2024 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710621341; cv=none; b=HlU09q6Fr+aRM8AH7L3hvxmHTDxOBcAmt+5ciSnNFieDGpvr3l/tpVq4EChUT64gJhc52z+Q0H6WLPX0eJAjlPAWUUAwNZlCNM35gGQz4tJubys6GzckRCwYFzN6Id2nCTW2BIAzFtflorvJJHTQyUgSktz4f7oaRpk+NcDXiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710621341; c=relaxed/simple;
	bh=gTuos2vrk2Aq2RdkAXzhuDP3hXzu8Fb6ZlqMaChzjhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APONsMnJrjXCbLGNh9fDyMuLlNtIQgwbanYPJyiO5OO2mXH9JCY4QQcZFXIwxL9aaxVhmG6aWi1i0mYPtqSdylTULhz67uZfVpvw/wuf/tSLkSIXtljKnEDXl99eDfNyh9XQVvoeOc/WPqAIjEfeub+N6eYR45RHYlrcvrywwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 524355 invoked by uid 1000); 16 Mar 2024 16:35:30 -0400
Date: Sat, 16 Mar 2024 16:35:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>

On Tue, Mar 12, 2024 at 09:57:06AM +0100, Jan Čermák wrote:
> Hi Alan
> 
> On 11. 03. 24 15:43, Alan Stern wrote:
> > Well, at least this means you do have a way of using the device, even
> > if it is rather awkward.  It might even work on the Raspberry Pi machine.
> 
> Still, I'm looking for a more permanent and robust solution. If it were only
> a single device I'm using myself, I could come up with a workaround.
> However, this is one of the very few available Z-Wave USB interfaces and
> there are more users affected. So far we went with reverting the patches,
> but that's surely not the way we want to go forward.
> 
> > The device is so non-responsive, I'm amazed it ever works at all.
> > Judging by the usbmon traces, it doesn't look as if it would work on a
> > Windows system.
> > 
> > Actually, if you have access to a computer running Windows or Mac OSX
> > and you can try out the device on that computer, it would be good to
> > get the equivalent of a usbmon trace (something like a Wireshark
> > capture log would do).  If those systems manage to do something that
> > Linux doesn't, we ought to know what it is.
> 
> Fredrik (one of the original reporters) is following this conversation, here
> [1] are logs from his machine with some details in the ticket [2]. He also
> wonders why the initialization doesn't work only on USB2 ports but works on
> USB3 if the initialization code is shared between those two.

It's very difficult to compare the Windows log with the usbmon trace.  
However, something Frederik mentioned about the number of resets led me 
to check more closely.  There are some extra unnecessary resets in the 
usbmon trace, and a reset that should be there is missing.

Below is a patch meant to get the number of resets back to what it 
should be.  I'd appreciate it if you can test this, and report the 
kernel log output along with the usbmon output for the normal case and 
also with the "old_scheme_first" parameter set.

I'm not very hopeful that this will solve the problem, but there's a 
good chance it will help point us in the right direction by removing 
extraneous complications.

Alan Stern



 drivers/usb/core/hub.c |   27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -4961,6 +4961,18 @@ hub_port_init(struct usb_hub *hub, struc
 			break;
 		}
 
+		if (retries > 0) {
+			retval = hub_port_reset(hub, port1, udev, delay, false);
+			if (retval < 0)		/* error or disconnect */
+				goto fail;
+			if (oldspeed != udev->speed) {
+				dev_dbg(&udev->dev,
+					"device reset changed speed!\n");
+				retval = -ENODEV;
+				goto fail;
+			}
+		}
+
 		if (do_new_scheme) {
 			retval = hub_enable_device(udev);
 			if (retval < 0) {
@@ -4972,6 +4984,13 @@ hub_port_init(struct usb_hub *hub, struc
 
 			maxp0 = get_bMaxPacketSize0(udev, buf,
 					GET_DESCRIPTOR_BUFSIZE, retries == 0);
+			if (maxp0 < 0) {
+				if (maxp0 != -ENODEV)
+					dev_err(&udev->dev, "device descriptor read/64, error %d\n",
+							maxp0);
+				retval = maxp0;
+				continue;
+			}
 			if (maxp0 > 0 && !initial &&
 					maxp0 != udev->descriptor.bMaxPacketSize0) {
 				dev_err(&udev->dev, "device reset changed ep0 maxpacket size!\n");
@@ -4988,13 +5007,6 @@ hub_port_init(struct usb_hub *hub, struc
 				retval = -ENODEV;
 				goto fail;
 			}
-			if (maxp0 < 0) {
-				if (maxp0 != -ENODEV)
-					dev_err(&udev->dev, "device descriptor read/64, error %d\n",
-							maxp0);
-				retval = maxp0;
-				continue;
-			}
 		}
 
 		for (operations = 0; operations < SET_ADDRESS_TRIES; ++operations) {
@@ -5533,6 +5545,7 @@ loop:
 			msleep(2 * hub_power_on_good_delay(hub));
 			usb_hub_set_port_power(hdev, hub, port1, true);
 			msleep(hub_power_on_good_delay(hub));
+			hub_port_debounce_be_stable(hub, port1);
 		}
 	}
 	if (hub->hdev->parent ||

