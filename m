Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332123D1
	for <regressions@lists.linux.dev>; Sat,  4 Mar 2023 14:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C5FC433EF;
	Sat,  4 Mar 2023 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677939132;
	bh=Jgl9uWraAvsXDhHpdMDnjGFUtIicxsb4GfZqlaKmbv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xGdbvtnh/B48cN0eHOaK7hMf1uOOASCwR2bx/sbb/OxtuIMn8vJNreQMmjjPd6m5v
	 sipwY8LL6hxbJKlhjR0rFBfVCvNP07Iy1TkOvBLQKANg1qcE7rnJrXx+0F986mjfC1
	 xwRkC+hlc3jYN1YH5qcmYCq4MO4mFsOpCUOgC9Nw=
Date: Sat, 4 Mar 2023 15:12:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Sasha Levin <sashal@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, emmi@emmixis.net,
	schwagsucks@gmail.com,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [regression] Bug 217114 - Tiger Lake SATA Controller not
 operating correctly [bisected]
Message-ID: <ZANRuSQHrXx/Cvro@kroah.com>
References: <ad02467d-d623-5933-67e0-09925c185568@leemhuis.info>
 <af6a355b-3ac2-a610-379a-167e87145368@opensource.wdc.com>
 <229e264a-9af6-7662-c04c-9c1492a18c51@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <229e264a-9af6-7662-c04c-9c1492a18c51@leemhuis.info>

On Sat, Mar 04, 2023 at 02:58:28PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 03.03.23 10:48, Damien Le Moal wrote:
> > On 3/3/23 16:10, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>
> >> I noticed a regression report in bugzilla.kernel.org that apparently
> >> affects 6.2 and later as well as 6.1.13 and later, as it was already
> >> backported there.
> >>
> >> As many (most?) kernel developer don't keep an eye on bugzilla, I
> >> decided to forward the report by mail. Quoting from
> >> https://bugzilla.kernel.org/show_bug.cgi?id=217114 :
> >>
> >>>  emmi@emmixis.net 2023-03-02 11:25:00 UTC
> >>>
> >>> As per kernel problem found in https://bbs.archlinux.org/viewtopic.php?id=283906 ,
> >>>
> >>> Commit 104ff59af73aba524e57ae0fef70121643ff270e
> >>
> >> [FWIW: That's "ata: ahci: Add Tiger Lake UP{3,4} AHCI controller" from
> >> Simon Gaiser]
> > 
> > I sent a revert with cc: stable.
> 
> Many thx for this and your quick actions.
> 
> @Greg, @Sasha: that revert landed as 6210038aeaf4 ("ata: ahci: Revert
> "ata: ahci: Add Tiger Lake UP{3,4} AHCI controller""); you might want to
> ensure you have it in the first batch of 6.1 backports in case you need
> to split the backports from the merge window over multiple 6.1.y releases.

I've queued this up now, thanks for letting us know.

greg k-h
