Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376890;
	b=JCQS60jh85SVxYDpY0GrE0D8WGKMhKCUBwZP/pjWZ/WeMJw6eJfnimsH3qhCgll56Tpk
	 1s3ot9e/6e8zOT+TPmj5cca4DSm70CHhHbY5eTQF6s8wTjJoXwknmp9NJg3U68eJZ/I/K
	 kll/5Zz8lChqLpeVSkqmKX/xLRWRlk7QWGezV+V7xvIgjV63is3+ELgygTmEWt/uqxx/m
	 rAfzx1xUjVkbt9k0NIDcRZAEr1xuxpCns/EL2nIR1ABWc8x2qsyaRICNVPU6BcA+CRLf0
	 GezUqSEy0e50Wkm46LYfV8ZKwi5kn2LAKGjrUnHXZB/Uxillx5mb+ZSWr0D7y4Rf9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376890;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=6VFcCQ8+hkv/Z0Ast47jgNhih51hX02Kw8npjw5+umQ=;
	b=lDUvvvMUZuX+X/TW1LMDfplhzaBztR51SkzIlpyO3SQhN8J2kQkauw49eBFtzAEdpmJs
	 g+sLFoCDVzrSjXfdyowXL14hy2ub8KFJOv/p0k7zNaKgVsg+ruc9hbncLKX2wyQ0OsQJq
	 kTZ3vKUiPYbt3d8UeScIaSO7nqDnSDDLiy2rrk+3Zpd1w84SSwtkuaxfLnp+6ka9qrWFi
	 +E2Pfe4PxI7ccyZ7ts7QgcNRMF6bW640EJGBHRTR8HKAmKeBG4u9Mbzm7lsd74/vJHi7I
	 jR9uYn7lnn7gsp9nL26F7KhLj8KNMsE/AvzukGdKDB7LXfadKEOdl1MS7RWZMdEv0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=DmPE+J6r;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E60C606A31A;
	Fri, 30 Oct 2026 16:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E60C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=DmPE+J6r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6VFcCQ8+hkv/Z0Ast47jgNhih51hX02Kw8npjw5+umQ=; b=DmPE+J6rcLlWvdvEniU5xjHTMg
	H+d/de0QEzHOXUJBPiPynAt/Er7KQmwKTorPs0E8sNua1hxr1/mBuwFqsHvhM4yG/ePe0vDver6E2
	0pj2N8OQtUbAt5fzO5DER1IC3Nzcc2Suf+pl6yECGnLl93zJRbnyEmisQW6fQ8AVmM5Ef7bBHOKg7
	1rB7PdX0zxqRzcRYRhY0oAawJL0UbspiHi7fVF5Ekqu6sCVjtsIYgm7x0gZnWgKFKSnhVazuJGmdt
	0h9S/lzqu7p5F9sfk9eFNolYHXMK6bWwDAKKchRywhK/ontbW2lh9Ojjfzi6ZCjnR5RRfnR/+G3QX
	jtOMl+Wg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMpFQ-003wWM-2I;
	Fri, 30 Oct 2026 16:14:33 +0000
Date: Fri, 30 Oct 2026 09:14:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Stian Halseth <stian@itx.no>
Cc: Frederic Weisbecker <frederic@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
Message-ID: <auTCQauaU733PY5z@gmail.com>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
 <20261025100202.2584654-1-stian@itx.no>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025100202.2584654-1-stian@itx.no>
X-Debian-User: leitao

On Sun, Oct 25, 2026 at 11:02:02AM +0100, Stian Halseth wrote:
> I could not hit the window in a KVM guest, but instrumented, the guest
> showed the sched timer armed 5.9 ms after now at HZ=250 right after a
> jiffies -> hpet switch, and tick stops saving a ts->last_tick more than
> a tick ahead. The fix boots without warnings there.

I am seeing this on my testing real hosts:

           clocksource: Switched to clocksource tsc-early
           ------------[ cut here ]------------
           WARNING: kernel/sched/cputime.c:481 at kcpustat_dyntick_stop+0x15e/0x1d0, CPU#2: swapper/2/0  [warn]
           Modules linked in:
           CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G S                   7.3.0-0_fbk701_debugnightly_rc0_upstream_17997_gc339f4010dea #1 PREEMPTLAZ
           Tainted: [S]=CPU_OUT_OF_SPEC
           Hardware name: Quanta Twin Lakes MP/Twin Lakes Passive MP, BIOS F09_3A23 12/08/2020
           RIP: 0010:kcpustat_dyntick_stop+0x15e/0x1d0
           Code: de e8 96 00 00 00 42 0f b6 44 2d 00 84 c0 75 4d 41 c6 07 00 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 0f 0b e9 2e ff ff ff <0f> 0b eb
           RSP: 0000:ffff88828a22fe38 EFLAGS: 00010087
           RAX: 0000000b9aef1500 RBX: 0000000b9aeb7036 RCX: 0000000000000001
           RDX: 00092e9200000000 RSI: ffffffff851ec9c0 RDI: ffffffff851ccaa0
           RBP: 1ffff111c3e65a3b R08: ffffffff8152bd65 R09: 0000000000000001
           R10: dffffc0000000000 R11: fffffbfff0f78a9a R12: fffffffffffc5b36
           R13: dffffc0000000000 R14: 0000000b9aef1500 R15: ffff888e1f32d1d8
           FS:  0000000000000000(0000) GS:ffff888e9684e000(0000) knlGS:0000000000000000
           CR2: 0000000000000000 CR3: 000000107162a001 CR4: 00000000007706f0
           PKRU: 55555554
           Call Trace:
           <TASK>
           tick_nohz_idle_exit+0x1d5/0x2d0
           do_idle+0x3b7/0x4a0
           cpu_startup_entry+0x45/0x60
           start_secondary+0x1b3/0x200
           common_startup_64+0x13e/0x140
           </TASK>
           irq event stamp: 406130
           hardirqs last  enabled at (406129): [<ffffffff849e90cf>] cpuidle_enter_state+0x13f/0x465
           hardirqs last disabled at (406130): [<ffffffff81557bc2>] tick_nohz_idle_exit+0x62/0x2d0
           softirqs last  enabled at (406118): [<ffffffff8126dc76>] __irq_exit_rcu+0xc6/0x230
           softirqs last disabled at (406111): [<ffffffff8126dc76>] __irq_exit_rcu+0xc6/0x230
           ---[ end trace 0000000000000000 ]---

