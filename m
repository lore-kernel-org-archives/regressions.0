Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E83290C
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 14:07:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso1131433e87.3
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688047626; x=1690639626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEYh2DRfk53je4DxOfap66hrkUZhOB02h/6gUlMbFXQ=;
        b=SxW8aPh3FgVNSKH2CoC6ad9zu7IDSAbyBabHXVoiqLmcesAK9OTxBIRASK/tyhXgIS
         h2nh5pkTSKxPDSIirIeWnovZRIoQDHAPtMRVg1mtV3QEjLP3ERfL3C0nTbqWF9LyuUx2
         RSbBzS6F8EaldvUiXGxkVhkFFxjRseDArwWsbuMEscGWzlGMV+vvuEAdTdQf0N2CeVRF
         HyIrjQPHyb25CSYZgD5bmfH7EaKpvn0o9tRvS2q7ZzNqPha/KcPm3TZv2bxJ3bm7QHNF
         rf2ryzln5Oo4yzQc9E4wXaia5+wdTp0xGEQ89OBODPXOnHtXJQ/bM8egb0O1KYKXNXDn
         S+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688047626; x=1690639626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEYh2DRfk53je4DxOfap66hrkUZhOB02h/6gUlMbFXQ=;
        b=ACeD6Hfdo7f+pkniS42qFHcH8jvPr+OwK0r6/WqNVCHcR87496cJ3+UrArNqUyvipf
         DOTRv4Xnbjj149doBWVMGI5TzOky4XbfTTmwdXJMp7xNbzobtQi+aIMTsf53TOvWdPzn
         wtTDcajXjAsxSPmNqedGIu+fuLDXt2KvUE6lMl7BHs2uyX+5ZFfD4Rzj4p7da574kCzX
         zbHjoKHXCspNfph1PLTdBJ8fMZiGktFsdMMRHOjX7kpZswT5Rr89YRsDzjhjTFmTSq7i
         V+0UbKOdG21sB0TpkGw99Km4sNRH8D5ZEASPQ3XXhGqTC8RlVQdJn3U0JrFQZ89trmis
         QDug==
X-Gm-Message-State: ABy/qLaPB1hqmnjg0WzH6IO5ycgXyLUH1GvpmUxIYO7ficXnxDM0mnny
	xjvoHBaka5N+GbvMPfBbTSppVtyERCX6F1oItAA=
X-Google-Smtp-Source: APBJJlGuXe9oTBIiTfmuhpdTfJ+BVZGUuj1yzHYCSkpMv5tJzrqDUg7bLo/dUXj75LHpnXbhfTNRHsjuJsRYiCnv1A0=
X-Received: by 2002:a05:6512:2214:b0:4f9:556b:93c5 with SMTP id
 h20-20020a056512221400b004f9556b93c5mr48961lfu.40.1688047625527; Thu, 29 Jun
 2023 07:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJ2H5FWuo9oDMgPm@debian> <be9320b5-7613-be0f-ffcd-4b3041ea5836@huaweicloud.com>
In-Reply-To: <be9320b5-7613-be0f-ffcd-4b3041ea5836@huaweicloud.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 29 Jun 2023 15:06:29 +0100
Message-ID: <CADVatmNG=_v0yLwZrK0FcOGdOkz_W_36kurKKeDHWoxyGWx7Qw@mail.gmail.com>
Subject: Re: mainline build failure due to 8295efbe68c0 ("md/raid1-10: factor
 out a helper to submit normal write")
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Song Liu <song@kernel.org>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuai,

On Thu, 29 Jun 2023 at 14:56, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> Hi,
>
> =E5=9C=A8 2023/06/29 21:32, Sudip Mukherjee (Codethink) =E5=86=99=E9=81=
=93:
> > Hi All,
> >
> > The latest mainline kernel branch fails to build x86_64, arm64 and arm =
allmodconfig
>
> Thanks for the testing, which branch are you testing?
>
> This problem is already fixed in latest mainline kernel:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Db5a99602b74bbfa655be509c615181dd95b0719e

The link you gave is not "mainline kernel". Its linux-next.

Linus still does not have the fix, so the mainline kernel branch fails.


--=20
Regards
Sudip
