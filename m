Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9148F57
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 22:07:20 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d7bb58517b8so1088855276.0
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693519640; x=1694124440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgnjEF4yFasLmpmpPrDGfWRlTkHCJIfRLIREm8beBzY=;
        b=QbWkLOJnsTR6qcoTqr+ijxfYzuIL/E2CnFaIlihy91LkyKpYmSlRVzyU8SjOQpHH1b
         /kmB35bsY7pq+48EcgSwoh/HgNnct/dbyKbcg1lCV4bkAj3Uaun6Aio7ofd68aC0ht0i
         oq6kSgZa+EOZRrhdPGLQWI9He7ncOV5w9nGEQ0r+i05VZTwCWm/rcUHskbZK/pWC4tAx
         3btRmZHWFh4KxsSN76Bm0ALMir/gel7rtY87Km/DktQ985DKDlmEqagTYtopDbq3B0ej
         1W+2OsbR0RFwW8iOYEWoySNQs+bVjvIdqxzfj7lv546QUZbGg+bFw6E5p5VNVjO3Br5i
         bBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693519640; x=1694124440;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qgnjEF4yFasLmpmpPrDGfWRlTkHCJIfRLIREm8beBzY=;
        b=JGkTy4sSqtz+jYX17zS2NIakv2EHMyU/7WXL0CoWn5QGQxwXBQtVuWh/TmiKeQb9ed
         7XhrHiWpJGgAFt1DjUfEtkc0FHqghLLSwCrwPyi/d42WcKqYR4ZtJ6JzYKFpf7QYXwjq
         aNzoRtvpQDkFX2/z885bp5daO4FROBV/puyUUaJ2HZMcxPep3U037QQfpesTNMIqC+NN
         i6zRx+QmXicauygqzVHm+QjRlaX03a0RbZffdNa0ivH6h2lpGunidjGTPNlrwxaCYb+O
         PXa4kEynQ6zyw/9TS7xEgz2peAO9TAw2rH+uDymed/2wjpRs/FbwMq1UbQv6KumYmBbX
         Qp7w==
X-Gm-Message-State: AOJu0Yz6sJpV0YKZag5TUuzQeEDFRpHC4IU8b85c72DvoIHDg5vJir5s
	O9/ZXkrKBLjKPqakkiKz9t306MmOSHA=
X-Google-Smtp-Source: AGHT+IH7jvi73S8Hy8V1cTNRJcs7gjaW7hdTTxoQCUGUr4SIru6AT2AYKzQ67n76Lv+PuuOp0QD90g+s5Og=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:7343:0:b0:d77:df8a:389a with SMTP id
 o64-20020a257343000000b00d77df8a389amr23375ybc.3.1693519640007; Thu, 31 Aug
 2023 15:07:20 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:07:16 -0700
In-Reply-To: <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de> <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de> <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de> <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de> <ZO4nbzkd4tovKpxx@google.com> <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
Message-ID: <ZPEPFJ8QvubbD3H9@google.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd related
From: Sean Christopherson <seanjc@google.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
	Linux Regressions <regressions@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023, Marc Haber wrote:
> Hi,
>=20
> On Tue, Aug 29, 2023 at 10:14:23AM -0700, Sean Christopherson wrote:
> > On Tue, Aug 29, 2023, Marc Haber wrote:
> > > Both come from virt-manager, so if the XML helps more, I'll happy to
> > > post that as well.
> >=20
> > Those command lines are quite different, e.g. the Intel one has two
> > serial ports versus one for the AMD VM.
>=20
> Indeed? I virt-manager, I don't see a second serial port. In either case,
> only the one showing up in the VM as ttyS0 is being used. But thanks for
> making me look, I discovered that the machine on the Intel host still
> used emulated SCSI instead of VirtIO f=C3=BCr the main disk. I changed th=
at.
>=20
> >Unless Tony jumps in with an
> > idea, I would try massaging either the good or bad VM's QEMU
> > invocation, e.g. see if you can get the AMD VM to "pass" by pulling in
> > stuff from the Intel VM, or get the Intel VM to fail by making its
> > command line look more like the AMD VM.
>=20
> In Virt-Manager, both machines don't look THAT different tbh. I verified
> the XML and the differences are not big at all.
>=20
> Do you want me to try different vCPU types? Currently the VM is set to
> "Opteron_G3", would you recommend a different vCPU for the host having a
> "AMD GX-412TC SOC" host CPU?

I would be surprised if using a different vCPU type fixed anything, but it'=
s not
impossible that it could help.  In general, unless someone from the serial =
driver
side spots an issue, fixing whatever the bug is will likely require a repro=
ducer,
which in turn likely means narrowing down what exactly is unique about your=
 AMD
setup.  In other words, if you have cycles to spare, anything you can do to=
 help
isolate the problem would be appreciated.
