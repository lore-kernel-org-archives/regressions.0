Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92F14F67
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWnnZ7Ix"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso4320451a12.1
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698941127; x=1699545927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwjuKF0m6b95GH5kA/PrMCqg/Fnygmr6UMeQTw8Px6w=;
        b=kWnnZ7IxgWpmGIOZfhnBqdByOT3Ue4XDYrPf8siq/lVQGWRhRu0sk/ghYjVHXMOkVL
         y7plAVgAAzET/MexVfxI1Q8CZbafN/1GegWobiDutnL+vO1WFcQdkET59t0OBbiI9Txn
         du+6LdOpiKa/OOMpIOAx9Te0tXgPCitfKZih5bopd3zqfHfqOecqi81+LOvrYnSJ3bQn
         Idbm2LH9cq4Luz6sRXTFbhIPXmtpVC+KXLJhD9TuYwICBvt5/TeoYGOOV+5MY8q0wEHf
         t/luxj/4C30UXBdWP0+8OboZE3iVoUVv8UFUH9UheexfAGUVoulZm7KfXyxzsjomaA14
         kwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698941127; x=1699545927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwjuKF0m6b95GH5kA/PrMCqg/Fnygmr6UMeQTw8Px6w=;
        b=wvsoNnmXgq/uZISvy3o1DbNcD63FWuQkz6pD7LDadHhvkDpk912x59i3pzzO+l/o89
         w7wT2C5shvw67b03sSzBTx82TrYoUI1C8HaAUOAenSyLQ4zg/SFcCTbtwGCp+IDrHOd4
         a0fpbWJDJsxeZjusMs++QBheZhHmnwuCOTa2gpoDy0hgLifItBOXCbW1Nns6mVMDbVay
         BvFEOiLIF3RjnuF1l4HygNOzdo1cAPa+1SqaCe64HKtxnkg0zEG3i1ICHA9sBhjrumzs
         5UvHV4DJaQ8b3F0NQVPPcwCAiy1Eo16knvVTmBwpmEiaFSsDzrM8v1qQTimzTeTN1++/
         fqkg==
X-Gm-Message-State: AOJu0YwfCqlEqG+c5v2KTB2VrtKXrFMghpK1jLE4Pc0wkl1a4c8HAon5
	8rtvwHzCpDx2DgkfJAfJut+hPhTjfywxIIUK1jHWlXo3nkecxg==
X-Google-Smtp-Source: AGHT+IEDjRFCQrTuZjKfZnvcTt3wSNXzpypFp3lHL7z9Tib5HnwFSzeTK6Iz8cd6cbDPJ8/qc8dsTUhsAZrRrKaZJyo=
X-Received: by 2002:a17:906:aac1:b0:9ad:cbc0:9f47 with SMTP id
 kt1-20020a170906aac100b009adcbc09f47mr231181ejb.12.1698941127037; Thu, 02 Nov
 2023 09:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUNiwMLBsL52X9wa@debian> <79260ece-5819-4292-bfac-dc21a3701813@bytedance.com>
 <7ade1b4d-71ad-4f32-9b19-9d8eac8e595b@leemhuis.info>
In-Reply-To: <7ade1b4d-71ad-4f32-9b19-9d8eac8e595b@leemhuis.info>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 2 Nov 2023 16:04:50 +0000
Message-ID: <CADVatmNkXXH5xwEe25cZeESRT5FscKQuGEoSZ=1tiGTtLO-+pg@mail.gmail.com>
Subject: Re: mainline build failure due to 9c66dc94b62a ("bpf: Introduce
 css_task open-coded iterator kfuncs")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Chuyi Zhou <zhouchuyi@bytedance.com>, Alexei Starovoitov <ast@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Yonghong Song <yonghong.song@linux.dev>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Thu, 2 Nov 2023 at 09:13, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 02.11.23 09:53, Chuyi Zhou wrote:
> > =E5=9C=A8 2023/11/2 16:50, Sudip Mukherjee (Codethink) =E5=86=99=E9=81=
=93:
>
> >> The latest mainline kernel branch fails to build mips
> >> decstation_64_defconfig,
> >> decstation_defconfig and decstation_r4k_defconfig with the error:
> >>
> >> kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
> >> kernel/bpf/task_iter.c:917:14: error: 'CSS_TASK_ITER_PROCS' undeclared
> >> (first use in this function)
> >>    917 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
> >>        |              ^~~~~~~~~~~~~~~~~~~
> > [...]
> >> git bisect pointed to 9c66dc94b62a ("bpf: Introduce css_task
> >> open-coded iterator kfuncs")
> >
> > Thanks for the report! This issue has been solved by Jiri.[1]
> >
> > [1]:https://lore.kernel.org/all/169890482505.9002.10852784674164703819.=
git-patchwork-notify@kernel.org/
>
> Thx, I was just about to reply something similar. :-D
>
> Sudip, maybe you know about this already, but in case you don't, here is
> a quick tip that might be useful for you: in cases like this it's often
> wise to search for earlier reports on lore using an even more
> abbreviated commit-id followed by a wildcard (e.g. "9c66dc94*"). That at
> least was how I found the fix quickly.

Yes, but the failure is still in the mainline. And it has happened in
the past that the fix has been submitted and taken by the maintainer
but was not sent to Linus.
In the last release cycle I had to send a reminder around the time of
-rc3 and in that case also the fix was submitted when I sent the build
failure mail.

But  like you said I will search and will not add Cc to rezbot in
cases where a fix has been submitted. Also if Linus wants then I will
not even send mails in these cases.

--=20
Regards
Sudip
