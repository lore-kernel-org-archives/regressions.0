Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08E84FD2
	for <regressions@lists.linux.dev>; Mon, 13 May 2024 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715642317; cv=none; b=GYc/Xh9c9mRUyw3Y/XJzNv29qLySjoKlswAa3WU+Q8eE8r9CFg2dbgSqN+6gJAqIgm3W825eT90ZNAZ+tAHbg43x6LUbjph+CxBDwnTUWVoxmMVptwMt/cTcR/+97Yt5w+Cl0B+CSk7sdnSmwDv9L0miicvsbMqKlU5ZNh5BakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715642317; c=relaxed/simple;
	bh=8wY1y0VlEXaKGXIlnRsLsv0pmH4Btpg3c+OsDGJ+dBw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhNNRYfTPKUmfNmhCvTA/2oiT6HlTn2WhXdlCP9lsA/k4Z/ER1QJZHhmI0HX96yECW3uxaWxjuhk1C4khO6Zw24/FCjS2mT7QTNpZWLax3rCHZyn+sagI5SQew9oJiyCK3UORPTXhzGj13j7bQt7RujMAOvQDq8xyAVVLZzgtzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TByblikb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TByblikb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715642314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qXWROXKG8a9e+WDVLQuvh7yEMpGdR+iDo+4e18bWFw=;
	b=TByblikb8w5kZk47OvXmEITxKMv2Ph5LFNnG/wOfYwyDt2J8zNFzPm8ymTezxOFaJSDi1A
	7VQ+ivwsq0crndkbw0Xu35QfvDaEwOiBYhkjIQHR2WnmYRwJh/H3sKImzaTatoZuTsE3Zm
	bU1nH2zhfMmvWF0yHdMze6VolS1it9Q=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-Sho1ts13O2-n9lmVe-VA1A-1; Mon, 13 May 2024 19:18:33 -0400
X-MC-Unique: Sho1ts13O2-n9lmVe-VA1A-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c9a75ea4ccso1452325b6e.2
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 16:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715642312; x=1716247112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qXWROXKG8a9e+WDVLQuvh7yEMpGdR+iDo+4e18bWFw=;
        b=wnRdBnK8gJlVulySvgPfoImkXU5fsBgFx7XEbnZ2Ye/IDPoNWFb0R18bDyn4gr6pLx
         Xm6yDNHu2y47i2r3MsHP5P18nbizpTo4z3qAvm3QGIqZIATMXbHVrHM+g+BgpbVoct5x
         il8B6RzFyYqKKev6j/u1O4u7Gk1YHM4HLyqcRxHmTtfF2rP6C5JjlJed9hZs5/o/Q+wI
         NDj4S22KSikZjBJz4R2Tnq29V32QqQgMAtThQ66gFDjCvlNeljAvkO9tyk9fNqhvbfLk
         up+bdLA2Dn74xOmEUQCNnMGSKieEBTZFgmbSOGn5ktEMeuMmBv2NQhbXVqkF7oXGU1wa
         1ykA==
X-Forwarded-Encrypted: i=1; AJvYcCUJbca6TmW8ky9++erfXoumX7D39CES+bmeCPhT61gXrnMSyj+V678OlptQWNBpOLiGWKY+CIjf6hwHmrV/RvLVNw2u8eRwfTsbh84=
X-Gm-Message-State: AOJu0Yx45vhgIVTEazslgNgSDXnbuW4EvOUvqiII2D4RqAd486uU3WhD
	Zazjm1L2AaMDJfol9ud+CEV39wAc4p9Hus77FewcNnqkgRKPpoMufM0HFRcuGB7pvIs2flztK/m
	+WnWgrzvt74+rLw9Q34lYtYbrKRsn5w01B2OwAdRNas2L2SQUcdttnaNCUjn5
X-Received: by 2002:a05:6808:487:b0:3c9:6a55:5f1a with SMTP id 5614622812f47-3c9971dcf6cmr15061043b6e.49.1715642312119;
        Mon, 13 May 2024 16:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5D72RC4LYRTNo2hkTuLtCqE64H9MkykuNQ8KmfYMOGK2wgXqYoc36FZMooj1/RkMQiX2r6Q==
X-Received: by 2002:a05:6808:487:b0:3c9:6a55:5f1a with SMTP id 5614622812f47-3c9971dcf6cmr15061001b6e.49.1715642311411;
        Mon, 13 May 2024 16:18:31 -0700 (PDT)
Received: from emerald.lyude.net ([2600:4040:5c6c:a300::feb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1d7068sm47662336d6.112.2024.05.13.16.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:18:30 -0700 (PDT)
Message-ID: <d3fe5278e7cd5af6c62b470b281b547b67e3959a.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Mon, 13 May 2024 19:18:29 -0400
In-Reply-To: <87jzjxn6s5.ffs@tglx>
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

On Mon, 2024-05-13 at 16:08 +0200, Thomas Gleixner wrote:
> On Wed, May 08 2024 at 19:21, Lyude Paul wrote:
> > Regarding the test results - I tried possible_cpus all the way up to 17
> > and nothing got the machine to boot. However, possible_cpus=3D8
> > intremap=3Doff did get the machine to boot successfully
>=20
> Oh. That's interesting.
>=20
> Does v6.9 (released yesterday) boot with just 'intremap=3Doff' too?

Yes - it still boots. As well I finally got the serial console adapter in, =
but
I don't see any additional output:

[    0.146896] printk: legacy console [tty0] enabled
[    0.147433] printk: legacy console [ttyS0] enabled
[    1.951453] ACPI: Core revision 20230628
[    1.955466] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    1.964698] APIC: Switch to symmetric I/O mode setup
[    1.970973] AMD-Vi: Using global IVHD EFR:0xf77ef22294ada, EFR2:0x0
[    1.978491] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    1.996945] Kernel panic - not syncing: timer doesn't work through Inter=
rupt-remapped IO-APIC
[    2.005376] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.9.0Lyude-Test+ #=
7
[    2.012248] Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS =
1.I0 01/22/2019
[    2.020160] Call Trace:
[    2.022584]  <TASK>
[    2.024666]  dump_stack_lvl+0x5d/0x80
[    2.028499]  panic+0x118/0x2c8
[    2.031522]  ? timer_irq_works+0x54/0xf0
[    2.035408]  panic_if_irq_remap.cold+0x5/0x9
[    2.039631]  setup_IO_APIC+0x398/0x860
[    2.043475]  ? _raw_spin_unlock_irqrestore+0x1d/0x40
[    2.048393]  ? clear_IO_APIC_pin+0x125/0x1e0
[    2.052617]  apic_intr_mode_init+0xcc/0xe0
[    2.056672]  x86_late_time_init+0x24/0x40
[    2.060820]  start_kernel+0x8be/0x960
[    2.064446]  x86_64_start_reservations+0x24/0x30
[    2.069015]  x86_64_start_kernel+0x95/0xa0
[    2.073069]  common_startup_64+0x13e/0x141
[    2.077280]  </TASK>
[    2.079447] ---[ end Kernel panic - not syncing: timer doesn't work thro=
ugh Interrupt-remapped IO-APIC ]---


>=20
> Thanks,
>=20
>         tglx
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

