Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D89137E
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 07:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57875C433C7;
	Wed,  5 Jul 2023 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688540940;
	bh=KNHJu+0CLU4ZCQdLgEFri5D+Z9BwIrdluwuvuUeNttE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKdIALsR0dMkHa9DJuKzvIPN6d8h9dFfEniOOt9bWgEKNcQIdf7any+sOkoPLEKea
	 +95s2KQ452fHNF4mzK3LiP0iF8hrCJ186zokGs38t/pxGUAu4cT3Fhxu8f4UEm1j6P
	 LCmtLDw3WijgFusqsM7zA87m4MVC7ID+D/hmFgPI=
Date: Wed, 5 Jul 2023 08:08:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jacob Young <jacobly.alt@gmail.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Memory Management <linux-mm@kvack.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Message-ID: <2023070509-undertow-pulverize-5adc@gregkh>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
 <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh>
 <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh>
 <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>

On Tue, Jul 04, 2023 at 01:22:54PM -0700, Suren Baghdasaryan wrote:
> On Tue, Jul 4, 2023 at 9:18 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > > > > > > Thanks! I'll investigate this later today. After discussing with
> > > > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > > > > > the issue is fixed. I'll post a patch shortly.
> > > > > >
> > > > > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> > > > >
> > > > > As that change fixes something in 6.4, why not cc: stable on it as well?
> > > >
> > > > Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> > > > patch is fixing 6.4 I didn't need to send it to stable for older
> > > > versions. Did I miss something?
> > >
> > > 6.4.y is a stable kernel tree right now, so yes, it needs to be included
> > > there :)
> >
> > I'm in wait-a-few-days-mode on this.  To see if we have a backportable
> > fix rather than disabling the feature in -stable.
> 
> Ok, I think we have a fix posted at [2]  and it's cleanly applies to
> 6.4.y stable branch as well. However fork() performance might slightly
> regress, therefore disabling per-VMA locks by default for now seems to
> be preferable even with this fix (see discussion at
> https://lore.kernel.org/all/54cd9ffb-8f4b-003f-c2d6-3b6b0d2cb7d9@google.com/).
> IOW, both [1] and [2] should be applied to 6.4.y stable. Both apply
> cleanly and I CC'ed stable on [2]. Greg, should I send [1] separately
> to stable@vger?

We can't do anything for stable until it lands in Linus's tree, so if
you didn't happen to have the stable@ tag in the patch, just email us
the git SHA1 and I can pick it up that way.

thanks,

greg k-h
