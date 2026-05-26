Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF911DED49
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805028; cv=pass; b=tv21WzOpNU33l3CArXkVE/SVyULyP+bLkubgKbGfnBjlbLynX0SfEFsPPLTmKE6MqKepKTOneUjrMeiXGWFBnQ+N0djMCUm83pbFgQ0jR6nMpBc+zkLFgZwclboTpY/trYM1T6p6BAcNSmpVDHuTwSgVtc9ZCkCLRp43dFbZOeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805028; c=relaxed/simple;
	bh=CPjvAUwnknL46Tj325qM1LRtHgQmjQzHZUIto+uk0zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOsQBQUeVgHUI+EKph6RgvEDFynHQ7qAuENf/jVmJLD//gnVhn3GgivMdJV1skcvSfggKJ6EJHgtCmffMjzBn4wbD7MAbMPkwBKJ0RPWeIYCDFha7N6MltRLf9ml+n+041Fkc6JjmN98OJRN+IgvWaF1n9IgjSgeDPPZPrSYNuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEkkLnTC; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEkkLnTC"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c7a459105so11454818d50.0
        for <regressions@lists.linux.dev>; Tue, 26 May 2026 07:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779805026; cv=none;
        d=google.com; s=arc-20240605;
        b=SF+H36OIKtcKUHF60wqq5wE591qxE8mmvYxOZnv5szlmqoQFTy32zsIWM9B2F8nWge
         0lj0TInMAG0KhbgDYrpECX4TXg9SJmnCTRbNNOrDp1RSy05RIUhbxLLcPRhI5/3QRCww
         pMnK5Ixov6DVS8zX1yQsM386l5wINzLXz+O4IraM+iLlQXt8XKjYVuMib9PBA4fQGRBa
         ePUf9eJzlPt/XUj3B1MrHbmPUCn/o/X//pF7WzmQV4XKGWnmwW8qSI4MCsCdUc0YT14m
         Oqx+vke2Tz7lBcWVxL9GakqM14v5kRVlSTmpU/BlZ/s2iHf+2vSgnq4m6zVWxZR6yij1
         r16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPjvAUwnknL46Tj325qM1LRtHgQmjQzHZUIto+uk0zs=;
        fh=1rqI/4B/dkYW12bIgvh8U6csKZvkmkY4+9AbuMHE6x8=;
        b=XrKILAdr7ddInr+zNIln6yugYz956O/h6bEPfczacGl9odMkutNzMz7+Zq4Lew6/fG
         tlMYCNRCe4eM65jnFnK33DfzNj5kfU5sGgs57WeBNV7MZyIiRitqaJ3bbvbxpPTbAuCq
         bStdRkUMrDkyL1sKxKaeV2pKKTTFKc3e8ebi2CQo1qr6D59rWiNZtFvHM+TGIoU/+aCe
         XxSmr5CbYFCEnThrD4JumZWODXpZI/Qg19lSV9/eOQU2nA1Iatt+281g+7ojc+KiJoOR
         rrACssn/0BUt3teiV4KMyG6XtEc4CRRVkUnr4+SX+N7Gb69M6Z+mRdoqVfgTMBqQkxwK
         J0Ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779805026; x=1780409826; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPjvAUwnknL46Tj325qM1LRtHgQmjQzHZUIto+uk0zs=;
        b=kEkkLnTCA7DljR3t2RZvv819sWy0UHXKvSZbOmmf+HdDPWSyh9EAcspEpuR+F9qJMa
         QdyzjueFxWzUM/O5+PNOD5Y1s4ieRQCrUHJC7GKr1tAjbyFpmhv4mbAdE2QSm7ILXhy2
         A3rUn9ofYzjxsagFOHcGzjM7PE6UmMdixOdHgnVOsRHvOc/KrJnu2PU1M+lDWZpA8U5/
         GrgRuMstBW5IiLcBWN285OFmPEqYribLeuSGz9nvix696VsAKwjm0r0922WIb3a7Fydt
         1wEpLicEl1jjxkUBgC3LNhty7UZ+cSfqEjlveli2GYLM0WpcDwMYQfyP2QqYEybAuVkW
         4xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805026; x=1780409826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPjvAUwnknL46Tj325qM1LRtHgQmjQzHZUIto+uk0zs=;
        b=gDxJYN0idEMzGGqgPkos3emZAPoEjHE/Db1roj1S+N6rx+eUQeJK2XUo6331q5Yqe+
         xeVM0VJMScnIVvPTRf793KIJWruK32zLtvdmTWMLYPbkX57XKnq+eonsNYTUYH3oC9jl
         AObGnaxS2xprcBBiSpOflz4+VkvnxI1619I/h6H1FpgYAW80QI6t2ED7T34RH8+6PHLl
         tlrrb93NaqMbAGbJlDsXfH4d2KEq3hqcb5Oq277eTuQvEVb/J0GcpX3UCfCmg5aYEoKs
         YPTCoP59MVPJCa1CUkRhOxrhMQ0WQdxqOooFb2qdYbEhOyICIAS/a+7dW8FXc/V+5siV
         r3wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8c/uoPKPqsW7nX603MUUv7SubP9iq0oZlWWXOBVpOzLyBOOvs4kw1/3ALamHN0fSL36h8jo2evRc/s+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4KNVlXchzZQocXOvNBG+98K2Ot34YnXZ++9yETKmHj4vZnhSb
	ZpNC5uO7uyrgEa9o8KnaNlSjrDaO61PjQuEcZtxJITwofF1cSDrw3Xf3LV/MQY9Cf2KF+D8bISQ
	GUIZz+Cp0B6L6v1R8O0PpUhNfsbQYjdo=
