Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022DE3F5BC5
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654415; cv=none; b=Js1RfMiEuEbA+RGvah1tYwEZNaYlyFhAxf/MqXz4eEtgWkbLB3hYeLaXhM41phT+TFyQUrZy54oAna/g2sDxEsmz4hhgDS52ICsNrpwgUz/gtPtDYwAJb8lyZf7+ryV82Faq885WbUArglLfIq5wt63vYtYVvg82R/NRZRhhtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654415; c=relaxed/simple;
	bh=rmrP0CKPuij0Mb95o8DBviq5T1C9biiS/sWkMpBJrqU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=RH/4x9cAqvAnK3q5yT+COUAh8glAfVZGKKey/WrHqT5H6Zy2J1euY4YjMBKdeWOfXABtSu7PKYLnfkBpArPGmrW7KqLNW2moD0pyv7ZxozNArp8RjU/TXbXOAPteAWXSE6ym9tIJF05mIGtegKseBg32iqz+8kbpmP5vriWCZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOtLhLiA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOtLhLiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780654413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLB31a1gGAMdNDuc+HogbludLHSY28HNq/UbUahWglY=;
	b=JOtLhLiADWDgHapt+08w6AGnhvsW+1lODE1uSbY540hGJe9lCWMXqk24I5tET6oKL3eNJH
	u6jNOQeo6j0/UlCZiOszx+LLhh9yPytILUuPrVvirS4kRrs/+N2gOyXwauCiB7S1jb6joM
	N60JIvsPxE6EcJJ25up1aFcKs/c9LQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-U76J0X2AP2yotBeHxJ52Qg-1; Fri, 05 Jun 2026 06:13:29 -0400
X-MC-Unique: U76J0X2AP2yotBeHxJ52Qg-1
X-Mimecast-MFC-AGG-ID: U76J0X2AP2yotBeHxJ52Qg_1780654409
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490abeb7298so18190585e9.2
        for <regressions@lists.linux.dev>; Fri, 05 Jun 2026 03:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654408; x=1781259208;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLB31a1gGAMdNDuc+HogbludLHSY28HNq/UbUahWglY=;
        b=aC9bHPweCXjfwpbT9ZuCvBUt0nLXa8PZg4PgQ/IbjmM375xONdNsORSnZIYJmbT6Qj
         TvoPfmQvLksTlCbqsN7D05uipYOdWs8XIrzm6UO4KIYGlPW+OINyKfAKO2ufSIII7KXv
         MDPUqPyGDUiYjzXITzFddMu33xmuUeiApx2HCsjX9FLb3W7+p8+xUbCeLzEU/I3BlbRY
         M4/OaxsifzqjL0jTUeWxTDSV5t6bCHmUBdt+pXEzAs46K9SjiK+XAvVGQUbKiAtahhoL
         5JBsjlFUqhPSZz2777AfF2ToA2rmfDLoZvHY4ufk6OumumFRtf87NA9mJv5ll0jmGyxA
         LiNg==
X-Forwarded-Encrypted: i=1; AFNElJ8U1A15jxbIpQYOVHTU0N7vpbWU0HNZfXGl2W5DQ43AJDmNeR1DB3tawvH6pDFT9Ww8xSV4I0q3oexcUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfIvVKhLrpnFR+wCMzbv7RKvi45qAMTYLTxkUL4+XyfqVpLQAG
	DbAFV6RsegraKcQTQqqcSxjMM/En+iMS4VVG9a/G+2iWIQLSKtUxLUi5m89yaDG1liruF9fEmdD
	0IckFHL0wy18M5BmhANMvOow9P1LwxFoidb64nY45n0WWn9h+htBbK41lJW2RSuDh
X-Gm-Gg: Acq92OHDRLBCVLaj4+YSmL2f1uBrRO6GbeBdjE4u+hTL1PUZAVXNElefLp8ojoBIViH
	KW50SzzZSyIVSq6KHZJOP5WjD/900et7exoUvrBzJJ2sUd8GDIBtoWhr5v2YZ5BvrIRig9Ht79N
	caQneMH+zaYlxU9IFgcRS7q1keOjE9aW+lEKXy+afCJVfi7nbHORlTnEPpWNemb01iSGY7XsGgo
	O4uYAWYFWQm5gw6rU3ycxUvz40/r4YYSLJQmjnjsJ4rfBnIvM+E4CAPTjXhy/YpPK+Cb+sEtOSU
	prG07L59d2w0zexxDapWsLvi+dQtf1AsiRF+V/Qc2HWFFZ/NHnbXSzRxe+WEMPBx6B0mwZ81Fku
	o/aAP23u6slvwPTTjQP5XYtycTKxHK4G0cAvUr+NIsTE=
X-Received: by 2002:a05:600c:c0d0:b0:490:c2a3:abae with SMTP id 5b1f17b1804b1-490c2a3abf2mr29040465e9.34.1780654408401;
        Fri, 05 Jun 2026 03:13:28 -0700 (PDT)
