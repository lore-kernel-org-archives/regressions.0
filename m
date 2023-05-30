Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66D1EA76
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 17:37:32 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-ba2b9ecfadaso9166113276.2
        for <regressions@lists.linux.dev>; Tue, 30 May 2023 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685468252; x=1688060252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcR9cOf4iNxvcptr0XhjKDmCn9YVouEV8X1B4pLhZos=;
        b=2owOn5ofEJH8z5xQXF3wRlLfqsfnpAbD5656tieTF+k6aazPFTGqzXWX1Ncw9pSWgm
         6Uu41j315BtDBiMeWlumYZxrhS8WCCRhp5X9R/qvzzYrU7cOt+rb1JL+mxaNnbaE78gT
         +7DT07mObBuGXuFs3NhAYXxpD3qXK2w8XajhKwAwzzLOlYSzkglQYnqQvJ1HuNlCCavK
         NhGN98NvCRLgRj32sjfZDdlklM8FhLeyOKaCMHppgqfjbngTlLf/U2XhbzdXt2bVAtf7
         Lb6sYyk0Sj0ESb3zLwRDTN6ox5HCp2LnSy7c254529yo2FaYwLBtNeylQWfqfEYrM5kY
         DjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685468252; x=1688060252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcR9cOf4iNxvcptr0XhjKDmCn9YVouEV8X1B4pLhZos=;
        b=WPUPImyDKvYh+6qx9HYKAoqtllKnpYNHr6D5qnoV9F4EwNa0zvgOXnSR9YiBLFnFlL
         a8gEBAUuK3afCAsRGWOJaOC0ABXUv3om+a1ZXz/ECwyQUHUFMWOYCCKB2hiHQvU49ZCo
         CgOjIYJgCCPaP1o59T8d+uwK/Ce7aB5erVZ3+/jvDJ9wtmXADKbrMzCfFMq1EybbImGY
         nQbcwRzFPw7/zm7CJEeoZW3FJZgrCHH8tP5rhTfYOkY8ZzeRHdBlAi66a4AkBW3TXiGV
         tUuQggwPQpijTkg7baBQGV8RhgS6NtxteDrgGmVNPYC5UxemOVR+s3srUa8eEmpFwQRH
         VKdQ==
X-Gm-Message-State: AC+VfDxlQh/DH2ePPP630zb5ezdCdpm7NbMVf3lLQ0B21qvvRetQxeZE
	l49Hbr4J5HeM4HHPZRhlBTDb9aa9kfk=
X-Google-Smtp-Source: ACHHUZ6omR/+/JpyHNAJjPOrIi/nvTDl7T8hNgfgqut+pVpe10qa7llxGDnkDcyui6PYSWMEIkjFkAJuWXY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4ea:b0:ba8:337a:d8a3 with SMTP id
 w10-20020a05690204ea00b00ba8337ad8a3mr1790878ybs.11.1685468251848; Tue, 30
 May 2023 10:37:31 -0700 (PDT)
Date: Tue, 30 May 2023 10:37:30 -0700
In-Reply-To: <CADpTngWiXNh1wAFM_EYGm-Coa8nv61Tu=3TG+Z2dVCojp2K1yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
 <ZHNMsmpo2LWjnw1A@debian.me> <CADpTngWiXNh1wAFM_EYGm-Coa8nv61Tu=3TG+Z2dVCojp2K1yg@mail.gmail.com>
Message-ID: <ZHY0WkNlui91Mxoj@google.com>
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
From: Sean Christopherson <seanjc@google.com>
To: Fabio Coatti <fabio.coatti@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, kvm@vger.kernel.org, 
	Junaid Shahid <junaids@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 30, 2023, Fabio Coatti wrote:
> Il giorno dom 28 mag 2023 alle ore 14:44 Bagas Sanjaya
> <bagasdotme@gmail.com> ha scritto:
> > #regzbot ^introduced: v6.3.1..v6.3.2
> > #regzbot title: WARNING trace at kvm_nx_huge_page_recovery_worker when opening a new tab in Chrome
> 
> Out of curiosity, I recompiled 6.3.4 after reverting the following
> commit mentioned in 6.3.2 changelog:
> 
> commit 2ec1fe292d6edb3bd112f900692d9ef292b1fa8b
> Author: Sean Christopherson <seanjc@google.com>
> Date:   Wed Apr 26 15:03:23 2023 -0700
> KVM: x86: Preserve TDP MMU roots until they are explicitly invalidated
> commit edbdb43fc96b11b3bfa531be306a1993d9fe89ec upstream.
> 
> And the WARN message no longer appears on my host kernel logs, at
> least so far :)

Hmm, more than likely an NX shadow page is outliving a memslot update.  I'll take
another look at those flows to see if I can spot a race or leak.

> > Fabio, can you also check the mainline (on guest)?
> 
> Not sure to understand, you mean 6.4-rcX? I can do that, sure, but why
> on guest?

Misunderstanding probably?  Please do test with 6.4-rcX on the host.  I expect
the WARN to reproduce there as well, but if it doesn't then we'll have a very
useful datapoint.
