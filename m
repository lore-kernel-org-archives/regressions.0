Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A2B9C1420D7
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710276432; cv=none; b=Km+JeoqWUBj+rOCLTojyrl9hApHxWrY0udWIJI/qvP9aFouaW9BIJkdurpjxykpqPlNeoTmBiVbfr4BLDVut5ZNRzUMkDWMmgh3Rex/uHwK8Mkdasrrg1miQtLNxn9B14hlEPrSAC5EYKSGSIbFR8s7f90Y58ncMmCumhm0QiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710276432; c=relaxed/simple;
	bh=P1NCPsLVEkLdCqz5V0MpZqW0w0TkNvmE8PjL1Dk7UI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfinEYnGorQDXOs2JvY2DKLEwPcGGMWILCn9SxScAhW7z3ImmbCI5JjBO0OrwDevqJvjiwVLsvfOQ+fiAyaUBK91smbklnPmr14cFSWBneT2ddxVbudvaGsbO3e/+bsxfJpEJPXoEruIf+F/DQeLqojyXNb2GZKsVVIpGmUoulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 395255 invoked by uid 1000); 12 Mar 2024 16:47:09 -0400
Date: Tue, 12 Mar 2024 16:47:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <580528c3-7084-40ff-9b2e-6f395266b0b2@rowland.harvard.edu>
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

I agree, this should be fixed if we can.  I'm still puzzled about how 
commits you located could cause any difference in the device's behavior, 
given that they don't seem to cause any change's to the computer's 
behavior.

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

Good.  I've been quite busy recently, but I'll look at the logs when 
there is time.

The USB-2 and USB-3 drivers do share some initialization code, but not 
all of it.  The first couple of steps are quite different: With a USB-2 
controller they are handled by the kernel driver, but with a USB-3 
controller they are handled directly by the controller's hardware with 
no software influence.

Alan Stern

> Also, if needed, I can get more logs from the X220 I was using for my usbmon
> traces - I believe I have an HDD with Windows 7 install lying somewhere.
> 
> Regards,
> Jan
> 
> 
> [1] https://github.com/home-assistant/operating-system/files/14563813/usbPcap1_USB2-port.txt
> [2] https://github.com/home-assistant/operating-system/issues/2995#issuecomment-1989329739
