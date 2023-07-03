Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A1388
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 02:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C578C433C9;
	Mon,  3 Jul 2023 02:09:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Czm2HqFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1688350184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YfUDgE9UpoZoJNvCaViUCsdMg1IKYAvnMr8MJkjQcM0=;
	b=Czm2HqFeoBk+SThe11mNo+QExFBvOhp9c1Y+6IrJYGbjaqZgkTZAr864a6YBxJvJxVq+EG
	v04RPX4280StOFi8YgP5/syHyxSWF9GTZmOpSxoilgNckXAd0sPO8GWx6ZNJiBrrblCU0E
	zK6/2wqBhs8JByEokG98HYKk4jNkwHg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b471508e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 3 Jul 2023 02:09:44 +0000 (UTC)
Date: Mon, 3 Jul 2023 04:09:42 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
Message-ID: <ZKIt5vyc_HunicuZ@zx2c4.com>
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
 <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
 <ZKIlibX5wCgWlonq@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZKIlibX5wCgWlonq@debian.me>

On Mon, Jul 03, 2023 at 08:34:01AM +0700, Bagas Sanjaya wrote:
> On Sun, Jul 02, 2023 at 03:46:38PM +0200, Jason A. Donenfeld wrote:
> > I've got an overdue patch that I still need to submit to netdev, which
> > I suspect might actually fix this.
> > 
> > Can you let me know if
> > https://git.zx2c4.com/wireguard-linux/patch/?id=54d5e4329efe0d1dba8b4a58720d29493926bed0
> > solves the problem?
> 
> The reporter on Bugzilla [1] said it fixed the regression, so telling
> regzbot:
> 
> #regzbot fix: 54d5e4329efe0d

That's not correct. I tend to send patches to netdev@, not pulls, so the
commit is going to be different. Just leave this alone for a bit and
tidy things up once everything hits the main trees.
