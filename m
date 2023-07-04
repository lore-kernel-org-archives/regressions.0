Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABC6D18
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 16:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59F5C433C7;
	Tue,  4 Jul 2023 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688487489;
	bh=plFnlH3PVa4WT7JKH0cCP1otEaPsygd1p/9DKGjnZlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DP+7MVF9vnt3bFNlQkpF4LExsXEbROYu+xuyqDpBQzN9EIZJgYMCQ3rRO3qj64/s5
	 yd/IuW/oKpDL8zTX7u+j+d8QhVQkrxzzOdnvwaPICdLx+y4LQgCKjjqcZGrfHT6/zH
	 arQfP+r/qWPUZQdOu9jZZCWHKufOwfpShgZOVKCM=
Date: Tue, 4 Jul 2023 09:18:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, Jacob
 Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory
 Management <linux-mm@kvack.org>, Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: Fwd: Memory corruption in multithreaded user space program
 while calling fork
Message-Id: <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
In-Reply-To: <2023070453-plod-swipe-cfbf@gregkh>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
	<5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
	<CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
	<CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
	<2023070359-evasive-regroup-f3b8@gregkh>
	<CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
	<2023070453-plod-swipe-cfbf@gregkh>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:

> > > > > Thanks! I'll investigate this later today. After discussing with
> > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > > > the issue is fixed. I'll post a patch shortly.
> > > >
> > > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> > >
> > > As that change fixes something in 6.4, why not cc: stable on it as well?
> > 
> > Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> > patch is fixing 6.4 I didn't need to send it to stable for older
> > versions. Did I miss something?
> 
> 6.4.y is a stable kernel tree right now, so yes, it needs to be included
> there :)

I'm in wait-a-few-days-mode on this.  To see if we have a backportable
fix rather than disabling the feature in -stable.

