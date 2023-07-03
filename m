Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA6DDA5
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 11:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B84BC433C8;
	Mon,  3 Jul 2023 11:52:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GnC0iVlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1688385145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0p6WxcfcurW1ojVjG0OfmSJPVPldUZ2nwahjcJiKmnA=;
	b=GnC0iVlXNHmnvIR0K+1I8WV2TUjbpmYZBeZkxt2BXrIrYn3VkuUmK8bTUNgVWDrCHDXHiv
	v/Wt/KffreWOpSDlMkZdQ+tq57CNU9lTDTWNBR55Lj4FcUF5R1qUchl/Y6ObOF8SikasZk
	P+/oyCCkKkbkQSS7uiYKzegXZDueZPQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35675c46 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 3 Jul 2023 11:52:25 +0000 (UTC)
Date: Mon, 3 Jul 2023 13:52:23 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
Message-ID: <ZKK2d/2aKoH1RVaN@zx2c4.com>
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
 <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
 <ZKIlibX5wCgWlonq@debian.me>
 <ZKIt5vyc_HunicuZ@zx2c4.com>
 <493448c9-7a76-532b-0f06-adf6b806ef5b@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <493448c9-7a76-532b-0f06-adf6b806ef5b@leemhuis.info>

On Mon, Jul 03, 2023 at 07:18:32AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> 
> On 03.07.23 04:09, Jason A. Donenfeld wrote:
> > On Mon, Jul 03, 2023 at 08:34:01AM +0700, Bagas Sanjaya wrote:
> >> On Sun, Jul 02, 2023 at 03:46:38PM +0200, Jason A. Donenfeld wrote:
> >>> I've got an overdue patch that I still need to submit to netdev, which
> >>> I suspect might actually fix this.
> >>>
> >>> Can you let me know if
> >>> https://git.zx2c4.com/wireguard-linux/patch/?id=54d5e4329efe0d1dba8b4a58720d29493926bed0
> >>> solves the problem?
> >>
> >> The reporter on Bugzilla [1] said it fixed the regression, so telling
> >> regzbot:
> >>
> >> #regzbot fix: 54d5e4329efe0d
> > 
> > That's not correct.
> 
> Yeah, the gitsha will only work when it's stable.
> 
> > I tend to send patches to netdev@, not pulls, so the
> > commit is going to be different. Just leave this alone for a bit and
> > tidy things up once everything hits the main trees.
> 
> Kinda right, but otoh this makes things this slightly annoying bit
> harder for regression tracking. But as the patch subject rarely changes,
> this can usually be avoided by using:
> 
> #regzbot fix: wireguard: queueing: use saner cpu selection wrapping

Here's the final sha:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=7387943fa35516f6f8017a3b0e9ce48a3bef9faa
