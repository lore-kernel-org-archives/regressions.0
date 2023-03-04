Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFFB7E
	for <regressions@lists.linux.dev>; Sat,  4 Mar 2023 15:54:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so2849195wmq.1
        for <regressions@lists.linux.dev>; Sat, 04 Mar 2023 07:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677945244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsepL0tvWvLyn3/LsFMVSsF0JgTexm6WZnv5HSKWLi8=;
        b=bq3hRRdhVN4W4S3cGVUc48hBUnT+7mQMay/c5pNi1PHnFBgN7UIqFOs/zycE437s0x
         xEjvJEz+PGysoUNpLmGy4opiDWbcEaCH6393n0T3hCHWX0F1GHAr4EFPD8bQeKeqFdIb
         YZFuRCAJbM9dTvho8GgafJvY5vAhnw15FGWO23Ifjji3QKBmbH/gVW1WKBfuPpWMwMkv
         ulWT/vrLkHewlB69uF39AVNb3/vmbQBCqScZ4B5G6UVBNB1pZgq1+u6zkWNJ6UcBMZT8
         5yPp9dxZvFGrIY60nY4tP/3JHCZe/Bf/2sUOi81RDsq2Zz3TYKCY8/rYxC/yBm5pRNgJ
         p3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677945244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsepL0tvWvLyn3/LsFMVSsF0JgTexm6WZnv5HSKWLi8=;
        b=MnPAMG1YYLiNkBrRbn1lOvV179NPhpfZ3bDC7o9jeBQ/k3PcY+RDUu8pbKZ/9vxnyQ
         0sZo2WIgD8xKhvUFjPLJjFOH54Z4D3BMxXToN7bQNmu9gHe3ZJfj/DZuONwvaEVUDnkC
         2TnoWnAcsRTm0R1S7UJsdCZHbrbUIysOHXjHlrP6+S1PcoEPmloKrxxxbBTWmF6XJCaz
         amnmm1LTEfF57N0kgJgO9p5yfdIoepXE17dP4O22BklnQwqDGLgGckOUulDBbiViEaHu
         A6y606iO1VUyrNOAw63/TdibBsG8VxSvREtFRLOe2gu5xPGKnXtQVuriWq8X3B3PmktS
         66xw==
X-Gm-Message-State: AO0yUKUUSz5pN/8glPCM1Vo9r6ewHyXv+ybFv0tq1FYThFYQvyb7Cu9z
	976iDB6By+ixVf6uyoWZTcVGebVANca4NI0DaEZl9B5JsV0=
X-Google-Smtp-Source: AK7set8ps9y5m4K1FLPZRrU0txATHmkv/mGn81Up3y4JGYSyi54mASm1sWXN4KfwTD9pMM6P4j+vKsAeIKG0aMp42bI=
X-Received: by 2002:a05:600c:181d:b0:3e1:bfc:d1c3 with SMTP id
 n29-20020a05600c181d00b003e10bfcd1c3mr1028824wmp.5.1677945243872; Sat, 04 Mar
 2023 07:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB1LBmv1kY+kuUBWvXRoe+mbQBjtJOFvZB8Smmbcuy2MdvgJnA@mail.gmail.com>
In-Reply-To: <CAB1LBmv1kY+kuUBWvXRoe+mbQBjtJOFvZB8Smmbcuy2MdvgJnA@mail.gmail.com>
From: Laurent Lyaudet <laurent.lyaudet@gmail.com>
Date: Sat, 4 Mar 2023 16:53:53 +0100
Message-ID: <CAB1LBmsBGFDLoKZHUZCLHDvHb68eOfc-W+W9hQXbXkqRB7Uykw@mail.gmail.com>
Subject: Re: Too many BDL entries regression
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I filled a bug report to Ubuntu also :
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2009271
It should contain all the data about my hardware :)

Best regards,
    Laurent Lyaudet




Le sam. 4 mars 2023 =C3=A0 16:41, Laurent Lyaudet
<laurent.lyaudet@gmail.com> a =C3=A9crit :
>
> Hello,
>
> Thanks for your hard work :)
> Ubuntu 22.10 shipped kernel 5.19.0-35 thursday.
> And some people started having syslogs :
> "Too many BDL entries"
> https://askubuntu.com/questions/1457367/snd-hda-intel-0000001f-3-too-many=
-bdl-entries-messages-in-system-log
>
> I looked here how to report it :
> https://docs.kernel.org/admin-guide/reporting-issues.html
> and searched for "Too many BDL entries" but found nothing
>
> I looked at versions here :
> https://kernel.org/
> but I don't know if version 5.19 should be reported at
> stable@vger.kernel.org
> since it is in between
> 5.15.98
> and 6.1.15
> or maybe Ubuntu does some renumbering ?
>
> Excuse me if my report does not contain all needed data,
> or should be addressed elsewhere.
> Sorry if I cannot do all the checks with latest kernel ;
> my current laptop is my only PC for work,
> and I would prefer to avoid breaking it, even for a day or two.
>
> Nevertheless, I would be happy to provide log extracts or other
> information that may help.
>
> Have a nice week-end, best regards,
>     Laurent Lyaudet
