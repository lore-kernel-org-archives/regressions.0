Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B455C3E
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406539; cv=none; b=owN4fKs7DTNfyY77ZUtXnIN3iWuGYOOtqP1NPWJJyMdMjl2yWrdRYNfIyWKpBFw1JRMFr/+9Ljg93uhlvnscnAEsS+EKETxN1NM5IEC6lhX+uXC443UbXqP7fxkrYi9TtUTbPtiTYnwtqFRDH+b8uKfemSpsddJ8nik+StjqAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406539; c=relaxed/simple;
	bh=YrFd0Bzm8fQgHp/yoJrRTQkoNzjREerf+PNcZDF7MG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMPNZuRSFYT2ZUb6xVaJCBkpIDPOlpHZxv1Wgf6RZMGm5P4mwqBIwbMp0ZkIG9sfvbNGTgVUey1jG2SsMJWOkvoR2IXuY6Jla7FFrnj1QtcCeLmr0zt9OShE6Hy3XuAtbyy8+1p/V+fCyaHO9Sf9kU/WaUvLcdJtZWjMy1xeZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KxNxVUyL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KxNxVUyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716406536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxARM696Ruhc6XSa/3hNwXMhYhmoleEP5HmM++LiPQM=;
	b=KxNxVUyLjoVe6gV7tq3xIbGLej2SAfcsMy1poFdoFIWLymTazW7oVCFeLvNomXeQmjqAcS
	P7YwCDAX1MR68yzZIKVfLQIbxGhWuioLLhQD3Wy9F3+BNVlxJ7aDvKGENCvn14PyC19wpq
	yG9Lkxv5Krw90Y3a5/ii3/eyMKkym5s=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-UH4sk4yUOo60uHkSpU0zzw-1; Wed, 22 May 2024 15:35:35 -0400
X-MC-Unique: UH4sk4yUOo60uHkSpU0zzw-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-627f644882eso2469817b3.0
        for <regressions@lists.linux.dev>; Wed, 22 May 2024 12:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406535; x=1717011335;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1+GUtmZEMisQFH3yNqOkGsNRPJHqCdk4whL2W9DFJs=;
        b=Y30UeFMCu4k8Kn2VIjIz2KnONaY/gRZqXgvyPO9dbgrn7MkBjugb3RxJoFMxbURyuR
         pp2AMsxB3nx/3ce/oPE1+0l3QjP7XLuXENSctkjcnmieXuiNoBKRaJRg1c5y49x0i248
         E+iZK2kz1TttI5YCAxfviGIL8/UR91hhst62vyE8+fQXsvS0WMaSWGPDjJN4oN4I7AaN
         1V7JNMKT5cTUUWuYZTFjH3G+5bK4qxSo++dJJawqzILSXBmwWjTxGcW8sPeE2Dq+wa6I
         chpoZMXvzWMdtU36BvHw3rikHatBJsdcsWuRDaZeG8FkytHFBTdP9UYxdEHf0oBqIWDj
         6FVw==
X-Forwarded-Encrypted: i=1; AJvYcCWfYLgBd3mn5PpzyIZxnRoEmtORok3w0rmUNn0yV1VDxRG1sqlvHQTF9xEVKf1eYeAS0QNOCk5HxadKyk7hsQAg3HnhwwATC5MArDI=
X-Gm-Message-State: AOJu0YzFtGop9adgTRpi7eFQPHDJe78OfjImjbP4W7OCiTOYQI9A0BMi
	wRRIGQbjxXCQIN713hlu1Yf9npC5KtzWPwo6x0Ms7oeF4Fb82ey+sB1oXHDMqrDIm9Em8pLdngY
	P9PdwJ4XXbJxvZ+hFn+HlzgXCXg26ae6IJpyCuFH7zHWGXcWxZsuV9zFn4lXZ
X-Received: by 2002:a05:690c:ec8:b0:622:d6af:2555 with SMTP id 00721157ae682-627e46c99dfmr37663507b3.2.1716406534815;
        Wed, 22 May 2024 12:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkeKHMpWK8NcbIqif3cn71ot7RxQSe8rSsBapJOvWCPrePt7YrMQWmfal+XiT4DcmQGYyAUw==
X-Received: by 2002:a05:690c:ec8:b0:622:d6af:2555 with SMTP id 00721157ae682-627e46c99dfmr37663307b3.2.1716406534434;
        Wed, 22 May 2024 12:35:34 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300:d6d6:453d:2844:4388? ([2600:4040:5c6c:a300:d6d6:453d:2844:4388])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a62014446fsm53408446d6.31.2024.05.22.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 12:35:33 -0700 (PDT)
