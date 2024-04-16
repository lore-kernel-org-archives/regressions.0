Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB63B2A6
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309698; cv=none; b=VRm9LrqXRuN9VsIt1g5kUU2Yi2dSIgv1gpndi3xKTi7FtFDJMOwvoeAKtnom68h0U2PFy8guvBr8iZxtbFZ2AFpC1V7Vw+duhX8W87Tn7fgSUCs8LC1SkuNJ3xYkoYzkbfz+TpPQy53bjoORRprCZKbQvW8NePDSKlllh1ZiIHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309698; c=relaxed/simple;
	bh=Yq3XYE5PQn1xLC4Ak5UqnG6QBcosEZ2V2zfPFVJIjp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOQbADC6TWAY/Y6fmXDeB3zXpBMb31E0Ufw7GlpgmbRWdm9WODOr9fpSuk1fpH+DyrhvhF1VUrk5nFCN9DgAiwk+NpGJ/+ds2yLHeve93nhMdAttriAKtfzJ1l2jlum1m7qFaUho0J/eJdS15FCWWhcQZOW4gT0v72uS1Fvpec0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7/NgHf6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7/NgHf6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ed267f2936so3974213b3a.3
        for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713309696; x=1713914496; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fgpHfTT4Bxv+6WWCRjV8ylNM9LjcYeL1sBjLxOjPOk=;
        b=W7/NgHf6JMlOercruJLwNE3JLNqsJqBwl/5ouaLTYmqWY58UoE1/1ajQLUmmjJD9Ew
         TpGwnBI6j/ywBDs5WQW7hxcUtMMd2isF1Zje4jICrgE6d9uvx3Kd0E1jnHCR5DcR0Alk
         oRP8vdqLT0D5ZJYqi7USbs+ZWUe7uMVnkTUy7OpLo/DxcXGHyqZEj/ag5e3nTu5PMG2r
         A2AJfdj/tLNj4ya+tPYyOByuDtJrF3bHXuWgQ6U7ZxDsfGTSXVC+ChdZeObwV11EqjA5
         1ih3HLDN8UVa/BpiKzGLkMZAk05RVQ+whK2bavE8Lc1x5a+eEYx6jVMWNWFz9jSOWKkR
         +DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713309696; x=1713914496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fgpHfTT4Bxv+6WWCRjV8ylNM9LjcYeL1sBjLxOjPOk=;
        b=n77EmteuCjmZWBd04lAa3h0nG5Aqz1YevwQRj5OOE3o9oZYMIrQVHhuFgYHZLN0+j2
         akG7MqMiaVnRAA7as5OLhUM5UZaHCnzgBjoQZbVsYNNyWb/i7xJPsaV1YljX9RWD9rjb
         sxKcCHT8qPYC3jfJa8lKwG+bRlh7NnwuhvhQU43F5oQCufE1l1D1f7+mPKpy51Q8hjmG
         Q8JA3i1ySfpIsydzdTJByLAg0zWVr+nss7EEJoFD0/De8ajagLzoN/SFBveT74ZXnMdx
         53K95wESzMV3ZsFDwwMW5is5SJxhj/6K6t9OBBqu+Axbnt0c2GsxK3HaIJTy4pG6Ea0U
         la0g==
X-Gm-Message-State: AOJu0Yz/DGBlm1eJ6cawfwEjeJDykT936aLOkiVh2B6DWf+Ym9fW6h5u
	QHUsKXaaqzUdXqn3zvu6TruHsgHguW87koN3QcJYcGh49iIRyst7mc+FRMSq
X-Google-Smtp-Source: AGHT+IFRj3M/Wa9lIIhbJrMGRGXExG4U8ICEyuvtKUVCJx+R1O1y/hFqrxZp+bEM2ETZ7slNNsafMw==
X-Received: by 2002:a05:6a00:2295:b0:6ed:1012:9572 with SMTP id f21-20020a056a00229500b006ed10129572mr15448814pfe.29.1713309696504;
        Tue, 16 Apr 2024 16:21:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:6f51])
        by smtp.gmail.com with ESMTPSA id t6-20020a056a00138600b006ecef9e9615sm9483775pfg.200.2024.04.16.16.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:21:36 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Tue, 16 Apr 2024 13:21:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: Bug 218665 - nohz_full=0 prevents kernel from booting
Message-ID: <Zh8H_vG2dQLOjoIB@slm.duckdns.org>
References: <5be248c6-cdda-4d2e-8fae-30fc2cc124c0@leemhuis.info>
 <enqg6mcuhvff7gujjbapdiclicl3z6f2vnggcsg65pexipyr3o@4men5fhyt3vb>
 <28c84b3b-f68f-4f45-8da1-9c3f9a342509@leemhuis.info>
 <7kugx5ivbplwwrcq5zp37djtpakl55b3pfy36gpbsbcx43dpcs@uheu6iv7gm7h>
 <81149f18-0132-4ace-8c71-1b75790a88e4@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81149f18-0132-4ace-8c71-1b75790a88e4@leemhuis.info>

Hello,

On Tue, Apr 16, 2024 at 08:08:07AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 12.04.24 04:57, Bjorn Andersson wrote:
> > On Wed, Apr 10, 2024 at 11:18:04AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 08.04.24 00:52, Bjorn Andersson wrote:
> >>> On Tue, Apr 02, 2024 at 10:17:16AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>>>
> >>>> Tejun, apparently it's cause by a change of yours.
> >>>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=218665 :
> >>>>
> >>>>> booting the current kernel (6.9.0-rc1, master/712e1425) on x86_64
> >>>>> with nohz_full=0 cause a page fault and prevents the kernel from
> >>>>> booting.
> >>> [...]
> 
> Tejun, I got a bit lost here. Can you help me out please?
> 
> I'm currently assuming that these two reports have the same cause:
> https://lore.kernel.org/all/20240402105847.GA24832@redhat.com/T/#u
> https://bugzilla.kernel.org/show_bug.cgi?id=218665
> 
> And that both will be fixed by this patch from Oleg Nesterov:
> https://lore.kernel.org/lkml/20240411143905.GA19288@redhat.com/
> 
> But well, to me it looks like below issue from Bjorn is different, even
> if it is caused by the same change -- nevertheless it looks like nobody
> has looked into this since it was reported about two weeks ago. Or was
> progress made and I just missed it?

Can you elaborate why Bjorn's case is different? I was assuming it was the
same problem and that Oleg's fixes would address the issue.

Thanks.

-- 
tejun
