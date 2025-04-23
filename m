Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13019D081
	for <regressions@lists.linux.dev>; Wed, 23 Apr 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436782; cv=none; b=jxuzsLWysWh+Uidw7kmM4FUxCIVGAX3+cZEMTyDp4gIam5RvMofyi5ChCx5dcIP7u289Zb9daknlWiojKA+OSslkuJjuozaQxjA3iKK1sE1dFPbYTixLnahwoLP/6wnUfPd5mz8srux7W2mHGxREJqs4Xxt2k9TNfXIid4dvGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436782; c=relaxed/simple;
	bh=qeXaEOZxb709KPbgIWs4cj6m9zaoicIroOb1v3e0D38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CthRZKd88FMoLO+UkujMd+uNO+OLS6RyNH0xGBEYxYm31KBCLegcUHPCNlV36hg8QnpQmXmkQvYKHxwZSSRfL7cT6NK4P+BYxXNIYVyr2yfFSfVJW7ALF0OombShBRGO4IKLdnwDk1G/qkgc2ekbhsS5pyrOxx2AdZ78senHeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ktlvh72+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ktlvh72+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c33ac23edso2225805ad.0
        for <regressions@lists.linux.dev>; Wed, 23 Apr 2025 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436780; x=1746041580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7TWawy/oO2koF169FCbsai+IajiXPIwWUAaxyA1lZrk=;
        b=Ktlvh72+wgkqaLrWs3FoDQM3lZfcOq/6Hk144Ob10XDG1EjRtFoassEnXUS9BIsc+h
         jfBDRoYcLCjFlKtcxmclhmQvo32Ad+fKhBEkCHQlXSxx0JEMNKZ2qHdkIYFaq/3FyDB1
         FUJlZSDTMlcRFBPUqx9UZIOTy2j9ZPa9x5pkirvVcuTBJ8wejLu1gLlmHVeD3AoMXdbn
         ornf/7+5rA2dT+KTcp2QVS8940nNIAuHk8HyH9zoJZZY1F6665X+qtjm+DFDQZgeegGZ
         4GrZozE1zur07A6CEN+XFykEnZ2EkyRZSBN/znKsta9XowOSSaCWPAdz/eIvrCgmWsmI
         sRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436780; x=1746041580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TWawy/oO2koF169FCbsai+IajiXPIwWUAaxyA1lZrk=;
        b=u8Dq2XsqDyaSHwJjC7XImrA3JwdF1r03w3mfh5TCix1DPQP2lo3+0LoAwXKqPdTS0f
         29xPUwePUR0ydmjpwjy1b8S/rmcZ+broMtwOH+kSgLwz+iM2FUiaCTOiV++OUfDJ6xf1
         SR61AfjjJ1vgWLPJnAQ7tXo6eaCXFv4fr0/b1njBuDKGZXNWVZmyHOpr3b4xasFzaQhX
         ft/bOw4sAcUu3Gmyit/ICOZE9K+nJZGdURP1RmRNuM4P4gBk3KyDlwybiwQjkDfduxGN
         RsEmmZ8SVD4jixg8y6GCnxmifU8M8kheus/V5qAtjyN51ftIMScPx2NYTvsi8G8no3wT
         HxnA==
X-Forwarded-Encrypted: i=1; AJvYcCUk0nrI4MPoGjgRdq4UJsEjXVvfJdIIhQG9dHjb+8RUxNvHGSy5kavKXaDKpVpuaj/WekYN6CImo/qa7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDlhwwSdvq2gA/6ZYYJmM8RLCveoIZbMc64EVXdLjoNPrslXe7
	kkZoIPME17zGDQVDQBZULXw4q1aaQ6h2dqEc3NMWTyxMvvthNMdh
X-Gm-Gg: ASbGncv3EX1FMnI2QVyLpsEEzKUXKyZM10o+sxbz57IRBTdh8Z9upb2juhQc38gvrEf
	+Pq8M3rkKdDh+5RQqVpC3LRbMvr7fAPGN993h8hWPT6owe83F8OmI7XU85gLAGYi3Gn9zNtoIrI
	yKIdKF164hHrPsKIjnffDyW1oVP+7gumYhkJ77/pwR1P2MIst6bYlLcKnjeaD/SR2E6LxJCczfw
	GZst/za83/HpEUoWGyk6buiX+0prHqvu2/RSz5HIDfpimfkonlpkztr8JgX0hHF3RoGnwLa5RG7
	gGInv6jRZKlaeNi7f4snphrAFyV7drLvzsY6JyB7qghz
