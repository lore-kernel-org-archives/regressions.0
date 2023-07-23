Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51931371
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 14:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A5C433C8;
	Sun, 23 Jul 2023 14:32:11 +0000 (UTC)
Date: Sun, 23 Jul 2023 10:32:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <kkabe@vega.pgw.jp>
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer
 dereference,address:00000004
Message-ID: <20230723103210.4b1b032e@rorschach.local.home>
In-Reply-To: <230723205506.M0106064@vega.pgw.jp>
References: <230722113014.M0204460@vega.pgw.jp>
	<230723205506.M0106064@vega.pgw.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Jul 2023 20:55:06 +0900
<kkabe@vega.pgw.jp> wrote:

> So I tried to trap NULL and return:
> 
> ================ patch-drm_vblank_cancel_pending_works-printk-NULL-ret.patch
> diff -up ./drivers/gpu/drm/drm_vblank_work.c.pk2 ./drivers/gpu/drm/drm_vblank_work.c
> --- ./drivers/gpu/drm/drm_vblank_work.c.pk2	2023-06-06 20:50:40.000000000 +0900
> +++ ./drivers/gpu/drm/drm_vblank_work.c	2023-07-23 14:29:56.383093673 +0900
> @@ -71,6 +71,10 @@ void drm_vblank_cancel_pending_works(str
>  {
>  	struct drm_vblank_work *work, *next;
>  
> +	if (!vblank->dev) {
> +		printk(KERN_WARNING "%s: vblank->dev == NULL? returning\n", __func__);
> +		return;
> +	}
>  	assert_spin_locked(&vblank->dev->event_lock);
>  
>  	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
> ================
> 
> This time, the printk trap does not happen!! and radeon.ko works.
> (NULL check for vblank->worker is still fireing though)
> 
> Now this is puzzling.
> Is this a timing issue?

It could very well be. And the ftrace patch could possibly not be the
cause at all. But the thread that is created to do the work is causing
the race window to be opened up, which is why you see it with the patch
and don't without it. It may not be the problem, it may just tickle the
timings enough to trigger the bug, and is causing you to go on a wild
goose chase in the wrong direction.

-- Steve


> Is systemd-udevd doing something not favaorble to kernel?
> Is drm vblank code running without enough initialization?
> 
> Puzzling is, that purely useland activity
> (logging in on tty1 before radeon.ko load)
> is affecting kernel panic/no-panic.

