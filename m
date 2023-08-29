Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654EE28E7
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 15:42:07 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d71f505d21dso5085618276.3
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693323726; x=1693928526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FM+v7KoHt1GJYjQWDGW6MffrxjUsrAprZHeC2dCdMpA=;
        b=ShfSUJQoiSUYFGv57zbNASG0wbJofUBgLzVihwXDm89k44TiHISL1V+sTpJmJnWCr8
         FXmDpfqXNl7VeVOxdhf/fQdLgSWP+86QKBcgC73AnU7/HXox1Eg3J/L0jSTCx7gN03rn
         JykHkfTZo91+5DQrf4aKOEWN/iEhtgmY1gY+mFr+Pz0fmWABWNXXJQT/Qeb3BESMX4Kk
         iJGzAf+gm3PpCLQxdBNwiltWVVE5f1F4kQIB+j2uhm4HwfLM+7/sEwi6PauxOhyG8pL/
         lp7sZb7DXyp+P3owRCEc1iFuB9hWoolFA+hvoI4B5WUz2fY+fno+uvi2qC524ygwm0aG
         LCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693323726; x=1693928526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FM+v7KoHt1GJYjQWDGW6MffrxjUsrAprZHeC2dCdMpA=;
        b=YcQOuzxHuxP1/LiVyuxneeuz36an3qIKyZMaCt41E3MXhoIPBP7miUZ3r7DIAHTjtK
         OdG/NIHKsXhg8FSwoCWI6fOeiyr44IZ8x2Qr4zw6icS64GiUEy8VlLxP4LtpbnrNxdso
         wYJXuOvVTJLBIk6XTKdtqSQcGjg73Ahn9Xh5xKzwlmNJpc8w07TIF9Xo1yiJZbyWb56r
         V/4l9QDst7Zwqa5dJvLKKt0gqp+35529F5fDfRthxvqJ1Ae5x2boaq025Pivp0H1u1PW
         mzZL60Gveji4iPbiOY7ryULGsKdQmK1fw/PhXRP5P7peptdmQO3H0++wPsh4RUy0f79d
         GaQg==
X-Gm-Message-State: AOJu0YxnUrmgL/Im5q8eIhBmRUBKWEZztr3M3+9N+FJUquUSmBRw3vZq
	iS5R9nRB+6gx7raK61IUxYckIa+LI8s=
X-Google-Smtp-Source: AGHT+IF6CUFPwOOuauhBgYXgbvrbrbPqnplg1MCTn9RK+HDLQlkTN18njH15rUkTdOyKD0fPsv/RBXuxAx4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:68e:0:b0:d77:cd42:913a with SMTP id
 j14-20020a5b068e000000b00d77cd42913amr769568ybq.9.1693323726307; Tue, 29 Aug
 2023 08:42:06 -0700 (PDT)
Date: Tue, 29 Aug 2023 08:42:04 -0700
In-Reply-To: <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de> <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de> <ZO4GeazfcA09SfKw@google.com> <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
Message-ID: <ZO4RzCr/Ugwi70bZ@google.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd related
From: Sean Christopherson <seanjc@google.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
	Linux Regressions <regressions@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 29, 2023, Marc Haber wrote:
> On Tue, Aug 29, 2023 at 07:53:45AM -0700, Sean Christopherson wrote:
> > What is different between the bad host(s) and the good host(s)?  E.g. kernel, QEMU,
> 
> The bad host is an APU ("AMD GX-412TC SOC") with 4 GB of RAM, one of the
> good hosts is a "Xeon(R) CPU E3-1246 v3" with 32 GB of RAM.

I don't expect it to help, but can you try booting the bad host with
"spec_rstack_overflow=off"?

> system configuration is from the same ansible playbook, but of course there
> are differences.

Can you capture the QEMU command lines for the good and bad hosts?  KVM doesn't
get directly involved in serial port emulation; if the blamed commit in 6.5 is
triggering unexpected behavior then QEMU is a better starting point than KVM.