X-Received: by 2002:a05:600c:c0d0:b0:490:c2a3:abae with SMTP id 5b1f17b1804b1-490c2a3abf2mr29039905e9.34.1780654407854;
        Fri, 05 Jun 2026 03:13:27 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm26336854f8f.35.2026.06.05.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:13:27 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Fernando Fernandez Mancera
 <fmancera@suse.de>, netdev@vger.kernel.org, yuhuang@redhat.com,
 justin.iurman@gmail.com, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 dsahern@kernel.org, Chris Adams <linux@cmadams.net>, Beniamino Galvani
 <bgalvani@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 Andrew Lunn <andrew@lunn.ch>, ihuguet@redhat.com,
 regressions@lists.linux.dev, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Matthieu Baerts <matttbe@kernel.org>
Subject: Re: IPv6 address insertion order (was Re: [PATCH net v2] Revert
 "ipv6: preserve insertion order for same-scope addresses")
Message-ID: <20260605121325.3d426dc4@elisabeth>
In-Reply-To: <20260604183909.GA877115@shredder>
References: <20260529112357.5079-1-fmancera@suse.de>
	<20260529134045.56330243@elisabeth>
	<ah57wxGjL7JBORR1@zatzit>
	<20260602132118.GA508395@shredder>
	<ah-SvHdPRrYXX6lx@zatzit>
	<20260603074717.GA569921@shredder>
	<20260603174538.5454bb93@elisabeth>
	<aiDUMHKi2Sn1_dYD@zatzit>
	<20260604183909.GA877115@shredder>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 05 Jun 2026 12:13:26 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hypn1YKQ7L9idyI67h1GQ6JpB_DQ61cenAtDZJJYO-k_1780654409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Jun 2026 21:39:09 +0300
Ido Schimmel <idosch@nvidia.com> wrote:

> On Thu, Jun 04, 2026 at 11:26:08AM +1000, David Gibson wrote:
> > So, I second Stefano's arguments for the most part, as well as
> > re-iterating that being broken by this change would require the
> > intersection of two unlikely conditions (misusing NLM_F_APPEND *and*
> > expecting the "wrong" order).
> > 
> > That said, Ido, if you're still not convinced I can do this as an
> > attribute.  It's more hassle, but I can make it work.  
> 
> I appreciate the survey that Stefano and you conducted, but there is
> still a non-zero chance of causing regressions by suddenly giving
> NLM_F_APPEND a meaning in RTM_NEWADDR. We already tried the
> "change-and-see-what-happens" methodology once with this feature and it
> backfired, so it's going to be quite painful if we miss again.
> 
> As I see it, we have three options:

Thanks for the helpful summary by the way.

> 1. Use NLM_F_APPEND. Relatively easy change in both the kernel and user
> space, but at the risk of reintroducing regressions.
> 
> 2. Add a new attribute (e.g., IFA_INSERT_MODE with DEFAULT/APPEND
> options). Less risky than #1, at the cost of a bit more code in both the
> kernel and user space.
> 
> 3. Do nothing. As I understand it, any production software (as opposed
> to a test script) that cares about the in-scope order will have to
> maintain a fallback anyway (e.g., iterating over IPv6 addresses in
> reverse).

It's not always enough, or needed, or practical, though:

a. 'ip address restore' could be "fixed" to load the addresses in a
   reversed order for IPv6, but what should 'ip address showdump' do at
   that point?

   Also reverse the order? Or not, because that's the order addresses
   were dumped in? I'm fairly sure 'ip address save' shouldn't reverse
   it. It would be more convenient for the other operations, but
   definitely wrong, because the kernel is picking addresses in the
   opposite order.

   All these are doable, some look questionable, but any of the possible
   workarounds looks hard to document, or even remember.

b. as to pasta(1) and passt(1): the regression introduced by the revert
   of the kernel change isn't a big one: after all, we had the right
   behaviour for just a few months.

   Similarly, if the kernel gives us a way to get it right, we would
   just stick to it for the future and be done with it. Adding a
   workaround for older kernels isn't a priority because there was no
   regression.

   Side note: the workaround would be rather impractical for us because
   we don't use dynamic memory allocation, but we certainly can't blame
   the kernel or anybody else for that.

c. regardless of how addresses are dumped to userspace, there would be
   no way to get the kernel to do what one reasonably expects it to do
   (also from established IPv4 practice): *use* addresses in order of
   insertion

By the way of c., you're explicitly excluding test scripts as they are
certainly less important, but does it really make sense to force people
to to maintain the kind of workaround Matthieu mentioned? Reporting it
here for convenience:

  https://github.com/multipath-tcp/packetdrill/commit/1b7cd4482ce8

> Therefore, the changes in #1 and #2 are not strictly
> necessary, yet they are uAPI that the kernel will have to maintain
> forever.
> 
> Given the above, my preference would be #3 -> #2 -> #1. The first two
> options expose the same capability to user space, so #1 doesn't buy us
> anything over #2, except a bit less code, but we risk introducing a
> regression.
> 
> Between #2 and #3, production software can't drop the fallback even if
> we implement #2, yet #2 requires us to maintain uAPI forever. I think we
> should accept that the divergence between IPv4 and IPv6 is not ideal,
> but at least it's predictable and dependable (Fernando is working on a
> ksft and documentation).
> 
> That being said, you can send an RFC for #1 and see what others think
> since at this point it's unclear who is still following the thread.

I think there's general consensus against #1 ("abusing" NLM_F_APPEND),
but still, I think #2 is very much needed and fundamentally harmless.

-- 
Stefano

