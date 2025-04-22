Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11C1E2606
	for <regressions@lists.linux.dev>; Tue, 22 Apr 2025 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354543; cv=none; b=iSWkHujeEBzqN+ulMNNt9hSVyxrNuc7KjB5ELAxysS9hKpsXEqdOR/UhX+UiaGXmTkwPLA7/tsxftSAvLNs8RqsnDJOp1+LFBCs6LUIJjzDrSwf8skkoTEo8ufMLDYoIoiZCWF/UsWSVEfY94p+/yKyKS5okoQ7efu9lrFpKTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354543; c=relaxed/simple;
	bh=iykaHhBnl9JNM7hxvi+qM8kwPweNLcLOO2zElA+Pdjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB04spbu04sHivPUNNR+gbrwn+tXztPii9PXBuaxCvxsLjdw+4XY7n6C6Ih2Zg5sKHGeyLenXLm447QexEEJ3aaDCNDu9F5DntGRnZBrxyjpc5gROI3YVPwJCGFSdvzjVoQvmFwfo/x1Dji1mgbFiDLpEwnGahsTbONbe20zVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3Iitb3o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3Iitb3o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22d95f0dda4so24623065ad.2
        for <regressions@lists.linux.dev>; Tue, 22 Apr 2025 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745354541; x=1745959341; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CaIOmdrt13KU/miHWyqAdd2EpE7lQ4kV1HkCuMBXWOk=;
        b=b3Iitb3o+VPj0eTyReE9iRHhKA6CkVoK3FgBqjZ37W7ZLqZ0Qj1QtckUngtoB+7WD1
         BKxxm/aWi60uHOlWYCR0k0PI35BUmuz8+qwrKUV4sHv2SyLgjkAg/2T8FQk/CmWoTwnk
         +W3GWAS4L+bixuLUJE6xcHglqzfME0gDcL5WAh4yGpUH0F9ynz942T13l5/qrWPLkgnO
         Qm02ieJNl+z+ilX8MszaAFMwLKGnS62KtM3s0t/wW88SiIV/ZoZm6Ya1K1SvkgxzOn9h
         fVHM1pOIMKV9zJBnwwQ+aQwPnJw/emLQzOhAPgeUFJkiQ997xWxnqCh0UxcI24YDk25E
         o5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354541; x=1745959341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaIOmdrt13KU/miHWyqAdd2EpE7lQ4kV1HkCuMBXWOk=;
        b=XdzzteDDRTuO1/4+YJdDE4l8GdRZfwRotWmQW+3TSGN8jYjIRqoS9ckcZ6uNTpOfTq
         bxMvkrgDdO5wxpP3IAW3plbvs0kMUlqIqNBf76eZxOCYIkX5zYjo/bP9kBgRfeMsZagQ
         uE1CW+m35r97vKOPwTErP+s4PAbs7S/2JmhtbVp7qmWYxJz0uSLhA76Wy7paX95KAy5H
         WFsW07MbhFUh38gU5hEhoWaIac+pMPStG8EKG+EwFwKAMF49NaNA3u8u72Hm4nlExkFM
         C22Gs8DmWCVZyGuXRiH04J/CGlrMhGwibu3/05pnSlD4m47bontHpFElrSU7869cgzYJ
         tz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUnoZ/+tck77o6AN15pNAsvfaAB/5NKfAIGIDYhdVutDf1iGeZxGhYtVUITC7p/9YCW2+bKlBVEm13eBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMlx1AxPGALjNQPilo4piLnixsKLBs7lK5iGHTvQlBK0Nk0u66
	WJqI9BGVsvd0CYs+HfOKkBzrnl3ChxRrt0r//7nlBgH4lGwHALIu
