Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8171625
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9u6PqLY"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5bd33abbb90so4185393a12.2
        for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 17:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700012142; x=1700616942; darn=lists.linux.dev;
        h=in-reply-to:references:message-id:to:from:subject:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drWTayj3BKMTDfEilqOG+kaENTU1KF/ppLqwLf4zMEE=;
        b=d9u6PqLY8cyrFHYh1PSkd63+6cSVJ7hPkUdOFhdhlLPLex621n1oUjnq1IcJO9Hzlo
         Tn7VumCwuLCAfjJ23ZAYU9Ab1w3Prig9lKc3lOe8OWgzgLAZIWQ938cZaHF9HElfaCDP
         HJrRPd7+PoXZx6W/nfWQZ5kuGgD2TZaMg1P7XwoZKa9uHYHrgdHtY/goKzM98brLuGBm
         n/ZUEiZeVSjOjJWXMhs29QSoTmqnNqHDLZ7EttV73l94J4ZmPInDDMSekc6U9Pq7lUv7
         s1jy3tmgvdfRC5jq9K0qBlC/R/9ksPz05KunGcK/NSNNf4nRirV4rNR1QF/27uY4mpjN
         OIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700012142; x=1700616942;
        h=in-reply-to:references:message-id:to:from:subject:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=drWTayj3BKMTDfEilqOG+kaENTU1KF/ppLqwLf4zMEE=;
        b=eUC+eL9cX6XdUan144FfXiOoaP7XeVQ1lRvcv71n9kHQzqQJgpmvqhYBA0dyvw+x2S
         EgNopb3nfHRsupmRE+BHRvXVVP8pbF2PvTNfghRwNHEle1EBC/m2Cgwc6T/DLFPxhLbj
         q3TUKgRNQ5yLAUYIApwV5Fk4Q5IpdUG3P/MujGvNRJuCF7WnqP1BOKXJ/1I6WOhnAa0f
         EgtF3NGPI7Pp/MtINP5ICBPRfheUGvYPcl3eeFZlZbQGNaSABn38Z68M/fc+v2rgjUfY
         /3D5g5IPjwOsCV7PLMOIaG44ak5d0kgrBbpLYaaSjRROMw/uGbmkJh9+k6DCyEVjmxhI
         yq+Q==
X-Gm-Message-State: AOJu0YwvscBmzTMZvDkSUJlV+Kx/Th/LKP25od46aV6w84zpz8NKyS8L
	7GT9Z4tl8cra+h1FcipYx0Y=
X-Google-Smtp-Source: AGHT+IE19lta4KRtMXWT/ZJMCf0a6kqYgyRh1wPCKs0pv8TUPTiHJNTPZBHA/r1N9A/6XyO6MHg6Sw==
X-Received: by 2002:a05:6a20:e124:b0:17b:2f9:4146 with SMTP id kr36-20020a056a20e12400b0017b02f94146mr13471128pzb.43.1700012141825;
        Tue, 14 Nov 2023 17:35:41 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id gw8-20020a17090b0a4800b002810810cc80sm5793046pjb.37.2023.11.14.17.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 17:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 11:35:35 +1000
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Linuxppc-dev"
 <linuxppc-dev-bounces+tpearson=raptorengineering.com@lists.ozlabs.org>,
 "Jens Axboe" <axboe@kernel.dk>, "regressions"
 <regressions@lists.linux.dev>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>
Message-Id: <CWYZVPYRFEW1.D62Z6KT8P5T@wheely>
X-Mailer: aerc 0.15.2
References: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com>

On Tue Nov 14, 2023 at 2:56 PM AEST, Timothy Pearson wrote:
> From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
> From: Timothy Pearson <tpearson@raptorengineering.com>
> Date: Mon, 13 Nov 2023 22:42:58 -0600
> Subject: [PATCH] powerpc: Fix data corruption on IPI
>
> On multithreaded SMP workloads such as those using io_uring, it is possib=
le for
> multiple threads to hold an inconsistent view of system memory when an IP=
I is
> issued.  This in turn leads to userspace memory corruption with varying d=
egrees
> of probability based on workload and inter-thread timing.
>
> io_uring provokes this bug by its use of TWA_SIGNAL during thread creatio=
n,
> which is especially noticeable as significant userspace data corruption w=
ith
> certain workloads such as MariaDB (bug MDEV-30728).  While using
> TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requ=
ires
> this workaround.
>
> Issue an lwsync barrier instruction prior to sending the IPI.  This ensur=
es
> the receiving CPU has a consistent view of system memory, in line with ot=
her
> architectures.
>
> Tested under QEMU in kvm mode, running on a Talos II workstation with dua=
l
> POWER9 DD2.2 CPUs.
>
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/powerpc/kernel/smp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index ab691c89d787..ba42238de518 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)
> =20
>  void arch_smp_send_reschedule(int cpu)
>  {
> -	if (likely(smp_ops))
> +	if (likely(smp_ops)) {
> +		__smp_lwsync();
>  		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
> +	}
>  }

do_message_pass() on powernv and pseries is
smp_muxed_ipi_message_pass(), and the first thing that
ends up doing is the smp_mb() in smp_muxed_ipi_set_message()
AFAIKS, which is a hwsync, which is a stronger barrier than
lwsync. So I can't see what this really fixes.

Thanks,
Nick
