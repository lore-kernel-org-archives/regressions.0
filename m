Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4F23B7
	for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 12:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C397CC433D2;
	Thu, 26 Jan 2023 12:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674735086;
	bh=KPkKSD7aWhYpforFO0pJPJv3XA4UUvnD2v1EFugEgqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DsfeXP3MPywBfapf1j68U2fsYoRWJr1DaPzWi74NDujNgTDyNgQ1iInlpLvOBPWhZ
	 dgbjF41INaKWSTmLGbC6hUi2hlVxaE3zeJX6nAjNxaHhzv2MWnLknFBp41TOIT81B2
	 ln/BLPiIuK03YBpKim2U/tMG4LCKbrlthnwZlrX9s7FWpYyliW/zSN25yS4zXbq6o1
	 oDeL383myENTyDldeQc8KuV4Re3HOXcuwLoBBFx/2jrf/CCCq6GjCcNSUwdCT4iLtw
	 qDQ0oKQdF6wfufBEEOLwk+7/zpHzn/jpN3EV9/3fihC2XnpD7F9xiZbGBioLd3EI44
	 Yv4H+MnVBlyxQ==
Date: Thu, 26 Jan 2023 06:11:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	"Zeno R.R. Davatz" <zdavatz@gmail.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Antonino Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] [Bug 216859] New: PCI bridge to bus boot hang at
 enumeration
Message-ID: <20230126121124.GA1258686@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112200819.GA1785077@bhelgaas>

[+cc folks from 145eed48de27 and framebuffer folks, regression list]

On Thu, Jan 12, 2023 at 02:08:19PM -0600, Bjorn Helgaas wrote:
> On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > 
> > >            Summary: PCI bridge to bus boot hang at enumeration
> > >     Kernel Version: 6.1-rc1
> > > ...
> > 
> > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > see attachments.
> > > 
> > > The enumeration works fine with Kernel 6.0 and below.
> > > 
> > > Same problem still exists with v6.1. and v6.2.-rc1

This is a regression between v6.0 and v6.1-rc1.  Console output during
boot freezes after nvidiafb deactivates the VGA console.

It was a lot of work for Zeno, but we finally isolated this console
hang to 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus").

The system actually does continue to boot and is accessible via ssh, 
but the console appears hung, at least for output.  More details in
the bugzilla starting at
https://bugzilla.kernel.org/show_bug.cgi?id=216859#c47 .

Bjorn
