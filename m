Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E274A0C
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 10:42:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so2303788f8f.2
        for <regressions@lists.linux.dev>; Tue, 30 May 2023 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685443377; x=1688035377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EMngjdaC1cmXnO92t13ixHPmzh14q713TwRNHCOvkO4=;
        b=n/tZIfLkvAmhBcu/GtiLcNnBZ80AeN4YOTzUd0gO/GDgxbTDIqvPPTQ4fUNWvBwEiW
         VB7LXyEzBVbeqDhK/nDHSJnXsw8lcco+qlByuWGEH6vHR3Xjio+JBWK61BYhrweprOaM
         BrZuB7aB3gOMu5vzTitg6hxx20UQLNIjG7pOHuXIxt8uRkeu002r6xWI+pZQNqySRyE/
         2R3RQ5O08DcvL2kS/Faz0qoKHmCpDH2NpF7281gQbr7zupVdyopbLBvHZjz3D84X/q8n
         JBvFfIAFr1QRjSGlyas0VSwul3/T6E32+A5D6WkJEpVD0hOY72FQQ8QAN6LH5gRz/K2b
         Q5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443377; x=1688035377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMngjdaC1cmXnO92t13ixHPmzh14q713TwRNHCOvkO4=;
        b=BXkRcMmVYAZ64t/GPcM21FRYyHIoMFNJXNtJvWGrfSgFI0aQDL/qSnMVzCIAQG78oG
         znC4Rij79stfCaGoP0sbVIbvWrw8OuyQ1ZhaWrUjwGJw4DRiSUpzqsBqcAtGHTdtUCRv
         2JU3PPnYncJ+nqtfxccgHofBA89+k9rO/ZKySSXNk5J6OkDS/s6Dc4ExRYTQ7bNa2IQ8
         PX/OCUtbVeI9nidpQafsovkKbQwsgoq1OG/C5Zv+YtEJwF40UWmP+Ztw5GLnQJYlGV74
         J6tbJZYmxepi7717smtpL2TbTk5Ltp73bJPd6f5IFm/SKUSu2b2W/lMpbYgyfezHmB3j
         rGKg==
X-Gm-Message-State: AC+VfDzFHNhZTig6P4O5sdhIYZPxUWorO/XhrBpxl4Jb+U6PXt75tRTh
	Zg1JKuwns5vRQEwZyrAaGxcNXHOlLZtzPJE+Yp8=
X-Google-Smtp-Source: ACHHUZ5H1Ssx816UXvIgGlTH4ABSGNqs7PdJbj/3LYVn0/wuOcXrJa/wiTRuIumAjBJ7bKuZhbA7KedJHrMOG7hRbzM=
X-Received: by 2002:a5d:42cd:0:b0:30a:ebe2:5e44 with SMTP id
 t13-20020a5d42cd000000b0030aebe25e44mr1131518wrr.67.1685443376733; Tue, 30
 May 2023 03:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
 <ZHNMsmpo2LWjnw1A@debian.me>
In-Reply-To: <ZHNMsmpo2LWjnw1A@debian.me>
From: Fabio Coatti <fabio.coatti@gmail.com>
Date: Tue, 30 May 2023 12:42:45 +0200
Message-ID: <CADpTngWiXNh1wAFM_EYGm-Coa8nv61Tu=3TG+Z2dVCojp2K1yg@mail.gmail.com>
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, kvm@vger.kernel.org, 
	Junaid Shahid <junaids@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno dom 28 mag 2023 alle ore 14:44 Bagas Sanjaya
<bagasdotme@gmail.com> ha scritto:

>
> Thanks for the regression report. I'm adding it to regzbot:
>
> #regzbot ^introduced: v6.3.1..v6.3.2
> #regzbot title: WARNING trace at kvm_nx_huge_page_recovery_worker when opening a new tab in Chrome

Out of curiosity, I recompiled 6.3.4 after reverting the following
commit mentioned in 6.3.2 changelog:

commit 2ec1fe292d6edb3bd112f900692d9ef292b1fa8b
Author: Sean Christopherson <seanjc@google.com>
Date:   Wed Apr 26 15:03:23 2023 -0700
KVM: x86: Preserve TDP MMU roots until they are explicitly invalidated
commit edbdb43fc96b11b3bfa531be306a1993d9fe89ec upstream.

And the WARN message no longer appears on my host kernel logs, at
least so far :)

>
> Fabio, can you also check the mainline (on guest)?

Not sure to understand, you mean 6.4-rcX? I can do that, sure, but why
on guest? The WARN appears on host logs, the one with 6.3.4 kernel.
Guest is a standard ubuntu 22.04, currently with 5.19.0-42-generic
(ubuntu) kernel


-- 
Fabio
