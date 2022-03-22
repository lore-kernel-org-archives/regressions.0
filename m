Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024AA31
	for <regressions@lists.linux.dev>; Tue, 22 Mar 2022 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647944399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m4GF+9cHV53cr1b1xAXRydH38vqCGfAi4QbQEVblHtE=;
	b=ITZFY3lDdiLwM3qGqCHHqFTZAC2yNu1BNFlZpNa6bIQoVXc/xzGT5ZsAtAYKwErHsh+3KF
	qM3QjBaRPkOJp9BUAVb3bfvfHBRealMaBLoITe/uAoxgFL6xDJe149HhRe4mt0jJfm5BcS
	SGNPQu/jb2eb/AfzWIZ/IMAX8sqTNXQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-FQewODulN-y9kmYMuuwegw-1; Tue, 22 Mar 2022 06:19:58 -0400
X-MC-Unique: FQewODulN-y9kmYMuuwegw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-2dc1ce31261so145825687b3.6
        for <regressions@lists.linux.dev>; Tue, 22 Mar 2022 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m4GF+9cHV53cr1b1xAXRydH38vqCGfAi4QbQEVblHtE=;
        b=N3iRm0gFR12bl84o7GwcBCyvHc4zivgnSw79AXYjhKU72WQW1wTJY2q/VEw1FM5xeW
         0ys6GihqrLo7KC/znD5OkeVOlwcqhwjAS2RsHZXh1zZJr/N8oTFqwsemUbcYVTR3xgB3
         aFmrHLKKcd6C8BOdSv6AVamHlFM/D2h9dGldcSjX1PL3+d4XyXAESA407uwjdYTbWs/M
         wzBZvzQJDk8VividVyysQ3Km1A/k7ctqMBp+dmOvNw+jnwlFgNwsday/wCvzd0d7udOY
         PJdiGYE/tbC3ztpbYDXMCFm2ZXdQo18XpNE6ZdDw1/KD2DGxUysG58zHjAxNcV3E00tm
         wkiA==
X-Gm-Message-State: AOAM532rpF+31KFM8c18ACV2aEklOIDFGCPnG/3bFuikL2Ss8EWJ5sFP
	fnujRquM/VF5+AyiWiRRNHXI8ZazxMJlTm4ZlEr2LX6EL5zln5FDlZCvW2zk7D9mhDdFwj80HBN
	hoKxBfEtNcLh9vNt7cCjdQAVYA74VLya23AdfgUU=
X-Received: by 2002:a81:79d5:0:b0:2e5:9d33:82ab with SMTP id u204-20020a8179d5000000b002e59d3382abmr28322737ywc.460.1647944398074;
        Tue, 22 Mar 2022 03:19:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1s+XqKJwWIkv18BmjfiRSu7eZCg2W9vokwL7Up2nCK/iOM0QMoUFKZUpNL1cAHqgyWIPdVSoun3BcuCKTC8A=
X-Received: by 2002:a81:79d5:0:b0:2e5:9d33:82ab with SMTP id
 u204-20020a8179d5000000b002e59d3382abmr28322720ywc.460.1647944397874; Tue, 22
 Mar 2022 03:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4VaGDZr_4wzRn2___eDYRtmdPaGGJdzu_LCSkJYuY9BEO3cw@mail.gmail.com>
 <CAE4VaGDKXnQJKdayeNsAD5RcqsKu5XG2UeweLvgZoFO-pn-t9Q@mail.gmail.com> <Yjl26QqwU1L2XWoh@kroah.com>
In-Reply-To: <Yjl26QqwU1L2XWoh@kroah.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Tue, 22 Mar 2022 11:19:46 +0100
Message-ID: <CAE4VaGBRcwPEO3JZtSesvE0bFTQ_P62mC7MmZ5Rc9VQey+=L_w@mail.gmail.com>
Subject: Re: PANIC: "Oops: 0000 [#1] PREEMPT SMP PTI" starting from 5.17 on
 dual socket Intel Xeon Gold servers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jhladky@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> Can you use 'git bisect' to track down the kernel commit that caused
> this problem?

Yes, I will try that and report the back the findings.

On Tue, Mar 22, 2022 at 8:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 22, 2022 at 12:37:37AM +0100, Jirka Hladky wrote:
> > Cc: regressions@lists.linux.dev stable@vger.kernel.org
> >
> > On Tue, Mar 22, 2022 at 12:29 AM Jirka Hladky <jhladky@redhat.com> wrote:
> > >
> > > Starting from kernel 5.17 (tested with rc2, rc4, rc7, rc8) we
> > > experience kernel oops on Intel Xeon Gold dual-socket servers (2x Xeon
> > > Gold 6126 CPU)
> > >
> > > Bellow is a backtrace and the dmesg log.
> > >
> > > I have trouble creating a simple reproducer - it happens at random
> > > places when preparing the NAS benchmark to be run. The script creates
> > > a bunch of directories, compiles the benchmark a start trial runs.
> > >
> > > Could you please help to narrow down the problem?
>
> Can you use 'git bisect' to track down the kernel commit that caused
> this problem?
>
> thanks,
>
> greg k-h
>


-- 
-Jirka

