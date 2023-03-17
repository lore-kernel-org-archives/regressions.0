Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE136A
	for <regressions@lists.linux.dev>; Fri, 17 Mar 2023 18:37:34 +0000 (UTC)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
	(TLS1.3:TLS_AES_256_GCM_SHA384:256)
	by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pdEx0-0001L6-18;
	Fri, 17 Mar 2023 18:37:14 +0000
Date: Fri, 17 Mar 2023 18:37:13 +0000
From: Brian Morrison <bdm@fenrir.org.uk>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>, Chen Xingdi <chenxingdi@huawei.com>, Takashi
 Iwai <tiwai@suse.de>, Moritz Fischer <mdf@kernel.org>, Christian Lamparter
 <chunkeey@googlemail.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: USB regression in kernel 6.2.2
Message-ID: <20230317183713.7bef83c2@deangelis.fenrir.org.uk>
In-Reply-To: <3d0a0429-a634-4c18-82e8-72028d8226d0@rowland.harvard.edu>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
	<db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
	<20230309200415.118777d2@deangelis.fenrir.org.uk>
	<20230312000316.2955d55a@deangelis.fenrir.org.uk>
	<d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
	<20230314140008.79a90c38@deangelis.fenrir.org.uk>
	<c9b12beb-cb12-8839-db74-b18480885053@linux.intel.com>
	<3d0a0429-a634-4c18-82e8-72028d8226d0@rowland.harvard.edu>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.1git48 (GTK 3.24.37; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, 15 Mar 2023 10:53:23 -0400
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, Mar 15, 2023 at 01:19:16PM +0200, Mathias Nyman wrote:
> > On 14.3.2023 16.00, Brian Morrison wrote:  
> > > On Mon, 13 Mar 2023 12:06:59 +0200
> > > Mathias Nyman <mathias.nyman@linux.intel.com> wrote:  
>  [...]  
> > > 
> > > I have now reverted the above commit, it's only the one line in
> > > xhci-pci.c and it took a couple of hours to rebuild my kernel
> > > rpms which wasn't too bad.
> > > 
> > > With this change all of my USB devices are present again and the 3
> > > /dev/ttyUSB* nodes are all present and usable.
> > >   
> > 
> > Thanks for testing.
> > So setting PROBE_PREFER_ASYNCHRONOUS does trigger this issue for
> > Renesas xHCI.
> > 
> > Was it so that with the devices connected to the Intel host
> > everything worked on 6.2 kernel?
> > 
> > Just to make sure that this is a vendor specific host issue and not
> > generic xhci driver issue.

I will see if I can test this, but it may be difficult. The add-on
Renesas card allows my USB cables (with quite large ferrites to keep RF
out of the PC) to fit in, the Intel host ports are in a different
orientation and so physically too close together for the ferrite-laden
cables to fit in.

If I can manage to test it I will report, but don't hold your breath.

> > 
> > If we can't quickly figure out the real reason for this then we
> > just have to revert that patch.

It's certainly working for me, but as I don't know much about how the
xhci driver initialises and finds the two bus host controllers I don't
know about any consequences beyond the boot delay issue that prompted
the async change in the first place.

> >   
> > > I found this in the linux-usb list archives:
> > > 
> > > https://www.spinics.net/lists/kernel/msg4569289.html
> > > 
> > > and the first part of this patch series here:
> > > 
> > > https://www.spinics.net/lists/kernel/msg4569288.html
> > > 
> > > Should both of these patches be reverted? I assume so but I don't
> > > think I have anything that uses an ehci device to test it.
> > >   
> > 
> > Probably just the xhci one. I haven't heard of any ehci issues.
> > 
> > Alan (cc) would know better if there are any new odd ehci issues
> > that can be traced back to the async probe change.  
> 
> I haven't heard of any problems with EHCI.

I think that EHCI and UHCI are older standards, I don't know if the
hardware those drivers work with is still common. I also have a VIA PCI
USB card on another machine that also uses the xhci driver and it's much
older than the machine with the Renesas card. I don't think I have the
hardware that would allow me to test those drivers.

> 
> Alan Stern
> 

Please ask if there is any extra patch you would like me to try.

-- 

Brian Morrison

