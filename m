Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC553239
	for <regressions@lists.linux.dev>; Mon, 13 Feb 2023 20:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F1AC433EF;
	Mon, 13 Feb 2023 20:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676321244;
	bh=CxKp7DdRpIHLjyKvK/8EagwtvA0dnNmDwSHqDGmAmwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ijPd2PKP+TMC7+P+NjEuiTm/Xko37dYQGHOYIwUvdyrPqNZhHk0AFGgO6F2k0TM7o
	 ioS89gBKo368/y1po2aQidhAEu3/QR+vtaf+A+JE1lhaLfHyMzLx3k1c9A3xJoj+vM
	 blAl7XLQnM9AlGq5+IaTu5fXxrkRy8yPz+8PutJXFoWDUmadezKiVPz9qGJkcc2SkN
	 D6b2Jo10o/Xwo4Kv7VfztFUo/CGrugTgqtPpA4vftg7DPDgCt9d40wi6G+AnnZ4kzN
	 kobvP2nuT2FrNqfDlj3+ReUFIZoAc37dOeXfDBIguvw7AHPHALEBVzn2vpQVom3ZY5
	 e5ABk69JqVjag==
Date: Mon, 13 Feb 2023 14:47:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: regressions@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] [Bug 216859] New: PCI bridge to bus boot hang at
 enumeration
Message-ID: <20230213204722.GA2929794@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201232750.GA1908996@bhelgaas>

On Wed, Feb 01, 2023 at 05:27:50PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 26, 2023 at 06:11:24AM -0600, Bjorn Helgaas wrote:
> > [+cc folks from 145eed48de27 and framebuffer folks, regression list]
> > 
> > On Thu, Jan 12, 2023 at 02:08:19PM -0600, Bjorn Helgaas wrote:
> > > On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > > > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > > 
> > > > >            Summary: PCI bridge to bus boot hang at enumeration
> > > > >     Kernel Version: 6.1-rc1
> > > > > ...
> > > > 
> > > > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > > > see attachments.
> > > > > 
> > > > > The enumeration works fine with Kernel 6.0 and below.
> > > > > 
> > > > > Same problem still exists with v6.1. and v6.2.-rc1
> > 
> > This is a regression between v6.0 and v6.1-rc1.  Console output during
> > boot freezes after nvidiafb deactivates the VGA console.
> > 
> > It was a lot of work for Zeno, but we finally isolated this console
> > hang to 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus").
> > 
> > The system actually does continue to boot and is accessible via ssh, 
> > but the console appears hung, at least for output.  More details in
> > the bugzilla starting at
> > https://bugzilla.kernel.org/show_bug.cgi?id=216859#c47 .
> 
> #regzbot introduced: 145eed48de27
> #regzbot dup: https://lore.kernel.org/all/D41A3A42-2412-4722-9090-01565058E525@gmail.com/

#regzbot fix: 04119ab1a49f ("nvidiafb: detect the hardware support before removing console.")
