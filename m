Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8683064A
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EHGw5W5X"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cd0af4a7d3so44045707b3.0
        for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1701097393; x=1701702193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGECS7hQ9z7O8g2r5L0bNaVk88br4ZWd2DQT3SC6LRo=;
        b=EHGw5W5XMOH2rCmyPnjEw9fgiZOVdBaQ2fRW9jHduXOeAhxqKA+LtO+JENEve8+1Mj
         BWbGPTbnSQ1pIFr69KFvZx1oRKGtcZNsyxB0faSH2Z0ecpdQv0l/FiXuQIYUO/4PIL2N
         0I05N0ioHZOh3agAzQC2An8EKTqW7W5ZJ7Sx02OG98Htj6Ku7q1cgjDQuZmlOV5NQLJx
         LLpGWy/Madg3F7Oa70OA+pmyrET/xBaptSobwzU4qHjULKYj3TJgr8bJ6N0yxe2pTQLF
         j6R6EvrgT/ZvWU1yMfjzoKHFezFB9kvdf1c/Uq7SwV3vTPTszGxJBIvH47puSSNJKk4S
         IZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701097393; x=1701702193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGECS7hQ9z7O8g2r5L0bNaVk88br4ZWd2DQT3SC6LRo=;
        b=eCRrtH1Krlgar4sk2t3svoE69+/6dShCnFqYiJUM4XplTodbPH1il13cwfngxPUNwM
         TO+/EuQPQbZAdzFaW5X7Ii3rkD5xHtqcMinc7meRIQIxGKf1TILBSlrwYDLa5Z26GWL0
         zasqEVTVTuD0zgf585JuLIs/Styr9dci2p7YR5U5sFkHMty2D22au9GnO4G2tK0lbZqF
         h96N+6OVm7u5Bx6lqNejlGHjuxrdSDbfIcQFtlpLcxSRqVlXYWj7qPsVHZC9qvBXBDvI
         b+0pEaIE1B7HSfUiDl/rFmMm8VL2Y5V9v+SlH1TnTKydRxDy5m9q8YupHvS4MTB/pxzA
         xFkw==
X-Gm-Message-State: AOJu0YzIFfErnuoy5Q0AnajjkmfN2bD0cRWIyZefveXo2JtTCT0/JCTk
	OVKa6jrD0BxJB62IKcGOCCjSy8xF+cUeSFfj4zkj
X-Google-Smtp-Source: AGHT+IGWFWX4nZPEY4/r2GM+zJBz8aBYpVp3/NycgX3NsxoWQhG2nQBJqmmnxJUC/Y8LXiDmxbnvm64m3VvefvSfC3s=
X-Received: by 2002:a25:6987:0:b0:db4:158:b9d9 with SMTP id
 e129-20020a256987000000b00db40158b9d9mr12095112ybc.1.1701097392639; Mon, 27
 Nov 2023 07:03:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs6WafDBtSbcLpoyWehQyBPNeX37PvsP6HzSotXr3dYLg@mail.gmail.com>
In-Reply-To: <CA+G9fYs6WafDBtSbcLpoyWehQyBPNeX37PvsP6HzSotXr3dYLg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Nov 2023 10:03:01 -0500
Message-ID: <CAHC9VhRrxX=LcXmLxyMwF6_rZEEYO+5DG_3EaeWsAoVY9CuSXA@mail.gmail.com>
Subject: Re: lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared
 (first use in this function); did you mean 'LSM_ID_YAMA'?
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 5:43=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following build errors noticed while building selftests lsm tests for x86
> with gcc-13 toolchain on Linux next-20231127 tag.
>
> Build log:
> ------
> selftest/lsm/lsm_list_modules_test
> lsm_list_modules_test.c: In function 'correct_lsm_list_modules':
> lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first
> use in this function); did you mean 'LSM_ID_YAMA'?
>   104 |                 case LSM_ID_IMA:
>       |                      ^~~~~~~~~~
>       |                      LSM_ID_YAMA
> lsm_list_modules_test.c:104:22: note: each undeclared identifier is
> reported only once for each function it appears in
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

A fix was posted last week and should be merged this week, lore link below:

https://lore.kernel.org/linux-security-module/20231122160742.109270-2-paul@=
paul-moore.com/

--=20
paul-moore.com
