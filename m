Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FB70
	for <regressions@lists.linux.dev>; Mon,  7 Jun 2021 23:38:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d16so14262733pfn.12
        for <regressions@lists.linux.dev>; Mon, 07 Jun 2021 16:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tzl/iu/vFFmoLKFoTmiIShaoSM1s2/J+joAOEt8srgo=;
        b=SUfkvsyAznGc0vyYpzBW9Pk7H55Pq4rmtd/4Owt7s3qsFJc1I/BdMS1zoF7KCyhcx5
         t29l1Sth4Pz8z+J63Xi5C19DJauBQlP2lBNDzQIRJj2K5xxR0bIVoZCayRfG5hNHojbe
         3GOK7/s/w97QFSsUeP6HgcxQrS+CHLr/AKDh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tzl/iu/vFFmoLKFoTmiIShaoSM1s2/J+joAOEt8srgo=;
        b=caWPTr9HGLWrznJ5rRR4N9IDMS+/BBEtaFqBhlmeuRWmXkfgvvO9q2jbRUQoFuGOrI
         XYQDz8uLDUpyWLRd1TrHH80qfI7yewuoEk0ovkdDRpNpora5oAjfxS/tA5kiCvoCmOzU
         FnOR4W2xWVUlUa0GdOB7A0sSw8tfAj/9J5ccmADrEfU6w+shGHT5eNq4icWYbiE+9O1r
         Oq9ijoWQR6J69yo3dSJDU4YkyTQ1QdMn3SKAHwwQ3P/iuF0oW5rUkc5aF8C4DgDfNlXT
         u5aj3oyOout+LkVW0ZbaVEeglhn5yKvj6E2lcARdR9wktONdCgsXD8WKbUB7nG/gNhut
         ytxA==
X-Gm-Message-State: AOAM532DoPmSB3jkUQKzaXlNUhtO8l0W1Q9VusxLUCtsr9+NKEBRD6LW
	xR4F7TrKW8fbgDcYBeNpaHj5Jyah0xqsgw==
X-Google-Smtp-Source: ABdhPJw1Ibg8a/3BGwUKgszQQ5uuesfRMqhnOMCj6TG2FNJRwCsa5E//vGREdKbbbtlT11PWDiPRig==
X-Received: by 2002:a63:4d1a:: with SMTP id a26mr5647966pgb.117.1623109137037;
        Mon, 07 Jun 2021 16:38:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u10sm2789532pfh.123.2021.06.07.16.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 16:38:50 -0700 (PDT)
Date: Mon, 7 Jun 2021 16:38:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev,
	Andrea Righi <andrea.righi@canonical.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <202106071621.C11535A@keescook>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>

On Mon, Jun 07, 2021 at 04:22:45PM +0200, Christian Brauner wrote:
> Hey Linus,
> hey Kees,
> 
> This morning I got a report about regressions when running containers
> using lsm profiles when spawning a new process into a container. Andrea
> bisected this to: bfb819ea20ce ("proc: Check /proc/$pid/attr/ writes
> against file opener")

Aaagh.

> Spawning a new process into a running container is a bit messy due to
> accumulated legacy cruft and here's one way we're currently doing it.
> Parent process -> immediate process -> attached process: the
> intermediate process is needed to attach to the container's namespaces
> and then we fork so that the "attached process" is a proper member of
> the pid namespace of the container, i.e. a child of PID 1 in the new pid
> namespace.
>
> The IPC mechanism is:

In here, "initial" means "parent", "transient" means "intermediate"?

> 
> /* 
>  * IPC mechanism: (X is receiver)
>  *   initial process        transient process   attached process
>  *        X           <---  send pid of
>  *                          attached proc,
>  *                          then exit
>  *    send 0 ------------------------------------>    X
>  *                                              [do initialization]
>  *        X  <------------------------------------  send 1
>  *   [add to cgroup, ...]
>  *    send 2 ------------------------------------>    X
>  *						[set LXC_ATTACH_NO_NEW_PRIVS]
>  *        X  <------------------------------------  send 3
>  *   [open LSM label fd]

As in, "initial process" is opening "attached process"'s attr fd?

>  *    send 4 ------------------------------------>    X
>  *   						[set LSM label]

Does "initial" send the fd to "attached"?

>  *   close socket                                 close socket
>  *                                                run program
>  */
> 
> With your fix Kees, the last step where the attached process writes its
> own lsm profile fails with EPERM where it would succeed before. That
> means v5.13 breaks all container users currently where it has worked
> continuously before. :)

I can only understand this if the fd is passed to the writer, or the
writer opens, changes creds, and then writes?

> The LSM profile is written after we've become root in our new namespace
> 
> 	if (!lxc_drop_groups())
> 		goto on_error;
> 
> 	if (options->namespaces & CLONE_NEWUSER)
> 		if (!lxc_switch_uid_gid(ctx->setup_ns_uid, ctx->setup_ns_gid))
> 			goto on_error;
> 
> 	if (attach_lsm(options) && ctx->lsm_label) {
> 		/* Change into our new LSM profile. */
> 		ret = ctx->lsm_ops->process_label_set_at(ctx->lsm_ops, fd_lsm, ctx->lsm_label, on_exec);
> 		if (ret < 0)
> 			goto on_error;
> 
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> 		TRACE("Set %s LSM label to \"%s\"", ctx->lsm_ops->name, ctx->lsm_label);
> 	}
> 
> So the effective ids of the process writing the lsm profile are
> different from the ids of the process that opened the lsm fd in this
> case.

I'm assuming the issue is the latter (open, drop privs, write). And
I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
either?)

-- 
Kees Cook
