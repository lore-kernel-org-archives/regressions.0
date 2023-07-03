Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA4F9C6
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 13:26:36 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b5d1498670so3506062a34.1
        for <regressions@lists.linux.dev>; Mon, 03 Jul 2023 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688390796; x=1690982796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqn7IKTdo14CySBv00ohACcAfgAIiWSh1E9RKmDPgr4=;
        b=Ek1UGhRgVlcOvIL06WHpGzgjgyHpvklDmtxMOactMDjhcaI4gwwV65eiGbrFnTuYMp
         sx+StujcB87IZnmVr0obLNhPZ3QtF3Hnn6KRTiSfoUNG34iq6GMQjbrGeO8blA+j2tvf
         h/kwO/mSVsgqvnw7MmKImnD9Pydwuvvhl5dLCVmInI1GKbEVxBZ0/2klnE3A77D9x7bU
         WI8PiUsuUjVZhuHi476SolDhvelKrfeWzquDbo/oNuoRyDoPM28I7yNszphIDppKjqcD
         nIvToQ+4GW88bXvZB5zKvNYfZ/SizZVOiU893uOtzX5iYcLUjFStPOA9WE2E32m0Xk2o
         XXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390796; x=1690982796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqn7IKTdo14CySBv00ohACcAfgAIiWSh1E9RKmDPgr4=;
        b=kEIL/u6BBFyToJ8n2tZ6pcqNfcFGv4Vzg/LBpJYoDw57IEh5KWLD899sWJRAysoGR0
         vybbIs+UjlmrvR4tOpI5dAw+CuGDN3+JUnxi2CKfMvHhL2nsi4BuF/lxjumQsVIPHdSj
         WLvEcL8nNcauTexkGTUxezPDteUSayI6Sl+xcZv4mUzfsF/8MUyxvIEKBdzPR+8CQxIg
         e+EuTNpp/0d8DH2y5OYDF6+5IO2A5nv3oyb0mPo3eG3SM5ohnIJ8MK6cTQMfr9yHpAFu
         cs+dk0OCK7VU7TgJJ6rjsOdCechlm6Lt1STSXv9l9ZN9EsUiVMGGUKUmkVgzKMoH1FSU
         LD/g==
X-Gm-Message-State: AC+VfDz/tTDns/0nX98Dx7pR2xdUGuzk2gSibo4CG0HzQMMtg1rv8RMJ
	+takZ3goudNjezi2qsuEQQBA3k1BGLxpOvFQxfI=
X-Google-Smtp-Source: ACHHUZ6uqGeljNO+21cjgetYX14NexS83zR1TTJuyVJ+ZqhjCxOYbav6ccfXjzVMlVGI0t01i24YsOMut9poxjZGFYM=
X-Received: by 2002:a05:6808:199f:b0:3a1:e7ad:11a2 with SMTP id
 bj31-20020a056808199f00b003a1e7ad11a2mr9346884oib.18.1688390795816; Mon, 03
 Jul 2023 06:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <CGME20230627161055eucas1p18d097cbcc2215b292c65a5b3a0f0e6b5@eucas1p1.samsung.com>
 <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com> <9b778d59-c8d5-b037-0eb7-34cee5f273cc@samsung.com>
 <CABfnBFoZ=gh2rkY_oYWzjkGcu8HPQ2FqnrnushH0DZFSi8cwOg@mail.gmail.com> <50723e0c-370b-7e4f-338c-401998739fba@samsung.com>
In-Reply-To: <50723e0c-370b-7e4f-338c-401998739fba@samsung.com>
From: Clemens Springsguth <cspringsguth@gmail.com>
Date: Mon, 3 Jul 2023 15:25:58 +0200
Message-ID: <CABfnBFpZJ=kToimneFgs87i=yL37Z8_MJ5nL6NUpW9w6mFSyjw@mail.gmail.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Martin Belanger <martin.belanger@dell.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, John Meneghini <jmeneghi@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Kanchan Joshi <joshi.k@samsung.com>, Jinhwan Park <jh.i.park@samsung.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Javier Gonzalez <javier.gonz@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 6:21=E2=80=AFPM Pankaj Raghav <p.raghav@samsung.com=
> wrote:
>
> On 2023-06-30 17:18, Clemens Springsguth wrote:
> > Hi Pankaj,
> >
> > i would be very very grateful if you would create and submit the quirk
> > as a proper patch.
> >
>
> No problem. I will send something soon, but could you test it and
> give me a tested-by tag when I send the patch? I don't have that
> model at my disposal.
>

Hi Pankaj,

I am available for testing with pleasure.

kind regards
Clemens
