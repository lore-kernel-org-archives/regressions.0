Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E47A
	for <regressions@lists.linux.dev>; Tue, 28 Jun 2022 09:20:13 +0000 (UTC)
Received: from zn.tnic (p2e55da55.dip0.t-ipconnect.de [46.85.218.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1FC6D1EC0523;
	Tue, 28 Jun 2022 11:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1656408008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=P4I0TjKHjqOdYAYDzfzcgpCy0FJmUruFpcABPJLWdPI=;
	b=bKGNkZwLNtK8M8MJ96eVFTIilWJOxYvR7nriIHsKA83D4g0wWxIIRgCpkFM/XLJrKtUipg
	p54vyaYkjjVqUJ8MTQ82seMFM25J6PuA7R+8OqI4KDJJqtcYJX/cyDrZAkn8HFX2PhWzIJ
	gcwzIdn6GETgH4b8SUNQv9+jRiab5JE=
Date: Tue, 28 Jun 2022 11:20:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexandre Messier <alex@me.ssier.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
	Andrew.Cooper3@citrix.com, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Unable to unlock encrypted disk starting with
 kernel 5.19-rc1+
Message-ID: <YrrHwxtD2dpts7PF@zn.tnic>
References: <6025678c-e94a-6966-e298-82fad658a889@me.ssier.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6025678c-e94a-6966-e298-82fad658a889@me.ssier.org>

On Tue, Jun 28, 2022 at 01:13:30AM -0400, Alexandre Messier wrote:
> Please let me know if more information is needed, or if some tests are needed
> to be run.

Yeah, pls send /proc/cpuinfo and full dmesg - privately is fine too.

Also, it would be lovely if I were able to reproduce this on a machine
here but mine doesn't have a crypto rootfs.

Perhaps you can point me to the exact instructions you're running to
decrypt your rootfs and I can try to create a usb crypto disk and try to
reproduce it with them...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
