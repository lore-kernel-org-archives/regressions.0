Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99111097E
	for <regressions@lists.linux.dev>; Fri, 15 Sep 2023 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XI4pp0oduPn/A0YqvObMvK3fxrovFz787U1W3QhLrvU=; b=eyKOZHZj0O7U/Sq7UbMk8n7rCA
	zHk46uk/3tAqg/wV8BMsVl1j2+0uNV3opRer/5KGR/VCs2XHnr3IawXPi67yj13PaH6BqEUpFVVeD
	jB1UvvmnvzrXRopHuJM4LcJlSsk6/kxBXkaTmP1U/cejjXYJxYPgQhIz2QxrYuEtm2PE=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net ([82.36.99.19] helo=stax)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1qhDQM-0003f6-2T;
	Fri, 15 Sep 2023 19:20:14 +0100
Received: from localhost (stax.localdomain [local])
	by stax.localdomain (OpenSMTPD) with ESMTPA id fda34262;
	Fri, 15 Sep 2023 18:20:12 +0000 (UTC)
Date: Fri, 15 Sep 2023 19:20:12 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
cc: Ash Holland <ash@sorrel.sh>, alsa-devel@alsa-project.org, 
    regressions@lists.linux.dev
Subject: Re: [REGRESSION] rust midir MIDI library causes kernel oops
In-Reply-To: <871qezux3d.wl-tiwai@suse.de>
Message-ID: <ba096915-4d9e-0cfa-2dfb-57cb476b3544@xwax.org>
References: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh> <87msy1ip6l.wl-tiwai@suse.de> <ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org> <874jjvuywk.wl-tiwai@suse.de> <871qezux3d.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Fri, 15 Sep 2023, Takashi Iwai wrote:

> On Fri, 15 Sep 2023 19:30:51 +0200, Takashi Iwai wrote:
> > 
> > On Fri, 15 Sep 2023 18:04:35 +0200, Mark Hills wrote:
[...]
> > > I upgraded from 6.1.0 to 6.5.3 and Reaper now crashes or hangs on startup 
> > > with the trace below in dmesg.
> > > 
> > > The newer kernel already includes a fix very similar to below, so I think 
> > > an issue remains.
> > > 
> > > I did not dig deeper than capturing information and finding this related 
> > > thread.
> > (snip)
> > > [   72.601440] BUG: kernel NULL pointer dereference, address: 0000000000000020
> > (snip)
> > > [   72.601455] RIP: 0010:snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > (snip)
> > > [   72.601477] Call Trace:
> > > [   72.601478]  <TASK>
> > > [   72.601479]  ? __die+0x1b/0x60
> > > [   72.601482]  ? page_fault_oops+0x154/0x420
> > > [   72.601485]  ? mas_update_gap.part.0+0xac/0x1f0
> > > [   72.601488]  ? sched_clock_cpu+0xb/0x190
> > > [   72.601491]  ? __smp_call_single_queue+0x2f/0x50
> > > [   72.601493]  ? exc_page_fault+0x37a/0x560
> > > [   72.601495]  ? seq_open+0x4b/0x70
> > > [   72.601497]  ? asm_exc_page_fault+0x22/0x30
> > > [   72.601501]  ? snd_rawmidi_proc_info_read+0x35/0x220 [snd_rawmidi]
> > > [   72.601505]  snd_info_seq_show+0x21/0x40 [snd]
> > > [   72.601511]  seq_read_iter+0x105/0x4a0
> > > [   72.601514]  seq_read+0x9e/0xd0
> > > [   72.601516]  proc_reg_read+0x50/0xa0
> > > [   72.601518]  vfs_read+0xa4/0x300
> > > [   72.601521]  ? __do_sys_newfstatat+0x35/0x60
> > > [   72.601524]  ksys_read+0x5a/0xe0
> > > [   72.601526]  do_syscall_64+0x38/0x90
> > > [   72.601528]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > 
> > It must be a completely different bug.  It comes from the proc fs
> > read, not the read over sequencer device itself.
> 
> Does the change below fix the problem?

It does! At least it passes my initial test. Reaper starts up now.

> -- 8< --
> --- a/sound/core/rawmidi.c
> +++ b/sound/core/rawmidi.c
> @@ -1770,7 +1770,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
>  	if (IS_ENABLED(CONFIG_SND_UMP))
>  		snd_iprintf(buffer, "Type: %s\n",
>  			    rawmidi_is_ump(rmidi) ? "UMP" : "Legacy");
> -	if (rmidi->ops->proc_read)
> +	if (rmidi->ops && rmidi->ops->proc_read)
>  		rmidi->ops->proc_read(entry, buffer);
>  	mutex_lock(&rmidi->open_mutex);
>  	if (rmidi->info_flags & SNDRV_RAWMIDI_INFO_OUTPUT) {
> 
> 
> 

-- 
Mark
