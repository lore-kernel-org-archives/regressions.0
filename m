Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B12FB8
	for <regressions@lists.linux.dev>; Tue, 15 Jun 2021 06:21:09 +0000 (UTC)
Date: Tue, 15 Jun 2021 06:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1623738059;
	bh=lw5osVgYiJfQCZCofGUwhScUt21f+XdpmwbqzERy+Jc=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=HrgYwr+x8IsQK9b8k6EDnk9AgYBDC1Dnvati/jg7c1vCprDjbEzaUYU2a0dnsV+iQ
	 NluyFHC1VJwKnrv8QdGjcRBa2W7mK0+XJsFMkiCQmmT75MCgOIvLo1zdyLQj+8o7BL
	 zUVPO+/nVQXjWSSZKQfHDHZz4kD3pGCiCuYYtjA8=
To: Greg KH <gregkh@linuxfoundation.org>
From: Adam Edge <baronedge@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Reply-To: Adam Edge <baronedge@protonmail.com>
Subject: Re: Regression after 5.7.19 causing major freezes on CPU loads
Message-ID: <Db4HNrx24ySuyTJUmyA1QlComifjMlUPL1BUdigtYp3uALuovNXf28l8YARD3sg-9RcOoobqiLg5tgQDbK3bA0ECXtCNHhINA_OV2_60mu4=@protonmail.com>
In-Reply-To: <YMhGDxrELFMrye9c@kroah.com>
References: <HnYKcqmY_z0ERb5qOOUauOLY1vt6nxuKHXzuKVrZ297elyqtzpsWTrjUUnlIDG7mQUYnJMfS8HkFceFMf0Fd_GLzOMghgf4btNt9YhwwZK0=@protonmail.com> <YMhCK8x7R4TbnLAF@kroah.com> <GUSUkWNwTxbgBsjYfpPEreYbwdu5JGec4XqJhWkFs8UncAWLJ9MdDIUvmZ0wYDLj8dFmEGcImo_fDBWte9QaFV2Yil6W7XLHlyXENv6vqd8=@protonmail.com> <YMhGDxrELFMrye9c@kroah.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Tuesday, June 15th, 2021 at 6:17 AM, Greg KH <gregkh@linuxfoundation.org=
> wrote:
> That sounds like the offending commit is in that range, which is good,
> you have narrowed it down.
> Just use 'git bisect' to track down the place where this fails at,
> that's all we want. No need to get a debug log yet, "failing to boot"
> is a good sign something is going wrong :)

Thank you. I will have to get back to this in the weekend then, I will
inform you (and the list! :^) of the bisect results as soon as possible.

Best Regards,
Adam Edge
