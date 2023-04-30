Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B992F26
	for <regressions@lists.linux.dev>; Sun, 30 Apr 2023 21:34:21 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a950b982d4so665335ad.0
        for <regressions@lists.linux.dev>; Sun, 30 Apr 2023 14:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682890461; x=1685482461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXvWfcPwYE0l610o5narxo1kaxveEE8bMSO3FZe1UVo=;
        b=hDMD+683FV9awGOim+l3BgEF4meaq+TP43gjtapNGzLkLF5zY5YsesXkf7cRd4dD5S
         Iw8UMAZsf/7oUUoofWgWKdhivDRLbC6NpwgpNuwogs3zIkEUu42YsumVcan5J8iYnEYc
         UhiZQiveG08+Wf68OfDFL1xZNwfDfoCGV+exPdRJpb0z2xHPWSO2MT7ujT7eatyl2+mH
         OdvZkK5bPRy6xutc7aET2dU267ixeRr5CPC0c4vZdKDHPk0qSH9Npvtk82KM5gMJQcc7
         e14DZSPQzOFuJKQVEYPcIWhHvozrIRyCilZW/srEDBcXv9bdHk80X5juPl9UZMl3NBV4
         K7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682890461; x=1685482461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXvWfcPwYE0l610o5narxo1kaxveEE8bMSO3FZe1UVo=;
        b=LTnDVvjuDejyVNhoYzDkqnD1E1KrxXMeMbbrQVdf0hGPCtS4XRsoksO7kUnFTi3PAj
         tscbCA7z7WmaeRxQDDNYayEgtuY2DlRi4sG2+7HgtLovaIS7GVbNHWggBT22+WevCRXP
         i8gU1Px02GFG2CV0HRUWPQ6AEDDCNm74En+XixQ6XtZDmg8TfbIhrf85koFkiPJkuq80
         cGM/qPFAMqJah5C7407YUdI28YtdbOjJVfvrc8L9M96+aEfnSLLiZl/UpaO2C4OYOyzQ
         Cadu6kbdLE/O4UTSNdjqm1+DpN6f/BQBLQsx1v2hqXKyNNqX0cPHUCaWx3O4cKxePPAn
         u7qw==
X-Gm-Message-State: AC+VfDxSyO7sc0LRkEVeGMQSXCI3DFaG+1tlL78XaK4uOyBq5wUtXMJA
	CYFVh8hjckC6WfBhn8wivATSIcW5m+2JWBkz3K80rQ==
X-Google-Smtp-Source: ACHHUZ4ggBLuGq7jC2q832O9om3D3hjpgadwUqVDNqfRn7eoOKxA5MqKMSS7c9EM4oTS5Ucy0OevPZVq+8ZgCGrt0XU=
X-Received: by 2002:a17:902:b20a:b0:1a6:42f0:e575 with SMTP id
 t10-20020a170902b20a00b001a642f0e575mr299829plr.5.1682890460920; Sun, 30 Apr
 2023 14:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230316220638.983743-1-dlatypov@google.com> <20230430181500.122664-1-sj@kernel.org>
In-Reply-To: <20230430181500.122664-1-sj@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Sun, 30 Apr 2023 14:34:09 -0700
Message-ID: <CAGS_qxqmWYzTBkfmFoALoteaG303tJNh1K5N2=Pmykqk+2BeTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kunit: tool: add subscripts for type annotations
 where appropriate
To: SeongJae Park <sj@kernel.org>
Cc: brendanhiggins@google.com, davidgow@google.com, rmoar@google.com, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, 
	johannes@sipsolutions.net, Johannes Berg <johannes.berg@intel.com>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 30, 2023 at 11:15=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> Hi Daniel,
>
> On Thu, 16 Mar 2023 15:06:36 -0700 Daniel Latypov <dlatypov@google.com> w=
rote:
>
> > E.g. for subprocess.Popen, it can be opened in `text=3DTrue` mode where=
 it
> > returns strings, or `text=3DFalse` where it returns bytes.
> > To differentiate, you can annotate types as `Popen[str]` or
> > `Popen[bytes]`.
> >
> > This patch should add subscripts in all the places we were missing them=
.
>
> I just found this patch is in the latest mainline tree, and it causes kun=
it
> failure on my test machine like below.
>
>     $ python3 --version
>     Python 3.8.10
>     $
>     $ ./tools/testing/kunit/kunit.py run --build_dir ../kunit.out/
>     Traceback (most recent call last):
>       File "./tools/testing/kunit/kunit.py", line 24, in <module>
>         import kunit_kernel
>       File "/home/sjpark/linux/tools/testing/kunit/kunit_kernel.py", line=
 42, in <module>
>         class LinuxSourceTreeOperations:
>       File "/home/sjpark/linux/tools/testing/kunit/kunit_kernel.py", line=
 95, in LinuxSourceTreeOperations
>         def start(self, params: List[str], build_dir: str) -> subprocess.=
Popen[str]:
>     TypeError: 'type' object is not subscriptable
>     $
>
> I further confirmed reverting this patch makes it run again.  Do you have=
 any
> idea?

It seems like support for the subscript wasn't added until Python 3.9.

I know support for subscripting other types like re.Pattern was added
in 3.9 per https://peps.python.org/pep-0585/ but it doesn't mention
Popen there...
This patch also added typing.IO[str] and concurrent.Future[None], so
those might be problematic too.

Can you check if the typing.IO and concurrent.Future[None] changes
cause problems?
(I don't have an easy way of testing against older Python versions currentl=
y).

If so, we should revert the patch.
If not, we can undo just the Popen changes.

And in either case, we'll need to update ./tools/testing/kunit/run_checks.p=
y.
Currently, it runs `mypy --strict` which will start failing if we
revert any part of this patch.

Thanks,
Daniel
