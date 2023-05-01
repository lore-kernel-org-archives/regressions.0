Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94326567B
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 18:19:34 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1aaf702c3ccso91885ad.1
        for <regressions@lists.linux.dev>; Mon, 01 May 2023 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682965174; x=1685557174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x586HEdntjiG3UWvC4VzSehiz+nFWAPjdh7JwBrp8xg=;
        b=W4ttgpj+tk0PA98qPFHXkYMcTTNGgT8dXJrzRMqAkiUx2G1AGa5w/ZD/aR+Ewn295X
         gJkoJkJZ/EHMxNW4MmniSmgpIXt/k0/BxI0S9bAst5nFS4tqJQN2F37XE5YiKLzAb5Cz
         I/XHsS1CrQXeOMtu6sr5DqkgY9iURplfi9Q0TQC3zez4clqsKtBf2dLBIA1DQcp0iDt1
         4cmJcIADiJc3z+139LXHs81jrcoEoIc0qb284WMlZck7F5akRGeNTEq9oF1mI/QVDT66
         6zhpSm2Lxt0MFCKb8bR4t3+cQGJ2Ou13HXqu8UppaR3TyU5PfQWVU7fO4R6IoAl63RWM
         ecCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682965174; x=1685557174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x586HEdntjiG3UWvC4VzSehiz+nFWAPjdh7JwBrp8xg=;
        b=LxugQOZm6x0Ni/iptVyhIT6MsLi9yIkYyPgLArQF0O3fZhdZAjnMTCJgeNqsYgqSpT
         mrrHSaxWlMFjQOrTHvui4Fn6bTsTXp/03Cg7Kg2HxBjQnQQ/cGCFXong0ohQsnW1lnHX
         arOG4iAEpUc1ffw/OKdeXWSQt9vJQMG20UlECAaqdYpf9LPPet2qKVLdAbDF6OMU0oEp
         9EQvGqZZwG/2Lyl+phf2azgllH1/mWJc02y/9HpYb1G+P76Qi0UKdb8aFYa8E+mRq+ra
         6tL+pX0iFP9uZV07yEbRrjyNfy+sk3vytBTS5OAeyB5Km2yNp8BTZh1/Gnj3XFjfFYLf
         8M1w==
X-Gm-Message-State: AC+VfDxSRm6A97HO9cy96RN+sOikm6rcn8fOIkqChzAdzTMNtpHhGXyh
	11Dj4jiuFon0AJc0CA7fcV3coIxRZmUnKp9hD1IJUg==
X-Google-Smtp-Source: ACHHUZ5UllUhL9iXbL443z63MmMSkl9/6j81FAS+ovadxdUdMwh1W7AHr88rmYnqWCbHrpS7PAa+JtMq/sHDKLJ4ZU4=
X-Received: by 2002:a17:902:d504:b0:1a9:3251:e3ae with SMTP id
 b4-20020a170902d50400b001a93251e3aemr6776plg.3.1682965173837; Mon, 01 May
 2023 11:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGS_qxqmWYzTBkfmFoALoteaG303tJNh1K5N2=Pmykqk+2BeTg@mail.gmail.com>
 <20230501171520.138753-1-sj@kernel.org>
In-Reply-To: <20230501171520.138753-1-sj@kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Mon, 1 May 2023 11:19:22 -0700
Message-ID: <CAGS_qxqUUX=V+DfYp8LnjxB03OeZVhaXpmg_8zW98zvJLCcZ6A@mail.gmail.com>
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

On Mon, May 1, 2023 at 10:15=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote=
:
>

[snip]

> >
> > It seems like support for the subscript wasn't added until Python 3.9.
> >
> > I know support for subscripting other types like re.Pattern was added
> > in 3.9 per https://peps.python.org/pep-0585/ but it doesn't mention
> > Popen there...
> > This patch also added typing.IO[str] and concurrent.Future[None], so
> > those might be problematic too.
> >
> > Can you check if the typing.IO and concurrent.Future[None] changes
> > cause problems?
> > (I don't have an easy way of testing against older Python versions curr=
ently).
>
> Thank you for quick reply.  Reverting Popen changes only as below fixed m=
y
> issue.  So seems typing.IO and concurrent.Future[None] chages doesn't cau=
se
> problems at least for my use case.

Sounds good.
Sent https://lore.kernel.org/linux-kselftest/20230501181610.2617032-1-dlaty=
pov@google.com

I was hoping adding `--python-version 3.7` to the `mypy --strict`
invocation would help, but it still fails for me :\

$ ./tools/testing/kunit/run_cheks.py
...
mypy: FAILED
> kunit_kernel.py:95: error: Missing type parameters for generic type "Pope=
n"  [type-arg]
> kunit_kernel.py:116: error: Missing type parameters for generic type "Pop=
en"  [type-arg]
> kunit_kernel.py:145: error: Missing type parameters for generic type "Pop=
en"  [type-arg]
> Found 3 errors in 1 file (checked 8 source files)

And here I was, hoping it would complain about code incompatible with
python 3.7...
But at the very least, that patch should fix the current problem.

Daniel
