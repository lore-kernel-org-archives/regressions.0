Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A32C96
	for <regressions@lists.linux.dev>; Fri,  5 Nov 2021 07:56:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C956126A;
	Fri,  5 Nov 2021 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636099005;
	bh=XWGL8h6Al0uEX0lwkNW9/eoS2LbyAJ18Bq7DYvjK6SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPxF1XxvpCBZPS/YEaxEwyn3DCipjSb3vVskWf8ufhvo8GZNz5Myh2W5ASd/njl/y
	 RNWbFlHwTj23fcxONYq8xmmiU3r6VamAtC+gfLljmcPmxstZ7sOGjqQDnr3eL//T7S
	 4K4J8UZXM5pbIB6/DLl/czQz9ian8zDsiwNHE5Vo=
Date: Fri, 5 Nov 2021 08:56:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
Message-ID: <YYTju3KSkC2MHvhf@kroah.com>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
 <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>
 <YYOF9+wDS2J0oqU8@kroah.com>
 <e75eb70e-2495-dce5-34b2-0b933d887f4a@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e75eb70e-2495-dce5-34b2-0b933d887f4a@leemhuis.info>

On Thu, Nov 04, 2021 at 09:50:12AM +0100, Thorsten Leemhuis wrote:
> aOn 04.11.21 08:04, Greg KH wrote:
> > On Thu, Nov 04, 2021 at 07:53:37AM +0100, Thorsten Leemhuis wrote:
> >> On 03.11.21 10:02, Hans de Goede wrote:
> >>>
> >>> We (Fedora) have been receiving multiple reports about USB devices stopping
> >>> working starting with 5.14.14 .
> >>>
> >>> An Arch Linux user has found that reverting the first 2 patches from this series:
> >>> https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
> >>>
> >>> Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
> >>>
> >>> See here for the Arch-linux discussion surrounding this:
> >>> https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
> >>>
> >>> And here are 2 Fedora bug reports of Fedora users being unable to use their
> >>> machines due their mouse + kbd not working:
> >>>
> >>> https://bugzilla.redhat.com/show_bug.cgi?id=2019542
> >>> https://bugzilla.redhat.com/show_bug.cgi?id=2019576
> >>>
> >>> Can we get this patch-series reverted from the 5.14.y releases please ?
> >> #regzbot ^introduced: b7a0a792f864583207c593b50fd1b752ed89f4c1
> >> #regzbot ignore-activity
> > 
> > Process question.  Is there anything I need to do here when this is
> > resolved?  I'm thinking of reverting the offending patches in 5.16-rc1,
> > but when/if that happens, how will the regzbot know this?
> 
> You don't need to do something special, but you need to do something ;-)
> Regzbot will know the regression got resolved if the commit message of
> the fix (a proper one or a revert) in mainline links to the report with
> a Link: tag. Hence, the commit should have something like this:
> 
> Link:
> https://lore.kernel.org/stable/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com/

Close, the patch will have this link tag:
    Link: https://lore.kernel.org/r/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com

Is that ok?

I've committed the reverts to my tree and pushed them out so they show
up in the next linux-next release and will get the reverts to Linus
before 5.16-rc1.  Let's see if the bot can notice them :)

thanks,

greg k-h
