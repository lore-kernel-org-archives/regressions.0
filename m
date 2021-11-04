Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376D2C8B
	for <regressions@lists.linux.dev>; Thu,  4 Nov 2021 07:04:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78DA861051;
	Thu,  4 Nov 2021 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636009471;
	bh=FB8AN3+z0ZFJq3ZEUl6SC+0VH0wBjAUBJixQwUIZtfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgqHrFn72JoKO+TFEyPhPf36ClAJax8eFEII3HEQZUqBoDXxvWyx7IuJs+O0Awphs
	 AYXGkRAxus17HBfdr5nbEcltRm7k8IHOGBs/1M0hc+Rv/wmZDXQ6LcbXaF4j50fJoO
	 wmTcfztQm+aLBK6EVf350m5uX9355obH5ibD+tkU=
Date: Thu, 4 Nov 2021 08:04:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
Message-ID: <YYOF9+wDS2J0oqU8@kroah.com>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
 <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>

On Thu, Nov 04, 2021 at 07:53:37AM +0100, Thorsten Leemhuis wrote:
> On 03.11.21 10:02, Hans de Goede wrote:
> > 
> > We (Fedora) have been receiving multiple reports about USB devices stopping
> > working starting with 5.14.14 .
> > 
> > An Arch Linux user has found that reverting the first 2 patches from this series:
> > https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
> > 
> > Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
> > 
> > See here for the Arch-linux discussion surrounding this:
> > https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
> > 
> > And here are 2 Fedora bug reports of Fedora users being unable to use their
> > machines due their mouse + kbd not working:
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=2019542
> > https://bugzilla.redhat.com/show_bug.cgi?id=2019576
> > 
> > Can we get this patch-series reverted from the 5.14.y releases please ?
> #regzbot ^introduced: b7a0a792f864583207c593b50fd1b752ed89f4c1
> #regzbot ignore-activity
> 

Process question.  Is there anything I need to do here when this is
resolved?  I'm thinking of reverting the offending patches in 5.16-rc1,
but when/if that happens, how will the regzbot know this?

thanks,

greg k-h
