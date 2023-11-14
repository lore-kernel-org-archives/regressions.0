Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CF125CB
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmK/NhOK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9c603e235d1so790064566b.3
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 23:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699948755; x=1700553555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4a+/2GPGE9t75raLONwdARDIoGnauquz2NCORYIhTU=;
        b=DmK/NhOKc50CPO/jK2zqW4kiHzFd3/HSomWXfbpDMtE2siI7zEFfhK/77/9LNdkB1e
         QudrZ3yb/gPum4oiVRt4rsquaOPgvNsOwY/zpvLR/82xzLf1icVhQJmwVZY1GkuP7cGa
         hvTu7vTuqAEiqNTOoRcL0ctTyB5I8J31aVLwM9ej43FJOBEzj15yMKxDxCUOtr7UuaT0
         ZejmQJQv6wtUIMLN43pwnQ5G0yFhznrF3Z0lhi/SOLDM2yxOI3KFGjYfNd81THtFcNxV
         IVFc8qMA0EOTgmJ4Sn0O2J/cma9s8Us/VqS2CT0mRMKMnUp4fGhzSSQQJOkOM8nP1lxq
         479Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948755; x=1700553555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4a+/2GPGE9t75raLONwdARDIoGnauquz2NCORYIhTU=;
        b=HtxC6mqHUtKDJfhuIeR0RnCFHljYTgH4FSHjlzUUaynzFpDCnyvCG9Vv3SOsES2feA
         yCDaEzSNqgK3zFDluuo3rNSPO7GzYPgR68r1ERd/zb+8w+S2XnMMJk4nGVL2N+nZ4BGY
         E2NGGHe0Qxpuki7v4OTNOZH5MIPa0B3Sw0RDD4oylvZWw5aZxVPFjgIvPyQz4KvWTRyY
         4gdWG6XxqbXA1WksIP03LT3uEnXQgRTj3l0PdvDtmfmVF+eshGSZEF9G/BVvlNhmOu9n
         TMq27Tx9pQnQPMddQYTOCAM0JqdsqD6EKDXVBeMBnePQvblbU7uwPxeRhUmiuviOL4f+
         UdCQ==
X-Gm-Message-State: AOJu0YwC+Emi7RuNdRSjfc8A5E1aahTxIHTv55hZHdNAzipPTyaxnIQZ
	mciHRkLr3YHtc6kao8RqkkI=
X-Google-Smtp-Source: AGHT+IFXGdSF749Vw+Es4dVZ6ercLAXGf4Rh3cImzzah0qbOCjoxgH64N87ZOu3hi9j9Nr/+6HmbjA==
X-Received: by 2002:a17:906:7ad5:b0:9bf:a01c:8213 with SMTP id k21-20020a1709067ad500b009bfa01c8213mr5863838ejo.11.1699948755089;
        Mon, 13 Nov 2023 23:59:15 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id gr23-20020a170906e2d700b009d3148fb9f6sm5134054ejb.22.2023.11.13.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 23:59:14 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 43834BE2DE0; Tue, 14 Nov 2023 08:59:14 +0100 (CET)
Date: Tue, 14 Nov 2023 08:59:14 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Linuxppc-dev <linuxppc-dev-bounces+tpearson=raptorengineering.com@lists.ozlabs.org>,
	Jens Axboe <axboe@kernel.dk>,
	regressions <regressions@lists.linux.dev>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
Message-ID: <ZVMo0vOZAxuxT8la@eldamar.lan>
References: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com>

On Mon, Nov 13, 2023 at 10:56:09PM -0600, Timothy Pearson wrote:
> >From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
> From: Timothy Pearson <tpearson@raptorengineering.com>
> Date: Mon, 13 Nov 2023 22:42:58 -0600
> Subject: [PATCH] powerpc: Fix data corruption on IPI
> 
> On multithreaded SMP workloads such as those using io_uring, it is possible for
> multiple threads to hold an inconsistent view of system memory when an IPI is
> issued.  This in turn leads to userspace memory corruption with varying degrees
> of probability based on workload and inter-thread timing.
> 
> io_uring provokes this bug by its use of TWA_SIGNAL during thread creation,
> which is especially noticeable as significant userspace data corruption with
> certain workloads such as MariaDB (bug MDEV-30728).  While using
> TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requires
> this workaround.
> 
> Issue an lwsync barrier instruction prior to sending the IPI.  This ensures
> the receiving CPU has a consistent view of system memory, in line with other
> architectures.
> 
> Tested under QEMU in kvm mode, running on a Talos II workstation with dual
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
>  
>  void arch_smp_send_reschedule(int cpu)
>  {
> -	if (likely(smp_ops))
> +	if (likely(smp_ops)) {
> +		__smp_lwsync();
>  		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);

Once this is accepted in mainline, can you ensure that it get
backported to the needed relevant stable series? (Should it be CC'ed
as well for stable@?).

For context, and maybe worth adding a Link: reference as well this is
hit in Debian in https://bugs.debian.org/1032104

Regards,
Salvatore
