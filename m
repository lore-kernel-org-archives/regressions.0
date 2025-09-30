Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7241F1302
	for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759245102; cv=none; b=UJ+I3j7nIzwMRxjAFlB1TgKfhgZy1cf+5EzTGRX2X3SGIcyF47z+mvsvfBgRTSmzwi0WOCl1Ps5ipN/fHP0hDF5zeJhf+nqduonO2xdemo/7EXO/HsxAizLP28/rqV9s02KKM/2LJq/JKLw6b2CNKvfY6dlwHBSy2lDoJ6fYcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759245102; c=relaxed/simple;
	bh=EoQoC9gmyDFd04iDE/2CPVDmTENmOaGyZ91Ul897hi8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OLeHHIg1UBX3K+gTEtAuaD3CkcVzDaiecJhMkCIe9VTn66FuqAaImNZe/D+d/LC46VTMdLkcPFoUKGvCA6F6UVCnXcQEPwmWD0GeiwDyPpDBHWSuk+z31c846/SJ69B2Z5uT1D8pNwvUVM8eOFoUFaDDKj2inB7CawfuoncZ12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qHaU4Qn/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qHaU4Qn/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso5635154a91.0
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759245100; x=1759849900; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRw+IQDxMuuhxFprgh+nTQeMioqYSRGrn50nIsG9oms=;
        b=qHaU4Qn/itexkqJq8N1A81yo18Pe6u+wdtzPh5s9KhzAxHQ6PCeINDNKd5x1J4/7Lu
         JgRs1DFJB3Zi74P/ztenCaribxVnswpDbv7MFQGhpl/ceHfCmN9dK+o4lCXUeeRsPzyi
         leAYJnFYNHrHkvfIj+co+8TNyWKbMAVgX23WHQf8SiWETrjO7bVhhnvZxNAC8e0ikdRz
         ztUMFMQTdRI9XGz/Ukr5CS0RQYoaI/fqsQ3f33KSYbLZLv9vtU9hTOSDacuo7UTtIWpE
         1JJMhu7UdZEDnmwpXaNEaltfyHrTpOtelgcXs6xioTzVpyhh/aIlQqL11+zToTfxKNEy
         dD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759245100; x=1759849900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRw+IQDxMuuhxFprgh+nTQeMioqYSRGrn50nIsG9oms=;
        b=u4AUIiVxf2HFuDIcWgMNZ4bm7tJcub/tneCUi2yDqGoZwOJhFzE8VEv5MqisZmksrg
         RVqxmy8JvPaJAGsiaQri8/KTB3EspGb7UaF3OVKTK383ikuN2dIgN+QOTAPmFVVn1pPw
         WgTC/vyytbgzjGKHP+tk9MjsRws5cKZT31HGwJHmLT9Fn+zburqxLDeghB4VoHcAHwBK
         Qket1s2WCkbja9v9u2lOx6sHAzy48nrL0QHpdoOFmad9Ii3Mvt27yAN9C6sNGQ4eQpTI
         DKGeng8l7BooFmRlP3r7DL3Xl3riFc6Gvdm8n6jstXgAg4UWyTNsbV2sGAewXnE6Fqmw
         rgow==
X-Forwarded-Encrypted: i=1; AJvYcCUIXc49+dQqP/NQZemuMzaKRS8Zx0VKTH9S6a0tXIKse42fWoggzkGDS0w4iPlCAnz2U1y51bdGIoYyQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx104x8Gxe5PN+8BsIhvBnLi3siQY4j4/cAp1P3LXVLpiDLUs7I
	i69Xts+D5LkbvSHs914JQ2a7FiiGpnE/ohmlrWyd6YXpTnBqV2k8jySIHWK4LTrZg3CoXqroxLs
	JCT9nAw==
X-Google-Smtp-Source: AGHT+IFBJmhE94WYrCLM6s2PzvuRfYNTdKgTIJ07w4Sqgez2h3b8qceYm4qVSWPiyT7z6wceIMRCZp20cTU=
X-Received: from pjzg20.prod.google.com ([2002:a17:90a:e594:b0:339:9a75:1b1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b4a:b0:330:72fb:ac13
 with SMTP id 98e67ed59e1d1-3342a22cc80mr21528295a91.5.1759245100148; Tue, 30
 Sep 2025 08:11:40 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:11:38 -0700
In-Reply-To: <CA+G9fYuUcs_-SKWSbiAgyzuhE9-oqSAGDQOU6pTPfwq57+cWSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+G9fYuUcs_-SKWSbiAgyzuhE9-oqSAGDQOU6pTPfwq57+cWSw@mail.gmail.com>
Message-ID: <aNvzKq7itcc3ZY_Y@google.com>
Subject: Re: selftests: kvm: irqfd_test: KVM_IRQFD failed, rc: -1 errno: 11
 (Resource temporarily unavailable)
From: Sean Christopherson <seanjc@google.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kvmarm@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, kvm list <kvm@vger.kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 30, 2025, Naresh Kamboju wrote:
> The selftests: kvm: irqfd_test consistently fails across all test platforms
> since its introduction in Linux next-20250625. The failure occurs due to
> a KVM_IRQFD ioctl returning errno 11 (Resource temporarily unavailable).
> This has been observed from day one and is reproducible on all test runs.

It's a known issue[*], that I think we kinda forgot about.  The underlying issue
is that KVM ARM needs the test to create a vGIC, but the fix stalled out a bit
because there isn't one single, "obviously correct" way to do that.

I'll Cc you and ping Oliver on the other thread.

[*] https://lore.kernel.org/all/20250825155203.71989-1-sebott@redhat.com
