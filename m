Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5734CD9
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684243116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVPatnC3k+2YTCrqOtx9X1ykWQAM87umCcg4LBsYnSs=;
	b=gYM+u7DLfMw8K/GbkqcsSjSRaAIkZe0YqV60m9SEFv5tmxVSiDMEgbffr7tPQF1Zx6inNh
	FEgBsHxRNPKEzqAq4Yrmn/vwsCr2JQkhmwcwKAFzuTl/AujfoHWM7sG6xCZVfVVMz5e0E+
	9IlGOmO3FtQ0+wdrdksKOqDOPfOXHV0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-IkGvywwTPW-Lif-CGKEy7g-1; Tue, 16 May 2023 09:18:29 -0400
X-MC-Unique: IkGvywwTPW-Lif-CGKEy7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A14B29ABA24;
	Tue, 16 May 2023 13:18:28 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.147])
	by smtp.corp.redhat.com (Postfix) with SMTP id 0EFEF40C6EC4;
	Tue, 16 May 2023 13:18:24 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 16 May 2023 15:18:14 +0200 (CEST)
Date: Tue, 16 May 2023 15:18:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, nicolas.dichtel@6wind.com,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
	mst@redhat.com, sgarzare@redhat.com,
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com,
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
Message-ID: <20230516131810.GA28890@redhat.com>
References: <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com>
 <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
 <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
 <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
 <122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.com>
 <CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
 <8bfb7d1d-f7d0-94ca-4777-e31a2003027a@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bfb7d1d-f7d0-94ca-4777-e31a2003027a@oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

On 05/15, Mike Christie wrote:
>
> Oleg and Christian,
>
>
> Below is an updated patch that doesn't check for PF_USER_WORKER in the
> signal.c code and instead will check for if we have blocked the signal.

Looks like I need to read the whole series... will try tomorrow.

> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2336,8 +2336,15 @@ __latent_entropy struct task_struct *copy_process(
>  	p->flags &= ~PF_KTHREAD;
>  	if (args->kthread)
>  		p->flags |= PF_KTHREAD;
> -	if (args->user_worker)
> +	if (args->user_worker) {
> +		/*
> +		 * User worker are similar to io_threads but they do not
> +		 * support signals and cleanup is driven via another kernel
> +		 * interface so even SIGKILL is blocked.
> +		 */
>  		p->flags |= PF_USER_WORKER;
> +		siginitsetinv(&p->blocked, 0);

I never liked the fact that io-threads block the signals, this adds
another precedent... OK, this needs another discussion.

> +static void try_set_pending_sigkill(struct task_struct *t)
> +{
> +	/*
> +	 * User workers don't support signals and their exit is driven through
> +	 * their kernel layer, so by default block even SIGKILL.
> +	 */
> +	if (sigismember(&t->blocked, SIGKILL))
> +		return;
> +
> +	sigaddset(&t->pending.signal, SIGKILL);
> +	signal_wake_up(t, 1);
> +}

so why do you need this? to avoid fatal_signal_pending() or signal_pending() ?

In the latter case this change is not enough.

Oleg.