X-Gm-Gg: ASbGncvOBBVFvCUVs7nZ54vReYE68a/V2gEOTkjUIZy95KE17KqcH4OJlq1G5MkKGlB
	0Ju9yi6UMNdYGrZdhjFOi9lKjKdh4vxBeU7TRKEe7QEV9BNBbx/1MFbIV5R4CU6EElN5XiOYJ8p
	ZPtUTa/g++iQ3DpzSkclQ5dZfj2kIeD0z4ro4nX3lO9LDorSkQjT/l7S2kWC8DDLQH40O2KAI7C
	GnBBa2T/dsz0Nz74+FEMrKHPk9FhqesvRKM+r5Ac/EQpNkIapacUfhz5spp7nrv1rhmCUsU/tV1
	38vDl+7/j79wwW9JyTKSxjEgQDeuSX/gRPTFsCdwObvw
X-Google-Smtp-Source: AGHT+IGBlLoRB1xhv3Q/YgrhOc0DfgkasA/12Oe3DR29IJaqjESvijQ/+eEb2nRJAHl8NBi8VItuGw==
X-Received: by 2002:a17:903:2f88:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22c535a4b55mr257118285ad.12.1745354541235;
        Tue, 22 Apr 2025 13:42:21 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdbf00sm89438705ad.225.2025.04.22.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:42:20 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:42:19 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>
Cc: "Alan J. Wylie" <alan@wylie.me.uk>, Jamal Hadi Salim <jhs@mojatatu.com>,
	regressions@lists.linux.dev, Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aAf/K7F9TmCJIT+N@pop-os.localdomain>
References: <20250421104019.7880108d@frodo.int.wylie.me.uk>
 <6fa68b02-cf82-aeca-56e6-e3b8565b22f4@applied-asynchrony.com>
 <20250421131000.6299a8e0@frodo.int.wylie.me.uk>
 <20250421200601.5b2e28de@frodo.int.wylie.me.uk>
 <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>

On Tue, Apr 22, 2025 at 07:20:24PM +0200, Holger Hoffstätte wrote:
> (cc: Greg KH)
> 
> On 2025-04-22 18:51, Alan J. Wylie wrote:
> > On Mon, 21 Apr 2025 21:09:27 +0100
> > "Alan J. Wylie" <alan@wylie.me.uk> wrote:
> > 
> > > On Mon, 21 Apr 2025 21:47:44 +0200
> > > Holger Hoffstätte <holger@applied-asynchrony.com> wrote:
> > > 
> > > > > I'm afraid that didn't help. Same panic.
> > > > 
> > > > Bummer :-(
> > > > 
> > > > Might be something else missing then - so for now the only other
> > > > thing I'd suggest is to revert the removal of the qlen check in
> > > > fq_codel.
> > > 
> > > Like this?
> > > 
> > > $ git diff  sch_fq_codel.c
> > > diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
> > > index 6c9029f71e88..4fdf317b82ec 100644
> > > --- a/net/sched/sch_fq_codel.c
> > > +++ b/net/sched/sch_fq_codel.c
> > > @@ -316,7 +316,7 @@ static struct sk_buff *fq_codel_dequeue(struct
> > > Qdisc *sch) qdisc_bstats_update(sch, skb);
> > >          flow->deficit -= qdisc_pkt_len(skb);
> > > -       if (q->cstats.drop_count) {
> > > +       if (q->cstats.drop_count && sch->q.qlen) {
> > >                  qdisc_tree_reduce_backlog(sch, q->cstats.drop_count,
> > >                                            q->cstats.drop_len);
> > >                  q->cstats.drop_count = 0;
> > > $
> > > 
> > 
> > It's been about 21 hours and no crash yet. I had an excellent day down
> > a cave, so there's not been as much Internet traffic as usual, but
> > there's a good chance the above patch as at least worked around, if not
> > fixed the issue.
> 
> Thought so .. \o/
> 
> I guess now the question is what to do about it. IIUC the fix series [1]
> addressed some kind of UAF problem, but obviously was not applied
> correctly or is missing follow-ups. It's also a bit mysterious why
> adding the HTB patch didn't work.
> 
> Maybe Cong Wang can advise what to do here?

I guess my patch caused some regression, I am still decoding the crashes
reported here.

Meanwhile, if you could provide a reliable (and ideally minimum)
reproducer, it would help me a lot to debug.

Thanks!
