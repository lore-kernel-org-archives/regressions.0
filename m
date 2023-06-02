Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADF18AE1
	for <regressions@lists.linux.dev>; Fri,  2 Jun 2023 14:29:26 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-75ca95c4272so201568885a.0
        for <regressions@lists.linux.dev>; Fri, 02 Jun 2023 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685716165; x=1688308165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hR4cfRO52K19EaWIBnrpEm4Q5CC06YOFcLL4jhPlEBk=;
        b=BBYNmuHPhOzCvfMF36eNi+aDUZZa1x6vDdpD0TUIuW3+SUQ9FI7eJWxYscbLKqZzbw
         9lzj6CAAsAD/TJ/t8UofaoYLqVA+PF4zaowiZf6mg40pn0PU3wtKSwQeCw+dWf7TN0ip
         c3XaJS19FEVWVEbuo6SDimPZsP2GvYc7U6SR2/2I7xLAAN/lPKM7A+snOoztxQUx1iPR
         e+GL8revbu/ZnjOnPRIzXY0tBQUIMWGUSj5YNXn9B9s8h0jIeMb2WCpCUI2cygAV2GD9
         4O17wtQMbvb204v9ZqcXrH46FEZFScPJ2+1JyAuRjlktf+FR3/ul0J2tDKMewSxcBpil
         dZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716165; x=1688308165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR4cfRO52K19EaWIBnrpEm4Q5CC06YOFcLL4jhPlEBk=;
        b=EIPCtahB25B+MIQvyKAgCd75c07ffwfKeCa8K3x/u4oeGQRjnLEmE1b/DtB/tO1oba
         OKVOH2hIsQWTZass1+WiYkmy1mJSPmpP3YOS4MfpXC8CibtNfk9opC25PMOxJ4aqulnA
         hgCOhN9OGHYv5k5K42FU1F8ADJlc/k8nEoCdPxhAAlb2ZHOk8AGglN+m4B+PS621fHd7
         gF14Bito8UMsscoqgH6qbj4GMz1JQtJhbAayqyAeb5k5F/0N5+VCqPTsVDVPZf3IzG6y
         uQ6o8W0z69UH5cdz2rf/5bJKMFjXgd2iZz8DyaG+YnVXMF7eubuxJLcR8u+0017Mr8ut
         qMuA==
X-Gm-Message-State: AC+VfDy0NMSpAzu9uu0WJnFoE6J/3w7BN7DSrD56sUiOQvyL3A+VHxTe
	Yzhdv/aYuhgSWQ/XUkVk1zes4EnZTMHzua4l5iw=
X-Google-Smtp-Source: ACHHUZ56MEkeH5Zo1tXDtmMTp0+mZ8Ne4ufF6avETdOTCToxjO9N+oqb5AbfO1rRUEIIe3xcJl8rCw==
X-Received: by 2002:a05:620a:208c:b0:75b:23a1:8e30 with SMTP id e12-20020a05620a208c00b0075b23a18e30mr11561210qka.1.1685716165465;
        Fri, 02 Jun 2023 07:29:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w8-20020ae9e508000000b0075ce3d29be5sm694399qkf.44.2023.06.02.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:29:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q55mO-001veh-8c;
	Fri, 02 Jun 2023 11:29:24 -0300
Date: Fri, 2 Jun 2023 11:29:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Chuck Lever III <chuck.lever@oracle.com>,
	"elic@nvidia.com" <elic@nvidia.com>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>,
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Subject: Re: system hang on start-up (mlx5?)
Message-ID: <ZHn8xALvQ/wKER1t@ziepe.ca>
References: <A1E5B427-897B-409E-B8E3-E417678E81F6@oracle.com>
 <bf2594bb-94e0-5c89-88ad-935dee2ac95c@leemhuis.info>
 <5b235e0f-cd4c-a453-d648-5a4e9080ac19@leemhuis.info>
 <AAFDF38A-E59A-4D6A-8EC2-113861C8B5DB@oracle.com>
 <bb2df75d-05be-3f7b-693a-84be195dc2f1@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2df75d-05be-3f7b-693a-84be195dc2f1@leemhuis.info>

On Fri, Jun 02, 2023 at 03:55:43PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 02.06.23 15:38, Chuck Lever III wrote:
> > 
> >> On Jun 2, 2023, at 7:05 AM, Linux regression tracking #update (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >>
> >> [TLDR: This mail in primarily relevant for Linux regression tracking. A
> >> change or fix related to the regression discussed in this thread was
> >> posted or applied, but it did not use a Link: tag to point to the
> >> report, as Linus and the documentation call for.
> > 
> > Linus recently stated he did not like Link: tags pointing to an
> > email thread on lore.
> 
> Afaik he strongly dislikes them when a Link: tag just points to the
> submission of the patch being applied;

He has said that, but AFAICT enough maintainers disagree that we are
still adding Link tags to the submission as a glorified Change-Id

When done well these do provide information because the cover letter
should back link to all prior version of the series and you can then
capture the entire discussion, although manually.

> at the same time he *really wants* those links if they tell the
> backstory how a fix came into being, which definitely includes the
> report about the issue being fixed (side note: without those links
> regression tracking becomes so hard that it's basically no
> feasible).

Yes, but this started to get a bit redundant as we now have

 Reported-by:  xx@syzkaller

Which does identify the original bug and all its places, and now
people are adding links to the syzkaller email too because checkpatch
is complaining.

> > Also, checkpatch.pl is now complaining about Closes: tags instead
> > of Link: tags. A bug was never opened for this issue.
> 
> That was a change by somebody else, but FWIW, just use Closes: (instead
> of Link:) with a link to the report on lore, that tag is not reserved
> for bugs.
> 
> /me will go and update his boilerplate text used above

And now you say they should be closes not link?

Oy it makes my head hurt all these rules.

Jason
