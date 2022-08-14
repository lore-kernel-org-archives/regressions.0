Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8008EDA
	for <regressions@lists.linux.dev>; Sun, 14 Aug 2022 13:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F18C433C1;
	Sun, 14 Aug 2022 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660482104;
	bh=WAP5JA0wQbdx2XgmotyffLP9nUzI/sVbWZvAOatNT3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zNpzQEfBY6ClWGQYxNib/B/GVaQ5aFeAGkg2nXIL2Bllu/uco+d8LidddCFnoLsKQ
	 xQ6qfDh1+3VjYZ76fP5XxcSkoe3hsn2QjTqaqawHxMHWlgexd98rNQGIeMWciiW0vO
	 Hwcz4HtIbHwemE5umHqlsCFeGFye7AdM+98CvyIo=
Date: Sun, 14 Aug 2022 15:01:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, jbeulich@suse.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	regressions@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Message-ID: <YvjyNdH+X0dwjj+f@kroah.com>
References: <20220715142549.25223-1-jgross@suse.com>
 <efbde93b-e280-0e40-798d-dc7bf8ca83cf@leemhuis.info>
 <a0ce2f59-b653-fa8b-a016-1335f05c86ae@netscape.net>
 <32ed59c9-c894-c426-dd27-3602625cf3b1@netscape.net>
 <4688ee9b-1b18-3204-cc93-c6ab2ce9222c@netscape.net>
 <YvjFY1dn2Afg/mFj@kroah.com>
 <22bb6f38-c319-35a1-cf8a-07f78904ecfb@netscape.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22bb6f38-c319-35a1-cf8a-07f78904ecfb@netscape.net>

On Sun, Aug 14, 2022 at 08:08:30AM -0400, Chuck Zmudzinski wrote:
> On 8/14/2022 5:50 AM, Greg KH wrote:
> > On Sun, Aug 14, 2022 at 05:19:12AM -0400, Chuck Zmudzinski wrote:
> > > Well, that did not take long. Juergen responded with a message,
> > > which is encrypted and not delivered to my mailbox because I do not
> > > have the PGP keys, presumably to make it difficult for me to continue
> > > the discussion and defend myself after I was accused of violating
> > > the netiquette rules yesterday by Boris:
> >
> > The message was signed, not encrypted.  Odd that your email client could
> > not read it, perhaps you need to use a different one?
> >
> > thanks,
> >
> > greg k-h
> 
> It's not that my e-mail client could not read it, there is no evidence it
> was ever sent to me.

The To: line had your address in it, so it was sent to you, and again,
it was not encrypted as you claimed, but rather just signed to verify he
was the sender.  That's not making anything difficult for anyone, so I
think you owe him an apology here, especially as you are asking him to
do work for you.

best of luck!

greg k-h
