Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C8146A91
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157741; cv=none; b=HCtaLAEIJz7UU7H1fvY4A0q287isog5Z9sIfszOmD7c6ERbibSURry8qmSV/DxXynPFV4s6uK/1UfTBgnvv0BzBv+UkIqmDsEClO5baHYGyi0GTLJhXb6EIrQAJ069KDdNpMQIVKuot+E2zlAeUrT8kbQrRx41TBSW0zdXOsHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157741; c=relaxed/simple;
	bh=ibwa7qVlsz6WfcpJqPrroTnKs/SIZZIG690/0G7mCPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSbS1DNZ+th1Bxk1eUSHK9+7Cavj2mu9cyH4XQo8yanFIUkXxkn3atR3XE9jA9+QyqdNhju3vvNp3BjjLmJ+6Hu8basf9vNDUShXnY+VB+4LnmgbjAT+f2phdeEyiq2fjnYrZgdeAfsrY6AapF102ewrmNb5mr1awDpY76QAK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4tzQ5Oc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4tzQ5Oc"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e24c889618so29073135ad.2
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712157739; x=1712762539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fd7qpkMBxQ2+k8rxh1w6ZQnt5fuyzAt4KYqqtVYV1Mw=;
        b=b4tzQ5OcQeQhcQI28gmLwjVqbkZj20ChrrID+xM+TeohlD+GEbJUt9p/+AvoZh+e1l
         ijOwaC3kXPoqhVM8gUeLfdnsMQfw7QA8hrH2cVmmim4pvlqd/c6OzsGcg2aCsit4bgtl
         BnOeip3MgfBRm+zoSlvoGspRdqQ0LPan43m++/3WuBxtmpM6+ybIqSbXOfB2er8nMg00
         vSDCccuRPRbi71IIQdTtihrXpyQKToY0dhvCDro/QozpZmWz4m0MsP13Xih/pmT0vURd
         XEZX+DAVuLQExK0MwKe6Z48ewq6eLl9n4rWqxNEgB+MXDwGC4Gq9upCwe1/L6G9DuzQc
         whrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712157739; x=1712762539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fd7qpkMBxQ2+k8rxh1w6ZQnt5fuyzAt4KYqqtVYV1Mw=;
        b=rcyP2RkpGRm8jOHZmAtx2/YKzd9ZeaXG6vT/R6Uuc1DHYyDm4jvPh/Gs3WaXC7o6G7
         YyXyg12eEK0BxNmdSPusIo/uxCbT8dKdKLWQ99P/3Cevgy2l+Y0M8B118exKz/vwubBU
         tVlO5axjzBmLiScPWTluop7bgw6p3+UwSzt6BQkhbInyQ3sRijJ1D0NZzj9vqsMXdi58
         xCPDqyc7tUedCUC6rWIZxIX2AzD3bytAdPY4lymFC0nPvPqMAemc5dhMwmNDO4EVqoS0
         CkKWfX7C1zqyGY561Xjd0quu/9JERpJqgyQI9YeKAMI34RXUHFe30Bv2wqRbqKviSYDC
         Fgvw==
X-Gm-Message-State: AOJu0YyPQ2HX2bzgyO6//IWHN/nyAhv48oSXV4Ogty18qWIAw1qr2+/n
	5ibQdYG5GQMjwRkyXjSs8jvG6GKK2EnGWzbflxuYCC3PpBB//BqF
X-Google-Smtp-Source: AGHT+IHjO4mpK4Tq4azhCzt5xkjqRK+0OXIWC7WSgQ51pHzDtg/QMk6JiACDB2L0msI6Q6if578FSw==
X-Received: by 2002:a17:902:f612:b0:1e2:9ae0:2165 with SMTP id n18-20020a170902f61200b001e29ae02165mr1541870plg.0.1712157738889;
        Wed, 03 Apr 2024 08:22:18 -0700 (PDT)
Received: from localhost (dhcp-141-239-158-86.hawaiiantel.net. [141.239.158.86])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d89500b001d91d515dffsm13428232plz.156.2024.04.03.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:22:18 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 3 Apr 2024 05:22:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Hibernate stuck after recent kernel/workqueue.c changes in
 Stable 6.6.23
Message-ID: <Zg10Keik4KORjXMh@slm.duckdns.org>
References: <ce4c2f67-c298-48a0-87a3-f933d646c73b@leemhuis.info>
 <ZgylCe48FuOKNWtM@slm.duckdns.org>
 <b6cdb17f-206c-4dff-bb45-a60317e0a55e@leemhuis.info>
 <2024040328-surfacing-breezy-34c6@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024040328-surfacing-breezy-34c6@gregkh>

Hello,

On Wed, Apr 03, 2024 at 07:11:04AM +0200, Greg KH wrote:
> > Side note: I have no idea why the stable team backported those patches
> > and no option on whether that was wise, just trying to help finding the best
> > solution forward from the current state of things.
> 
> The Fixes: tag triggered it, that's why they were backported.
> 
> > > which would
> > > be far too invasive for -stable, thus no Cc: stable.
> > >
> > > I didn't know a Fixes
> > > tag automatically triggers backport to -stable. I will keep that in mind for
> > > future.
> > 
> > /me fears that more and more developers due to situations like this will
> > avoid Fixes: tags and wonders what consequences that might have for the
> > kernel as a whole
> 
> The problem is that we have subsystems that only use Fixes: and not cc:
> stable which is why we need to pick these up as well.  Fixes: is great,
> but if everyone were to do this "properly" then we wouldn't need to pick
> these other ones up, but instead, it's about 1/3 of our volume :(
> 
> I'll gladly revert the above series if they shouldn't have been
> backported to stable, but from reading them, it seemed like they were
> fixing an issue that was serious and should have been added to stable,
> which is why they were.

Oh, yeah, they're fixing an issue. It's just that the issue is relatively
confined peformance degradation and the fix is really invasive, so not a
great -stable candidate. At the very least, they'd need a log longer cooking
time in mainline before being considered for -stable backport.

My intention w/ Fixes: wasn't triggering -stable backport at all, so it's a
miscommunication. From now on, I'll keep in mind that Fixes: does trigger
backports. I'm not too worried about not using it as the fixee commit can be
mentioned in the commit message.

> This is also why we have review cycles, so maintainers can let us know
> if they want us to drop them :)

Heh, sorry about that. This never caused any issues, so I just glide over
the stable mails without thinking.

Thanks.

-- 
tejun