X-Gm-Gg: Acq92OG8az4GFOEJmWjPfkNdcStaNFDAnQzhNwnAn9TaUtPr812pWO9Rnvh5iJwWqvi
	7QtupDsLoCrgWudKD3uye6X0l1m5bkEfo6kJ90K95FxzDxYtKUE3nUn8vOniyQ5Y8o9amqnTEEm
	jr5vzbRdaYTCHx2RAc2TrNJqgVs/8BkY0kYwWcsM2xOwD3xHNjSpofRBX4V5UicWdU7K2Ijso4R
	FnAXeamti7u9JxTBD1srOw0870mFuo8SR820NS3wBTk4E5ELWo+O8rbOLs+4FCg18Im14xE9VqZ
	cswuh8Ya9tBF5YzTDso0Kyos+WoXzbyKjluzGNTR6Q==
X-Received: by 2002:a05:690e:1285:b0:651:bd7e:c04c with SMTP id
 956f58d0204a3-65eacdbcbc6mr17674347d50.21.1779805025924; Tue, 26 May 2026
 07:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMw=ZnSaVSzn1RGtiNRG+iNj8M1e12rZtA98i4jL8jYP5UyzWg@mail.gmail.com>
 <mcm5gloab3zt5duszhtk4p472rsvmrhnesocg2n3kghqunwd5n@2izhebvb2gvo>
In-Reply-To: <mcm5gloab3zt5duszhtk4p472rsvmrhnesocg2n3kghqunwd5n@2izhebvb2gvo>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 26 May 2026 15:16:54 +0100
X-Gm-Features: AVHnY4K1Ck1F2aIxmhHouFWAO3rkhXrm9vXX1726CrwmF33F4hGXerbXZzKiBYI
Message-ID: <CAMw=ZnR4TaZvobAE5Pr+9MUGBswTmHdus5uPJ_Ae+dGpDuNoMw@mail.gmail.com>
Subject: Re: Occasional 'WARNING: mm/backing-dev.c:636 at cgwb_release_workfn'
 when running mdadm
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Mike Rapoport <rppt@kernel.org>, Christian Brauner <christian@brauner.io>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 15:14, Jan Kara <jack@suse.cz> wrote:
>
> Hi!
>
> On Tue 26-05-26 13:01:11, Luca Boccassi wrote:
> > Hi, I've been told to report this here.
> >
> > In our CI test that runs some mdadm commands we occasionally (maybe 1
> > in 100 runs, not reproducible manually) see the following kernel warn:
> >
> > [ 15.769393] TEST-64-UDEV-STORAGE.sh[245]: + mdadm -v --stop /dev/md/mdparity
> > [ 15.786033] ------------[ cut here ]------------
> > [ 15.788632] !list_empty(&wb->b_attached)
> > [ 15.788634] WARNING: mm/backing-dev.c:636 at
>
> Thanks for report! Interesting. I haven't seen this yet but I suspect my
> rework of cgwb inode switching (happened in 6.18) could be responsible for
> this.
>
> Since the 7.0.11 kernel we've got a couple of fixups to this code. In
> particular 6689f01d6740 ("writeback: Fix use after free in
> inode_switch_wbs_work_fn()") and now also fixes sitting in
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.writeback
>
> Your script seems to be exercising mount/umount so the above fixes could
> indeed be related to your problem. If you can run with a kernel built from
> the above branch, it would be great if you can verify the problem got
> indeed fixed.

Thanks, it's very occasional so can't reproduce it manually, but once
that new kernel version starts appearing in arch/rawhide, I'll report
back if I see the same warn again
