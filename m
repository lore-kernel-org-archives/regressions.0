Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18636BCD1
	for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320299; cv=none; b=RQrAa5LScnJIPa8d7+lIDmQV9zD2MZGLMDwJfoEAwqzzgvEgkcLZ396jMeoibf3d9X+rtYOpFCAcrM9D/BWWslRGhU9xKh4X7tp8UsiX2apVVrCqEtixSDiIRqPG6L2nmpkG2YWLQ+TsJL3MVHBGxcZMc2xlILGroWcdS9BEjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320299; c=relaxed/simple;
	bh=rSj+33Ka1A3ryeFu6FTIEAoPeWaVJuhSuOrGIljygMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiWBMGYT0/bQF6FoSONP1/l7JncjhZhn0466LrIamagZNJi8BB2KvGc14g7q/fY1lkGPtKyPJPdb8nGBKrLV39ajlSwff3DVc6pMPfmjY9HDspJvEnzHKImNfL2wwqlakfsEFlIz0PPdz03mXNdrDT8UXaRt8ICsaLJPTzwQRng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PszcNDDp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PszcNDDp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A93A440E0194;
	Tue, 13 Jan 2026 16:04:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Kma9SYS0mRFa; Tue, 13 Jan 2026 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768320290; bh=hoRUVOQfoYHp89NAwvgiW4eRZmSu3/ifdhe3eXoxCtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PszcNDDpZOXGEYdBWzv7Xwp9l3fef+RiWwHvnadceseBpHGTSIKDLEcKnFVPCaQT4
	 6ry6Mh2VWCylpwEkabul0iGnTu8qtImij12WvK2WvEEWUUzXSPvXFgasfSApXPYz18
	 GwNnWdCCA2QyJnSpqrhLAduUAtNib8B06X4QVhRzGojHThUgm071ANV2Q8aRQXHFga
	 2LXDxKSjaANYuvRaosMn6tR59PO7vZdxup2FoXUYjy/eL7KkNRT/mynS6PvSZ5COIH
	 /cyQih+YubOBAXhSYCxdSXBZZ6PsESmws4xf2H7/iyUzuUNcIEFKJ8UwXEII1EczKK
	 JEajo9etCqOFIwKmnxQrTGuBlXlpuywehsyBAwsVBjJjYPJjMlqoINos6iD76WkH2w
	 7SwjFh5EXWnIJw1cUWnyD/BQbV8NA5gwjAzBcTCEtss7LUBhBPNL/7CEKyMdnAvQKK
	 DQAr00ozLvMPlZjeQlMNW9MapQyhb86CWaIZGrayIHne6zTM0bcEzzFt7JYpksgjGk
	 FrvGMccOFykNl3CmvZEs/MJYnSNKME4AljTvHYWSCnhCHw3FOIPF6f/AQQ+Pv/ELMO
	 hjJ0Mz2J+l7gSKvS5sD5S9ZOj98RHiaR+X9nHPQYzIiUD551NsP+eC1NMG2wSpePeO
	 PxnaHvHCsrYB18xzakn4wCk8=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 71BA640E01A9;
	Tue, 13 Jan 2026 16:04:44 +0000 (UTC)
Date: Tue, 13 Jan 2026 17:04:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260113160436.GMaWZtFMWnrjERYYQH@fat_crate.local>
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>

On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
> Is this perhaps a case that only the USB controller was passed through but
> that the root controller wasn't?  That would lead to a case that
> amd_smn_init() was never called and thus amd_roots was not initialized
> properly.
> 
> So it would be a NULL pointer deref.

Yah, looks like a NULL ptr:

   0:   05 bd 44 b8 01          add    $0x1b844bd,%eax
   5:   66 0f af 05 2d 44 b8    imul   0x1b8442d(%rip),%ax        # 0x1b8443a
   c:   01 
   d:   41 57                   push   %r15
   f:   41 56                   push   %r14
  11:   41 55                   push   %r13
  13:   41 54                   push   %r12
  15:   55                      push   %rbp
  16:   53                      push   %rbx


  17:   66 39 c2                cmp    %ax,%dx
  1a:   0f 83 c0 00 00 00       jae    0xe0

That's 

        if (node >= amd_num_nodes())
                return err;


  20:   48 8b 05 c3 61 d7 02    mov    0x2d761c3(%rip),%rax        # 0x2d761ea

That's fetching amd_roots. Which is 0, see RAX below.

  27:   0f b7 d2                movzwl %dx,%edx

Zero-extending the "node" var.

  2a:*  4c 8b 34 d0             mov    (%rax,%rdx,8),%r14               <-- trapping instruction

Get the root ptr.

Boom.

> >      [    0.302571] pci 0000:00:08.0: quirk_usb_early_handoff+0x0/0x180 took 16590 usecs
> >      [    0.303172] BUG: kernel NULL pointer dereference, address: 0000000000000000
> >      [    0.303189] #PF: supervisor read access in kernel mode
> >      [    0.303202] #PF: error_code(0x0000) - not-present page
> >      [    0.303216] PGD 0 P4D 0
> >      [    0.303225] Oops: Oops: 0000 [#1] SMP NOPTI
> >      [    0.303236] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.9-1.qubes.fc41.x86_64 #1 PREEMPT(full)
> >      [    0.303258] Hardware name: Xen HVM domU, BIOS 4.19.3 08/26/2025
> >      [    0.303273] RIP: 0010:__amd_smn_rw+0x30/0x100
> >      [    0.303288] Code: 05 bd 44 b8 01 66 0f af 05 2d 44 b8 01 41 57 41 56 41 55 41 54 55 53 66 39 c2 0f 83 c0 00 00 00 48 8b 05 c3 61 d7 02 0f b7 d2 <4c> 8b 34 d0 4d 85 f6 0f 84 a9 00 00 00 80 3d a4 61 d7 02 00 0f 84
> >      [    0.303327] RSP: 0018:ffffcdd30001fd68 EFLAGS: 00010297
> >      [    0.303341] RAX: 0000000000000000 RBX: ffffcdd30001fdb4 RCX: 0000000010136008
> >      [    0.303359] RDX: 0000000000000000 RSI: 0000000000000064 RDI: 0000000000000060

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
