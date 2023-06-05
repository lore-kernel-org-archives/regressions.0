Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0557811C9B
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q9kK4FWpujilN7N4KgicC38GOFmjovQF+Cg7lFXJo9s=; t=1685964765; x=1686828765; 
	b=XXzn6lrcOM+P+MTSX2gqd0FoqZJkm3EWGcLchTBSFCASWynUk5ABTHPgdtQUKjspUho8oQBjCbs
	5zReG8W+r+9USjGQqCIEdX8M0ZHQxwE1/ztL/+xrU0QP7ZXUVB+mQiygPjNjeT86daQBA0Y6oaAlM
	L1x0gkJEpd1ERGuLpZjl8dBVY5bKodxjRAVPrJsCqMsLsvX9LNVkDVkgHtLBSjdUHIydZshLLguFR
	/k2ELRlQgkNU+BQIR5d0AsIDrFF/l2miDr78vA7wfKPVjAnSll6UtAUAvWJh4Lp3nF7HQhPZ4inHJ
	LwwoSOHR9dRrnGtHXDZ3F/2LGVC0geh1bxFQ==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
	by mail.blnma.de with esmtp (Exim 4.96)
	(envelope-from <malte@starostik.de>)
	id 1q68K2-000D3H-2j;
	Mon, 05 Jun 2023 11:24:26 +0000
Received: from zen.localnet ([62.214.179.90])
	by mail.blnma.de with ESMTPSA
	id hgEtK+nFfWQPPwAA399c4A
	(envelope-from <malte@starostik.de>); Mon, 05 Jun 2023 11:24:25 +0000
From: Malte Starostik <malte@starostik.de>
To: bagasdotme@gmail.com
Cc: basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
 linux@hexchain.org, regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date: Mon, 05 Jun 2023 13:24:25 +0200
Message-ID: <3250319.ancTxkQ2z5@zen>
In-Reply-To: <ZG3ipauL9FTnQJiC@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

chiming in here as I'm experiencing what looks like the exact same issue, also 
on a Lenovo Z13 notebook, also on Arch:
Oops during startup in task udev-worker followed by udev-worker blocking all 
attempts to suspend or cleanly shutdown/reboot the machine - in fact I first 
noticed because the machine surprised with repeatedly running out of battery 
after it had supposedly been in standby but couldn't. Only then I noticed the 
error on boot.

bisect result:
904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
commit 904e28c6de083fa4834cdbd0026470ddc30676fc
Merge: a738688177dc 2f7f4efb9411
Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed Feb 22 10:44:31 2023 +0100

    Merge branch 'for-6.3/hid-bpf' into for-linus
    
    Initial support of HID-BPF (Benjamin Tissoires)
    
    The history is a little long for this series, as it was intended to be
    sent for v6.2. However some last minute issues forced us to postpone it
    to v6.3.
    
    Conflicts:
    * drivers/hid/i2c-hid/Kconfig:
      commit bf7660dab30d ("HID: stop drivers from selecting CONFIG_HID")
      conflicts with commit 2afac81dd165 ("HID: fix I2C_HID not selected
      when I2C_HID_OF_ELAN is")
      the resolution is simple enough: just drop the "default" and "select"
      lines as the new commit from Arnd is doing


BR Malte

> On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
> > > What last kernel version before this regression occurs? Do you mean
> > > v6.2?
> > > 
> > 
> > I was using 6.2.12 (Arch Linux distro kernel) before seeing this 
regression.
> 
> Can you perform bisection to find the culprit that introduces the
> regression? Since you're on Arch Linux, see its wiki article [1] for
> instructions.
> 
> Thanks.
> 
> [1]: https://wiki.archlinux.org/title/Bisecting_bugs_with_Git



