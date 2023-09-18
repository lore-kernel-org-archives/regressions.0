Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3447728DA6
	for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 22:56:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso660728866b.3
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695077769; x=1695682569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tftkfCRDvcs4v9yhjyjUTVMx7qSfJ5Yv3Qi6b8m0pFI=;
        b=akdVwicNRiPQRvclBg08UnejkXfpax/BnZGOElmh/FCRLprAoCGyYtCV5+/WyO9Q6G
         KTcDFkyFJf1V023H99/7dzFZpt7+EeNZlRFWrzzkNxlHpflYsVXNy9XTwkKvsETNaCTi
         sWsOsV4ptVv2KXSByp/6KLdwSwlmSEfg3jPMM1uzcLD4BjN2mlhtS2qJVjzq5LWbW9iB
         ZqEy7Smm+lRX+BNzwYKx4vTNsGHOBfqBF49MYee1PZ7pr3Nbm/Hr6LomxOkifujYDSQa
         Aiw5jI8Wn+HuINjqtRODkOB2Nvbfm+ytZwJJqBX4yd1JkKAmAX3gp5gm/hdr2lKMZxnY
         pSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695077769; x=1695682569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tftkfCRDvcs4v9yhjyjUTVMx7qSfJ5Yv3Qi6b8m0pFI=;
        b=eniw+l7JX+mRqs+kbJRmIlR+pYy7eHBQTd9ZSdxdpTJpqHpb5VRvsNBkG9qQnVEIkw
         lyJey3ncGohEsWnZ/8vu59jIr6cmZYlX0m//DmAcZTtpxc1nRwfUps1ItIkZHLsdHlQY
         SAd/MrUdwsBxVzLlrvSMxQiPwPMoAxcwbYG1FkUuyfgCP2KiqSJjQTHoxorV0ZlBTTCg
         kaVSX8kGytW61OPgPZ0IPJ6bYlhKgiMLzJS5n1rB5LhqCWMAPMzq2wRFus6ceR3yaZA3
         FGxy+epjDYmaMDSv//fU2v+5i5fn7PIvA+a3ZmF+LJM4+E3fms9bc4dp4FiXI+VcRhGY
         ta6g==
X-Gm-Message-State: AOJu0YxGR5KLUsyIE73OO/a6VU8lRb2vzAWlea3uzJ6uY67PxWVfLK31
	SguPA2I776QRjmzX5iaGfg0i5B3mFN+mp40rlzU=
X-Google-Smtp-Source: AGHT+IFpC7h3oiR2e/FsAxZpvqmdBeNGyNbZC00OQ9F6uY4pZs5emDtplxQ/fvPIz/FLvbM4UJDM2JpjENynkjMDLyA=
X-Received: by 2002:a17:906:519b:b0:9ad:e298:a5d with SMTP id
 y27-20020a170906519b00b009ade2980a5dmr9218002ejk.19.1695077769209; Mon, 18
 Sep 2023 15:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
In-Reply-To: <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
From: Brian Pardy <brian.pardy@gmail.com>
Date: Mon, 18 Sep 2023 18:55:58 -0400
Message-ID: <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Steve French <sfrench@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[RS removed from CC due to bounce message]

On Wed, Sep 6, 2023 at 5:03=E2=80=AFPM Brian Pardy <brian.pardy@gmail.com> =
wrote:
> On Tue, Sep 5, 2023 at 9:01=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> > Thanks for the regression report. But if you want to get it fixed,
> > you have to do your part: perform bisection. See Documentation/admin-gu=
ide/bug-bisect.rst in the kernel sources for how to do that.
> >
> > Anyway, I'm adding it to regzbot:
> >
> > #regzbot ^introduced: v6.4..v6.5
> > #regzbot title: incorrect CPU utilization report (multiplied) when moun=
ting CIFS
>
> Thank you for directing me to the bug-bisect documentation. Results below=
:
>
> # git bisect bad
> d14de8067e3f9653cdef5a094176d00f3260ab20 is the first bad commit
> commit d14de8067e3f9653cdef5a094176d00f3260ab20
> Author: Ronnie Sahlberg <lsahlber@redhat.com>
> Date:   Thu Jul 6 12:32:24 2023 +1000
>
>     cifs: Add a laundromat thread for cached directories
>
>     and drop cached directories after 30 seconds
>
>     Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
>     Signed-off-by: Steve French <stfrench@microsoft.com>
>
>  fs/smb/client/cached_dir.c | 67 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  fs/smb/client/cached_dir.h |  1 +
>  2 files changed, 68 insertions(+)

Is there any further information I can provide to aid in debugging
this issue? Should I just expect incorrect load average reporting when
a CIFS share is mounted on any kernel >6.5.0?

I'm not clear on the value or necessity of this "laundromat thread" -
everything worked as expected before it was added - shall I just patch
it out of my kernel builds going forward if there is no interest in
fixing it? Is a .config option to disable it possible?
