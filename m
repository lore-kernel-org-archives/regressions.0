Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33463CA
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 14:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE93C433EF;
	Mon, 15 May 2023 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684160633;
	bh=BS6JVi3U6AfGKU8Juy8abcYENm4+fIaoNY9mN6+Bwy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrK32zAplnlrqy40OU3XJSBXClfmG9O7ZOlTlNfLZCNAlZqPWij/MvKdYbCd95gR2
	 aqBJ9Phg/BhKmSH3JKt+kK36Yp/sCMMpu/hWfqT82d/Jb2G4M3mJusvu6e3ksv2lpE
	 pRedKzAVyDGXLVPsGb1RLCwMmDe33hoWngAKowOcuFqmAj6ue952HtF7GcJd31dx8S
	 GaX/sf4DiWvSy52m27xRONQ8jgx9Z9kAUXUy8FoHrvVXYrv/R0FQntd8ziWJx9Zt9x
	 u40aiCpN4LNpF3i/wJXZaAFB4YJPNraVBZqlzdMwTf3oHdOkbawI64usc7zsQu3nJH
	 Xl2vfX5SxQyRA==
Date: Mon, 15 May 2023 16:23:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Mike Christie <michael.christie@oracle.com>,
	nicolas.dichtel@6wind.com,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
	mst@redhat.com, sgarzare@redhat.com,
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com,
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
Message-ID: <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
References: <20230202232517.8695-1-michael.christie@oracle.com>
 <20230202232517.8695-9-michael.christie@oracle.com>
 <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com>
 <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>

On Sat, May 13, 2023 at 10:08:04AM -0500, Linus Torvalds wrote:
> On Sat, May 13, 2023 at 7:39 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >
> > Jumping in here, as I found another problem with that patch: it broke
> > s2idle on my laptop when a qemu-kvm VM is running, as freezing user
> > space processes now fails for me:
> 
> Hmm. kthreads have PF_NOFREEZE by default, which is probably the reason.
> 
> Adding
> 
>         current->flags |= PF_NOFREEZE;
> 
> to the vhost_task setup might just fix it, but it feels a bit off.
> 
> The way io_uring does this is to  do
> 
>                 if (signal_pending(current)) {
>                         struct ksignal ksig;
> 
>                         if (!get_signal(&ksig))
>                                 continue;
>                         break;
>                 }
> 
> in the main loop, which ends up handling the freezer situation too.
> But it should handle things like SIGSTOP etc as well, and also exit on
> actual signals.
> 
> I get the feeling that the whole "vhost_task_should_stop()" logic
> should have the exact logic above, and basically make those threads
> killable as well.
> 
> Hmm?

I'm still trying to catch up after LSFMM with everything that's happened
on the fs side so coming back to this thread with a fresh set of eyes is
difficult. Sorry about the delay here.

So we seem to two immediate issues:
(1) The current logic breaks ps output because vhost creates helper
    processes instead of threads. The suggested patch by Mike was to
    make them proper threads again but somehow special threads in the
    sense that they don't unshare signal handlers. The latter part is
    possibly broken and seems hacky. (That's earlier in the thread.)
(2) Freezing of vhost tasks fails. (This mail.)

So I think we will be able to address (1) and (2) by making vhost tasks
proper threads and blocking every signal except for SIGKILL and SIGSTOP
and then having vhost handle get_signal() - as you mentioned - the same
way io uring already does. We should also remove the ingore_signals
thing completely imho. I don't think we ever want to do this with user
workers.

@Mike, can you get a patch ready ideally this week so we can get this
fixed soon?
