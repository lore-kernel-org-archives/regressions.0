Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 61CA0538D
	for <regressions@lists.linux.dev>; Wed, 15 Mar 2023 15:00:05 +0000 (UTC)
Received: (qmail 836918 invoked by uid 1000); 15 Mar 2023 10:53:23 -0400
Date: Wed, 15 Mar 2023 10:53:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Brian Morrison <bdm@fenrir.org.uk>, linux-usb@vger.kernel.org,
  Linux kernel regressions list <regressions@lists.linux.dev>,
  Chen Xingdi <chenxingdi@huawei.com>, Takashi Iwai <tiwai@suse.de>,
  Moritz Fischer <mdf@kernel.org>,
  Christian Lamparter <chunkeey@googlemail.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: USB regression in kernel 6.2.2
Message-ID: <3d0a0429-a634-4c18-82e8-72028d8226d0@rowland.harvard.edu>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
 <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
 <20230309200415.118777d2@deangelis.fenrir.org.uk>
 <20230312000316.2955d55a@deangelis.fenrir.org.uk>
 <d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
 <20230314140008.79a90c38@deangelis.fenrir.org.uk>
 <c9b12beb-cb12-8839-db74-b18480885053@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9b12beb-cb12-8839-db74-b18480885053@linux.intel.com>

On Wed, Mar 15, 2023 at 01:19:16PM +0200, Mathias Nyman wrote:
> On 14.3.2023 16.00, Brian Morrison wrote:
> > On Mon, 13 Mar 2023 12:06:59 +0200
> > Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> > > 
> > > 
> > > In your v6.2 logs the usb bus numbers are interleaved, in the v6.1
> > > they are not. xhci driver registers two usb buses per host, one
> > > High-Speed and one SuperSpeed.
> > > 
> > > This change could be due to 6.2 commit:
> > > 
> > > 4c2604a9a689 usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS
> > > 
> > > Not sure why it would cause this regression, but worth testing it.
> > 
> > I have now reverted the above commit, it's only the one line in
> > xhci-pci.c and it took a couple of hours to rebuild my kernel rpms which
> > wasn't too bad.
> > 
> > With this change all of my USB devices are present again and the 3
> > /dev/ttyUSB* nodes are all present and usable.
> > 
> 
> Thanks for testing.
> So setting PROBE_PREFER_ASYNCHRONOUS does trigger this issue for Renesas xHCI.
> 
> Was it so that with the devices connected to the Intel host everything worked
> on 6.2 kernel?
> 
> Just to make sure that this is a vendor specific host issue and not generic xhci
> driver issue.
> 
> If we can't quickly figure out the real reason for this then we just have to
> revert that patch.
> 
> > I found this in the linux-usb list archives:
> > 
> > https://www.spinics.net/lists/kernel/msg4569289.html
> > 
> > and the first part of this patch series here:
> > 
> > https://www.spinics.net/lists/kernel/msg4569288.html
> > 
> > Should both of these patches be reverted? I assume so but I don't think
> > I have anything that uses an ehci device to test it.
> > 
> 
> Probably just the xhci one. I haven't heard of any ehci issues.
> 
> Alan (cc) would know better if there are any new odd ehci issues that can
> be traced back to the async probe change.

I haven't heard of any problems with EHCI.

Alan Stern
