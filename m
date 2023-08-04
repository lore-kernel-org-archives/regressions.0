Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CAA929
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 12:51:58 +0000 (UTC)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-jH7Fuaw6NfaH3sdTu7sndA-1; Fri, 04 Aug 2023 08:51:55 -0400
X-MC-Unique: jH7Fuaw6NfaH3sdTu7sndA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b9d5bc6161so3206251fa.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691153514; x=1691758314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRlXGWY/CFWI5iW4ld/1S29gsGd4s6U2sDlhS/FmuSE=;
        b=NheaI8hhGZHMunXpMx89bXDy48cXVzJETRTntvimeQhvbA3HiWlf5DQlllU7EHYOAx
         CzkvU6JhEa+B6AZf8SwEdAl+NX/vsmlzzS4ME9DZTq/6EghewKShqn66ckpCnlsTRYVN
         k9dnWmmjBHixzW3D68xzf1DrcpeCdn/xbobzHiZ6BnXbduVxwKd+LbsT7LT0MrFdTEW8
         xePjXPuhBR4MX8SC+lQqumGLhoSlPJU81oLERZRXsIoCaBkYZhAhVTfsPx6uKYcJfGHT
         EsqntkXNzl1RrnnbBOmqa3uTKtrgENtfgY77jw8WR/px+zQRkjXBT7p2JOqL2AvJs/Jb
         38sA==
X-Gm-Message-State: ABy/qLbnRMgOPAj5h4PjYuPbsGDNCCKATdhNbfYgPZkmOFlqAELRmife
	1SAb5wxSCapfQ/De54HPZbFiZ/0+AjUb7jw1aJKel+w2+Zl6VwkT9/muBLyXR0mqybhZmZyj/cm
	EjebZbWW9EHhF+5L/mMnMOSc7iCLFvnM1KzQOxr8=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id x15-20020a2ea7cf000000b002b69969d0abmr14626213ljp.4.1691153514604;
        Fri, 04 Aug 2023 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFrcSjZXh6YM3wQYlauuWGfFGZv19JjISaVV8WqI5Be/z9XCLqb6j13RdZZx7ibxrrJTgr6pbJPMHFHOKn9vpw=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr14626204ljp.4.1691153514326; Fri, 04
 Aug 2023 05:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info> <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
In-Reply-To: <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 4 Aug 2023 14:51:43 +0200
Message-ID: <CACO55tvu4X3u8K-FGUeN2CBw1BnumRPBNEEqjn+EPzNCCCQYyg@mail.gmail.com>
Subject: Re: nouveau bug in linux/6.1.38-2
To: Olaf Skibbe <news@kravcenko.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, 1042753@bugs.debian.org, 
	Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 2:48=E2=80=AFPM Olaf Skibbe <news@kravcenko.com> wro=
te:
>
> On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:
>
> > mind retrying with only fb725beca62d and 62aecf23f3d1 reverted?
>
> I will do this later this day (takes some time, it is a slow machine).
>
> > Would be weird if the other two commits are causing it. If that's the
> > case, it's a bit worrying that reverting either of the those causes
> > issues, but maybe there is a good reason for it. Anyway, mind figuring
> > out which of the two you need reverted to fix your issue? Thanks!
>
> I can do this. But if I build two kernels anyway, isn't it faster to
> build each with only one of the patches applied? Or do you expect the
> patches to interact (so that the bug would only be present when both are
> applied)?
>

How are you building the kernel? Because normally from git reverting
one of those shouldn't take long, because it doesn't recompile the
entire kernel. But yeah, you can potentially just revert one of one
for now and it should be fine.

> Cheers,
> Olaf
>

