Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF53630
	for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681512973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+UGGOoI5bsc+nB4tnCayKybMsORMXbIfA49EDMN67c=;
	b=cBGQVXWTCmz6jYCymasY4sE1s5aTimWxaqP7CMe2DsdmJ4SE4xtZTSSLW6H03WYmViDLqR
	t/cQridSSycihyq3e5i9g4rUc6T48c3PEOwiBQ7WDB7tbC78vJmIqMSL0azptrMmaDmjlS
	V2a8Ckyjaxwrae519FEoLdd82FA0aIY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-2yTyRfnCPe-TDzv3qM9LpA-1; Fri, 14 Apr 2023 18:56:12 -0400
X-MC-Unique: 2yTyRfnCPe-TDzv3qM9LpA-1
Received: by mail-qt1-f197.google.com with SMTP id e8-20020a05622a110800b003e4e915a164so9574454qty.4
        for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 15:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681512971; x=1684104971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+UGGOoI5bsc+nB4tnCayKybMsORMXbIfA49EDMN67c=;
        b=Bpp5AW299nMzpbG/wnsZxGv6Z7jYPpIQLoTM2pT/iFv/unjNltx/bMnGJ+c2D3Ymuu
         /SNzfkW3ItyEVm/nbUtg5SM1NdAR6rTORpKqTxQCBsg/ubu1w50QeH5R28irjMAHYLoq
         ebTcGBvcopG0UnJugYo12c4b3DWTZLy92da0ZK6pF2mlP+m7zl/d9RidUtSms5XzylhN
         VThmbtGS08fO6npGoPFcgwZZrU/ZVH/KPVgdWVv7gu3AlT2to5Mql21BEz+ekdHPsqHy
         l65wRSqZ7tXAqfEWgOpsImfTmcS/usY906iK29Puv9p0sx+ki0MfUZPviV8NYbO0SuFq
         hcLQ==
X-Gm-Message-State: AAQBX9clkxM8oCjacZ6hlRzSA6RJeACIBiM98dDKZkzyCdxhWR0w5hsc
	Kc/PyA7TfOLtHN8RreCWjaVYuAmZZA7RabC/0dQeKOy3u5F6hBwKol4vSP1DVTE7vAaGxSyQx03
	CMt+YZRpYfPUptSg4+XGdCMRwvnEmVP8/oyiRtEGMFocdU8MOJGJp9tbork2XaUkCTf0ZQu63I5
	6ztaRGox8=
X-Received: by 2002:a05:622a:1cd:b0:3e9:94d5:529 with SMTP id t13-20020a05622a01cd00b003e994d50529mr10940940qtw.17.1681512971252;
        Fri, 14 Apr 2023 15:56:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350aaCmhnY4mwLfnaOO12Koejt0E7U7uMfVJMRWgL0W68Kzwtvs7mukfGyZUJPxHUEm2/GkzQxQ==
X-Received: by 2002:a05:622a:1cd:b0:3e9:94d5:529 with SMTP id t13-20020a05622a01cd00b003e994d50529mr10940920qtw.17.1681512970904;
        Fri, 14 Apr 2023 15:56:10 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id dp8-20020a05620a2b4800b0074ad1698959sm1546679qkb.40.2023.04.14.15.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 15:56:10 -0700 (PDT)
Date: Fri, 14 Apr 2023 15:56:08 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, 
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Subject: Re: question about mpt3sas commit b424eaa1b51c
Message-ID: <mntv2b4lkp44gicraijquuyjqob3dhmxbmdyec7zmv6jgjihnd@t5vpa35dkeal>
References: <gn42g3poxa4aqgttt3ck6cb5jwhpwovm3l7hay5z65d5tlfec3@kfs5mtqb2rlh>
 <2e585944-b34f-5df0-54e3-fba1205c4c1f@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2e585944-b34f-5df0-54e3-fba1205c4c1f@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 09, 2023 at 10:59:32AM +0200, Linux regression tracking #adding (Thorsten Leemhuis) wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 08.04.23 21:18, Jerry Snitselaar wrote:
> > We've had some people trying to track a problem for months revolving
> > around a system hanging at shutdown, and last thing they see being a
> > message from mpt3sas about a reset. They quickly bisected down to the
> > commit below, and reverted it made the problem go away for the
> > customer.
> > 
> > b424eaa1b51c ("scsi: mpt3sas: Transition IOC to Ready state during shutdown")
> 
> FWIW, that should have been fae21608c31c ("scsi: mpt3sas: Transition IOC
> to Ready state during shutdown") (see reply-to-self from Jerry)
> 
> > I got asked to look at something since I recently at another issue
> > that involved mpt3sas at shutdown, so I was looking through the
> > history, saw this commit being mentined. Looking at it, I'm not sure
> > why it is doing what is doing.
> > [...]
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced fae21608c31c
> #regzbot title scsi: mpt3sas: systems hang at shutdown
> #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
> 
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.

#regzbot resolve: had them boot a kernel with mpt3sas disabled in the config, and they reproduced the hang.

