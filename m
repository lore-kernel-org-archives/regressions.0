Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A122EF4
	for <regressions@lists.linux.dev>; Mon, 13 May 2024 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643193; cv=none; b=tX+8w6IFyocPAn12X+DXVx2wVGlKJ4C8YhvRC85A2rzw33SYOx2MTgW1Xs9zWvtN4QU+uy0hEUw2SddyQOfYi80q8JVfd4L4j51yV4YYUwsidARZgfeacgNQUh9FfBAkeOY6ozsn2V8oqXXkpdM/H3aeVA9oYR9cbui5fE1opa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643193; c=relaxed/simple;
	bh=uY6J8EX1dfxK0zuqDh0Z0/PhZm/PeE3/VOLys575B6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNEGkcO3MMF+4kzeeB0t6dI074O6wQ/VtVlJkraV5HGNcUxSh4e+Zng0PG0JgQRkLLZc6iODjx8JH5gXAAukGB8cahZwvrESqeXHVyqQXyoo0RHpX1q5ko5CRDNpO/tOB13PXnL6bzWoELDnjbNZv56Kxf90+MYlTOivvTz8WDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvwwOZXA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvwwOZXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715643190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8/X2zS1MTS8LCQf5QCN8XiG+4t1j75n46gvWHKUjD4=;
	b=UvwwOZXAYOLYM1vz7rjozn7w32iWk1wd+f8YZf5tIXAchiozTw1NxgzdftOq8U0FEQVzHF
	DCV0QUk0361YTPAmKdZ5+uKrgQqmdf0GzKoGHVVsSZnsP9m2gut65MDXg5q5wbTv4DfhSe
	nqdpNtQInj+Xj2CVvD5Rha1QLKUf/l8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-xOi6xKfEPVGvsSqdWO29wQ-1; Mon, 13 May 2024 19:32:59 -0400
X-MC-Unique: xOi6xKfEPVGvsSqdWO29wQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-792bb70ca0dso892545185a.0
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 16:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715643179; x=1716247979;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8/X2zS1MTS8LCQf5QCN8XiG+4t1j75n46gvWHKUjD4=;
        b=PQCLo0oiHVxDj6N2F8Q9uVwjzcKS4TNBEBenBK2ubApP55sH/U70TxqGUZ/xU/Y/NH
         tjxeohGso/u0oMACNlURQ0znitwrGss+y1HE104MxTKmYP9CVKnVfdf6sUguwBCRiP6x
         qOv33ZYf9rKbFELJpJFCMfP4vgYOTP9412yTFXe618LyPsIrpWdIhtNtGHgGGSzPZf6R
         pJDbmzXeg9rf08jgvXABsCZD5f5dvO2UwSKb1WquTn1Q/yUUP0Vy2/iCLAvGoICCR0he
         k+vYBCg1w9X9MRvLDTkuFjvfxg06FjW6fGeKAAissbNYEVcGi6UOFUPtpSiO+ZTOVbLi
         t1ig==
X-Forwarded-Encrypted: i=1; AJvYcCWNuXhywX4LxWqZOV2Giy2DqfSV/d9Vo9hJrg4BLhwQBQaeTMmHW5IBviSML+owDlLtZC2UiL41VEWzT7FDw0k6GIk5k6oHl2tj4VQ=
X-Gm-Message-State: AOJu0YyfJV0tRKcCJTTdyXX3vLnGMoKD3QFpOwZIkL4FY9Y/wAvbbGmN
	yVAgx8OtEFtexYuWIffKwgJkq63TpFNttDa7UIsYhf9h9h5dipURIP0kFhY8B0mAjgGShYZg4Ag
	RB8RLjAQft7T6bz0o60RswaTw8RBVsYpS+nRXcwtiok9B4lhFxhlMSR3Tld+k
X-Received: by 2002:a05:620a:5a76:b0:790:9817:309d with SMTP id af79cd13be357-792c6c4d5b9mr1817208985a.9.1715643178671;
        Mon, 13 May 2024 16:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf3bu4xHI4W+Da4JVqwE71fuBXhCzbfawreHIbwBSJukuSa6tEyZLJYhkFBdGwkK7njZrdtA==
X-Received: by 2002:a05:620a:5a76:b0:790:9817:309d with SMTP id af79cd13be357-792c6c4d5b9mr1817206585a.9.1715643178267;
        Mon, 13 May 2024 16:32:58 -0700 (PDT)