Message-ID: <d4496b4ed8a8a7bb34cf12e4cce65a6ad6705bc0.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Wed, 22 May 2024 15:35:21 -0400
In-Reply-To: <87wmntkhak.ffs@tglx>
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
	 <97bd95480a8b9951edc9ee2d2648d1b9c574e3b0.camel@redhat.com>
	 <87bk58n6le.ffs@tglx>
	 <2fd6009d21d606d13f0c472dbaa754a21f3105d9.camel@redhat.com>
	 <87wmntkhak.ffs@tglx>
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

Awesome! This patch does seem to make the system boot, thank you for your h=
elp
<3

Tested-by: Lyude Paul <lyude@redhat.com>

On Thu, 2024-05-16 at 15:38 +0200, Thomas Gleixner wrote:
> Lyude!
>=20
> On Wed, May 15 2024 at 19:15, Lyude Paul wrote:
> > On Tue, 2024-05-14 at 10:25 +0200, Thomas Gleixner wrote:
> > >=20
> > > Which one of the debug patches did you use?
> >=20
> > The one you sent on 4/18, when you also asked me for the output of
> > /sys/kernel/debug/x86/topo/
> >=20
> > (I thought I remembered that patch not booting on previous kernels but =
maybe
> > I'm misremembering)
>=20
> It booted with the -rc kernel too. :)
>=20
> I found an interesting and probably related difference in the boot logs
> though. Up to 8 possible CPUs the kernel uses logical destination mode
> for the APIC. With more than 8 it uses physical destination mode.
>=20
> Can you please test the patch below on top of 6.9 and validate that it
> boots w/o any magic command line parameter?
>=20
> Thanks,
>=20
>         tglx
> ---
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 66fd4b2a37a3..db5e93a7c194 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -1883,6 +1883,8 @@ static inline void try_to_enable_x2apic(int remap_m=
ode) { }
>  static inline void __x2apic_enable(void) { }
>  #endif /* !CONFIG_X86_X2APIC */
> =20
> +int irq_remap_mode =3D -1;
> +
>  void __init enable_IR_x2apic(void)
>  {
>  =09unsigned long flags;
> @@ -1915,6 +1917,8 @@ void __init enable_IR_x2apic(void)
> =20
>  =09if (ir_stat < 0)
>  =09=09restore_ioapic_entries();
> +=09else
> +=09=09irq_remap_mode =3D ir_stat;
>  =09legacy_pic->restore_mask();
>  =09local_irq_restore(flags);
>  }
> diff --git a/arch/x86/kernel/apic/apic_flat_64.c b/arch/x86/kernel/apic/a=
pic_flat_64.c
> index f37ad3392fec..5cc386db3557 100644
> --- a/arch/x86/kernel/apic/apic_flat_64.c
> +++ b/arch/x86/kernel/apic/apic_flat_64.c
> @@ -12,6 +12,7 @@
>  #include <linux/export.h>
>  #include <linux/acpi.h>
> =20
> +#include <asm/irq_remapping.h>
>  #include <asm/jailhouse_para.h>
>  #include <asm/apic.h>
> =20
> @@ -130,7 +131,8 @@ static int physflat_acpi_madt_oem_check(char *oem_id,=
 char *oem_table_id)
> =20
>  static int physflat_probe(void)
>  {
> -=09return apic =3D=3D &apic_physflat || num_possible_cpus() > 8 || jailh=
ouse_paravirt();
> +=09return apic =3D=3D &apic_physflat || irq_remap_mode =3D=3D IRQ_REMAP_=
XAPIC_MODE ||
> +=09=09num_possible_cpus() > 8 || jailhouse_paravirt();
>  }
> =20
>  static struct apic apic_physflat __ro_after_init =3D {
> diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
> index 842fe28496be..f633ab6dfa9f 100644
> --- a/arch/x86/kernel/apic/local.h
> +++ b/arch/x86/kernel/apic/local.h
> @@ -22,6 +22,8 @@ void x2apic_send_IPI_allbutself(int vector);
>  void x2apic_send_IPI_self(int vector);
>  extern u32 x2apic_max_apicid;
> =20
> +extern int irq_remap_mode;
> +
>  /* IPI */
> =20
>  DECLARE_STATIC_KEY_FALSE(apic_use_ipi_shorthand);
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

