Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0689271F6
	for <regressions@lists.linux.dev>; Fri, 26 May 2023 17:01:32 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-518d6f87a47so633330a12.3
        for <regressions@lists.linux.dev>; Fri, 26 May 2023 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685120492; x=1687712492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGSsRadg8/k5YCYiOUDx3xTCmP75V2hSKqivxNmuHB4=;
        b=aZqsNgc7a1OmO2JI7G8jku+ietUnfouKuJEoAN0tBmNqsAin9JBkSMFYL8S8gDKKHR
         aNwJp8m7f6BCK7xhN7d5Rg56l3clIm8a4vAXJ21vFWq6ntVMWn4JuMkj+seOzlT3z0re
         7TLJud0hRERbNC/6lX1JO+EPpwOIj22VokKAcYMFiNdb2rU1GlRTeeI9637dwFH9A2Hg
         9IPit8NpcZ+qUDmhb3agCo4Ubf9hB8JwiJnK1HorAFoH6JUgTD/M2hGVsJCYo13LCRXV
         xqq3/V0Cy5kQgGl23hEJ87cOuXXvbN7TdvWSEP62qm2L+f1N00ljfH6b5LZh9UeVraRh
         Asww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685120492; x=1687712492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGSsRadg8/k5YCYiOUDx3xTCmP75V2hSKqivxNmuHB4=;
        b=BQOQ58/H2iGOcsnX9YAQWXWHiooXFDNHzqnu9PIzlFn1IR4z6FSIiNzxcexIk4cTzG
         46DX5X2O28QJn010QD/QO8wTrR0mPUo4XoxoRoBHrdyxmDSw9sCqUrBazyCGimBuyFfl
         0IUGYuoG08sSw5pQoPMbr3lpnBsdQqjbyA3z++qlLDPyi+vIFsKWDAtTWq18By/Kwf9K
         2IzjQGNMIIpNQRnvq5eZ60qqmhr4/u5rJEMcyRNtpKFlTD8QqzRfET41sBOxDSlktT/j
         4HifTi4PXEZ3uTHtPjMTHeyKLityeaS8EaVEQXg7kqqQJqbPzoZiugXj24BUUxBJj/vK
         BPHw==
X-Gm-Message-State: AC+VfDyicSj8sbLpZn039ncLYZnYdgOOsXhEIHUIUKF9czZboqrViq4R
	9lCzWOVw76UXzt09nXDrpTkTLDZs1u4=
X-Google-Smtp-Source: ACHHUZ6OQjvHvHGEb6V1v/dWoqRH+hN+hXO0RBWjxtohTutQ74AAidsJ/QXWTOFyJ1SL6/Pncd+hcSIVLGk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:4b48:0:b0:530:638d:cf91 with SMTP id
 k8-20020a634b48000000b00530638dcf91mr25458pgl.4.1685120492215; Fri, 26 May
 2023 10:01:32 -0700 (PDT)
Date: Fri, 26 May 2023 10:01:30 -0700
In-Reply-To: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
Message-ID: <ZHDl6rXQ0UTWdk2O@google.com>
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
From: Sean Christopherson <seanjc@google.com>
To: Fabio Coatti <fabio.coatti@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 26, 2023, Fabio Coatti wrote:
> Hi all,
> I'm using vanilla kernels on a gentoo-based laptop and since 6.3.2

What was the last kernel you used that didn't trigger this WARN?

> I'm getting the kernel log  below when using kvm VM on my box.

Are you doing anything "interesting" when the WARN fires, or are you just running
the VM and it random fires?  Either way, can you provide your QEMU command line?

> I know, kernel is tainted but avoiding to load nvidia driver could make
> things complicated on my side; if needed for debug I can try to avoid it.

Nah, don't worry about that at this point.

> Not sure which other infos can be relevant in this context; if you
> need more details just let me know, happy to provide them.
> 
> [Fri May 26 09:16:35 2023] ------------[ cut here ]------------
> [Fri May 26 09:16:35 2023] WARNING: CPU: 5 PID: 4684 at
> kvm_nx_huge_page_recovery_worker+0x38c/0x3d0 [kvm]

Do you have the actual line number for the WARN?  There are a handful of sanity
checks in kvm_recover_nx_huge_pages(), it would be helpful to pinpoint which one
is firing.  My builds generate quite different code, and the code stream doesn't
appear to be useful for reverse engineering the location.