Received: from emerald.lyude.net ([2600:4040:5c6c:a300::feb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf34060csm498654085a.134.2024.05.13.16.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:32:57 -0700 (PDT)
Message-ID: <97bd95480a8b9951edc9ee2d2648d1b9c574e3b0.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Mon, 13 May 2024 19:32:56 -0400
In-Reply-To: <d3fe5278e7cd5af6c62b470b281b547b67e3959a.camel@redhat.com>
References: <3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com>
	 <20240418082703.GCZiDZVyra7qOQbyqn@fat_crate.local>
	 <fd040809d95b3e12b2fdc78a2409e187716bc66f.camel@redhat.com>
	 <87plumxz4x.ffs@tglx>
	 <abbb7d7ca781f6c664e4c5b1dffc19394ac79691.camel@redhat.com>
	 <87le59vw1y.ffs@tglx>
	 <3a0afe545747e5314a9cb6bbaa9ce90b259ddfac.camel@redhat.com>
	 <87edautcmz.ffs@tglx>
	 <3b1d16e357c1f9badeef405366492f05af26c085.camel@redhat.com>
	 <878r11t8zu.ffs@tglx> <016902d9-3858-4c65-b3ec-f7a5103af63c@amd.com>
	 <51d0dff8-2888-463c-95ab-71b491f12a8f@leemhuis.info> <877cg4ppd5.ffs@tglx>
	 <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
	 <d2c6f335a6eb5892b0d894d5df4a6e713fa013b5.camel@redhat.com>
	 <87jzjxn6s5.ffs@tglx>
	 <d3fe5278e7cd5af6c62b470b281b547b67e3959a.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh! I am not sure what changed, but I realized that you might also want to =
see
the serial output from the debugging patch that you had sent me a while ago=
.
So I just built that against the 6.9 kernel and it actually seems to boot
without needing me to pass intremap=3Doff. So it seems like that might actu=
ally
be a fix!

On Mon, 2024-05-13 at 19:18 -0400, Lyude Paul wrote:
> On Mon, 2024-05-13 at 16:08 +0200, Thomas Gleixner wrote:
> > On Wed, May 08 2024 at 19:21, Lyude Paul wrote:
> > > Regarding the test results - I tried possible_cpus all the way up to =
17
> > > and nothing got the machine to boot. However, possible_cpus=3D8
> > > intremap=3Doff did get the machine to boot successfully
> >=20
> > Oh. That's interesting.
> >=20
> > Does v6.9 (released yesterday) boot with just 'intremap=3Doff' too?
>=20
> Yes - it still boots. As well I finally got the serial console adapter in=
, but
> I don't see any additional output:
>=20
> [    0.146896] printk: legacy console [tty0] enabled
> [    0.147433] printk: legacy console [ttyS0] enabled
> [    1.951453] ACPI: Core revision 20230628
> [    1.955466] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 133484873504 ns
> [    1.964698] APIC: Switch to symmetric I/O mode setup
> [    1.970973] AMD-Vi: Using global IVHD EFR:0xf77ef22294ada, EFR2:0x0
> [    1.978491] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    1.996945] Kernel panic - not syncing: timer doesn't work through Int=
errupt-remapped IO-APIC
> [    2.005376] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.9.0Lyude-Test+=
 #7
> [    2.012248] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIO=
S 1.I0 01/22/2019
> [    2.020160] Call Trace:
> [    2.022584]  <TASK>
> [    2.024666]  dump_stack_lvl+0x5d/0x80
> [    2.028499]  panic+0x118/0x2c8
> [    2.031522]  ? timer_irq_works+0x54/0xf0
> [    2.035408]  panic_if_irq_remap.cold+0x5/0x9
> [    2.039631]  setup_IO_APIC+0x398/0x860
> [    2.043475]  ? _raw_spin_unlock_irqrestore+0x1d/0x40
> [    2.048393]  ? clear_IO_APIC_pin+0x125/0x1e0
> [    2.052617]  apic_intr_mode_init+0xcc/0xe0
> [    2.056672]  x86_late_time_init+0x24/0x40
> [    2.060820]  start_kernel+0x8be/0x960
> [    2.064446]  x86_64_start_reservations+0x24/0x30
> [    2.069015]  x86_64_start_kernel+0x95/0xa0
> [    2.073069]  common_startup_64+0x13e/0x141
> [    2.077280]  </TASK>
> [    2.079447] ---[ end Kernel panic - not syncing: timer doesn't work th=
rough Interrupt-remapped IO-APIC ]---
>=20
>=20
> >=20
> > Thanks,
> >=20
> >         tglx
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

