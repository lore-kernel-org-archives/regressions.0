Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344E23C6A
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 15:01:13 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-560ee0df572so33639407b3.0
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684422073; x=1687014073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=COEcCFWgCbplE1MtlqGXZIriKuoSjyaM69XcEc43hFs=;
        b=V4t31ISM6ddijUWJrMbzNdsub50JqaWK0bG2NFCCpmTFivM5lhHY9OWHzMC0C/HCMT
         Ja37GZLQK+L91ygKXO4cJFqPAoIr3jFi1MTJXKDiS/EGFspP9Frt+o9dDL8Nt0rXY7Ua
         Ausy7uWZTyz5+fN5nyBn1wmlxoKRTBGWLWJlig0yVzR79vIUv/RMFOFcXJiDrmQZoa6d
         HQy+bLYpiwmqRs3B2j7jXF2JXzKsYXuDfjdrnYJNbxh/Km+HRilenhnoRg1cmJFynjeP
         xxeuMJ42jYGmeu3M3IZ8qsQ+6U1GzhFBwKRh08c9gxKDFBu4fbkUTLHLge/Lo83UhALz
         gvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684422073; x=1687014073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COEcCFWgCbplE1MtlqGXZIriKuoSjyaM69XcEc43hFs=;
        b=B3nDggBOtdJu9hn8widloklXwx3BJRTOHj/eg5THQ0UYDDRlWzdgUQHg5oITLaSXyu
         6DJFCpKpVisdA/53mhd7C9z/LyFiAztq48SaVEx23PtHU6hsN4+G/6Q7BgS6j60/f975
         qVPXQ6U3f/reLrppUxnWfL1fJy5uwm/M0MpIqhJ5yS/RSZGc3vkpg2R67gkQctFxbayi
         hAbzeR1tDmOLje9YqcyIdmMVYdozuR5ZO77dZFKQpwyfVi/rHplI6OOamKE50Ap5vM6u
         qeqzrzRyreENsDHzfYdhvczCTnoyJT28kaMHMe5c4oIsKHa4WHr7hjVCMPrxH8+W8v5a
         2lLA==
X-Gm-Message-State: AC+VfDxq2d3T1p72NxF8BYk5g7YPMYo7DZeJztDeSK1mlptiDURBkTpj
	DXHLF2RIImQ0WK1afsqpdFtdRZMEioA=
X-Google-Smtp-Source: ACHHUZ7IX6Wx0LSBkpzQqjr+OXaJS2pKyVuTTzwb3z0a97s/un34w9qdMEO5QA63WIOBuZvYpFhahx6OOmI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:e50e:0:b0:561:3149:d684 with SMTP id
 s14-20020a81e50e000000b005613149d684mr1180910ywl.10.1684422072950; Thu, 18
 May 2023 08:01:12 -0700 (PDT)
Date: Thu, 18 May 2023 08:01:11 -0700
In-Reply-To: <babafe0f-3154-fb0a-346f-2bbea48a366e@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <71288f04-546c-9af3-e29a-eb3c44e0d948@gmail.com> <babafe0f-3154-fb0a-346f-2bbea48a366e@gmail.com>
Message-ID: <ZGY9twXBuTWpliAB@google.com>
Subject: Re: Fwd: Persistent rt_sigreturn segfaults on KVM VMs after upgrade
 to 5.15
From: Sean Christopherson <seanjc@google.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Theodor Milkov <tm@del.bg>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 18, 2023, Bagas Sanjaya wrote:
> On 5/18/23 20:57, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> > 
> >> I'm experiencing sporadic but persistent segmentation faults on the KVM
> >> VMs I manage. These faults began appearing after upgrading from Linux
> >> Kernel 4.x to 5.15.59. I further upgraded to 5.15.91 and transitioned the
> >> userspace from Debian 10 (buster) to Debian 11 (bullseye), yet the issues
> >> persist. Notably, the libc has also changed in the process as seen in the
> >> following error logs:

Was the host or guest kernel upgraded?  If the guest kernel was upgraded, it's
unlikely, though still possible, that this is a KVM bug.

> >> post.sh[21952]: bad frame in rt_sigreturn frame:000072db65961bb8
> >> ip:6c25f82a9a5d sp:72db65962168 orax:ffffffffffffffff in
> >> libc-2.28.so[6c25f8294000+147000]
> >>
> >> cron[7626]: bad frame in rt_sigreturn frame:000073ddebeb6ff8
> >> ip:72ad9f44d594 sp:73ddebeb75a8 orax:ffffffffffffffff in
> >> libc-2.28.so[72ad9f3a9000+147000]
> >>
> >> cron[64687]: bad frame in rt_sigreturn frame:000073265764b038
> >> ip:67c7b5a0f14a sp:73265764b5f0 orax:ffffffffffffffff in
> >> libc-2.31.so[67c7b596f000+159000]
> >>
> >> worker.py[54568]: bad frame in rt_sigreturn frame:000078eef6591cf8
> >> ip:6c9f9b2a604e sp:78eef6592298 orax:ffffffffffffffff in
> >> libpthread-2.31.so[6c9f9b29a000+10000]
> >>
> >>
> >> The segmentation faults occur 1-3 times daily across approximately 1000
> >> VMs running on hundreds of (supermicro, intel cpu) bare-metal servers.
> >> Currently, there's no reliable way for me to reproduce the issue. I
> >> initially considered this bug -
> >> https://www.spinics.net/lists/linux-tip-commits/msg61293.html - as a
> >> possible cause, but judging from the comments it likely isn't.
> >>
> >> The best approximation to a reproducer I have is a Python script that
> >> initiates several child processes and continuously sends them a sigusr1
> >> signal. Still, it takes a few hours to trigger the issue even when running
> >> this script on several hundred VMs.
> >>
> >> Switching to the 6.x kernel isn't immediately feasible as these are
> >> production systems with specific requirements. The transition is planned
> >> but will likely take several months.
> >>
> >> I'm looking for suggestions on how to more reliably reproduce this
> >> problem. Then I could try different old and new kernels and maybe narrow
> >> it down.
> > 
> > See bugzilla for the full thread.
> > 
> > Anyway, I'm adding it to regzbot:
> > 
> > #regzbot introduced: v4.19..v5.15 https://bugzilla.kernel.org/show_bug.cgi?id=217457
> > #regzbot title: bad frame in rt_sigreturn (libc-related?) regression after 5.15 upgrade
> > 
> 
> Oops, I forgot to add the reporter:
> 
> #regzbot from: Theodor Milkov <tm@del.bg>
> 
> Sorry for inconvenience.
> 
> -- 
> An old man doll... just what I always wanted! - Clara
> 