X-Google-Smtp-Source: AGHT+IEWT0wZBmAOH0PSIjsDQw7UecOVeWgSLRwG+BXz/ugDANFWFinATMDNMWo+M4dyODERvpT75A==
X-Received: by 2002:a17:902:e5cc:b0:223:3630:cd32 with SMTP id d9443c01a7336-22c5365eaefmr309410525ad.53.1745436780172;
        Wed, 23 Apr 2025 12:33:00 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf52cesm108249605ad.65.2025.04.23.12.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:32:59 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:32:58 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: "Alan J. Wylie" <alan@wylie.me.uk>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aAlAakEUu4XSEdXF@pop-os.localdomain>
References: <20250421131000.6299a8e0@frodo.int.wylie.me.uk>
 <20250421200601.5b2e28de@frodo.int.wylie.me.uk>
 <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <aAf/K7F9TmCJIT+N@pop-os.localdomain>
 <20250422214716.5e181523@frodo.int.wylie.me.uk>
 <aAgO59L0ccXl6kUs@pop-os.localdomain>
 <20250423105131.7ab46a47@frodo.int.wylie.me.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423105131.7ab46a47@frodo.int.wylie.me.uk>

On Wed, Apr 23, 2025 at 10:51:49AM +0100, Alan J. Wylie wrote:
> On Tue, 22 Apr 2025 14:49:27 -0700
> Cong Wang <xiyou.wangcong@gmail.com> wrote:
> 
> > Although I am still trying to understand the NULL pointer, which seems
> > likely from:
> > 
> >  478                         if (p->inner.clprio[prio].ptr == cl->node + prio) {
> >  479                                 /* we are removing child which is pointed to from
> >  480                                  * parent feed - forget the pointer but remember
> >  481                                  * classid
> >  482                                  */
> >  483                                 p->inner.clprio[prio].last_ptr_id = cl->common.classid;
> >  484                                 p->inner.clprio[prio].ptr = NULL;
> >  485                         }
> > 
> > Does the following patch work? I mean not just fixing the crash, but
> > also not causing any other problem.
> 
> > ---
> > 
> > diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
> > index 4b9a639b642e..0cdc778fddef 100644
> > --- a/net/sched/sch_htb.c
> > +++ b/net/sched/sch_htb.c
> > @@ -348,7 +348,8 @@ static void htb_add_to_wait_tree(struct htb_sched *q,
> >   */
> >  static inline void htb_next_rb_node(struct rb_node **n)
> >  {
> > -	*n = rb_next(*n);
> > +	if (*n)
> > +		*n = rb_next(*n);
> >  }
> >  
> >  /**
> 
> There's been three of these: 
> 
> Apr 23 08:08:32 bilbo kernel: WARNING: CPU: 0 PID: 0 at htb_deactivate+0xd/0x30 [sch_htb]
> Apr 23 08:08:32 bilbo kernel: WARNING: CPU: 0 PID: 0 at htb_deactivate+0xd/0x30 [sch_htb]
> Apr 23 10:41:36 bilbo kernel: WARNING: CPU: 1 PID: 0 at htb_deactivate+0xd/0x30 [sch_htb]
> 
> But no panic.
> 
> I've run scripts/decode.sh on the last one.
> 

Thanks a lot for testing! This helped a lot to verify how far we can go
beyond the panic and what I still missed. To me it looks a bit
complicated for -stable if we make everything idempotent along the path.

Do you mind testing the following one instead? Please revert the
above one for htb_next_rb_node(). I think maybe this is the safest fix
we could have for -stable.

Thanks!

--------->

diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
index 4b9a639b642e..3786abbdc4c3 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -1487,7 +1487,8 @@ static void htb_qlen_notify(struct Qdisc *sch, unsigned long arg)
 
 	if (!cl->prio_activity)
 		return;
-	htb_deactivate(qdisc_priv(sch), cl);
+	if (!cl->leaf.q->q.qlen)
+		htb_deactivate(qdisc_priv(sch), cl);
 }
 
 static inline int htb_parent_last_child(struct htb_class *cl)
